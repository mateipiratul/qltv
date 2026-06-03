package com.qltv.util;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class SqlExceptionTranslator {

    private static final Map<Integer, String> CUSTOM_ERROR_MAP = new HashMap<>();

    static {
        // Standard ORA Codes
        CUSTOM_ERROR_MAP.put(1, "A record with this unique identifier already exists.");
        CUSTOM_ERROR_MAP.put(1400, "A required field is missing. Please complete all mandatory fields.");
        CUSTOM_ERROR_MAP.put(2291, "Integrity error: the referenced record (e.g. team or country) does not exist.");
        CUSTOM_ERROR_MAP.put(2292, "Cannot delete this record because it is being used by other parts of the system.");
        CUSTOM_ERROR_MAP.put(12899, "One of the fields contains too much text for the database limits.");

        // Application-Specific Trigger Errors (from 03_triggers_audit.sql)
        CUSTOM_ERROR_MAP.put(20010, "This team already has an active sponsorship that overlaps with the selected period.");
        CUSTOM_ERROR_MAP.put(20013, "The end date cannot be earlier than the start date.");
        CUSTOM_ERROR_MAP.put(20014, "Integrity check failed: either the player has an overlapping contract or the match is scheduled outside the tournament period.");
        CUSTOM_ERROR_MAP.put(20016, "Maximum maps for this match format reached. Cannot add more maps.");
        CUSTOM_ERROR_MAP.put(20018, "This map has already been played in this match series.");
        CUSTOM_ERROR_MAP.put(20020, "Cannot record statistics for a match that hasn't started yet.");
        CUSTOM_ERROR_MAP.put(20023, "Statistics error: the player did not have a valid active contract on the match date.");
        CUSTOM_ERROR_MAP.put(20028, "Logical error: headshots cannot exceed the total number of kills.");
        CUSTOM_ERROR_MAP.put(20030, "Consistency error: total kills in the round cannot exceed total deaths.");
        CUSTOM_ERROR_MAP.put(20031, "Age restriction: members must be at least 16 years old.");
        CUSTOM_ERROR_MAP.put(20040, "Team limit reached: a team cannot have more than 7 active players simultaneously.");
    }

    public static String translate(SQLException e) {
        int errorCode = Math.abs(e.getErrorCode());
        
        // Check for specific ORA/Trigger codes
        if (CUSTOM_ERROR_MAP.containsKey(errorCode)) {
            return CUSTOM_ERROR_MAP.get(errorCode);
        }

        // Fallback to the SQL state or raw message if it's readable
        String msg = e.getMessage();
        if (msg != null && msg.contains("ORA-")) {
            // Clean up the Oracle prefix for common cases
            return msg.substring(msg.indexOf(":") + 1).trim();
        }

        return "A database error occurred. Please contact the administrator.";
    }
}
