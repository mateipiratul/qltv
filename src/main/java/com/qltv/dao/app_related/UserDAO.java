package com.qltv.dao.app_related;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.Country;
import com.qltv.models.personnel.Team;
import com.qltv.models.personnel.Member;
import com.qltv.models.personnel.Player;
import com.qltv.models.personnel.Coach;
import com.qltv.models.app_related.User;
import com.qltv.models.app_related.UserType;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class UserDAO extends BaseDAO<User> {

    @Override
    public List<User> getAll() {
        try (Stream<User> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<User> streamAll() {
        return fetchStream("SELECT * FROM utilizatori", this::mapResultSetToUser);
    }

    @Override
    public Optional<User> getById(int id) {
        String sql = "SELECT * FROM utilizatori WHERE id_user = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToUser(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching user by ID", e);
        }
        return Optional.empty();
    }

    public Optional<User> findByUsername(String username) {
        String sql = "SELECT * FROM utilizatori WHERE username = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToUser(rs));
                }
            }
        } catch (SQLException e) {
            handleException("finding user by username", e);
        }
        return Optional.empty();
    }

    public Optional<User> findByEmail(String email) {
        String sql = "SELECT * FROM utilizatori WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToUser(rs));
                }
            }
        } catch (SQLException e) {
            handleException("finding user by email", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(User user) {
        if (user.getId() == null) {
            insert(user);
        } else {
            update(user);
        }
    }

    private void insert(User user) {
        String sql = "INSERT INTO utilizatori (email, parola_hash, username, tip_user, data_creare, nationalitate, poza_profil_url, este_activ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_user"})) {
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPasswordHash());
            pstmt.setString(3, user.getUsername());
            pstmt.setString(4, user.getUserType().name());
            pstmt.setDate(5, user.getRegistrationDate() != null ? Date.valueOf(user.getRegistrationDate()) : new Date(System.currentTimeMillis()));
            pstmt.setString(6, user.getNationality() != null ? user.getNationality().getId() : null);
            pstmt.setString(7, user.getProfilePictureUrl());
            pstmt.setInt(8, user.getIsActive() != null && user.getIsActive() ? 1 : 0);
            
            pstmt.executeUpdate();
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            handleException("inserting user", e);
        }
    }

    @Override
    public void update(User user) {
        String sql = "UPDATE utilizatori SET email = ?, parola_hash = ?, username = ?, tip_user = ?, nationalitate = ?, poza_profil_url = ?, este_activ = ? WHERE id_user = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPasswordHash());
            pstmt.setString(3, user.getUsername());
            pstmt.setString(4, user.getUserType().name());
            pstmt.setString(5, user.getNationality() != null ? user.getNationality().getId() : null);
            pstmt.setString(6, user.getProfilePictureUrl());
            pstmt.setInt(7, user.getIsActive() != null && user.getIsActive() ? 1 : 0);
            pstmt.setInt(8, user.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating user", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM utilizatori WHERE id_user = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
              handleException("deleting user", e);
        }
    }

    // Favorites Management - Teams
    public Stream<Team> streamFavoriteTeams(int userId) {
        String sql = "SELECT e.* FROM echipe e JOIN user_echipe_fav f ON e.id_echipa = f.id_echipa WHERE f.id_user = ?";
        return fetchStream(sql, rs -> {
            Team team = new Team(rs.getInt("id_echipa"));
            team.setName(rs.getString("nume_echipa"));
            team.setTag(rs.getString("tag_echipa"));
            team.setLogoUrl(rs.getString("logo_url"));
            int rankVal = rs.getInt("ranking_mondial");
            team.setRank(rs.wasNull() ? new Team.Unranked() : new Team.Ranked(rankVal));
            return team;
        }, userId);
    }

    public void addFavoriteTeam(int userId, int teamId) {
        String sql = "INSERT INTO user_echipe_fav (id_user, id_echipa) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, teamId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // Ignore duplicate favorites
        }
    }

    public void removeFavoriteTeam(int userId, int teamId) {
        String sql = "DELETE FROM user_echipe_fav WHERE id_user = ? AND id_echipa = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, teamId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("removing favorite team", e);
        }
    }

    public boolean isTeamFavorited(int userId, int teamId) {
        String sql = "SELECT 1 FROM user_echipe_fav WHERE id_user = ? AND id_echipa = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, teamId);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }

    // Favorites Management - Members
    public Stream<Member> streamFavoriteMembers(int userId) {
        String sql = "SELECT m.*, j.id_rol, j.rezolutie, j.sensitivitate, j.dpi_mouse, a.stil_antrenorat, a.ani_experienta " +
                     "FROM membri m " +
                     "JOIN user_membri_fav f ON m.id_membru = f.id_membru " +
                     "LEFT JOIN jucatori j ON m.id_membru = j.id_jucator " +
                     "LEFT JOIN antrenori a ON m.id_membru = a.id_antrenor " +
                     "WHERE f.id_user = ?";
        return fetchStream(sql, rs -> {
            int id = rs.getInt("id_membru");
            if (rs.getString("id_rol") != null) {
                Member p = new Player(id);
                p.setNickname(rs.getString("nickname"));
                p.setFirstName(rs.getString("prenume"));
                p.setLastName(rs.getString("nume"));
                return p;
            } else {
                Member c = new Coach(id);
                c.setNickname(rs.getString("nickname"));
                c.setFirstName(rs.getString("prenume"));
                c.setLastName(rs.getString("nume"));
                return c;
            }
        }, userId);
    }

    public void addFavoriteMember(int userId, int memberId) {
        String sql = "INSERT INTO user_membri_fav (id_user, id_membru) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, memberId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // Ignore duplicate
        }
    }

    public void removeFavoriteMember(int userId, int memberId) {
        String sql = "DELETE FROM user_membri_fav WHERE id_user = ? AND id_membru = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, memberId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("removing favorite member", e);
        }
    }

    public boolean isMemberFavorited(int userId, int memberId) {
        String sql = "SELECT 1 FROM user_membri_fav WHERE id_user = ? AND id_membru = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, memberId);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User u = new User(rs.getInt("id_user"));
        u.setEmail(rs.getString("email"));
        u.setPasswordHash(rs.getString("parola_hash"));
        u.setUsername(rs.getString("username"));
        u.setUserType(UserType.valueOf(rs.getString("tip_user")));
        u.setRegistrationDate(rs.getDate("data_creare").toLocalDate());
        u.setIsActive(rs.getInt("este_activ") == 1);
        u.setProfilePictureUrl(rs.getString("poza_profil_url"));
        
        String natCode = rs.getString("nationalitate");
        if (natCode != null) {
            u.setNationality(new Country(natCode));
        }
        return u;
    }
}
