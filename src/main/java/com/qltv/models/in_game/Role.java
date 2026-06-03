package com.qltv.models.in_game;

public enum Role {
    RFL("Rifler"),
    IGL("In-Game Leader"),
    AWP("AWPer"),
    ENT("Entry Fragger"),
    SUP("Support"),
    ANC("Anchor"),
    LRK("Lurker");

    private final String name;

    Role(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
