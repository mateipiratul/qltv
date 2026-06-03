package com.qltv.dao.in_game;

import com.qltv.dao.BaseDAO;
import com.qltv.models.in_game.IndividualStatistic;
import com.qltv.models.personnel.Player;
import com.qltv.models.in_game.Round;
import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class StatisticDAO extends BaseDAO<IndividualStatistic> {

    @Override
    public List<IndividualStatistic> getAll() {
        try (Stream<IndividualStatistic> stream = streamAll()) {
            return stream.toList();
        }
    }

    @Override
    public Stream<IndividualStatistic> streamAll() {
        String sql = "SELECT s.*, m.nickname, mk.nickname as killer_nickname " +
                     "FROM statistici_individuale s " +
                     "JOIN membri m ON s.id_jucator = m.id_membru " +
                     "LEFT JOIN membri mk ON s.id_jucator_ucigas = mk.id_membru";
        return fetchStream(sql, this::mapResultSetToStatistic);
    }

    @Override
    public Optional<IndividualStatistic> getById(int id) {
        throw new UnsupportedOperationException("IndividualStatistic uses a compound key (Round ID + Player ID). Use getByRound(roundId) instead.");
    }

    public List<IndividualStatistic> getByRound(int roundId) {
        String sql = "SELECT s.*, m.nickname, mk.nickname as killer_nickname " +
                     "FROM statistici_individuale s " +
                     "JOIN membri m ON s.id_jucator = m.id_membru " +
                     "LEFT JOIN membri mk ON s.id_jucator_ucigas = mk.id_membru " +
                     "WHERE s.id_runda = ?";
        try (Stream<IndividualStatistic> stream = fetchStream(sql, this::mapResultSetToStatistic, roundId)) {
            return stream.toList();
        }
    }

    @Override
    public void save(IndividualStatistic s) {
        // Always insert/update based on compound key
        String sql = "MERGE INTO statistici_individuale s " +
                     "USING (SELECT ? id_runda, ? id_jucator FROM dual) src " +
                     "ON (s.id_runda = src.id_runda AND s.id_jucator = src.id_jucator) " +
                     "WHEN MATCHED THEN UPDATE SET kills = ?, assists = ?, damage = ?, headshots = ?, flash_assists = ?, died = ?, id_jucator_ucigas = ? " +
                     "WHEN NOT MATCHED THEN INSERT (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, id_jucator_ucigas) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, s.getRound().getId());
            pstmt.setInt(2, s.getPlayer().getId());
            pstmt.setInt(3, s.getKills());
            pstmt.setInt(4, s.getAssists());
            pstmt.setInt(5, s.getDamage());
            pstmt.setInt(6, s.getHeadshots());
            pstmt.setInt(7, s.getFlashAssists());
            pstmt.setInt(8, s.getDied() ? 1 : 0);
            if (s.getKilledBy() != null) {
                pstmt.setInt(9, s.getKilledBy().getId());
            } else {
                pstmt.setNull(9, Types.INTEGER);
            }
            
            pstmt.setInt(10, s.getRound().getId());
            pstmt.setInt(11, s.getPlayer().getId());
            pstmt.setInt(12, s.getKills());
            pstmt.setInt(13, s.getAssists());
            pstmt.setInt(14, s.getDamage());
            pstmt.setInt(15, s.getHeadshots());
            pstmt.setInt(16, s.getFlashAssists());
            pstmt.setInt(17, s.getDied() ? 1 : 0);
            if (s.getKilledBy() != null) {
                pstmt.setInt(18, s.getKilledBy().getId());
            } else {
                pstmt.setNull(18, Types.INTEGER);
            }
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
              handleException("saving statistic", e);
        }
    }

    @Override
    public void update(IndividualStatistic entity) {
        throw new UnsupportedOperationException("Update directly via save() which performs a MERGE (UPSERT).");
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Deletion requires a compound key. Single ID deletion is unsupported.");
    }

    private IndividualStatistic mapResultSetToStatistic(ResultSet rs) throws SQLException {
        Round round = new Round(rs.getInt("id_runda"));
        Player player = new Player(rs.getInt("id_jucator"));
        player.setNickname(rs.getString("nickname"));
        
        Player killer = null;
        int killerId = rs.getInt("id_jucator_ucigas");
        if (!rs.wasNull()) {
            killer = new Player(killerId);
            killer.setNickname(rs.getString("killer_nickname"));
        }

        return new IndividualStatistic(
            round, player,
            rs.getInt("kills"),
            rs.getInt("assists"),
            rs.getInt("damage"),
            rs.getInt("headshots"),
            rs.getInt("flash_assists"),
            rs.getInt("died") == 1,
            killer
        );
    }
}
