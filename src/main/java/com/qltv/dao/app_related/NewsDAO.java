package com.qltv.dao.app_related;

import com.qltv.dao.BaseDAO;
import com.qltv.models.app_related.News;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class NewsDAO extends BaseDAO<News> {

    @Override
    public List<News> getAll() {
        try (Stream<News> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<News> streamAll() {
        return fetchStream("SELECT * FROM noutati ORDER BY data_postare DESC", this::mapResultSetToNews);
    }

    @Override
    public Optional<News> getById(int id) {
        String sql = "SELECT * FROM noutati WHERE id_noutate = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToNews(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching news by ID", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(News news) {
        if (news.getId() == null) {
            insert(news);
        } else {
            update(news);
        }
    }

    private void insert(News n) {
        String sql = "INSERT INTO noutati (titlu_noutate, continut_noutate, data_postare, imagine_url) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"id_noutate"})) {
            pstmt.setString(1, n.getTitle());
            pstmt.setString(2, n.getContent());
            pstmt.setDate(3, n.getPostDate() != null ? Date.valueOf(n.getPostDate()) : new Date(System.currentTimeMillis()));
            pstmt.setString(4, n.getImageUrl());
            pstmt.executeUpdate();
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) n.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            handleException("inserting news", e);
        }
    }

    @Override
    public void update(News n) {
        String sql = "UPDATE noutati SET titlu_noutate = ?, continut_noutate = ?, data_postare = ?, imagine_url = ? WHERE id_noutate = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, n.getTitle());
            pstmt.setString(2, n.getContent());
            pstmt.setDate(3, n.getPostDate() != null ? Date.valueOf(n.getPostDate()) : null);
            pstmt.setString(4, n.getImageUrl());
            pstmt.setInt(5, n.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("updating news", e);
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM noutati WHERE id_noutate = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            handleException("deleting news", e);
        }
    }

    private News mapResultSetToNews(ResultSet rs) throws SQLException {
        News n = new News(rs.getInt("id_noutate"));
        n.setTitle(rs.getString("titlu_noutate"));
        n.setContent(rs.getString("continut_noutate"));
        Date d = rs.getDate("data_postare");
        if (d != null) n.setPostDate(d.toLocalDate());
        n.setImageUrl(rs.getString("imagine_url"));
        return n;
    }
}
