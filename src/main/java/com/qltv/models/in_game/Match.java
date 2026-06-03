package com.qltv.models.in_game;

import com.qltv.models.logistics.Tournament;

import java.time.LocalDate;
import java.util.Objects;

public class Match {
    private Integer id;
    private Tournament tournament;
    private LocalDate date;
    private String format;
    private String stage;

    public Match(Integer id) {
        this.id = id;
    }

    public Match(Integer id, Tournament tournament, LocalDate date, String format, String stage) {
        this.id = id;
        this.tournament = tournament;
        this.date = date;
        this.format = format;
        this.stage = stage;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Match match)) return false;
        return Objects.equals(id, match.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return String.format("Match #%d (%s) - %s", id, format, date);
    }
}
