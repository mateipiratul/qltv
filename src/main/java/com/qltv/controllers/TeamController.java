package com.qltv.controllers;

import com.qltv.models.personnel.Team;
import com.qltv.models.logistics.Sponsor;
import com.qltv.models.logistics.Sponsorship;
import com.qltv.services.TeamService;
import com.qltv.services.SponsorService;
import com.qltv.services.SponsorshipService;
import com.qltv.services.UserService;
import com.qltv.util.SessionManager;
import javafx.application.Platform;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.ListChangeListener;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.geometry.Insets;

import java.util.List;
import java.util.Optional;
import java.util.HashSet;
import java.util.Set;

public class TeamController {

    @FXML private TableView<Team> teamTable;
    @FXML private TableColumn<Team, Void> colFavorite;
    @FXML private TableColumn<Team, String> colName;
    @FXML private TableColumn<Team, String> colTag;
    @FXML private TableColumn<Team, String> colRank;
    @FXML private TableColumn<Team, String> colLogoUrl;

    @FXML private VBox formContainer;
    @FXML private TextField nameField;
    @FXML private TextField tagField;
    @FXML private TextField rankField;
    @FXML private TextField logoUrlField;
    @FXML private TextField searchField;
    
    @FXML private Button addButton;
    @FXML private Button editButton;
    @FXML private Button deleteButton;
    @FXML private Button linkSponsorButton;
    @FXML private Button unlinkButton;
    @FXML private Pagination pagination;
    @FXML private ListView<Sponsorship> sponsorshipListView;

    @FXML private TableView<com.qltv.models.personnel.Contract> contractTable;
    @FXML private TableColumn<com.qltv.models.personnel.Contract, String> colMember;
    @FXML private TableColumn<com.qltv.models.personnel.Contract, String> colStart;
    @FXML private TableColumn<com.qltv.models.personnel.Contract, String> colEnd;
    
    @FXML private javafx.scene.layout.FlowPane rosterFlowPane;

    private final ObservableList<Team> teamList = FXCollections.observableArrayList();
    private final TeamService teamService = new TeamService();
    private final SponsorshipService sponsorshipService = new SponsorshipService();
    private final SponsorService sponsorService = new SponsorService();
    private final UserService userService = new UserService();
    private final com.qltv.services.ContractService contractService = new com.qltv.services.ContractService();
    private final com.qltv.services.MemberService memberService = new com.qltv.services.MemberService();
    
    private FilteredList<Team> filteredData;
    private SortedList<Team> sortedData;
    private final ObservableList<Team> currentPageList = FXCollections.observableArrayList();
    private final ObservableList<com.qltv.models.personnel.Contract> contractHistory = FXCollections.observableArrayList();
    private static final int ROWS_PER_PAGE = 20;

    private final Set<Integer> favoriteTeamIds = new HashSet<>();

    @FXML
    public void initialize() {
        filteredData = new FilteredList<>(teamList, p -> true);
        sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(teamTable.comparatorProperty());
        teamTable.setItems(currentPageList);

        // update pagination when the filtered/sorted data changes
        filteredData.addListener((ListChangeListener<Team>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<Team>) c -> updatePagination());

        // react to pagination page changes
        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateTablePage(newVal.intValue()));

