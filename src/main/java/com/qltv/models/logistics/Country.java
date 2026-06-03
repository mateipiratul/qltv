package com.qltv.models.logistics;

import com.qltv.util.ValidationUtil;
import java.util.Objects;

public class Country {
    private String id;
    private Region regionId;
    private String name;
    private String flagUrl;

    public Country(String id) {
        setId(id);
    }

    public Country(String id, Region regionId, String name, String flagUrl) {
        setId(id);
        setRegionId(regionId);
        setName(name);
        setFlagUrl(flagUrl);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        String sanitizedId = ValidationUtil.sanitizeInput(id);
        ValidationUtil.validateCountryId(sanitizedId);
        this.id = sanitizedId;
    }

    public Region getRegionId() {
        return regionId;
    }

    public void setRegionId(Region regionId) {
        this.regionId = regionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        String sanitizedName = ValidationUtil.sanitizeInput(name);
        ValidationUtil.validateCountryName(sanitizedName);
        this.name = sanitizedName;
    }

    public String getFlagUrl() {
        return flagUrl;
    }

    public void setFlagUrl(String flagUrl) {
        String sanitizedUrl = ValidationUtil.sanitizeInput(flagUrl);
        if (sanitizedUrl.length() > 255) {
            throw new IllegalArgumentException("Flag URL cannot exceed 255 characters.");
        }
        this.flagUrl = sanitizedUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Country country)) return false;
        return Objects.equals(id, country.id);
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
