package com.qltv.dao.personnel;

import com.qltv.dao.BaseDAO;
import com.qltv.models.personnel.Team;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class TeamDAO extends BaseDAO<Team> {

    @Override
    public List<Team> getAll() {
        try (Stream<Team> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Team> streamAll() {
        return fetchStream("SELECT * FROM echipe ORDER BY ranking_mondial ASC NULLS LAST", this::mapResultSetToTeam);
    }

    @Override
    public Optional<Team> getById(int id) {
        String sql = "SELECT * FROM echipe WHERE id_echipa = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToTeam(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching team by ID", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Team team) {
        if (team.getId() == null) {
            insert(team);
        } else {
            update(team);
        }
    }

    private void insert(Team team) {
        String sql = "INSERT INTO echipe (nume_echipa, tag_echipa, ranking_mondial, logo_url) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_echipa"})) {
            pstmt.setString(1, team.getName());
            pstmt.setString(2, team.getTag());
            if (team.getRank() instanceof Team.Ranked(int rankValue)) {
                pstmt.setInt(3, rankValue);
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }
            pstmt.setString(4, team.getLogoUrl());
            
            pstmt.executeUpdate();
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    team.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            handleException("inserting team", e);
        }
    }

    @Override
    public void update(Team team) {
        String sql = "UPDATE echipe SET nume_echipa = ?, tag_echipa = ?, ranking_mondial = ?, logo_url = ? WHERE id_echipa = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, team.getName());
            pstmt.setString(2, team.getTag());
            if (team.getRank() instanceof Team.Ranked(int rankValue)) {
                pstmt.setInt(3, rankValue);
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }
            pstmt.setString(4, team.getLogoUrl());
            pstmt.setInt(5, team.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating team", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM echipe WHERE id_echipa = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting team", e);
        }
    }

    private Team mapResultSetToTeam(ResultSet rs) throws SQLException {
        Team t = new Team(rs.getInt("id_echipa"));
        t.setName(rs.getString("nume_echipa"));
        t.setTag(rs.getString("tag_echipa"));
        
        int rankVal = rs.getInt("ranking_mondial");
        if (rs.wasNull()) {
            t.setRank(new Team.Unranked());
        } else {
            t.setRank(new Team.Ranked(rankVal));
        }
        t.setLogoUrl(rs.getString("logo_url"));
        return t;
    }
}
