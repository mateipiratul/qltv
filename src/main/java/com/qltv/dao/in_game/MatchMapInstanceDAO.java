package com.qltv.dao.in_game;

import com.qltv.dao.BaseDAO;
import com.qltv.models.in_game.Map;
import com.qltv.models.in_game.Match;
import com.qltv.models.in_game.MatchMapInstance;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class MatchMapInstanceDAO extends BaseDAO<MatchMapInstance> {

    @Override
    public List<MatchMapInstance> getAll() {
        try (Stream<MatchMapInstance> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<MatchMapInstance> streamAll() {
        return fetchStream("SELECT i.*, h.nume_harta FROM instante_meci_harta i " +
                           "JOIN harti h ON i.id_harta = h.id_harta", this::mapResultSetToInstance);
    }

    @Override
    public Optional<MatchMapInstance> getById(int id) {
        String sql = "SELECT i.*, h.nume_harta FROM instante_meci_harta i " +
                     "JOIN harti h ON i.id_harta = h.id_harta " +
                     "WHERE i.id_instanta = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToInstance(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching match map instance by ID", e);
        }
        return Optional.empty();
    }

    public List<MatchMapInstance> getByMatch(int matchId) {
        List<MatchMapInstance> list = new ArrayList<>();
        String sql = "SELECT i.*, h.nume_harta FROM instante_meci_harta i " +
                     "JOIN harti h ON i.id_harta = h.id_harta " +
                     "WHERE i.id_meci = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, matchId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToInstance(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching match map instances by match", e);
        }
        return list;
    }

    @Override
    public void save(MatchMapInstance instance) {
        if (instance.getId() == null) {
            insert(instance);
        } else {
            update(instance);
        }
    }

    private void insert(MatchMapInstance i) {
        String sql = "INSERT INTO instante_meci_harta (id_meci, id_harta, durata_minute) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_instanta"})) {
            pstmt.setInt(1, i.getMatch().getId());
            pstmt.setInt(2, i.getMap().getId());
            if (i.getDurationMinutes() != null) {
                pstmt.setInt(3, i.getDurationMinutes());
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) i.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting match map instance", e);
        }
    }

    @Override
    public void update(MatchMapInstance i) {
        String sql = "UPDATE instante_meci_harta SET id_meci = ?, id_harta = ?, durata_minute = ? WHERE id_instanta = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, i.getMatch().getId());
            pstmt.setInt(2, i.getMap().getId());
            if (i.getDurationMinutes() != null) {
                pstmt.setInt(3, i.getDurationMinutes());
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }
            pstmt.setInt(4, i.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating match map instance", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM instante_meci_harta WHERE id_instanta = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
              handleException("deleting match map instance", e);
        }
    }

    private MatchMapInstance mapResultSetToInstance(ResultSet rs) throws SQLException {
        Match match = new Match(rs.getInt("id_meci"));
        Map map = new Map(rs.getInt("id_harta"));
        map.setName(rs.getString("nume_harta"));
        
        Integer duration = rs.getInt("durata_minute");
        if (rs.wasNull()) {
            duration = null;
        }

        return new MatchMapInstance(
            rs.getInt("id_instanta"),
            match,
            map,
            duration
        );
    }
}
