package com.qltv.models.in_game;

import java.util.Objects;

public class MatchMapInstance {
    private Integer id;
    private Match match;
    private Map map;
    private Integer durationMinutes;

    public MatchMapInstance(Integer id) {
        this.id = id;
    }

    public MatchMapInstance(Integer id, Match match, Map map, Integer durationMinutes) {
        this.id = id;
        this.match = match;
        this.map = map;
        this.durationMinutes = durationMinutes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Match getMatch() {
        return match;
    }

    public void setMatch(Match match) {
        this.match = match;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public Integer getDurationMinutes() {
        return durationMinutes;
    }

    public void setDurationMinutes(Integer durationMinutes) {
        this.durationMinutes = durationMinutes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof MatchMapInstance that)) return false;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return (map != null ? map.getName() : "Unknown Map") + " (" + durationMinutes + "m)";
    }
}
