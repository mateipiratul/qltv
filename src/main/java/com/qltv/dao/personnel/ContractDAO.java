package com.qltv.dao.personnel;

import com.qltv.dao.BaseDAO;
import com.qltv.models.personnel.Contract;
import com.qltv.models.personnel.Player;
import com.qltv.models.personnel.Team;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class ContractDAO extends BaseDAO<Contract> {

    @Override
    public List<Contract> getAll() {
        try (Stream<Contract> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Contract> streamAll() {
        String sql = "SELECT c.*, e.nume_echipa FROM istoric_contracte c JOIN echipe e ON c.id_echipa = e.id_echipa";
        return fetchStream(sql, this::mapResultSetToContract);
    }

    @Override
    public Optional<Contract> getById(int id) {
        String sql = "SELECT c.*, e.nume_echipa FROM istoric_contracte c JOIN echipe e ON c.id_echipa = e.id_echipa WHERE c.id_contract = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToContract(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching contract by id", e);
        }
        return Optional.empty();
    }

    public List<Contract> getByMember(int memberId) {
        String sql = "SELECT c.*, e.nume_echipa, m.nickname as member_nickname FROM istoric_contracte c JOIN echipe e ON c.id_echipa = e.id_echipa JOIN membri m ON c.id_membru = m.id_membru WHERE c.id_membru = ?";
        try (Stream<Contract> stream = fetchStream(sql, this::mapResultSetToContract, memberId)) {
            return stream.toList();
        }
    }

    public List<Contract> getByTeam(int teamId) {
        String sql = "SELECT c.*, e.nume_echipa, m.nickname as member_nickname FROM istoric_contracte c JOIN echipe e ON c.id_echipa = e.id_echipa JOIN membri m ON c.id_membru = m.id_membru WHERE c.id_echipa = ? ORDER BY c.data_inceput DESC";
        try (Stream<Contract> stream = fetchStream(sql, this::mapResultSetToContract, teamId)) {
            return stream.toList();
        }
    }

    @Override
    public void save(Contract c) {
        if (c.getId() == null) {
            insert(c);
        } else {
            update(c);
        }
    }

    private void insert(Contract c) {
        String sql = "INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_contract"})) {
            pstmt.setInt(1, c.getMember().getId());
            pstmt.setInt(2, c.getTeam().getId());
            pstmt.setDate(3, Date.valueOf(c.getStartDate()));
            pstmt.setDate(4, c.getEndDate() != null ? Date.valueOf(c.getEndDate()) : null);
            pstmt.setDouble(5, c.getMonthlySalary());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) c.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting contract", e);
        }
    }

    @Override
    public void update(Contract c) {
        String sql = "UPDATE istoric_contracte SET id_membru = ?, id_echipa = ?, data_inceput = ?, data_sfarsit = ?, salariu_lunar = ? WHERE id_contract = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, c.getMember().getId());
            pstmt.setInt(2, c.getTeam().getId());
            pstmt.setDate(3, Date.valueOf(c.getStartDate()));
            pstmt.setDate(4, c.getEndDate() != null ? Date.valueOf(c.getEndDate()) : null);
            pstmt.setDouble(5, c.getMonthlySalary());
            pstmt.setInt(6, c.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating contract", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM istoric_contracte WHERE id_contract = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting contract", e);
        }
    }

    private Contract mapResultSetToContract(ResultSet rs) throws SQLException {
        Team team = new Team(rs.getInt("id_echipa"));
        team.setName(rs.getString("nume_echipa"));
        Player member = new Player(rs.getInt("id_membru"));
        try {
            member.setNickname(rs.getString("member_nickname"));
        } catch (SQLException ignored) {}
        
        return new Contract(
            rs.getInt("id_contract"),
            member, team,
            rs.getDate("data_inceput").toLocalDate(),
            rs.getDate("data_sfarsit") != null ? rs.getDate("data_sfarsit").toLocalDate() : null,
            rs.getDouble("salariu_lunar")
        );
    }
}
