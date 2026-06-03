package com.qltv.models.personnel;

import java.time.LocalDate;

public class Contract {
    private Integer id;
    private Member member;
    private Team team;
    private LocalDate startDate;
    private LocalDate endDate;
    private Double monthlySalary;

    public Contract() {
    }

    public Contract(Integer id) {
        this.id = id;
    }

    public Contract(Integer id, Member member, Team team, LocalDate startDate, LocalDate endDate, Double monthlySalary) {
        this.id = id;
        this.member = member;
        this.team = team;
        this.startDate = startDate;
        this.endDate = endDate;
        this.monthlySalary = monthlySalary;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
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

    public Double getMonthlySalary() {
        return monthlySalary;
    }

    public void setMonthlySalary(Double monthlySalary) {
        this.monthlySalary = monthlySalary;
    }
}
