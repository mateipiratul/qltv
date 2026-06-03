package com.qltv.models.logistics;

import com.qltv.util.ValidationUtil;

public class Organizer {
    private Integer id;
    private String name;
    private String website;
    private String email;
    private String logoUrl;

    public Organizer(Integer id) {
        this.id = id;
    }

    public Organizer(Integer id, String name, String website, String email, String logoUrl) {
        this.id = id;
        setName(name);
        setWebsite(website);
        setEmail(email);
        setLogoUrl(logoUrl);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        String sanitizedName = ValidationUtil.sanitizeInput(name);
        ValidationUtil.validateOrganizerName(sanitizedName);
        this.name = sanitizedName;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        String sanitizedWebsite = ValidationUtil.sanitizeInput(website);
        ValidationUtil.validateWebsite(sanitizedWebsite);
        this.website = sanitizedWebsite;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        String sanitizedEmail = ValidationUtil.sanitizeInput(email);
        ValidationUtil.validateEmail(sanitizedEmail, 50);
        this.email = sanitizedEmail;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        String sanitizedUrl = ValidationUtil.sanitizeInput(logoUrl);
        if (sanitizedUrl.length() > 255) {
            throw new IllegalArgumentException("Logo URL cannot exceed 255 characters.");
        }
        this.logoUrl = sanitizedUrl;
    }
}
