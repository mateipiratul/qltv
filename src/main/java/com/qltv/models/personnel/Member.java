package com.qltv.models.personnel;

import com.qltv.models.logistics.Country;
import com.qltv.util.ValidationUtil;
import java.time.LocalDate;
import java.util.Objects;

public abstract class Member {
    private Integer id;
    private Country country;
    private String lastName;
    private String firstName;
    private String nickname;
    private LocalDate birthDate;
    private String profilePictureUrl;

    protected Member(Integer id) {
        this.id = id;
    }

    protected Member(Integer id, Country country, String lastName, String firstName, String nickname, LocalDate birthDate, String profilePictureUrl) {
        this.id = id;
        this.country = country;
        setLastName(lastName);
        setFirstName(firstName);
        setNickname(nickname);
        this.birthDate = birthDate;
        setProfilePictureUrl(profilePictureUrl);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        String sanitizedName = ValidationUtil.sanitizeInput(lastName);
        ValidationUtil.validateMemberName(sanitizedName, "Last name");
        this.lastName = sanitizedName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        String sanitizedName = ValidationUtil.sanitizeInput(firstName);
        ValidationUtil.validateMemberName(sanitizedName, "First name");
        this.firstName = sanitizedName;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        String sanitizedNickname = ValidationUtil.sanitizeInput(nickname);
        if (!sanitizedNickname.isEmpty()) {
            ValidationUtil.validateNickname(sanitizedNickname);
            this.nickname = sanitizedNickname;
        } else {
            this.nickname = null;
        }
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getProfilePictureUrl() {
        return profilePictureUrl;
    }

    public void setProfilePictureUrl(String profilePictureUrl) {
        String sanitizedUrl = ValidationUtil.sanitizeInput(profilePictureUrl);
        if (sanitizedUrl.length() > 255) {
            throw new IllegalArgumentException("Profile picture URL cannot exceed 255 characters.");
        }
        this.profilePictureUrl = sanitizedUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Member member)) return false;
        return Objects.equals(id, member.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        if (nickname != null && !nickname.isBlank()) {
            return String.format("%s \"%s\" %s", firstName, nickname, lastName);
        }
        return String.format("%s %s", firstName, lastName);
    }
}
