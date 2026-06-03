package com.qltv.models.personnel;

import com.qltv.models.logistics.Country;
import com.qltv.util.ValidationUtil;
import java.time.LocalDate;

public class Coach extends Member {
    private String coachingStyle;
    private Integer yearsOfExperience;

    public Coach(Integer id) {
        super(id);
    }

    public Coach(Integer id, Country country, String lastName, String firstName, String nickname, LocalDate birthDate,
                 String profilePictureUrl, String coachingStyle, Integer yearsOfExperience) {
        super(id, country, lastName, firstName, nickname, birthDate, profilePictureUrl);
        this.coachingStyle = ValidationUtil.sanitizeInput(coachingStyle);
        this.yearsOfExperience = yearsOfExperience;
    }

    public String getCoachingStyle() {
        return coachingStyle;
    }

    public void setCoachingStyle(String coachingStyle) {
        this.coachingStyle = ValidationUtil.sanitizeInput(coachingStyle);
    }

    public Integer getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(Integer yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }
}
