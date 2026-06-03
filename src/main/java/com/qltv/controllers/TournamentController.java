package com.qltv.controllers;

import com.qltv.models.logistics.EventType;
import com.qltv.models.logistics.Organizer;
import com.qltv.models.logistics.Tournament;
import com.qltv.models.personnel.Team;
import com.qltv.services.TournamentService;
import com.qltv.services.OrganizerService;
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
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.util.StringConverter;
import org.jetbrains.annotations.NotNull;

import java.util.List;
import java.util.Optional;

public class TournamentController {

    @FXML private TableView<Tournament> tournamentTable;
    @FXML private TableColumn<Tournament, String> colName;
    @FXML private TableColumn<Tournament, String> colType;
    @FXML private TableColumn<Tournament, String> colLocation;
    @FXML private TableColumn<Tournament, Double> colPrize;

    @FXML private FlowPane teamsFlowPane;

    @FXML private VBox formContainer;
    @FXML private TextField nameField;
    @FXML private TextField locationField;
    @FXML private TextField prizeField;
    @FXML private ComboBox<Organizer> organizerComboBox;
    @FXML private ComboBox<EventType> eventTypeComboBox;
    
    @FXML private TextField searchField;
    @FXML private ComboBox<String> typeFilter;
    @FXML private Button addButton;
    @FXML private Button editButton;
    @FXML private Button deleteButton;
    @FXML private Pagination pagination;

    @FXML private TableView<com.qltv.models.in_game.Match> matchTable;
    @FXML private TableColumn<com.qltv.models.in_game.Match, java.time.LocalDate> colMatchDate;
    @FXML private TableColumn<com.qltv.models.in_game.Match, String> colMatchStage;
    @FXML private TableColumn<com.qltv.models.in_game.Match, String> colMatchFormat;

    private final TournamentService tournamentService = new TournamentService();
    private final OrganizerService organizerService = new OrganizerService();
    private final com.qltv.services.MatchService matchService = new com.qltv.services.MatchService();
    
    private final ObservableList<Tournament> tournamentList = FXCollections.observableArrayList();
    private final ObservableList<com.qltv.models.in_game.Match> matchHistory = FXCollections.observableArrayList();
    private FilteredList<Tournament> filteredData;
    private SortedList<Tournament> sortedData;
    private final ObservableList<Tournament> currentPageList = FXCollections.observableArrayList();
    private static final int ROWS_PER_PAGE = 20;

    @FXML
    public void initialize() {
        filteredData = new FilteredList<>(tournamentList, p -> true);
        sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(tournamentTable.comparatorProperty());
        tournamentTable.setItems(currentPageList);

        filteredData.addListener((ListChangeListener<Tournament>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<Tournament>) c -> updatePagination());

        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateTablePage(newVal.intValue()));

        searchField.textProperty().addListener((obs, old, newVal) -> updateFilters());
        
        ObservableList<String> types = FXCollections.observableArrayList("All Types");
        for (EventType et : EventType.values()) {
            types.add(et.getName());
        }
        typeFilter.setItems(types);
        typeFilter.setValue("All Types");
        typeFilter.valueProperty().addListener((obs, old, newVal) -> updateFilters());

        // Setup EventType ComboBox
        eventTypeComboBox.setItems(FXCollections.observableArrayList(EventType.values()));
        eventTypeComboBox.setConverter(new StringConverter<>() {
            @Override
            public String toString(EventType et) {
                return (et == null) ? "" : et.getName();
            }
            @Override
            public EventType fromString(String string) {
                return null;
            }
        });

        // Setup Organizer ComboBox
        organizerComboBox.setConverter(new StringConverter<>() {
            @Override
            public String toString(Organizer org) {
                return (org == null) ? "" : org.getName();
            }
            @Override
            public Organizer fromString(String string) {
                return null;
            }
        });

        loadOrganizers();
        
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
        colName.setCellValueFactory(new PropertyValueFactory<>("name"));
        colType.setCellValueFactory(cellData -> {
            EventType et = cellData.getValue().getEventType();
            return new SimpleStringProperty(et != null ? et.getName() : "N/A");
        });
        colLocation.setCellValueFactory(new PropertyValueFactory<>("locationCity"));
        colPrize.setCellValueFactory(new PropertyValueFactory<>("totalPrizeUsd"));

