package com.qltv.models.logistics;

import com.qltv.models.personnel.Team;

import java.time.LocalDate;

public class Sponsorship {
    private Integer id;
    private Team team;
    private Sponsor sponsor;
    private LocalDate startDate;
    private LocalDate endDate;
    private Double contractAmount;

    public Sponsorship(Integer id) {
        this.id = id;
    }

    public Sponsorship(Integer id, Team team, Sponsor sponsor, LocalDate startDate, LocalDate endDate, Double contractAmount) {
        this.id = id;
        this.team = team;
        this.sponsor = sponsor;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractAmount = contractAmount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public Sponsor getSponsor() {
        return sponsor;
    }

    public void setSponsor(Sponsor sponsor) {
        this.sponsor = sponsor;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public Double getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(Double contractAmount) {
        this.contractAmount = contractAmount;
    }

    @Override
    public String toString() {
        if (sponsor != null) {
            String endStr = (endDate != null) ? endDate.toString() : "Present";
            return String.format("%s (%s to %s) - $%.2f", sponsor.getName(), startDate, endStr, contractAmount);
        }
        return "Sponsorship #" + id;
    }
}
