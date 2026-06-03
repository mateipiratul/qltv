package com.qltv.models.logistics;

import com.qltv.util.ValidationUtil;
import java.util.Objects;

public class Sponsor {
    private Integer id;
    private String name;
    private String industry;
    private String website;
    private String logoUrl;

    public Sponsor(Integer id) {
        this.id = id;
    }

    public Sponsor(Integer id, String name, String industry, String website, String logoUrl) {
        this.id = id;
        setName(name);
        setIndustry(industry);
        setWebsite(website);
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
        ValidationUtil.validateSponsorName(sanitizedName);
        this.name = sanitizedName;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        String sanitizedIndustry = ValidationUtil.sanitizeInput(industry);
        ValidationUtil.validateIndustry(sanitizedIndustry);
        this.industry = sanitizedIndustry;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        String sanitizedWebsite = ValidationUtil.sanitizeInput(website);
        ValidationUtil.validateWebsite(sanitizedWebsite);
        this.website = sanitizedWebsite;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Sponsor sponsor)) return false;
        return Objects.equals(id, sponsor.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return name;
    }
}
