package com.qltv.models.in_game;

import com.qltv.models.personnel.Player;

public class IndividualStatistic {
    private Round round;
    private Player player;
    private Integer kills;
    private Integer assists;
    private Integer damage;
    private Integer headshots;
    private Integer flashAssists;
    private Boolean died;
    private Player killedBy;

    public IndividualStatistic(Round round, Player player) {
        this.round = round;
        this.player = player;
    }

    public IndividualStatistic(Round round, Player player, Integer kills, Integer assists, Integer damage, Integer headshots, Integer flashAssists, Boolean died, Player killedBy) {
        this.round = round;
        this.player = player;
        this.kills = kills;
        this.assists = assists;
        this.damage = damage;
        this.headshots = headshots;
        this.flashAssists = flashAssists;
        this.died = died;
        this.killedBy = killedBy;
    }

    public IndividualStatistic() {

    }

    public Round getRound() {
        return round;
    }

    public void setRound(Round round) {
        this.round = round;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public Integer getKills() {
        return kills;
    }

    public void setKills(Integer kills) {
        this.kills = kills;
    }

    public Integer getAssists() {
        return assists;
    }

    public void setAssists(Integer assists) {
        this.assists = assists;
    }

    public Integer getDamage() {
        return damage;
    }

    public void setDamage(Integer damage) {
        this.damage = damage;
    }

    public Integer getHeadshots() {
        return headshots;
    }

    public void setHeadshots(Integer headshots) {
        this.headshots = headshots;
    }

    public Integer getFlashAssists() {
        return flashAssists;
    }

    public void setFlashAssists(Integer flashAssists) {
        this.flashAssists = flashAssists;
    }

    public Boolean getDied() {
        return died;
    }

    public void setDied(Boolean died) {
        this.died = died;
    }

    public Player getKilledBy() {
        return killedBy;
    }

    public void setKilledBy(Player killedBy) {
        this.killedBy = killedBy;
    }
}
