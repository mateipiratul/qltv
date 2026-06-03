package com.qltv.dao.logistics;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.Region;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class RegionDAO extends BaseDAO<Region> {

    @Override
    public List<Region> getAll() {
        try (Stream<Region> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Region> streamAll() {
        return fetchStream("SELECT * FROM regiuni ORDER BY nume_regiune", this::mapResultSetToRegion);
    }

    @Override
    public Optional<Region> getById(int id) {
        throw new UnsupportedOperationException("Regions use String IDs. Use getById(String) instead.");
    }

    public Optional<Region> getById(String id) {
        String sql = "SELECT * FROM regiuni WHERE id_regiune = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.ofNullable(mapResultSetToRegion(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching region by id", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Region entity) {
        throw new UnsupportedOperationException("Regions are predefined enums and cannot be inserted/saved from the application.");
    }

    @Override
    public void update(Region entity) {
        throw new UnsupportedOperationException("Regions are predefined enums and cannot be updated.");
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Regions are predefined enums and cannot be deleted.");
    }

    private Region mapResultSetToRegion(ResultSet rs) throws SQLException {
        String regionId = rs.getString("id_regiune");
        try {
            return Region.valueOf(regionId);
        } catch (IllegalArgumentException e) {
            System.err.println("Unknown region ID found in database: " + regionId);
            return null;
        }
    }
}
