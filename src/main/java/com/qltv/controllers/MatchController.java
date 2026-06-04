package com.qltv.controllers;

import com.qltv.models.in_game.Match;
import com.qltv.models.in_game.MatchMapInstance;
import com.qltv.services.MatchMapInstanceService;
import com.qltv.models.logistics.Tournament;
import com.qltv.models.personnel.Team;
import com.qltv.services.MatchService;
import com.qltv.services.TournamentService;
import com.qltv.util.SessionManager;
import javafx.application.Platform;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.Modality;
import java.net.URL;
import java.io.IOException;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class MatchController {

    @FXML private TableView<Match> matchTable;
    @FXML private TableColumn<Match, String> colTournament;
    @FXML private TableColumn<Match, LocalDate> colDate;
    @FXML private TableColumn<Match, String> colFormat;

    @FXML private Label teamALabel;
    @FXML private Label teamBLabel;
    @FXML private ListView<MatchMapInstance> mapInstancesListView;

    @FXML private VBox formContainer;
    @FXML private ComboBox<Tournament> tournamentComboBox;
    @FXML private DatePicker datePicker;
    @FXML private ComboBox<String> formatComboBox;
    @FXML private TextField formTeamAField;
    @FXML private TextField formTeamBField;
    
    @FXML private TextField searchField;
    @FXML private Button addButton;
    @FXML private Button editButton;
    @FXML private Button deleteButton;
    @FXML private Button statsButton;
    @FXML private Pagination pagination;

    private final ObservableList<Match> matchList = FXCollections.observableArrayList();
    private final MatchService matchService = new MatchService();
    private final TournamentService tournamentService = new TournamentService();
    private final MatchMapInstanceService mapInstanceService = new MatchMapInstanceService();
    
    private FilteredList<Match> filteredData;
    private SortedList<Match> sortedData;
    private final ObservableList<Match> currentPageList = FXCollections.observableArrayList();
    private static final int ROWS_PER_PAGE = 20;

    @FXML
    public void initialize() {
        filteredData = new FilteredList<>(matchList, p -> true);
        sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(matchTable.comparatorProperty());
        matchTable.setItems(currentPageList);

        // update pagination when the filtered/sorted data changes
        filteredData.addListener((ListChangeListener<Match>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<Match>) c -> updatePagination());

        // react to pagination page changes
        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateTablePage(newVal.intValue()));

        // Search field updates predicate
        searchField.textProperty().addListener((observable, oldValue, newValue) -> {
            filteredData.setPredicate(match -> {
                if (newValue == null || newValue.trim().isEmpty()) return true;
                String lower = newValue.toLowerCase();
                return match.getTournament().getName().toLowerCase().contains(lower);
            });
        });

        // RBAC Check
        boolean isAdmin = SessionManager.getInstance().isAdmin();
        formContainer.setVisible(isAdmin);
        formContainer.setManaged(isAdmin);
        addButton.setVisible(isAdmin);
        addButton.setManaged(isAdmin);
        editButton.setVisible(isAdmin);
        editButton.setManaged(isAdmin);
        deleteButton.setVisible(isAdmin);
        deleteButton.setManaged(isAdmin);

        // Column Mapping
        colDate.setCellValueFactory(new PropertyValueFactory<>("date"));
        colFormat.setCellValueFactory(new PropertyValueFactory<>("format"));
        
        // Map Tournament Name
        colTournament.setCellValueFactory(cellData -> {
            Tournament t = cellData.getValue().getTournament();
            return new SimpleStringProperty(t != null ? t.getName() : "N/A");
        });

        // Setup ComboBoxes
        formatComboBox.setItems(FXCollections.observableArrayList("BO1", "BO3", "BO5"));
        loadTournaments();

        // Selection Listener
        matchTable.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                if (isAdmin) populateFields(newVal);
                updatePreview(newVal);
            }
        });

        // Disable buttons when no row is selected
        editButton.disableProperty().bind(matchTable.getSelectionModel().selectedItemProperty().isNull());
        deleteButton.disableProperty().bind(matchTable.getSelectionModel().selectedItemProperty().isNull());

        loadMatches();
    }

    private void loadMatches() {
        ProgressIndicator progress = new ProgressIndicator();
        matchTable.setPlaceholder(progress);

        Task<List<Match>> task = new Task<>() {
            @Override
            protected List<Match> call() throws Exception {
                return matchService.getAll();
            }
        };

        task.setOnSucceeded(e -> {
            matchList.setAll(task.getValue());
            matchTable.setPlaceholder(new Label("No matches found"));
            updatePagination();
        });

        task.setOnFailed(e -> {
            matchTable.setPlaceholder(new Label("Failed to load matches"));
            showAlertError("Load failed", task.getException().getMessage());
        });

        new Thread(task).start();
    }

    @FXML
    private void onRefresh() {
        loadMatches();
        loadTournaments();
    }

    private void loadTournaments() {
        Task<List<Tournament>> task = new Task<>() {
            @Override
            protected List<Tournament> call() throws Exception {
                return tournamentService.getAll();
            }
        };
        task.setOnSucceeded(e -> tournamentComboBox.setItems(FXCollections.observableArrayList(task.getValue())));
        new Thread(task).start();
    }

    private void updatePreview(Match match) {
        teamALabel.setText("...");
        teamBLabel.setText("...");
        if (formTeamAField != null) formTeamAField.setText("Loading...");
        if (formTeamBField != null) formTeamBField.setText("Loading...");
        if (mapInstancesListView != null) {
            mapInstancesListView.getItems().clear();
        }
        
        Task<List<Team>> task = new Task<>() {
            @Override
            protected List<Team> call() throws Exception {
                return matchService.getTeamsInMatch(match.getId());
            }
        };

        task.setOnSucceeded(e -> {
            List<Team> teams = task.getValue();
            if (teams.size() >= 2) {
                teamALabel.setText(teams.get(0).getName());
                teamBLabel.setText(teams.get(1).getName());
                if (formTeamAField != null) formTeamAField.setText(teams.get(0).getName());
                if (formTeamBField != null) formTeamBField.setText(teams.get(1).getName());
            } else if (teams.size() == 1) {
                teamALabel.setText(teams.get(0).getName());
                teamBLabel.setText("TBD");
                if (formTeamAField != null) formTeamAField.setText(teams.get(0).getName());
                if (formTeamBField != null) formTeamBField.setText("TBD");
            } else {
                teamALabel.setText("TBD");
                teamBLabel.setText("TBD");
                if (formTeamAField != null) formTeamAField.setText("TBD");
                if (formTeamBField != null) formTeamBField.setText("TBD");
            }
        });

        new Thread(task).start();

        if (mapInstancesListView != null) {
            Task<List<MatchMapInstance>> mapTask = new Task<>() {
                @Override
                protected List<MatchMapInstance> call() throws Exception {
                    return mapInstanceService.getByMatch(match.getId());
                }
            };
            mapTask.setOnSucceeded(e -> mapInstancesListView.getItems().setAll(mapTask.getValue()));
            new Thread(mapTask).start();
        }
    }

    @FXML
    private void onEditMatch() {
        Match selected = matchTable.getSelectionModel().getSelectedItem();
        if (selected != null) {
            populateFields(selected);
        }
    }

    @FXML
    private void handleSave() {
        Tournament t = tournamentComboBox.getValue();
        LocalDate d = datePicker.getValue();
        String f = formatComboBox.getValue();

        if (t == null || d == null || f == null) {
            showAlertError("Validation Error", "All fields are required.");
            return;
        }

        Match selected = matchTable.getSelectionModel().getSelectedItem();
        Match matchToSave = (selected != null) ? selected : new Match(null);
        
        matchToSave.setTournament(t);
        matchToSave.setDate(d);
        matchToSave.setFormat(f);

        Task<Void> saveTask = new Task<>() {
            @Override
            protected Void call() throws Exception {
                matchService.save(matchToSave);
                return null;
            }
        };

        saveTask.setOnSucceeded(e -> {
            loadMatches();
            handleClear();
            showAlertInfo("Saved", "Match scheduled successfully.");
        });

        saveTask.setOnFailed(e -> showAlertError("Save failed", saveTask.getException().getMessage()));

        new Thread(saveTask).start();
    }

    @FXML
    private void handleDelete() {
        Match selected = matchTable.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showAlertError("Selection Required", "Please select a match to delete.");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Delete Match");
        confirm.setHeaderText("Confirm deletion");
        confirm.setContentText("Delete match ID: " + selected.getId() + "?");
        Optional<ButtonType> result = confirm.showAndWait();

        if (result.isPresent() && result.get() == ButtonType.OK) {
            Task<Void> deleteTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    matchService.delete(selected.getId());
                    return null;
                }
            };
            deleteTask.setOnSucceeded(e -> {
                loadMatches();
                handleClear();
                showAlertInfo("Deleted", "Match deleted successfully.");
            });
            deleteTask.setOnFailed(e -> showAlertError("Delete failed", deleteTask.getException().getMessage()));
            new Thread(deleteTask).start();
        }
    }

    @FXML
    private void handleClear() {
        tournamentComboBox.getSelectionModel().clearSelection();
        datePicker.setValue(null);
        formatComboBox.getSelectionModel().clearSelection();
        matchTable.getSelectionModel().clearSelection();
        teamALabel.setText("Team A");
        teamBLabel.setText("Team B");
        if (formTeamAField != null) formTeamAField.clear();
        if (formTeamBField != null) formTeamBField.clear();
        if (mapInstancesListView != null) mapInstancesListView.getItems().clear();
    }

    private void populateFields(Match match) {
        tournamentComboBox.setValue(match.getTournament());
        datePicker.setValue(match.getDate());
        formatComboBox.setValue(match.getFormat());
    }

    private void updatePagination() {
        int total = sortedData == null ? 0 : sortedData.size();
        int pageCount = (int) Math.ceil((double) Math.max(total, 1) / ROWS_PER_PAGE);
        pagination.setPageCount(pageCount == 0 ? 1 : pageCount);
        int currentIndex = Math.min(pagination.getCurrentPageIndex(), Math.max(0, pageCount - 1));
        pagination.setCurrentPageIndex(currentIndex);
        updateTablePage(currentIndex);
    }

    private void updateTablePage(int pageIndex) {
        if (sortedData == null) return;
        int fromIndex = pageIndex * ROWS_PER_PAGE;
        int toIndex = Math.min(fromIndex + ROWS_PER_PAGE, sortedData.size());
        currentPageList.setAll(sortedData.subList(fromIndex, toIndex));
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

    @FXML
    private void onViewStats() {
        Match selected = matchTable.getSelectionModel().getSelectedItem();
        if (selected == null) return;
        
        try {
            URL fxmlLocation = getClass().getResource("/views/in_game/match_details.fxml");
            if (fxmlLocation == null) {
                showAlertError("Error", "Could not find match_details.fxml");
                return;
            }
            FXMLLoader loader = new FXMLLoader(fxmlLocation);
            Parent root = loader.load();
            
            MatchDetailController controller = loader.getController();
            controller.setMatch(selected);
            
            Stage stage = new Stage();
            stage.setTitle("Match Details & Map Statistics - Match #" + selected.getId());
            stage.initModality(Modality.APPLICATION_MODAL);
            Scene scene = new Scene(root);
            
            URL cssLocation = getClass().getResource("/css/style.css");
            if (cssLocation != null) {
                scene.getStylesheets().add(cssLocation.toExternalForm());
            }
            
            stage.setScene(scene);
            stage.showAndWait();
            
        } catch (IOException e) {
            e.printStackTrace();
            showAlertError("Error", "Could not load match details view: " + e.getMessage());
        }
    }
}
