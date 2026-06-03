package com.qltv.models.personnel;

import com.qltv.models.logistics.Country;
import com.qltv.models.in_game.Role;
import com.qltv.util.ValidationUtil;
import java.time.LocalDate;

public class Player extends Member {
    private Role role;
    private String resolution;
    private Double sensitivity;
    private Integer mouseDpi;

    public Player(Integer id) {
        super(id);
    }

    public Player(Integer id, Country country, String lastName, String firstName, String nickname, LocalDate birthDate,
                  String profilePictureUrl, Role role, String resolution, Double sensitivity, Integer mouseDpi) {
        super(id, country, lastName, firstName, nickname, birthDate, profilePictureUrl);
        this.role = role;
        this.resolution = ValidationUtil.sanitizeInput(resolution);
        this.sensitivity = sensitivity;
        this.mouseDpi = mouseDpi;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = ValidationUtil.sanitizeInput(resolution);
    }

    public Double getSensitivity() {
        return sensitivity;
    }

    public void setSensitivity(Double sensitivity) {
        this.sensitivity = sensitivity;
    }

    public Integer getMouseDpi() {
        return mouseDpi;
    }

    public void setMouseDpi(Integer mouseDpi) {
        this.mouseDpi = mouseDpi;
    }
}