        searchField.textProperty().addListener((observable, oldValue, newValue) -> {
            filteredData.setPredicate(team -> {
                if (newValue == null || newValue.isEmpty()) return true;
                String lowerCaseFilter = newValue.toLowerCase();
                return team.getName().toLowerCase().contains(lowerCaseFilter)
                    || team.getTag().toLowerCase().contains(lowerCaseFilter);
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
        linkSponsorButton.setVisible(isAdmin);
        linkSponsorButton.setManaged(isAdmin);
        unlinkButton.setVisible(isAdmin);
        unlinkButton.setManaged(isAdmin);

        // Column Mapping
        setupFavoriteColumn();
        colName.setCellValueFactory(new PropertyValueFactory<>("name"));
        colTag.setCellValueFactory(new PropertyValueFactory<>("tag"));
        colLogoUrl.setCellValueFactory(new PropertyValueFactory<>("logoUrl"));
        
        // Special mapping for the Rank sealed interface
        colRank.setCellValueFactory(cellData -> {
            Team.Rank rank = cellData.getValue().getRank();
            return new SimpleStringProperty(rank != null ? rank.getDisplayValue() : "UNRANKED");
        });

        if (contractTable != null) {
            colMember.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getMember().getNickname()));
            colStart.setCellValueFactory(new PropertyValueFactory<>("startDate"));
            colEnd.setCellValueFactory(cellData -> {
                java.time.LocalDate end = cellData.getValue().getEndDate();
                return new SimpleStringProperty(end != null ? end.toString() : "Present");
            });
            contractTable.setItems(contractHistory);
        }

        // Disable buttons when no row is selected
        editButton.disableProperty().bind(teamTable.getSelectionModel().selectedItemProperty().isNull());
        deleteButton.disableProperty().bind(teamTable.getSelectionModel().selectedItemProperty().isNull());

        if (isAdmin) {
            teamTable.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
                if (newSelection != null) {
                    populateFields(newSelection);
                    loadSponsorships(newSelection.getId());
                    loadContracts(newSelection.getId());
                    loadRoster(newSelection.getId());
                } else {
                    sponsorshipListView.getItems().clear();
                    contractHistory.clear();
                    if (rosterFlowPane != null) rosterFlowPane.getChildren().clear();
                }
            });
        }

