package com.qltv.controllers;

import com.qltv.models.app_related.User;
import com.qltv.models.logistics.Country;
import com.qltv.services.CountryService;
import com.qltv.services.UserService;
import com.qltv.util.SessionManager;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.util.StringConverter;

import java.util.List;

public class ProfileController {

    @FXML private Label usernameLabel;
    @FXML private Label emailLabel;
    @FXML private TextField profilePicField;
    @FXML private ComboBox<Country> countryComboBox;

    @FXML private PasswordField oldPasswordField;
    @FXML private PasswordField newPasswordField;
    @FXML private PasswordField confirmPasswordField;

    private final UserService userService = new UserService();
    private final CountryService countryService = new CountryService();
    private User currentUser;

    @FXML
    public void initialize() {
        currentUser = SessionManager.getInstance().getCurrentUser();
        if (currentUser != null) {
            usernameLabel.setText(currentUser.getUsername());
            emailLabel.setText(currentUser.getEmail());
            profilePicField.setText(currentUser.getProfilePictureUrl());
            loadCountries();
        }

        countryComboBox.setConverter(new StringConverter<>() {
            @Override public String toString(Country c) { return c != null ? c.getName() : ""; }
            @Override public Country fromString(String s) { return null; }
        });
    }

    private void loadCountries() {
        Task<List<Country>> task = new Task<>() {
            @Override
            protected List<Country> call() throws Exception {
                return countryService.getAll();
            }
        };
        task.setOnSucceeded(e -> {
            countryComboBox.setItems(FXCollections.observableArrayList(task.getValue()));
            if (currentUser.getNationality() != null) {
                countryComboBox.setValue(currentUser.getNationality());
            }
        });
        new Thread(task).start();
    }

    @FXML
    private void handleUpdateProfile() {
        String picUrl = profilePicField.getText();
        Country country = countryComboBox.getValue();

        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                userService.updateProfile(currentUser.getId(), picUrl, country);
                return null;
            }
        };

        task.setOnSucceeded(e -> {
            currentUser.setProfilePictureUrl(picUrl);
            currentUser.setNationality(country);
            showAlertInfo("Success", "Profile updated successfully.");
        });
        task.setOnFailed(e -> showAlertError("Error", task.getException().getMessage()));

        new Thread(task).start();
    }

    @FXML
    private void handleChangePassword() {
        String oldP = oldPasswordField.getText();
        String newP = newPasswordField.getText();
        String confP = confirmPasswordField.getText();

        if (oldP.isEmpty() || newP.isEmpty() || confP.isEmpty()) {
            showAlertError("Validation Error", "All password fields are required.");
            return;
        }

        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                userService.updatePassword(currentUser.getId(), oldP, newP, confP);
                return null;
            }
        };

        task.setOnSucceeded(e -> {
            oldPasswordField.clear();
            newPasswordField.clear();
            confirmPasswordField.clear();
            showAlertInfo("Success", "Password changed successfully.");
        });
        task.setOnFailed(e -> showAlertError("Error", task.getException().getMessage()));

        new Thread(task).start();
    }

    private void showAlertError(String title, String content) {
        Platform.runLater(() -> {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle(title);
            alert.setHeaderText(null);
            alert.setContentText(content);
            alert.showAndWait();
        });
    }

    private void showAlertInfo(String title, String content) {
        Platform.runLater(() -> {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle(title);
            alert.setHeaderText(null);
            alert.setContentText(content);
            alert.showAndWait();
        });
    }
}
