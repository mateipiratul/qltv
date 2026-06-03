package com.qltv.util;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import java.time.LocalDate;

public class ValidationUtil {

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");

    private static final Pattern WEBSITE_PATTERN =
            Pattern.compile("^(https?://)?([a-zA-Z0-9.-]+)\\.([a-zA-Z]{2,})(/.*)?$");

    private static final Pattern USERNAME_PATTERN =
            Pattern.compile("^[a-zA-Z0-9_]{4,16}$");

    private static final Pattern PASSWORD_STRENGTH_PATTERN =
            Pattern.compile("^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^a-zA-Z0-9\\s])\\S{8,32}$");

    private static final List<String> RESULT_CODES = Arrays.asList("TRCT", "ELCT", "ELT", "BDCT", "BET");

    private ValidationUtil() {}

    public static void validateCountryId(String id) {
        if (id == null || id.length() != 2) {
            throw new IllegalArgumentException("Country ID must be exactly 2 characters.");
        }
    }

    public static void validateEmail(String email, int maxLength) {
        if (email == null || email.isBlank()) {
            throw new IllegalArgumentException("Email cannot be empty.");
        }
        if (email.length() > maxLength) {
            throw new IllegalArgumentException("Email cannot exceed " + maxLength + " characters.");
        }
        if (!EMAIL_PATTERN.matcher(email).matches()) {
            throw new IllegalArgumentException("Invalid email format.");
        }
    }

    public static void validateUrl(String url, int maxLength, String fieldName) {
        if (url == null || url.isBlank()) return;
        if (url.length() > maxLength) {
            throw new IllegalArgumentException(fieldName + " cannot exceed " + maxLength + " characters.");
        }
        if (!WEBSITE_PATTERN.matcher(url).matches()) {
            throw new IllegalArgumentException("Invalid " + fieldName + " format.");
        }
    }

    public static void validateWebsite(String url) {
        validateUrl(url, 100, "Website URL");
    }

    public static void validateUsername(String username) {
        if (username == null || username.isBlank()) {
            throw new IllegalArgumentException("Username cannot be empty.");
        }
        if (username.length() > 50) {
            throw new IllegalArgumentException("Username cannot exceed 50 characters.");
        }
        if (!USERNAME_PATTERN.matcher(username).matches()) {
            throw new IllegalArgumentException("Username must be 4-16 chars, letters/numbers/underscores only.");
        }
    }

    public static void validatePasswordStrength(String password) {
        if (password == null || password.isBlank()) {
            throw new IllegalArgumentException("Password cannot be empty.");
        }
        if (!PASSWORD_STRENGTH_PATTERN.matcher(password).matches()) {
            throw new IllegalArgumentException("Password must be 8-32 chars, with upper, lower, number, and special char.");
        }
    }

    public static void validatePassword(String hash) {
        if (hash == null || hash.isBlank()) {
            throw new IllegalArgumentException("Password hash cannot be empty.");
        }
        if (hash.length() > 256) {
            throw new IllegalArgumentException("Password hash storage limit exceeded.");
        }
    }

    public static void validateStringLength(String value, int minLength, int maxLength, String fieldName) {
        if (value == null || value.isBlank()) {
            throw new IllegalArgumentException(fieldName + " cannot be empty.");
        }
        if (value.length() < minLength || value.length() > maxLength) {
            throw new IllegalArgumentException(fieldName + " must be between " + minLength + " and " + maxLength + " chars.");
        }
    }

    public static void validateMatchRoundsNumber(Integer roundsNumber) {
        if (roundsNumber == null || roundsNumber < 0) {
            throw new IllegalArgumentException("Rounds number must be non-negative.");
        }
    }

    public static void validateDateRange(LocalDate startDate, LocalDate endDate) {
        if (startDate != null && endDate != null && endDate.isBefore(startDate)) {
            throw new IllegalArgumentException("End date cannot be before start date.");
        }
    }

    public static void validateResultCode(String code) {
        if (code == null || RESULT_CODES.stream().noneMatch(c -> c.equals(code))) {
            throw new IllegalArgumentException("Invalid result code.");
        }
    }

    public static void validateTeamName(String name) {
        validateStringLength(name, 2, 30, "Team name");
    }

    public static void validateTeamTag(String tag) {
        validateStringLength(tag, 2, 5, "Team tag");
    }

    public static void validateMemberWinnings(double winnings) {
        if (winnings < 0) throw new IllegalArgumentException("Winnings must be non-negative.");
    }

    public static void validateCity(String city) {
        validateStringLength(city, 1, 40, "City");
    }

    public static void validateMapName(String name) {
        validateStringLength(name, 1, 30, "Map name");
    }

    public static void validateIndustry(String industry) {
        validateStringLength(industry, 1, 40, "Industry");
    }

    public static void validateNewsTitle(String title) {
        validateStringLength(title, 1, 100, "News title");
    }

    public static void validateCommentContent(String content) {
        validateStringLength(content, 1, 1000, "Comment content");
    }

    public static void validateTournamentName(String name) {
        validateStringLength(name, 1, 40, "Tournament name");
    }

    public static void validateCountryName(String name) {
        validateStringLength(name, 1, 60, "Country name");
    }

    public static void validateOrganizerName(String name) {
        validateStringLength(name, 1, 40, "Organizer name");
    }

    public static void validateSponsorName(String name) {
        validateStringLength(name, 1, 40, "Sponsor name");
    }

    public static void validateMemberName(String name, String fieldName) {
        validateStringLength(name, 1, 30, fieldName);
    }

    public static void validateNickname(String nickname) {
        validateStringLength(nickname, 1, 25, "Nickname");
    }

    public static void validateNotNull(Object value, String fieldName) {
        if (value == null) {
            throw new IllegalArgumentException(fieldName + " cannot be null.");
        }
    }

    public static void validatePositiveNumber(Number value, String fieldName) {
        if (value == null || value.doubleValue() <= 0) {
            throw new IllegalArgumentException(fieldName + " must be a positive number.");
        }
    }

    public static void validateNonNegativeNumber(Number value, String fieldName) {
        if (value == null || value.doubleValue() < 0) {
            throw new IllegalArgumentException(fieldName + " must be non-negative.");
        }
    }

    public static void validateSensitivity(Double value) {
        if (value != null && (value < 0.01 || value > 20.0)) {
            throw new IllegalArgumentException("Sensitivity must be between 0.01 and 20.0.");
        }
    }

    public static void validateDpi(Integer value) {
        if (value != null && (value < 100 || value > 10000)) {
            throw new IllegalArgumentException("DPI must be between 100 and 10000.");
        }
    }

    public static void validateSalary(Double salary) {
        validatePositiveNumber(salary, "Monthly salary");
    }

    public static void validateWorldRanking(Integer ranking) {
        if (ranking != null && ranking <= 0) {
            throw new IllegalArgumentException("World ranking must be a positive integer.");
        }
    }

    public static void validateDuration(Integer minutes) {
        validatePositiveNumber(minutes, "Duration in minutes");
    }

    public static void validateBirthDate(LocalDate birthDate) {
        if (birthDate == null) {
            throw new IllegalArgumentException("Birth date cannot be empty.");
        }
        if (birthDate.isAfter(LocalDate.now().minusYears(13))) {
            throw new IllegalArgumentException("Member must be at least 13 years old.");
        }
    }

    public static void validateFutureDate(LocalDate date, String fieldName) {
        if (date != null && date.isBefore(LocalDate.now())) {
            throw new IllegalArgumentException(fieldName + " cannot be in the past.");
        }
    }

    public static String sanitizeInput(String input) {
        return (input == null) ? "" : input.trim();
    }
}
