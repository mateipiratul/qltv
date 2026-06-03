package com.qltv.dao.in_game;

import com.qltv.dao.BaseDAO;
import com.qltv.models.in_game.Match;
import com.qltv.models.personnel.Team;
import com.qltv.models.logistics.Tournament;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class MatchDAO extends BaseDAO<Match> {

    @Override
    public List<Match> getAll() {
        try (Stream<Match> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Match> streamAll() {
        return fetchStream("SELECT m.*, t.nume_turneu FROM meciuri m " +
                           "JOIN turnee t ON m.id_turneu = t.id_turneu " +
                           "ORDER BY m.data_ora DESC", this::mapResultSetToMatch);
    }

    @Override
    public Optional<Match> getById(int id) {
        String sql = "SELECT m.*, t.nume_turneu FROM meciuri m " +
                     "JOIN turnee t ON m.id_turneu = t.id_turneu " +
                     "WHERE m.id_meci = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToMatch(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching match by ID", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Match match) {
        if (match.getId() == null) {
            insert(match);
        } else {
            update(match);
        }
    }

    private void insert(Match m) {
        String sql = "INSERT INTO meciuri (id_turneu, data_ora, format_meci, faza_turneu) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_meci"})) {
            pstmt.setInt(1, m.getTournament().getId());
            pstmt.setTimestamp(2, m.getDate() != null ? Timestamp.valueOf(m.getDate().atStartOfDay()) : null);
            pstmt.setString(3, m.getFormat());
            pstmt.setString(4, m.getStage());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) m.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting match", e);
        }
    }

    @Override
    public void update(Match m) {
        String sql = "UPDATE meciuri SET id_turneu = ?, data_ora = ?, format_meci = ?, faza_turneu = ? WHERE id_meci = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, m.getTournament().getId());
            pstmt.setTimestamp(2, m.getDate() != null ? Timestamp.valueOf(m.getDate().atStartOfDay()) : null);
            pstmt.setString(3, m.getFormat());
            pstmt.setString(4, m.getStage());
            pstmt.setInt(5, m.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating match", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM meciuri WHERE id_meci = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
              handleException("deleting match", e);
        }
    }

    public List<Team> getTeamsInMatch(int matchId) {
        List<Team> teams = new ArrayList<>();
        // Logic: Match -> Rounds -> IndividualStats -> Player -> Contract -> Team
        String sql = "SELECT DISTINCT e.* FROM echipe e " +
                     "JOIN istoric_contracte ic ON e.id_echipa = ic.id_echipa " +
                     "JOIN statistici_individuale si ON ic.id_membru = si.id_jucator " +
                     "JOIN runde r ON si.id_runda = r.id_runda " +
                     "JOIN instante_meci_harta imh ON r.id_instanta = imh.id_instanta " +
                     "JOIN meciuri m ON imh.id_meci = m.id_meci " +
                     "WHERE m.id_meci = ? " +
                     "AND m.data_ora BETWEEN ic.data_inceput AND NVL(ic.data_sfarsit, TO_DATE('31-12-9999', 'DD-MM-YYYY'))";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, matchId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Team t = new Team(rs.getInt("id_echipa"));
                    t.setName(rs.getString("nume_echipa"));
                    t.setTag(rs.getString("tag_echipa"));
                    
                    int rankVal = rs.getInt("ranking_mondial");
                    if (rs.wasNull()) {
                        t.setRank(new Team.Unranked());
                    } else {
                        t.setRank(new Team.Ranked(rankVal));
                    }
                    teams.add(t);
                }
            }
        } catch (SQLException e) {
            handleException("fetching teams in match", e);
        }
        return teams;
    }

    public List<Match> getMatchesByTournament(int tournamentId) {
        String sql = "SELECT m.*, t.nume_turneu FROM meciuri m " +
                     "JOIN turnee t ON m.id_turneu = t.id_turneu " +
                     "WHERE m.id_turneu = ? " +
                     "ORDER BY m.data_ora DESC";
        try (Stream<Match> stream = fetchStream(sql, this::mapResultSetToMatch, tournamentId)) {
            return stream.toList();
        }
    }

    public List<Match> getMatchesByPlayer(int playerId) {
        String sql = "SELECT DISTINCT m.*, t.nume_turneu FROM meciuri m " +
                     "JOIN turnee t ON m.id_turneu = t.id_turneu " +
                     "JOIN instante_meci_harta imh ON m.id_meci = imh.id_meci " +
                     "JOIN runde r ON imh.id_instanta = r.id_instanta " +
                     "JOIN statistici_individuale si ON r.id_runda = si.id_runda " +
                     "WHERE si.id_jucator = ? " +
                     "ORDER BY m.data_ora DESC";
        try (Stream<Match> stream = fetchStream(sql, this::mapResultSetToMatch, playerId)) {
            return stream.toList();
        }
    }

    private Match mapResultSetToMatch(ResultSet rs) throws SQLException {
        Tournament t = new Tournament(rs.getInt("id_turneu"));
        t.setName(rs.getString("nume_turneu"));
        
        Match m = new Match(rs.getInt("id_meci"));
        m.setTournament(t);
        Date d = rs.getDate("data_ora");
        if (d != null) m.setDate(d.toLocalDate());
        m.setFormat(rs.getString("format_meci"));
        m.setStage(rs.getString("faza_turneu"));
        return m;
    }
}
