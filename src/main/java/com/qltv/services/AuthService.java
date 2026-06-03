package com.qltv.services;

import com.qltv.dao.app_related.UserDAO;
import com.qltv.models.app_related.User;
import com.qltv.models.app_related.UserType;
import com.qltv.util.SessionManager;
import com.qltv.util.ValidationUtil;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.Optional;

public class AuthService extends BaseService<User, UserDAO> {

    public AuthService() {
        super(new UserDAO());
    }

    // attempts to log in a user with the provided identifier (username or email) and password
    public void login(String identifier, String password) {
        if (identifier == null || identifier.trim().isEmpty() || password == null || password.isEmpty()) {
            throw new IllegalArgumentException("Please enter all fields");
        }

        // simple regex check: if it contains '@' treat as email, otherwise username
        boolean looksLikeEmail = identifier.contains("@");
        Optional<User> userOpt = looksLikeEmail ? dao.findByEmail(identifier.trim()) : dao.findByUsername(identifier.trim());

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            String storedHash = user.getPasswordHash();
            if (storedHash != null && storedHash.equals(hashPassword(password))) {
                if (!user.getIsActive()) {
                    AuditService.getInstance().logAction("LOGIN_DISABLED", "User", identifier);
                    throw new IllegalStateException("Your account has been disabled. Please contact an administrator.");
                }
                SessionManager.getInstance().setCurrentUser(user);
                AuditService.getInstance().logAction("LOGIN", "User", identifier);
                return;
            }
        }
        AuditService.getInstance().logAction("LOGIN_FAILED", "User", identifier);
        throw new IllegalArgumentException("Invalid username/email or password.");
    }

    // registers a new user after applying all business validations
    public User register(String username, String email, String password, String confirmPassword) throws IllegalArgumentException {
        ValidationUtil.validateUsername(username);
        ValidationUtil.validateEmail(email, 100);
        ValidationUtil.validatePasswordStrength(password);

        if (!password.equals(confirmPassword)) {
            throw new IllegalArgumentException("Passwords do not match");
        }

        if (dao.findByUsername(username).isPresent()) {
            throw new IllegalArgumentException("Username already taken");
        }

        if (dao.findByEmail(email).isPresent()) {
            throw new IllegalArgumentException("Email already in use");
        }

        User newUser = new User(null);
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPasswordHash(hashPassword(password));
        newUser.setUserType(UserType.STANDARD);
        newUser.setRegistrationDate(LocalDate.now());
        newUser.setIsActive(true);

        save(newUser);
        SessionManager.getInstance().setCurrentUser(newUser);
        AuditService.getInstance().logAction("REGISTER", "User", username);
        
        return newUser;
    }

    // hashes raw password using sha256
    public String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
