package com.qltv.models.app_related;

import com.qltv.models.logistics.Country;
import com.qltv.models.personnel.Member;
import com.qltv.models.personnel.Team;
import com.qltv.util.ValidationUtil;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

public class User {
    private Integer id;
    private String email;
    private String passwordHash;
    private String username;
    private UserType userType;
    private LocalDate registrationDate;
    private Country nationality;
    private String profilePictureUrl;
    private Boolean isActive;
    
    private Set<Team> favoriteTeams = new HashSet<>();
    private Set<Member> favoriteMembers = new HashSet<>();

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String email, String passwordHash, String username, UserType userType, 
                LocalDate registrationDate, Country nationality, String profilePictureUrl, Boolean isActive) {
        this.id = id;
        setEmail(email);
        setPasswordHash(passwordHash);
        setUsername(username);
        this.userType = userType;
        this.registrationDate = registrationDate;
        this.nationality = nationality;
        setProfilePictureUrl(profilePictureUrl);
        this.isActive = isActive;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        String sanitizedEmail = ValidationUtil.sanitizeInput(email);
        ValidationUtil.validateEmail(sanitizedEmail, 100);
        this.email = sanitizedEmail;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        String sanitizedHash = ValidationUtil.sanitizeInput(passwordHash);
        ValidationUtil.validatePassword(sanitizedHash);
        this.passwordHash = sanitizedHash;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        String sanitizedUsername = ValidationUtil.sanitizeInput(username);
        ValidationUtil.validateUsername(sanitizedUsername);
        this.username = sanitizedUsername;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        if (userType == null) {
            throw new IllegalArgumentException("User type cannot be null.");
        }
        this.userType = userType;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Country getNationality() {
        return nationality;
    }

    public void setNationality(Country nationality) {
        this.nationality = nationality;
    }

    public String getProfilePictureUrl() {
        return profilePictureUrl;
    }

    public void setProfilePictureUrl(String profilePictureUrl) {
        this.profilePictureUrl = ValidationUtil.sanitizeInput(profilePictureUrl);
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Set<Team> getFavoriteTeams() {
        return favoriteTeams;
    }

    public void setFavoriteTeams(Set<Team> favoriteTeams) {
        this.favoriteTeams = favoriteTeams != null ? favoriteTeams : new HashSet<>();
    }

    public Set<Member> getFavoriteMembers() {
        return favoriteMembers;
    }

    public void setFavoriteMembers(Set<Member> favoriteMembers) {
        this.favoriteMembers = favoriteMembers != null ? favoriteMembers : new HashSet<>();
    }
}
