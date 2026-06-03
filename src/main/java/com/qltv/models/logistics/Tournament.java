package com.qltv.models.logistics;

import com.qltv.util.ValidationUtil;
import java.time.LocalDate;
import java.util.Objects;

public class Tournament {
    private Integer id;
    private Organizer organizer;
    private EventType eventType;
    private String name;
    private LocalDate startDate;
    private LocalDate endDate;
    private String location;
    private Double totalPrizeUsd;

    public Tournament(Integer id) {
        this.id = id;
    }

    public Tournament(Integer id, Organizer organizer, EventType eventType,
                      String name, LocalDate startDate, LocalDate endDate,
                      String location, Double totalPrizeUsd) {
        this.id = id;
        this.organizer = organizer;
        this.eventType = eventType;
        setName(name);
        setStartDate(startDate);
        setEndDate(endDate);
        setLocation(location);
        this.totalPrizeUsd = totalPrizeUsd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Organizer getOrganizer() {
        return organizer;
    }

    public void setOrganizer(Organizer organizer) {
        this.organizer = organizer;
    }

    public EventType getEventType() {
        return eventType;
    }

    public void setEventType(EventType eventType) {
        this.eventType = eventType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        String sanitizedName = ValidationUtil.sanitizeInput(name);
        ValidationUtil.validateTournamentName(sanitizedName);
        this.name = sanitizedName;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        ValidationUtil.validateDateRange(startDate, this.endDate);
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        ValidationUtil.validateDateRange(this.startDate, endDate);
        this.endDate = endDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        String sanitizedLocation = ValidationUtil.sanitizeInput(location);
        ValidationUtil.validateCity(sanitizedLocation);
        this.location = sanitizedLocation;
    }

    public Double getTotalPrizeUsd() {
        return totalPrizeUsd;
    }

    public void setTotalPrizeUsd(Double totalPrizeUsd) {
        this.totalPrizeUsd = totalPrizeUsd;
    }

    public String getLocationCity() {
        if (location == null) return "";
        return location.split(",")[0];
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Tournament that)) return false;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return name != null ? name : "Tournament #" + id;
    }
}
