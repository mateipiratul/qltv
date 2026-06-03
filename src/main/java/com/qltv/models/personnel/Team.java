package com.qltv.models.personnel;

import com.qltv.util.ValidationUtil;

public class Team {

    // own version of Either type
    public sealed interface Rank permits Ranked, Unranked {
        String getDisplayValue();
    }
    public record Ranked(int rankValue) implements Rank {
        @Override
        public String getDisplayValue() {
            return String.valueOf(rankValue);
        }
    }
    public record Unranked() implements Rank {
        @Override
        public String getDisplayValue() {
            return "UNRANKED";
        }
    }

    private Integer id;
    private String name;
    private String tag;
    private Rank rank;
    private String logoUrl;

    public Team(Integer id) {
        this.id = id;
        this.rank = new Unranked();
    }

    public Team(Integer id, String name, String tag, Rank rank, String logoUrl) {
        this.id = id;
        setName(name);
        setTag(tag);
        if (rank == null) {
            throw new IllegalArgumentException("Team ranking cannot be null.");
        }
        this.rank = rank;
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
        ValidationUtil.validateTeamName(sanitizedName);
        this.name = sanitizedName;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        String sanitizedTag = ValidationUtil.sanitizeInput(tag);
        ValidationUtil.validateTeamTag(sanitizedTag);
        this.tag = sanitizedTag;
    }

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        if (rank == null) {
            this.rank = new Unranked();
        } else {
            this.rank = rank;
        }
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
