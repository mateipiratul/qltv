package com.qltv.services;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.stream.Stream;

public class AuditService {
    private static final String AUDIT_FILE = "audit_log.csv";
    private static AuditService instance;

    private AuditService() {}

    public static synchronized AuditService getInstance() {
        if (instance == null) {
            instance = new AuditService();
        }
        return instance;
    }

    public void logAction(String action, String entityType, String details) {
        try (FileWriter fw = new FileWriter(AUDIT_FILE, true);
             PrintWriter pw = new PrintWriter(fw)) {
            
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            // CSV format: Timestamp, Action, EntityType, Details
            pw.println(String.format("%s,%s,%s,\"%s\"", 
                    timestamp, 
                    action, 
                    entityType, 
                    details != null ? details.replace("\"", "\"\"") : ""));
            
        } catch (IOException e) {
            System.err.println("Failed to log audit action: " + e.getMessage());
        }
    }

    public Stream<String> getAuditLogStream() {
        try {
            return Files.lines(Paths.get(AUDIT_FILE));
        } catch (IOException e) {
            return Stream.empty();
        }
    }
}
