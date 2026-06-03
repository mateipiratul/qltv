package com.qltv.dao.personnel;

import com.qltv.dao.BaseDAO;
import com.qltv.models.personnel.Coach;
import com.qltv.models.personnel.Member;
import com.qltv.models.personnel.Player;
import com.qltv.models.in_game.Role;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class MemberDAO extends BaseDAO<Member> {

    @Override
    public List<Member> getAll() {
        try (Stream<Member> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Member> streamAll() {
        String sql = "SELECT m.*, j.id_rol, j.rezolutie, j.sensitivitate, j.dpi_mouse, " +
                     "a.stil_antrenorat, a.ani_experienta " +
                     "FROM membri m " +
                     "LEFT JOIN jucatori j ON m.id_membru = j.id_jucator " +
                     "LEFT JOIN antrenori a ON m.id_membru = a.id_antrenor";
        return fetchStream(sql, this::mapResultSetToMember);
    }

    @Override
    public Optional<Member> getById(int id) {
        String sql = "SELECT m.*, j.id_rol, j.rezolutie, j.sensitivitate, j.dpi_mouse, " +
                     "a.stil_antrenorat, a.ani_experienta " +
                     "FROM membri m " +
                     "LEFT JOIN jucatori j ON m.id_membru = j.id_jucator " +
                     "LEFT JOIN antrenori a ON m.id_membru = a.id_antrenor " +
                     "WHERE m.id_membru = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToMember(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching member by id", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Member member) {
        if (member.getId() == null) {
            insert(member);
        } else {
            update(member);
        }
    }

    private void insert(Member m) {
        String sqlMembru = "INSERT INTO membri (id_tara, nume, prenume, nickname, data_nastere, poza_profil_url) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);
            try (PreparedStatement pstmt = conn.prepareStatement(sqlMembru, new String[]{"id_membru"})) {
                pstmt.setString(1, m.getCountry() != null ? m.getCountry().getId() : null);
                pstmt.setString(2, m.getLastName());
                pstmt.setString(3, m.getFirstName());
                pstmt.setString(4, m.getNickname());
                pstmt.setDate(5, m.getBirthDate() != null ? Date.valueOf(m.getBirthDate()) : null);
                pstmt.setString(6, m.getProfilePictureUrl());
                pstmt.executeUpdate();
                
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) m.setId(rs.getInt(1));
                }

                switch (m) {
                    case Player p -> {
                        String sqlPlayer = "INSERT INTO jucatori (id_jucator, id_rol, rezolutie, sensitivitate, dpi_mouse) VALUES (?, ?, ?, ?, ?)";
                        try (PreparedStatement pstmtP = conn.prepareStatement(sqlPlayer)) {
                            pstmtP.setInt(1, p.getId());
                            pstmtP.setString(2, p.getRole() != null ? p.getRole().name() : "RFL");
                            pstmtP.setString(3, p.getResolution());
                            pstmtP.setDouble(4, p.getSensitivity());
                            pstmtP.setInt(5, p.getMouseDpi());
                            pstmtP.executeUpdate();
                        }
                    }
                    case Coach c -> {
                        String sqlCoach = "INSERT INTO antrenori (id_antrenor, stil_antrenorat, ani_experienta) VALUES (?, ?, ?)";
                        try (PreparedStatement pstmtC = conn.prepareStatement(sqlCoach)) {
                            pstmtC.setInt(1, c.getId());
                            pstmtC.setString(2, c.getCoachingStyle());
                            pstmtC.setInt(3, c.getYearsOfExperience());
                            pstmtC.executeUpdate();
                        }
                    }
                    default -> {
                    }
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
              handleException("inserting member", e);
        }
    }

    @Override
    public void update(Member m) {
        String sqlMembru = "UPDATE membri SET id_tara = ?, nume = ?, prenume = ?, nickname = ?, data_nastere = ?, poza_profil_url = ? WHERE id_membru = ?";
        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);
            try (PreparedStatement pstmt = conn.prepareStatement(sqlMembru)) {
                pstmt.setString(1, m.getCountry() != null ? m.getCountry().getId() : null);
                pstmt.setString(2, m.getLastName());
                pstmt.setString(3, m.getFirstName());
                pstmt.setString(4, m.getNickname());
                pstmt.setDate(5, m.getBirthDate() != null ? Date.valueOf(m.getBirthDate()) : null);
                pstmt.setString(6, m.getProfilePictureUrl());
                pstmt.setInt(7, m.getId());
                pstmt.executeUpdate();

                switch (m) {
                    case Player p -> {
                        String sqlPlayer = "UPDATE jucatori SET id_rol = ?, rezolutie = ?, sensitivitate = ?, dpi_mouse = ? WHERE id_jucator = ?";
                        try (PreparedStatement pstmtP = conn.prepareStatement(sqlPlayer)) {
                            pstmtP.setString(1, p.getRole() != null ? p.getRole().name() : "RFL");
                            pstmtP.setString(2, p.getResolution());
                            pstmtP.setDouble(3, p.getSensitivity());
                            pstmtP.setInt(4, p.getMouseDpi());
                            pstmtP.setInt(5, p.getId());
                            pstmtP.executeUpdate();
                        }
                    }
                    case Coach c -> {
                        String sqlCoach = "UPDATE antrenori SET stil_antrenorat = ?, ani_experienta = ? WHERE id_antrenor = ?";
                        try (PreparedStatement pstmtC = conn.prepareStatement(sqlCoach)) {
                            pstmtC.setString(1, c.getCoachingStyle());
                            pstmtC.setInt(2, c.getYearsOfExperience());
                            pstmtC.setInt(3, c.getId());
                            pstmtC.executeUpdate();
                        }
                    }
                    default -> {
                        // this branch stays here even if it will never be the case
                    }
                }
                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            } finally {
                conn.setAutoCommit(true);
            }
        } catch (SQLException e) {
            handleException("updating member", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM membri WHERE id_membru = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting member", e);
        }
    }

    public List<Player> getPlayersByTeam(int teamId) {
        List<Player> list = new ArrayList<>();
        String sql = "SELECT m.*, j.id_rol, j.rezolutie, j.sensitivitate, j.dpi_mouse " +
                     "FROM membri m " +
                     "JOIN jucatori j ON m.id_membru = j.id_jucator " +
                     "JOIN istoric_contracte c ON m.id_membru = c.id_membru " +
                     "WHERE c.id_echipa = ? AND (c.data_sfarsit IS NULL OR c.data_sfarsit >= CURRENT_DATE)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, teamId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Player p = new Player(rs.getInt("id_membru"));
                    p.setFirstName(rs.getString("prenume"));
                    p.setLastName(rs.getString("nume"));
                    p.setNickname(rs.getString("nickname"));
                    Date bDate = rs.getDate("data_nastere");
                    if (bDate != null) p.setBirthDate(bDate.toLocalDate());
                    try {
                        p.setRole(Role.valueOf(rs.getString("id_rol")));
                    } catch (Exception ignored) {}
                    p.setResolution(rs.getString("rezolutie"));
                    p.setSensitivity(rs.getDouble("sensitivitate"));
                    p.setMouseDpi(rs.getInt("dpi_mouse"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            handleException("fetching players by team", e);
        }
        return list;
    }

    private Member mapResultSetToMember(ResultSet rs) throws SQLException {
        int id = rs.getInt("id_membru");
        String firstName = rs.getString("prenume");
        String lastName = rs.getString("nume");
        String nickname = rs.getString("nickname");
        Date birthDate = rs.getDate("data_nastere");
        
        if (rs.getString("id_rol") != null) {
            Player p = new Player(id);
            p.setFirstName(firstName);
            p.setLastName(lastName);
            p.setNickname(nickname);
            if (birthDate != null) p.setBirthDate(birthDate.toLocalDate());
            try {
                p.setRole(Role.valueOf(rs.getString("id_rol")));
            } catch (SQLException ignored) {}
            p.setResolution(rs.getString("rezolutie"));
            p.setSensitivity(rs.getDouble("sensitivitate"));
            p.setMouseDpi(rs.getInt("dpi_mouse"));
            return p;
        } else {
            Coach c = new Coach(id);
            c.setFirstName(firstName);
            c.setLastName(lastName);
            c.setNickname(nickname);
            if (birthDate != null) c.setBirthDate(birthDate.toLocalDate());
            c.setCoachingStyle(rs.getString("stil_antrenorat"));
            c.setYearsOfExperience(rs.getInt("ani_experienta"));
            return c;
        }
    }
}
