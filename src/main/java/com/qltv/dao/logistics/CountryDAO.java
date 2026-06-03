package com.qltv.dao.logistics;

import com.qltv.dao.BaseDAO;
import com.qltv.models.logistics.Country;
import com.qltv.models.logistics.Region;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class CountryDAO extends BaseDAO<Country> {

    @Override
    public List<Country> getAll() {
        try (Stream<Country> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<Country> streamAll() {
        return fetchStream("SELECT * FROM tari ORDER BY nume_tara", this::mapResultSetToCountry);
    }

    @Override
    public Optional<Country> getById(int id) {
        throw new UnsupportedOperationException("Countries use String IDs. Use getByCode(String) instead.");
    }

    public Optional<Country> getByCode(String code) {
        String sql = "SELECT * FROM tari WHERE id_tara = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, code);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return Optional.ofNullable(mapResultSetToCountry(rs));
                }
            }
        } catch (SQLException e) {
            handleException("fetching country by code", e);
        }
        return Optional.empty();
    }

    @Override
    public void save(Country country) {
        throw new UnsupportedOperationException("Countries are predefined and cannot be inserted/saved from the application.");
    }

    @Override
    public void update(Country entity) {
        throw new UnsupportedOperationException("Countries are predefined and cannot be updated.");
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Countries are predefined and cannot be deleted.");
    }

    private Country mapResultSetToCountry(ResultSet rs) throws SQLException {
        Country c = new Country(rs.getString("id_tara"));
        c.setName(rs.getString("nume_tara"));
        c.setFlagUrl(rs.getString("steag_url"));

        String regId = rs.getString("id_regiune");
        if (regId != null) {
            try {
                c.setRegionId(Region.valueOf(regId));
            } catch (IllegalArgumentException e) {
                System.err.println("Unknown region ID found in database: " + regId);
                return null;
            }
        }
        return c;
    }
}
