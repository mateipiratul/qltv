package com.qltv.models.logistics;

public enum EventType {
    MJ("Major", "Largest type of event hosted, biggest prize pools available, with attending teams being only from top 40."),
    IL("International LAN", "While the magnitude of such event may vary, most have great impact on the Counter-Strike community, having top 50 teams attending."),
    RL("Regional LAN", "Nationally hosted events that promote the Counter-Strike culture on a regional level, sometimes standing as local qualifiers for large scale events."),
    ON("Online", "The event is hosted online, meaning that the attending teams may vary from tournament to tournament, usually being organised as qualifier stages for other bigger, physically hosted events."),
    LL("Local LAN", "Smallest type of event hosted, usually meant for smaller, local teams to perform and get recognized."),
    OT("Other", "Anything else that does not fall into any category");

    private final String name;
    private final String description;

    EventType(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}
