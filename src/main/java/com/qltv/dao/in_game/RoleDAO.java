package com.qltv.dao.in_game;

import com.qltv.dao.BaseDAO;
import com.qltv.models.in_game.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;
import java.util.Objects;

public class RoleDAO extends BaseDAO<Role> {

    @Override
    public List<Role> getAll() {
        try (Stream<Role> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Role> streamAll() {
        return fetchStream("SELECT * FROM roluri ORDER BY nume_rol", this::mapResultSetToRole)
                .filter(Objects::nonNull);
    }

    @Override
    public Optional<Role> getById(int id) {
        throw new UnsupportedOperationException("Roles use String IDs. Use getById(String) instead.");
    }

    public Optional<Role> getById(String id) {
        String sql = "SELECT * FROM roluri WHERE id_rol = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.ofNullable(mapResultSetToRole(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching role by ID", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Role entity) {
        throw new UnsupportedOperationException("Roles are predefined enums and cannot be inserted/saved from the application.");
    }

    @Override
    public void update(Role entity) {
        throw new UnsupportedOperationException("Roles are predefined enums and cannot be updated.");
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Roles are predefined enums and cannot be deleted.");
    }

    private Role mapResultSetToRole(ResultSet rs) throws SQLException {
        String roleId = rs.getString("id_rol");
        try {
            return Role.valueOf(roleId);
        } catch (IllegalArgumentException e) {
            System.err.println("Unknown role ID found in database: " + roleId);
            return null;
        }
    }
}
