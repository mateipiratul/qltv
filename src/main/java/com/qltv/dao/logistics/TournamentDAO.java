package com.qltv.dao.logistics;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.EventType;
import com.qltv.models.logistics.Organizer;
import com.qltv.models.personnel.Team;
import com.qltv.models.logistics.Tournament;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class TournamentDAO extends BaseDAO<Tournament> {

    @Override
    public List<Tournament> getAll() {
        try (Stream<Tournament> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Tournament> streamAll() {
        String sql = "SELECT t.*, o.nume_organizator FROM turnee t JOIN organizatori o ON t.id_organizator = o.id_organizator ORDER BY t.data_inceput DESC";
        return fetchStream(sql, this::mapResultSetToTournament);
    }

    @Override
    public Optional<Tournament> getById(int id) {
        String sql = "SELECT t.*, o.nume_organizator FROM turnee t JOIN organizatori o ON t.id_organizator = o.id_organizator WHERE t.id_turneu = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToTournament(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching tournament by id", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Tournament t) {
        if (t.getId() == null) {
            insert(t);
        } else {
            update(t);
        }
    }

    private void insert(Tournament t) {
        String sql = "INSERT INTO turnee (id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_turneu"})) {
            pstmt.setInt(1, t.getOrganizer().getId());
            pstmt.setString(2, t.getEventType().name());
            pstmt.setString(3, t.getName());
            pstmt.setDate(4, Date.valueOf(t.getStartDate()));
            pstmt.setDate(5, t.getEndDate() != null ? Date.valueOf(t.getEndDate()) : null);
            pstmt.setString(6, t.getLocation());
            pstmt.setDouble(7, t.getTotalPrizeUsd());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) t.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting tournament", e);
        }
    }

    @Override
    public void update(Tournament t) {
        String sql = "UPDATE turnee SET id_organizator = ?, id_tip_eveniment = ?, nume_turneu = ?, data_inceput = ?, data_sfarsit = ?, locatie_oras = ?, premiu_total_usd = ? WHERE id_turneu = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, t.getOrganizer().getId());
            pstmt.setString(2, t.getEventType().name());
            pstmt.setString(3, t.getName());
            pstmt.setDate(4, Date.valueOf(t.getStartDate()));
            pstmt.setDate(5, t.getEndDate() != null ? Date.valueOf(t.getEndDate()) : null);
            pstmt.setString(6, t.getLocation());
            pstmt.setDouble(7, t.getTotalPrizeUsd());
            pstmt.setInt(8, t.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating tournament", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM turnee WHERE id_turneu = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting tournament", e);
        }
    }

    public List<Team> getParticipatingTeams(int tournamentId) {
        List<Team> teams = new ArrayList<>();
        String sql = "SELECT DISTINCT e.* FROM echipe e " +
                     "JOIN istoric_contracte ic ON e.id_echipa = ic.id_echipa " +
                     "JOIN statistici_individuale si ON ic.id_membru = si.id_jucator " +
                     "JOIN runde r ON si.id_runda = r.id_runda " +
                     "JOIN instante_meci_harta imh ON r.id_instanta = imh.id_instanta " +
                     "JOIN meciuri m ON imh.id_meci = m.id_meci " +
                     "WHERE m.id_turneu = ? " +
                     "AND m.data_ora BETWEEN ic.data_inceput AND NVL(ic.data_sfarsit, TO_DATE('31-12-9999', 'DD-MM-YYYY'))";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, tournamentId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Team team = new Team(rs.getInt("id_echipa"));
                    team.setName(rs.getString("nume_echipa"));
                    team.setTag(rs.getString("tag_echipa"));
                    int rankVal = rs.getInt("ranking_mondial");
                    if (rs.wasNull()) {
                        team.setRank(new Team.Unranked());
                    } else {
                        team.setRank(new Team.Ranked(rankVal));
                    }
                    team.setLogoUrl(rs.getString("logo_url"));
                    teams.add(team);
                }
            }
        } catch (SQLException e) {
            handleException("fetching participating teams", e);
        }
        return teams;
    }

    private Tournament mapResultSetToTournament(ResultSet rs) throws SQLException {
        Organizer org = new Organizer(rs.getInt("id_organizator"));
        org.setName(rs.getString("nume_organizator"));
        EventType type = EventType.valueOf(rs.getString("id_tip_eveniment"));
        Tournament t = new Tournament(
            rs.getInt("id_turneu"), org, type,
            rs.getString("nume_turneu"),
            rs.getDate("data_inceput").toLocalDate(),
            rs.getDate("data_sfarsit") != null ? rs.getDate("data_sfarsit").toLocalDate() : null,
            rs.getString("locatie_oras"),
            rs.getDouble("premiu_total_usd")
        );
        return t;
    }
}
