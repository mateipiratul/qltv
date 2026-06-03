package com.qltv.dao.app_related;

import com.qltv.dao.BaseDAO;
import com.qltv.models.app_related.Comment;
import com.qltv.models.app_related.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Stream;

public class CommentDAO extends BaseDAO<Comment> {

    @Override
    public List<Comment> getAll() {
        try (Stream<Comment> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Comment> streamAll() {
        return fetchStream("SELECT c.*, u.username FROM comentarii c " +
                           "JOIN utilizatori u ON c.id_user = u.id_user", this::mapResultSetToComment);
    }

    @Override
    public Optional<Comment> getById(int id) {
        String sql = "SELECT c.*, u.username FROM comentarii c " +
                     "JOIN utilizatori u ON c.id_user = u.id_user " +
                     "WHERE c.id_comentariu = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToComment(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching comment by ID", e);
        }
        return Optional.empty();
    }

    public List<Comment> getThreadByNews(int newsId) {
        Map<Integer, Comment> allComments = new HashMap<>();
        List<Comment> roots = new ArrayList<>();
        
        String sql = "SELECT c.*, u.username FROM comentarii c " +
                     "JOIN utilizatori u ON c.id_user = u.id_user " +
                     "WHERE c.id_noutate = ? " +
                     "ORDER BY c.data_postare";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, newsId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Comment comment = mapResultSetToComment(rs);
                    allComments.put(comment.getId(), comment);
                    
                    if (comment.getParentId() == null || comment.getParentId() == 0) {
                        roots.add(comment);
                    } else {
                        Comment parent = allComments.get(comment.getParentId());
                        if (parent != null) {
                            parent.getReplies().add(comment);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            handleException("fetching comment thread", e);
        }
        return roots;
    }

    @Override
    public void save(Comment c) {
        if (c.getId() == null) {
            insert(c);
        } else {
            update(c);
        }
    }

    private void insert(Comment c) {
        String sql = "INSERT INTO comentarii (id_noutate, id_user, id_parinte, continut, data_postare) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_comentariu"})) {
            pstmt.setInt(1, c.getNewsId());
            pstmt.setInt(2, c.getUser().getId());
            if (c.getParentId() != null) {
                pstmt.setInt(3, c.getParentId());
            } else {
                pstmt.setNull(3, Types.INTEGER);
            }
            pstmt.setString(4, c.getContent());
            pstmt.setTimestamp(5, Timestamp.valueOf(java.time.LocalDateTime.now()));
            
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) c.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting comment", e);
        }
    }

    @Override
    public void update(Comment c) {
        String sql = "UPDATE comentarii SET continut = ? WHERE id_comentariu = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, c.getContent());
            pstmt.setInt(2, c.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating comment", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM comentarii WHERE id_comentariu = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting comment", e);
        }
    }

    private Comment mapResultSetToComment(ResultSet rs) throws SQLException {
        User user = new User(rs.getInt("id_user"));
        user.setUsername(rs.getString("username"));
        
        Comment c = new Comment(rs.getInt("id_comentariu"));
        c.setNewsId(rs.getInt("id_noutate"));
        c.setUser(user);
        int parentId = rs.getInt("id_parinte");
        if (!rs.wasNull()) {
            c.setParentId(parentId);
        }
        c.setContent(rs.getString("continut"));
        c.setPostDate(rs.getTimestamp("data_postare").toLocalDateTime());
        return c;
    }
}
