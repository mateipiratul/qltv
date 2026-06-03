package com.qltv.models.logistics;

public enum Region {
    EU("Europe"),
    NA("North America"),
    SA("South America"),
    AS("Asia"),
    OC("Oceania"),
    AF("Africa");

    private final String name;

    Region(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
