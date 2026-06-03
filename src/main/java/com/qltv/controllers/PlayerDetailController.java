package com.qltv.controllers;

import com.qltv.models.in_game.Match;
import com.qltv.models.logistics.Tournament;
import com.qltv.models.personnel.Contract;
import com.qltv.models.personnel.Player;
import com.qltv.models.personnel.Team;
import com.qltv.services.ContractService;
import com.qltv.services.MatchService;
import com.qltv.services.MemberService;
import com.qltv.services.TeamService;
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
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.util.StringConverter;

import java.time.LocalDate;
import java.util.List;

public class PlayerDetailController {

    @FXML private TextField roleField;
    @FXML private TextField resolutionField;
    @FXML private TextField sensitivityField;
    @FXML private TextField dpiField;
    @FXML private HBox adminActions;

    @FXML private TableView<Contract> contractTable;
    @FXML private TableColumn<Contract, String> colTeam;
    @FXML private TableColumn<Contract, String> colStart;
    @FXML private TableColumn<Contract, String> colEnd;
    
    @FXML private Pagination pagination;

    @FXML private TableView<Match> matchTable;
    @FXML private TableColumn<Match, String> colTournament;
    @FXML private TableColumn<Match, LocalDate> colDate;
    @FXML private TableColumn<Match, String> colFormat;

    private Player currentPlayer;
    private final MemberService memberService = new MemberService();
    private final TeamService teamService = new TeamService();
    private final ContractService contractService = new ContractService();
    private final MatchService matchService = new MatchService();
    
    private final ObservableList<Contract> contractHistory = FXCollections.observableArrayList();
    private final ObservableList<Match> matchHistory = FXCollections.observableArrayList();
    private FilteredList<Contract> filteredData;
    private SortedList<Contract> sortedData;
    private final ObservableList<Contract> currentPageList = FXCollections.observableArrayList();
    private static final int ROWS_PER_PAGE = 20;

    @FXML
    public void initialize() {
        boolean isAdmin = SessionManager.getInstance().isAdmin();
        adminActions.setVisible(isAdmin);
        adminActions.setManaged(isAdmin);

        filteredData = new FilteredList<>(contractHistory, p -> true);
        sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(contractTable.comparatorProperty());
        contractTable.setItems(currentPageList);

        filteredData.addListener((ListChangeListener<Contract>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<Contract>) c -> updatePagination());

        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateTablePage(newVal.intValue()));

        colTeam.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getTeam().getName()));
        colStart.setCellValueFactory(new PropertyValueFactory<>("startDate"));
        colEnd.setCellValueFactory(cellData -> {
            LocalDate end = cellData.getValue().getEndDate();
            return new SimpleStringProperty(end != null ? end.toString() : "Present");
        });

        // Setup Match Table
        if (matchTable != null) {
            colTournament.setCellValueFactory(cellData -> {
                Tournament t = cellData.getValue().getTournament();
                return new SimpleStringProperty(t != null ? t.getName() : "N/A");
            });
            colDate.setCellValueFactory(new PropertyValueFactory<>("date"));
            colFormat.setCellValueFactory(new PropertyValueFactory<>("format"));
            matchTable.setItems(matchHistory);
        }

        updatePagination();
    }

    public void setPlayerData(Player player) {
        this.currentPlayer = player;
        roleField.setText(player.getRole() != null ? player.getRole().getName() : "N/A");
        resolutionField.setText(player.getResolution());
        sensitivityField.setText(String.valueOf(player.getSensitivity()));
        dpiField.setText(String.valueOf(player.getMouseDpi()));

        loadContractHistory(player.getId());
        loadMatchHistory(player.getId());
    }

    @FXML
    private void onUpdateProfile() {
        if (currentPlayer == null) return;
        
        try {
            currentPlayer.setResolution(resolutionField.getText());
            currentPlayer.setSensitivity(Double.parseDouble(sensitivityField.getText()));
            currentPlayer.setMouseDpi(Integer.parseInt(dpiField.getText()));

            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    memberService.save(currentPlayer);
                    return null;
                }
            };
            task.setOnSucceeded(e -> showAlertInfo("Success", "Player profile updated."));
            task.setOnFailed(e -> showAlertError("Update Failed", task.getException().getMessage()));
            new Thread(task).start();
        } catch (NumberFormatException e) {
            showAlertError("Validation Error", "Sensitivity and DPI must be numeric.");
        }
    }

    @FXML
    private void onAddContract() {
        if (currentPlayer == null) return;

        Dialog<Contract> dialog = new Dialog<>();
        dialog.setTitle("Add New Contract");
        dialog.setHeaderText("Create a new contract for " + currentPlayer.getNickname());

        ButtonType saveBtnType = new ButtonType("Save", ButtonBar.ButtonData.OK_DONE);
        dialog.getDialogPane().getButtonTypes().addAll(saveBtnType, ButtonType.CANCEL);

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));

        ComboBox<Team> teamCombo = new ComboBox<>();
        teamCombo.setConverter(new StringConverter<>() {
            @Override public String toString(Team t) { return t != null ? t.getName() : ""; }
            @Override public Team fromString(String s) { return null; }
        });

        DatePicker startPicker = new DatePicker(LocalDate.now());
        TextField salaryField = new TextField("0");

        Task<List<Team>> loadTeamsTask = new Task<>() {
            @Override
            protected List<Team> call() throws Exception {
                return teamService.getAll();
            }
        };
        loadTeamsTask.setOnSucceeded(e -> teamCombo.setItems(FXCollections.observableArrayList(loadTeamsTask.getValue())));
        new Thread(loadTeamsTask).start();

        grid.add(new Label("Team:"), 0, 0);
        grid.add(teamCombo, 1, 0);
        grid.add(new Label("Start Date:"), 0, 1);
        grid.add(startPicker, 1, 1);
        grid.add(new Label("Monthly Salary:"), 0, 2);
        grid.add(salaryField, 1, 2);

        dialog.getDialogPane().setContent(grid);

        dialog.setResultConverter(btn -> {
            if (btn == saveBtnType) {
                Contract c = new Contract();
                c.setMember(currentPlayer);
                c.setTeam(teamCombo.getValue());
                c.setStartDate(startPicker.getValue());
                try {
                    c.setMonthlySalary(Double.parseDouble(salaryField.getText()));
                } catch (Exception ex) { c.setMonthlySalary(0.0); }
                return c;
            }
            return null;
        });

        dialog.showAndWait().ifPresent(c -> {
            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    contractService.save(c);
                    return null;
                }
            };
            task.setOnSucceeded(e -> loadContractHistory(currentPlayer.getId()));
            task.setOnFailed(e -> showAlertError("Error", task.getException().getMessage()));
            new Thread(task).start();
        });
    }

    private void loadContractHistory(int playerId) {
        Task<List<Contract>> task = new Task<>() {
            @Override
            protected List<Contract> call() throws Exception {
                return contractService.getByMember(playerId);
            }
        };
        task.setOnSucceeded(e -> {
            contractHistory.setAll(task.getValue());
            updatePagination();
        });
        new Thread(task).start();
    }

    private void loadMatchHistory(int playerId) {
        Task<List<Match>> task = new Task<>() {
            @Override
            protected List<Match> call() throws Exception {
                return matchService.getMatchesByPlayer(playerId);
            }
        };
        task.setOnSucceeded(e -> matchHistory.setAll(task.getValue()));
        new Thread(task).start();
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
