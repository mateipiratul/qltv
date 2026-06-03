package com.qltv.dao.logistics;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.Sponsor;
import com.qltv.models.logistics.Sponsorship;
import com.qltv.models.personnel.Team;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class SponsorshipDAO extends BaseDAO<Sponsorship> {

    @Override
    public List<Sponsorship> getAll() {
        try (Stream<Sponsorship> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Sponsorship> streamAll() {
        String sql = "SELECT s.*, spn.nume_sponsor FROM sponsorizari s JOIN sponsori spn ON s.id_sponsor = spn.id_sponsor";
        return fetchStream(sql, this::mapResultSetToSponsorship);
    }

    @Override
    public Optional<Sponsorship> getById(int id) {
        String sql = "SELECT s.*, spn.nume_sponsor FROM sponsorizari s JOIN sponsori spn ON s.id_sponsor = spn.id_sponsor WHERE s.id_sponsorizare = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToSponsorship(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching sponsorship by id", e);
        }
        return Optional.empty();
    }

    public List<Sponsorship> getByTeam(int teamId) {
        List<Sponsorship> list = new ArrayList<>();
        String sql = "SELECT s.*, spn.nume_sponsor FROM sponsorizari s JOIN sponsori spn ON s.id_sponsor = spn.id_sponsor WHERE s.id_echipa = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, teamId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToSponsorship(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching sponsorships for team", e);
        }
        return list;
    }

    @Override
    public void save(Sponsorship s) {
        if (s.getId() == null) {
            insert(s);
        } else {
            update(s);
        }
    }

    private void insert(Sponsorship s) {
        String sql = "INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_sponsorizare"})) {
            pstmt.setInt(1, s.getTeam().getId());
            pstmt.setInt(2, s.getSponsor().getId());
            pstmt.setDate(3, Date.valueOf(s.getStartDate()));
            pstmt.setDate(4, s.getEndDate() != null ? Date.valueOf(s.getEndDate()) : null);
            pstmt.setDouble(5, s.getContractAmount());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) s.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting sponsorship", e);
        }
    }

    @Override
    public void update(Sponsorship s) {
        String sql = "UPDATE sponsorizari SET id_echipa = ?, id_sponsor = ?, data_inceput = ?, data_sfarsit = ?, suma_contract = ? WHERE id_sponsorizare = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, s.getTeam().getId());
            pstmt.setInt(2, s.getSponsor().getId());
            pstmt.setDate(3, Date.valueOf(s.getStartDate()));
            pstmt.setDate(4, s.getEndDate() != null ? Date.valueOf(s.getEndDate()) : null);
            pstmt.setDouble(5, s.getContractAmount());
            pstmt.setInt(6, s.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating sponsorship", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM sponsorizari WHERE id_sponsorizare = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
              handleException("deleting sponsorship", e);
        }
    }

    private Sponsorship mapResultSetToSponsorship(ResultSet rs) throws SQLException {
        Sponsor sponsor = new Sponsor(rs.getInt("id_sponsor"));
        sponsor.setName(rs.getString("nume_sponsor"));
        Team team = new Team(rs.getInt("id_echipa"));
        return new Sponsorship(
            rs.getInt("id_sponsorizare"),
            team, sponsor,
            rs.getDate("data_inceput").toLocalDate(),
            rs.getDate("data_sfarsit") != null ? rs.getDate("data_sfarsit").toLocalDate() : null,
            rs.getDouble("suma_contract")
        );
    }
}
