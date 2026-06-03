package com.qltv.util;

import oracle.jdbc.pool.OracleDataSource;
import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseManager {
    private static DatabaseManager instance;
    private final OracleDataSource dataSource;

    private DatabaseManager() {
        Properties props = new Properties();
        try (InputStream is = DatabaseManager.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (is == null) {
                throw new IOException("db.properties not found in classpath");
            }
            props.load(is);

            dataSource = new OracleDataSource();
            dataSource.setURL(props.getProperty("db.url"));
            dataSource.setUser(props.getProperty("db.user"));
            dataSource.setPassword(props.getProperty("db.password"));

            // Enabling basic pooling features provided by the Oracle driver
            Properties cacheProps = new Properties();
            cacheProps.setProperty("InitialLimit", "3");
            cacheProps.setProperty("MinLimit", "1");
            cacheProps.setProperty("MaxLimit", "10");
            dataSource.setImplicitCachingEnabled(true);
            dataSource.setConnectionProperties(cacheProps);

        } catch (IOException | SQLException e) {
            throw new RuntimeException("Failed to initialize DatabaseManager with Connection Pooling", e);
        }
    }

    public static synchronized DatabaseManager getInstance() {
        if (instance == null) {
            instance = new DatabaseManager();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            System.err.println("Connection pool test failed: " + e.getMessage());
            return false;
        }
    }
}
