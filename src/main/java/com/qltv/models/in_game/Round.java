package com.qltv.models.in_game;

import com.qltv.util.ValidationUtil;
import java.util.Objects;

public class Round {
    private Integer id;
    private Integer mapInstanceId;
    private Integer roundNumber;
    private String resultCode;

    public Round(Integer id) {
        this.id = id;
    }

    public Round(Integer id, Integer mapInstanceId, Integer roundNumber, String resultCode) {
        this.id = id;
        this.mapInstanceId = mapInstanceId;
        setRoundNumber(roundNumber);
        setResultCode(resultCode);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMapInstanceId() {
        return mapInstanceId;
    }

    public void setMapInstanceId(Integer mapInstanceId) {
        this.mapInstanceId = mapInstanceId;
    }

    public Integer getRoundNumber() {
        return roundNumber;
    }

    public void setRoundNumber(Integer roundNumber) {
        if (roundNumber != null && roundNumber <= 0) {
            throw new IllegalArgumentException("Round number must be positive.");
        }
        this.roundNumber = roundNumber;
    }

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        String sanitizedCode = ValidationUtil.sanitizeInput(resultCode);
        ValidationUtil.validateResultCode(sanitizedCode);
        this.resultCode = sanitizedCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Round round)) return false;
        return Objects.equals(id, round.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Round " + roundNumber + " (" + resultCode + ")";
    }
}