        tournamentTable.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                if (isAdmin) populateFields(newVal);
                loadParticipatingTeams(newVal);
            }
        });

        editButton.disableProperty().bind(tournamentTable.getSelectionModel().selectedItemProperty().isNull());
        deleteButton.disableProperty().bind(tournamentTable.getSelectionModel().selectedItemProperty().isNull());

        loadTournaments();
    }

    private void loadOrganizers() {
        Task<List<Organizer>> task = new Task<>() {
            @Override
            protected List<Organizer> call() {
                return organizerService.getAll();
            }
        };
        task.setOnSucceeded(e -> organizerComboBox.setItems(FXCollections.observableArrayList(task.getValue())));
        new Thread(task).start();
    }

    private void updateFilters() {
        String searchText = searchField.getText();
        String selectedTypeName = typeFilter.getValue();
        
        filteredData.setPredicate(t -> {
            boolean matchesSearch = (searchText == null || searchText.isEmpty()) 
                || t.getName().toLowerCase().contains(searchText.toLowerCase());
            
            boolean matchesType = (selectedTypeName == null || "All Types".equals(selectedTypeName))
                || (t.getEventType() != null && t.getEventType().getName().equals(selectedTypeName));
            
            return matchesSearch && matchesType;
        });
    }

    private void loadTournaments() {
        ProgressIndicator progress = new ProgressIndicator();
        tournamentTable.setPlaceholder(progress);

        Task<List<Tournament>> task = new Task<>() {
            @Override
            protected List<Tournament> call() {
                return tournamentService.getAll();
            }
        };

        task.setOnSucceeded(e -> {
            tournamentList.setAll(task.getValue());
            tournamentTable.setPlaceholder(new Label("No tournaments found"));
            updatePagination();
        });

        task.setOnFailed(e -> {
            tournamentTable.setPlaceholder(new Label("Failed to load tournaments"));
            showAlertError("Load failed", task.getException().getMessage());
        });

        new Thread(task).start();
    }

    @FXML
    private void onRefresh() {
        loadTournaments();
        loadOrganizers();
    }

    @FXML
    private void onAddTournament() {
        handleClear();
    }

    @FXML
    private void onEditTournament() {
        Tournament selected = tournamentTable.getSelectionModel().getSelectedItem();
        if (selected != null) {
            populateFields(selected);
        }
    }

    private void loadParticipatingTeams(Tournament tournament) {
        teamsFlowPane.getChildren().clear();
        ProgressIndicator pi = new ProgressIndicator();
        pi.setPrefSize(30, 30);
        teamsFlowPane.getChildren().add(pi);

        Task<List<Team>> task = new Task<>() {
            @Override
            protected List<Team> call() {
                return tournamentService.getParticipatingTeams(tournament.getId());
            }
        };

        task.setOnSucceeded(e -> {
            teamsFlowPane.getChildren().clear();
            List<Team> teams = task.getValue();
            for (Team team : teams) {
                teamsFlowPane.getChildren().add(createTeamCard(team));
            }
        });

        task.setOnFailed(e -> {
            teamsFlowPane.getChildren().clear();
            teamsFlowPane.getChildren().add(new Label("Failed to load teams"));
        });

        new Thread(task).start();
    }

    private VBox createTeamCard(Team team) {
        VBox card = new VBox(10);
        card.getStyleClass().add("team-card");
        card.setAlignment(Pos.CENTER);
        card.setPrefSize(120, 60);

        Label nameLabel = new Label(team.getName());
        nameLabel.setStyle("-fx-font-weight: bold;");
        
        Label tagLabel = new Label("[" + team.getTag() + "]");
        tagLabel.setStyle("-fx-text-fill: #7f8c8d;");

        card.getChildren().addAll(nameLabel, tagLabel);
        return card;
    }

    @FXML
    private void handleSave() {
        String name = nameField.getText();
        String location = locationField.getText();
        String prizeStr = prizeField.getText();
        Organizer organizer = organizerComboBox.getValue();
        EventType eventType = eventTypeComboBox.getValue();

        if (name == null || name.isEmpty() || location == null || location.isEmpty() || organizer == null || eventType == null) {
            showAlertError("Validation Error", "All fields including Organizer and Type are required.");
            return;
        }

        double prize;
        try {
            prize = Double.parseDouble(prizeStr);
        } catch (NumberFormatException e) {
            showAlertError("Validation Error", "Prize must be a valid number.");
            return;
        }

        Tournament selected = tournamentTable.getSelectionModel().getSelectedItem();
        Tournament tToSave = (selected != null) ? selected : new Tournament(null);
        
        tToSave.setName(name);
        tToSave.setLocation(location);
        tToSave.setTotalPrizeUsd(prize);
        tToSave.setOrganizer(organizer);
        tToSave.setEventType(eventType);
        
        if (tToSave.getStartDate() == null) {
            tToSave.setStartDate(java.time.LocalDate.now());
        }

        Task<Void> saveTask = new Task<>() {
            @Override
            protected Void call() {
                tournamentService.save(tToSave);
                return null;
            }
        };

        saveTask.setOnSucceeded(e -> {
            loadTournaments();
            handleClear();
            showAlertInfo("Saved", "Tournament saved successfully.");
        });

        saveTask.setOnFailed(e -> showAlertError("Save failed", saveTask.getException().getMessage()));

        new Thread(saveTask).start();
    }

    @FXML
    private void handleDelete() {
        Tournament selected = tournamentTable.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showAlertError("Selection Required", "Please select a tournament to delete.");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Delete Tournament");
        confirm.setHeaderText("Confirm deletion");
        confirm.setContentText("Delete " + selected.getName() + "?");
        Optional<ButtonType> result = confirm.showAndWait();

        if (result.isPresent() && result.get() == ButtonType.OK) {
            Task<Void> deleteTask = getVoidTask(selected);
            new Thread(deleteTask).start();
        }
    }

    private @NotNull Task<Void> getVoidTask(Tournament selected) {
        Task<Void> deleteTask = new Task<>() {
            @Override
            protected Void call() {
                tournamentService.delete(selected.getId());
                return null;
            }
        };
        deleteTask.setOnSucceeded(e -> {
            loadTournaments();
            handleClear();
            showAlertInfo("Deleted", "Tournament deleted successfully.");
        });
        deleteTask.setOnFailed(e -> showAlertError("Delete failed", deleteTask.getException().getMessage()));
        return deleteTask;
    }

    @FXML
    private void handleClear() {
        nameField.clear();
        locationField.clear();
        prizeField.clear();
        organizerComboBox.getSelectionModel().clearSelection();
        eventTypeComboBox.getSelectionModel().clearSelection();
        tournamentTable.getSelectionModel().clearSelection();
        teamsFlowPane.getChildren().clear();
    }

    private void populateFields(Tournament t) {
        nameField.setText(t.getName());
        locationField.setText(t.getLocation());
        prizeField.setText(String.valueOf(t.getTotalPrizeUsd()));
        organizerComboBox.setValue(t.getOrganizer());
        eventTypeComboBox.setValue(t.getEventType());
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
}
