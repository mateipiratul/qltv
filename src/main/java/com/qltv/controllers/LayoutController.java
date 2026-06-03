package com.qltv.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import java.io.IOException;
import java.net.URL;

public class LayoutController {

    @FXML private StackPane contentArea;
    @FXML private VBox sidebar;

    @FXML
    public void initialize() {
        showDashboard();
    }

    @FXML
    public void showDashboard() {
        loadView("main");
    }

    @FXML
    private void handleDashboard(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("main");
    }

    @FXML
    private void handleMembers(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("members");
    }

    @FXML
    private void handleTeams(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("teams");
    }

    @FXML
    private void handleTournaments(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("tournaments");
    }

    @FXML
    private void handleMatches(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("matches");
    }

    @FXML
    private void handleSponsors(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("sponsors");
    }

    @FXML
    private void handleProfile(ActionEvent event) {
        updateActiveButton((Button) event.getSource());
        loadView("profile");
    }

    private void updateActiveButton(Button activeBtn) {
        sidebar.getChildren().stream()
                .filter(n -> n instanceof Button)
                .map(n -> (Button) n)
                .forEach(btn -> btn.getStyleClass().remove("nav-button-active"));
        activeBtn.getStyleClass().add("nav-button-active");
    }

    @FXML
    private void handleLogout() {
        try {
            URL fxmlLocation = getClass().getResource("/views/login.fxml");
            Parent loginView = FXMLLoader.load(fxmlLocation);
            Scene scene = contentArea.getScene();
            
            URL cssLocation = getClass().getResource("/css/style.css");
            if (cssLocation != null) {
                scene.getStylesheets().setAll(cssLocation.toExternalForm());
            }
            
            scene.setRoot(loginView);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loadView(String fxmlName) {
        try {
            URL fxmlLocation = getClass().getResource("/views/" + fxmlName + ".fxml");
            if (fxmlLocation == null) {
                System.err.println("Could not find " + fxmlName + ".fxml");
                return;
            }
            Parent view = FXMLLoader.load(fxmlLocation);
            contentArea.getChildren().setAll(view);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
