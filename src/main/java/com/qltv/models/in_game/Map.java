package com.qltv.models.in_game;

import com.qltv.util.ValidationUtil;
import java.util.Objects;

public class Map {
    private Integer id;
    private String name;
    private boolean activePool;
    private String imageUrl;

    public Map(Integer id) {
        this.id = id;
    }

    public Map(Integer id, String name, boolean activePool, String imageUrl) {
        this.id = id;
        setName(name);
        this.activePool = activePool;
        setImageUrl(imageUrl);
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
        ValidationUtil.validateMapName(sanitizedName);
        this.name = sanitizedName;
    }

    public boolean isActivePool() {
        return activePool;
    }

    public void setActivePool(boolean activePool) {
        this.activePool = activePool;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        String sanitizedUrl = ValidationUtil.sanitizeInput(imageUrl);
        if (sanitizedUrl.length() > 255) {
            throw new IllegalArgumentException("Image URL cannot exceed 255 characters.");
        }
        this.imageUrl = sanitizedUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Map map)) return false;
        return Objects.equals(id, map.id);
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
