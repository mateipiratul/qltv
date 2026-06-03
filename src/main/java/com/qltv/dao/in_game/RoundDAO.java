package com.qltv.dao.in_game;

import com.qltv.dao.BaseDAO;
import com.qltv.models.in_game.Round;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class RoundDAO extends BaseDAO<Round> {

    @Override
    public List<Round> getAll() {
        try (Stream<Round> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Round> streamAll() {
        return fetchStream("SELECT * FROM runde ORDER BY id_instanta, numar_runda", this::mapResultSetToRound);
    }

    @Override
    public Optional<Round> getById(int id) {
        String sql = "SELECT * FROM runde WHERE id_runda = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToRound(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching round by ID", e);
        }
        return Optional.empty();
    }

    public List<Round> getByMapInstance(int instanceId) {
        String sql = "SELECT * FROM runde WHERE id_instanta = ? ORDER BY numar_runda";
        try (Stream<Round> stream = fetchStream(sql, this::mapResultSetToRound, instanceId)) {
            return stream.toList();
        }
    }

    @Override
    public void save(Round r) {
        if (r.getId() == null) {
            insert(r);
        } else {
            update(r);
        }
    }

    private void insert(Round r) {
        String sql = "INSERT INTO runde (id_instanta, numar_runda, cod_rezultat) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_runda"})) {
            pstmt.setInt(1, r.getMapInstanceId());
            pstmt.setInt(2, r.getRoundNumber());
            pstmt.setString(3, r.getResultCode());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) r.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting round", e);
        }
    }

    @Override
    public void update(Round r) {
        String sql = "UPDATE runde SET id_instanta = ?, numar_runda = ?, cod_rezultat = ? WHERE id_runda = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, r.getMapInstanceId());
            pstmt.setInt(2, r.getRoundNumber());
            pstmt.setString(3, r.getResultCode());
            pstmt.setInt(4, r.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating round", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM runde WHERE id_runda = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting round", e);
        }
    }

    private Round mapResultSetToRound(ResultSet rs) throws SQLException {
        Round r = new Round(rs.getInt("id_runda"));
        r.setMapInstanceId(rs.getInt("id_instanta"));
        r.setRoundNumber(rs.getInt("numar_runda"));
        r.setResultCode(rs.getString("cod_rezultat"));
        return r;
    }
}
