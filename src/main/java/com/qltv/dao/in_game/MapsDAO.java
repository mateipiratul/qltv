package com.qltv.dao.in_game;

import com.qltv.dao.BaseDAO;
import com.qltv.models.in_game.Map;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class MapsDAO extends BaseDAO<Map> {

    @Override
    public List<Map> getAll() {
        try (Stream<Map> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Map> streamAll() {
        return fetchStream("SELECT * FROM harti ORDER BY nume_harta", this::mapResultSetToMap);
    }

    @Override
    public Optional<Map> getById(int id) {
        String sql = "SELECT * FROM harti WHERE id_harta = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToMap(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching map by ID", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Map map) {
        if (map.getId() == null) {
            insert(map);
        } else {
            update(map);
        }
    }

    private void insert(Map m) {
        String sql = "INSERT INTO harti (nume_harta, pool_activ, imagine_url) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_harta"})) {
            pstmt.setString(1, m.getName());
            pstmt.setInt(2, m.isActivePool() ? 1 : 0);
            pstmt.setString(3, m.getImageUrl());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) m.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting map", e);
        }
    }

    @Override
    public void update(Map m) {
        String sql = "UPDATE harti SET nume_harta = ?, pool_activ = ?, imagine_url = ? WHERE id_harta = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, m.getName());
            pstmt.setInt(2, m.isActivePool() ? 1 : 0);
            pstmt.setString(3, m.getImageUrl());
            pstmt.setInt(4, m.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating map", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM harti WHERE id_harta = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting map", e);
        }
    }

    private Map mapResultSetToMap(ResultSet rs) throws SQLException {
        Map m = new Map(rs.getInt("id_harta"));
        m.setName(rs.getString("nume_harta"));
        m.setActivePool(rs.getInt("pool_activ") == 1);
        m.setImageUrl(rs.getString("imagine_url"));
        return m;
    }
}
