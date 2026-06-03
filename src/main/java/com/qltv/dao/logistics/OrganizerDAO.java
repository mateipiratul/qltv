package com.qltv.dao.logistics;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.Organizer;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class OrganizerDAO extends BaseDAO<Organizer> {

    @Override
    public List<Organizer> getAll() {
        try (Stream<Organizer> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Organizer> streamAll() {
        return fetchStream("SELECT * FROM organizatori ORDER BY nume_organizator", this::mapResultSetToOrganizer);
    }

    @Override
    public Optional<Organizer> getById(int id) {
        String sql = "SELECT * FROM organizatori WHERE id_organizator = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToOrganizer(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching organizer by id", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Organizer org) {
        if (org.getId() == null) {
            insert(org);
        } else {
            update(org);
        }
    }

    private void insert(Organizer o) {
        String sql = "INSERT INTO organizatori (nume_organizator, site_web, email_contact, logo_url) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_organizator"})) {
            pstmt.setString(1, o.getName());
            pstmt.setString(2, o.getWebsite());
            pstmt.setString(3, o.getEmail());
            pstmt.setString(4, o.getLogoUrl());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) o.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting organizer", e);
        }
    }

    @Override
    public void update(Organizer o) {
        String sql = "UPDATE organizatori SET nume_organizator = ?, site_web = ?, email_contact = ?, logo_url = ? WHERE id_organizator = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, o.getName());
            pstmt.setString(2, o.getWebsite());
            pstmt.setString(3, o.getEmail());
            pstmt.setString(4, o.getLogoUrl());
            pstmt.setInt(5, o.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating organizer", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM organizatori WHERE id_organizator = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting organizer", e);
        }
    }

    private Organizer mapResultSetToOrganizer(ResultSet rs) throws SQLException {
        Organizer o = new Organizer(rs.getInt("id_organizator"));
        o.setName(rs.getString("nume_organizator"));
        o.setWebsite(rs.getString("site_web"));
        o.setEmail(rs.getString("email_contact"));
        o.setLogoUrl(rs.getString("logo_url"));
        return o;
    }
}