        loadTeams();
    }

    private void setupFavoriteColumn() {
        colFavorite.setCellFactory(param -> new TableCell<>() {
            private final Button btn = new Button();
            {
                btn.getStyleClass().add("text-button");
                btn.setStyle("-fx-font-size: 14px; -fx-padding: 0;");
                btn.setOnAction(event -> {
                    Team team = getTableView().getItems().get(getIndex());
                    toggleFavorite(team);
                });
            }

            @Override
            protected void updateItem(Void item, boolean empty) {
                super.updateItem(item, empty);
                if (empty) {
                    setGraphic(null);
                } else {
                    Team team = getTableView().getItems().get(getIndex());
                    if (favoriteTeamIds.contains(team.getId())) {
                        btn.setText("★");
                        btn.setStyle("-fx-text-fill: #f59e0b; -fx-font-size: 14px;");
                    } else {
                        btn.setText("☆");
                        btn.setStyle("-fx-text-fill: #94a3b8; -fx-font-size: 14px;");
                    }
                    setGraphic(btn);
                }
            }
        });
    }

    private void toggleFavorite(Team team) {
        int userId = SessionManager.getInstance().getCurrentUser().getId();
        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                userService.toggleFavoriteTeam(userId, team);
                return null;
            }
        };
        task.setOnSucceeded(e -> {
            if (favoriteTeamIds.contains(team.getId())) {
                favoriteTeamIds.remove(team.getId());
            } else {
                favoriteTeamIds.add(team.getId());
            }
            teamTable.refresh();
        });
        new Thread(task).start();
    }

    private void loadTeams() {
        ProgressIndicator progress = new ProgressIndicator();
        teamTable.setPlaceholder(progress);

        Task<List<Team>> task = new Task<>() {
            @Override
            protected List<Team> call() throws Exception {
                // Load favorites first
                int userId = SessionManager.getInstance().getCurrentUser().getId();
                List<Team> favs = userService.getFavoriteTeams(userId);
                favoriteTeamIds.clear();
                favs.forEach(t -> favoriteTeamIds.add(t.getId()));
                
                return teamService.getAll();
            }
        };

        task.setOnSucceeded(e -> {
            teamList.setAll(task.getValue());
            teamTable.setPlaceholder(new Label("No teams"));
            updatePagination();
        });

        task.setOnFailed(e -> {
            teamTable.setPlaceholder(new Label("Failed to load teams"));
            showAlertError("Load failed", task.getException().getMessage());
        });

        new Thread(task).start();
    }

    private void loadSponsorships(int teamId) {
        Task<List<Sponsorship>> task = new Task<>() {
            @Override
            protected List<Sponsorship> call() throws Exception {
                return sponsorshipService.getByTeam(teamId);
            }
        };
        task.setOnSucceeded(e -> sponsorshipListView.getItems().setAll(task.getValue()));
        new Thread(task).start();
    }

    private void loadContracts(int teamId) {
        Task<List<com.qltv.models.personnel.Contract>> task = new Task<>() {
            @Override
            protected List<com.qltv.models.personnel.Contract> call() throws Exception {
                return contractService.getByTeam(teamId);
            }
        };
        task.setOnSucceeded(e -> contractHistory.setAll(task.getValue()));
        new Thread(task).start();
    }

    private void loadRoster(int teamId) {
        if (rosterFlowPane == null) return;
        rosterFlowPane.getChildren().clear();
        ProgressIndicator pi = new ProgressIndicator();
        pi.setPrefSize(20, 20);
        rosterFlowPane.getChildren().add(pi);

        Task<List<com.qltv.models.personnel.Player>> task = new Task<>() {
            @Override
            protected List<com.qltv.models.personnel.Player> call() throws Exception {
                return memberService.getPlayersByTeam(teamId);
            }
        };
        
        task.setOnSucceeded(e -> {
            rosterFlowPane.getChildren().clear();
            List<com.qltv.models.personnel.Player> players = task.getValue();
            if (players.isEmpty()) {
                rosterFlowPane.getChildren().add(new Label("No active roster."));
            } else {
                for (com.qltv.models.personnel.Player p : players) {
                    VBox card = new VBox(5);
                    card.setStyle("-fx-background-color: #ffffff; -fx-padding: 10; -fx-border-color: #cbd5e1; -fx-border-radius: 5; -fx-background-radius: 5;");
                    card.setAlignment(javafx.geometry.Pos.CENTER);
                    Label nameLbl = new Label(p.getNickname());
                    nameLbl.setStyle("-fx-font-weight: bold;");
                    Label roleLbl = new Label(p.getRole() != null ? p.getRole().name() : "Player");
                    roleLbl.setStyle("-fx-text-fill: #64748b; -fx-font-size: 10px;");
                    card.getChildren().addAll(nameLbl, roleLbl);
                    rosterFlowPane.getChildren().add(card);
                }
            }
        });
        
        new Thread(task).start();
    }

    @FXML
    private void onLinkSponsor() {
        Team selectedTeam = teamTable.getSelectionModel().getSelectedItem();
        if (selectedTeam == null) return;

        Dialog<Sponsorship> dialog = new Dialog<>();
        dialog.setTitle("Link Sponsor");
        dialog.setHeaderText("Add sponsorship for " + selectedTeam.getName());

        ButtonType linkBtn = new ButtonType("Link", ButtonBar.ButtonData.OK_DONE);
        dialog.getDialogPane().getButtonTypes().addAll(linkBtn, ButtonType.CANCEL);
        dialog.getDialogPane().setMinWidth(500);
        try { dialog.getDialogPane().getStylesheets().add(getClass().getResource("/css/style.css").toExternalForm()); } catch(Exception ignored) {}

        GridPane grid = new GridPane();
        grid.setHgap(10); grid.setVgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));

        javafx.scene.layout.ColumnConstraints labelCol = new javafx.scene.layout.ColumnConstraints();
        labelCol.setMinWidth(120);
        grid.getColumnConstraints().add(labelCol);

        ComboBox<Sponsor> sponsorCombo = new ComboBox<>();
        DatePicker startPicker = new DatePicker(java.time.LocalDate.now());
        TextField amountField = new TextField("5000");

        Task<List<Sponsor>> loadSponsorsTask = new Task<>() {
            @Override
            protected List<Sponsor> call() throws Exception {
                return sponsorService.getAll();
            }
        };
        loadSponsorsTask.setOnSucceeded(e -> sponsorCombo.setItems(FXCollections.observableArrayList(loadSponsorsTask.getValue())));
        new Thread(loadSponsorsTask).start();

        grid.add(new Label("Sponsor:"), 0, 0); grid.add(sponsorCombo, 1, 0);
        grid.add(new Label("Start Date:"), 0, 1); grid.add(startPicker, 1, 1);
        grid.add(new Label("Amount ($):"), 0, 2); grid.add(amountField, 1, 2);

        dialog.getDialogPane().setContent(grid);

        dialog.setResultConverter(btn -> {
            if (btn == linkBtn) {
                Sponsorship s = new Sponsorship(null, selectedTeam, sponsorCombo.getValue(), startPicker.getValue(), null, 0.0);
                try {
                    s.setContractAmount(Double.parseDouble(amountField.getText()));
                } catch (Exception ex) {
                    s.setContractAmount(0.0);
                }
                return s;
            }
            return null;
        });

        dialog.showAndWait().ifPresent(s -> {
            Task<Void> saveTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    sponsorshipService.save(s);
                    return null;
                }
            };
            saveTask.setOnSucceeded(e -> loadSponsorships(selectedTeam.getId()));
            saveTask.setOnFailed(e -> showAlertError("Error", saveTask.getException().getMessage()));
            new Thread(saveTask).start();
        });
    }

    @FXML
    private void onUnlinkSponsor() {
        Sponsorship selected = sponsorshipListView.getSelectionModel().getSelectedItem();
        if (selected == null) return;

        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                sponsorshipService.delete(selected.getId());
                return null;
            }
        };
        task.setOnSucceeded(e -> loadSponsorships(selected.getTeam().getId()));
        new Thread(task).start();
    }

    @FXML
    private void onSortByRank() {
        Task<List<Team>> task = new Task<>() {
            @Override
            protected List<Team> call() throws Exception {
                return teamService.getTeamsSortedByRanking();
            }
        };
        task.setOnSucceeded(e -> {
            teamList.setAll(task.getValue());
            updatePagination();
        });
        new Thread(task).start();
    }

    @FXML
    private void onRefresh() {
        loadTeams();
    }

    @FXML
    private void onEditTeam() {
        Team selected = teamTable.getSelectionModel().getSelectedItem();
        if (selected != null) {
            populateFields(selected);
        }
    }

    @FXML
    private void handleSave() {
        String name = nameField.getText();
        String tag = tagField.getText();
        String rankStr = rankField.getText();
        String logoUrl = logoUrlField.getText();

        Team.Rank rankObj;
        if (rankStr == null || rankStr.trim().isEmpty()) {
            rankObj = new Team.Unranked();
        } else {
            try {
                rankObj = new Team.Ranked(Integer.parseInt(rankStr.trim()));
            } catch (NumberFormatException e) {
                showAlertError("Validation Error", "Rank must be a number or empty.");
                return;
            }
        }

        Team selected = teamTable.getSelectionModel().getSelectedItem();
        Team teamToSave = (selected != null) ? selected : new Team(null);
        
        teamToSave.setName(name);
        teamToSave.setTag(tag);
        teamToSave.setRank(rankObj);
        teamToSave.setLogoUrl(logoUrl);

        Task<Void> saveTask = new Task<>() {
            @Override
            protected Void call() throws Exception {
                teamService.save(teamToSave);
                return null;
            }
        };

        saveTask.setOnSucceeded(e -> {
            loadTeams();
            handleClear();
            showAlertInfo("Saved", "Team saved successfully.");
        });

        saveTask.setOnFailed(e -> showAlertError("Save failed", saveTask.getException().getMessage()));

        new Thread(saveTask).start();
    }

    @FXML
    private void handleDelete() {
        Team selected = teamTable.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showAlertError("Selection Required", "Please select a team to delete.");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Delete Team");
        confirm.setHeaderText("Confirm deletion");
        confirm.setContentText("Delete team " + selected.getName() + "?");
        Optional<ButtonType> result = confirm.showAndWait();

        if (result.isPresent() && result.get() == ButtonType.OK) {
            Task<Void> deleteTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    teamService.delete(selected.getId());
                    return null;
                }
            };
            deleteTask.setOnSucceeded(e -> {
                loadTeams();
                handleClear();
                showAlertInfo("Deleted", "Team deleted successfully.");
            });
            deleteTask.setOnFailed(e -> showAlertError("Delete failed", deleteTask.getException().getMessage()));
            new Thread(deleteTask).start();
        }
    }

    @FXML
    private void handleClear() {
        nameField.clear();
        tagField.clear();
        rankField.clear();
        logoUrlField.clear();
        teamTable.getSelectionModel().clearSelection();
    }

    private void populateFields(Team team) {
        nameField.setText(team.getName());
        tagField.setText(team.getTag());
        
        Team.Rank rank = team.getRank();
        if (rank instanceof Team.Ranked r) {
            rankField.setText(String.valueOf(r.rankValue()));
        } else {
            rankField.clear();
        }
        
        logoUrlField.setText(team.getLogoUrl());
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
