package com.qltv.dao;

import com.qltv.util.DatabaseManager;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.Spliterators;
import java.util.function.Consumer;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public abstract class BaseDAO<T> {

    @FunctionalInterface
    protected interface ResultSetMapper<R> {
        R map(ResultSet rs) throws SQLException;
    }

    protected Connection getConnection() throws SQLException {
        return DatabaseManager.getInstance().getConnection();
    }

    protected void logException(String message, Throwable t) {
        Logger.getLogger(getClass().getName()).log(Level.SEVERE, message, t);
    }

    protected void handleException(String operation, SQLException e) {
        logException("Database error during " + operation, e);
        String userMessage = com.qltv.util.SqlExceptionTranslator.translate(e);
        throw new DataAccessException(userMessage, e);
    }

    protected <R> Stream<R> fetchStream(String sql, ResultSetMapper<R> mapper, Object... params) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }
            rs = pstmt.executeQuery();

            final Connection finalConn = conn;
            final PreparedStatement finalPstmt = pstmt;
            final ResultSet finalRs = rs;

            return StreamSupport.stream(new Spliterators.AbstractSpliterator<R>(Long.MAX_VALUE, 0) {
                @Override
                public boolean tryAdvance(Consumer<? super R> action) {
                    try {
                        if (finalRs.next()) {
                            action.accept(mapper.map(finalRs));
                            return true;
                        }
                        return false;
                    } catch (SQLException e) {
                        throw new RuntimeException("Error during stream iteration", e);
                    }
                }
            }, false).onClose(() -> {
                try { if (finalRs != null) finalRs.close(); } catch (SQLException e) { logException("Error closing RS", e); }
                try {
                    finalPstmt.close();
                } catch (SQLException e) { logException("Error closing Stmt", e); }
                try {
                    finalConn.close();
                } catch (SQLException e) { logException("Error closing Conn", e); }
            });
        } catch (SQLException e) {
            // Clean up on initial failure
            try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
            logException("Failed to initiate stream fetch for SQL: " + sql, e);
            return Stream.empty();
        }
    }

    public abstract List<T> getAll();

    public abstract Stream<T> streamAll();
    
    public abstract Optional<T> getById(int id);

    public abstract void save(T entity);

    public abstract void update(T entity);

    public abstract void delete(int id);
}
