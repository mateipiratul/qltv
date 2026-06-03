package com.qltv.dao.logistics;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.Sponsor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class SponsorDAO extends BaseDAO<Sponsor> {

    @Override
    public List<Sponsor> getAll() {
        try (Stream<Sponsor> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Sponsor> streamAll() {
        return fetchStream("SELECT * FROM sponsori ORDER BY nume_sponsor", this::mapResultSetToSponsor);
    }

    @Override
    public Optional<Sponsor> getById(int id) {
        String sql = "SELECT * FROM sponsori WHERE id_sponsor = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToSponsor(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching sponsor by id", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Sponsor sponsor) {
        if (sponsor.getId() == null) {
            insert(sponsor);
        } else {
            update(sponsor);
        }
    }

    private void insert(Sponsor sponsor) {
        String sql = "INSERT INTO sponsori (nume_sponsor, domeniu_activitate, site_web, logo_url) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_sponsor"})) {
            pstmt.setString(1, sponsor.getName());
            pstmt.setString(2, sponsor.getIndustry());
            pstmt.setString(3, sponsor.getWebsite());
            pstmt.setString(4, sponsor.getLogoUrl());
            
            pstmt.executeUpdate();
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    sponsor.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            handleException("inserting sponsor", e);
        }
    }

    @Override
    public void update(Sponsor sponsor) {
        String sql = "UPDATE sponsori SET nume_sponsor = ?, domeniu_activitate = ?, site_web = ?, logo_url = ? WHERE id_sponsor = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, sponsor.getName());
            pstmt.setString(2, sponsor.getIndustry());
            pstmt.setString(3, sponsor.getWebsite());
            pstmt.setString(4, sponsor.getLogoUrl());
            pstmt.setInt(5, sponsor.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating sponsor", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM sponsori WHERE id_sponsor = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting sponsor", e);
        }
    }

    private Sponsor mapResultSetToSponsor(ResultSet rs) throws SQLException {
        Sponsor s = new Sponsor(rs.getInt("id_sponsor"));
        s.setName(rs.getString("nume_sponsor"));
        s.setIndustry(rs.getString("domeniu_activitate"));
        s.setWebsite(rs.getString("site_web"));
        s.setLogoUrl(rs.getString("logo_url"));
        return s;
    }
}
