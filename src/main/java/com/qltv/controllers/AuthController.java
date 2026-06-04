package com.qltv.controllers;

import com.qltv.services.AuthService;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.concurrent.Task;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;

public class AuthController {

    private final AuthService authService = new AuthService();

    // Login Fields
    @FXML private TextField loginIdentifierField;
    @FXML private PasswordField loginPasswordField;
    @FXML private Label loginErrorLabel;
    @FXML private Button loginButton;
    @FXML private ProgressIndicator loginProgress;

    // Register Fields
    @FXML private TextField regUsernameField;
    @FXML private TextField regEmailField;
    @FXML private PasswordField regPasswordField;
    @FXML private PasswordField regConfirmPasswordField;
    @FXML private Label regErrorLabel;
    @FXML private Button registerButton;
    @FXML private ProgressIndicator regProgress;

    @FXML
    private void handleLogin(ActionEvent event) {
        String identifier = loginIdentifierField.getText();
        String password = loginPasswordField.getText();

        loginErrorLabel.setVisible(false);
        setLoginUIState(true);

        Task<Void> loginTask = new Task<>() {
            @Override
            protected Void call() throws Exception {
                authService.login(identifier, password);
                return null;
            }
        };

        loginTask.setOnSucceeded(e -> {
            setLoginUIState(false);
            navigateToDashboard(event);
        });

        loginTask.setOnFailed(e -> {
            setLoginUIState(false);
            Throwable ex = loginTask.getException();
            loginErrorLabel.setText(ex.getMessage());
            loginErrorLabel.setVisible(true);
        });

        new Thread(loginTask).start();
    }

    private void setLoginUIState(boolean loading) {
        if (loginButton != null) loginButton.setVisible(!loading);
        if (loginProgress != null) loginProgress.setVisible(loading);
        if (loginIdentifierField != null) loginIdentifierField.setDisable(loading);
        if (loginPasswordField != null) loginPasswordField.setDisable(loading);
    }

    private void setRegUIState(boolean loading) {
        if (registerButton != null) registerButton.setVisible(!loading);
        if (regProgress != null) regProgress.setVisible(loading);
        if (regUsernameField != null) regUsernameField.setDisable(loading);
        if (regEmailField != null) regEmailField.setDisable(loading);
        if (regPasswordField != null) regPasswordField.setDisable(loading);
        if (regConfirmPasswordField != null) regConfirmPasswordField.setDisable(loading);
    }

    @FXML
    private void handleRegister(ActionEvent event) {
        String username = regUsernameField.getText();
        String email = regEmailField.getText();
        String password = regPasswordField.getText();
        String confirm = regConfirmPasswordField.getText();

        regErrorLabel.setVisible(false);
        setRegUIState(true);

        Task<Void> regTask = new Task<>() {
            @Override
            protected Void call() throws Exception {
                authService.register(username, email, password, confirm);
                return null;
            }
        };

        regTask.setOnSucceeded(e -> {
            setRegUIState(false);
            navigateToDashboard(event);
        });

        regTask.setOnFailed(e -> {
            setRegUIState(false);
            Throwable ex = regTask.getException();
            regErrorLabel.setText(ex.getMessage());
            regErrorLabel.setVisible(true);
        });

        new Thread(regTask).start();
    }

    @FXML
    private void showRegisterForm(ActionEvent event) {
        switchScene(event, "/views/app_related/register.fxml");
    }

    @FXML
    private void showLoginForm(ActionEvent event) {
        switchScene(event, "/views/app_related/login.fxml");
    }

    private void navigateToDashboard(ActionEvent event) {
        switchScene(event, "/views/main_layout.fxml");
    }

    private void switchScene(ActionEvent event, String fxmlPath) {
        try {
            URL fxmlLocation = getClass().getResource(fxmlPath);
            if (fxmlLocation == null) {
                System.err.println("Could not find " + fxmlPath);
                return;
            }
            Parent root = FXMLLoader.load(fxmlLocation);
            Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            Scene scene = new Scene(root);
            
            URL cssLocation = getClass().getResource("/css/style.css");
            if (cssLocation != null) {
                scene.getStylesheets().add(cssLocation.toExternalForm());
            }
            
            stage.setScene(scene);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
