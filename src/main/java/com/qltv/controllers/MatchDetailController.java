package com.qltv.controllers;

import com.qltv.models.in_game.IndividualStatistic;
import com.qltv.models.in_game.Map;
import com.qltv.models.in_game.Match;
import com.qltv.models.in_game.MatchMapInstance;
import com.qltv.models.in_game.Round;
import com.qltv.models.personnel.Player;
import com.qltv.models.personnel.Team;
import com.qltv.models.personnel.Contract;
import com.qltv.services.*;
import com.qltv.util.SessionManager;
import com.qltv.util.CsvExportUtil;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.beans.property.SimpleBooleanProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.FileChooser;
import javafx.util.StringConverter;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class MatchDetailController {

    @FXML private Label matchTitleLabel;
    @FXML private ListView<MatchMapInstance> mapInstanceListView;
    @FXML private ComboBox<Map> mapComboBox;
    @FXML private TextField durationField;
    @FXML private VBox mapAdminControls;

    @FXML private Label activeMapLabel;
    @FXML private ComboBox<Round> roundComboBox;
    @FXML private Button addRoundButton;
    @FXML private Button deleteRoundButton;

    @FXML private TableView<IndividualStatistic> statsTable;
    @FXML private TableColumn<IndividualStatistic, String> colPlayer;
    @FXML private TableColumn<IndividualStatistic, String> colTeam;
    @FXML private TableColumn<IndividualStatistic, Integer> colKills;
    @FXML private TableColumn<IndividualStatistic, Integer> colAssists;
    @FXML private TableColumn<IndividualStatistic, Integer> colDamage;
    @FXML private TableColumn<IndividualStatistic, Integer> colHeadshots;
    @FXML private TableColumn<IndividualStatistic, Integer> colFlashAssists;
    @FXML private TableColumn<IndividualStatistic, Boolean> colDied;
    @FXML private TableColumn<IndividualStatistic, String> colKilledBy;

    @FXML private HBox statsAdminControls;
    @FXML private ComboBox<Team> teamSelectionComboBox;
    @FXML private ComboBox<Player> playerComboBox;
    @FXML private ComboBox<Player> killerComboBox;
    @FXML private TextField killsField;
    @FXML private TextField assistsField;
    @FXML private TextField damageField;
    @FXML private TextField hsField;
    @FXML private TextField flashField;
    @FXML private CheckBox diedCheckBox;

    private Match currentMatch;
    private List<Team> matchTeams = new ArrayList<>();

    private final TeamService teamService = new TeamService();
    private final MatchService matchService = new MatchService();
    private final MemberService memberService = new MemberService();
    private final MapService mapService = new MapService();
    private final MatchMapInstanceService mapInstanceService = new MatchMapInstanceService();
    private final RoundService roundService = new RoundService();
    private final StatisticService statisticService = new StatisticService();
    private final ContractService contractService = new ContractService();

    private final ObservableList<MatchMapInstance> mapInstances = FXCollections.observableArrayList();
    private final ObservableList<Round> rounds = FXCollections.observableArrayList();
    private final ObservableList<IndividualStatistic> playerStats = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        // RBAC Check
        boolean isAdmin = SessionManager.getInstance().isAdmin();
        if (mapAdminControls != null) {
            mapAdminControls.setVisible(isAdmin);
            mapAdminControls.setManaged(isAdmin);
        }
        if (statsAdminControls != null) {
            statsAdminControls.setVisible(isAdmin);
            statsAdminControls.setManaged(isAdmin);
        }
        if (addRoundButton != null) addRoundButton.setVisible(isAdmin);
        if (deleteRoundButton != null) deleteRoundButton.setVisible(isAdmin);

        // Bindings
        mapInstanceListView.setItems(mapInstances);
        roundComboBox.setItems(rounds);
        statsTable.setItems(playerStats);

        // Map column renderers
        colPlayer.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getPlayer().getNickname()));
        
        colTeam.setCellValueFactory(cellData -> {
            return new SimpleStringProperty(getPlayerTeamName(cellData.getValue().getPlayer()));
        });
        
        colKills.setCellValueFactory(new PropertyValueFactory<>("kills"));
        colAssists.setCellValueFactory(new PropertyValueFactory<>("assists"));
        colDamage.setCellValueFactory(new PropertyValueFactory<>("damage"));
        colHeadshots.setCellValueFactory(new PropertyValueFactory<>("headshots"));
        colFlashAssists.setCellValueFactory(new PropertyValueFactory<>("flashAssists"));
        
        colDied.setCellValueFactory(cellData -> new SimpleBooleanProperty(cellData.getValue().getDied()).asObject());
        colDied.setCellFactory(column -> new TableCell<>() {
            @Override
            protected void updateItem(Boolean item, boolean empty) {
                super.updateItem(item, empty);
                if (empty || item == null) {
                    setText(null);
                } else {
                    setText(item ? "Yes" : "No");
                }
            }
        });

        colKilledBy.setCellValueFactory(cellData -> {
            Player killer = cellData.getValue().getKilledBy();
            return new SimpleStringProperty(killer != null ? killer.getNickname() : "-");
        });

        // Map Converters
        mapComboBox.setConverter(new StringConverter<>() {
            @Override public String toString(Map map) { return map != null ? map.getName() : ""; }
            @Override public Map fromString(String string) { return null; }
        });

        teamSelectionComboBox.setConverter(new StringConverter<>() {
            @Override public String toString(Team team) { return team != null ? team.getName() : ""; }
            @Override public Team fromString(String string) { return null; }
        });

        playerComboBox.setConverter(new StringConverter<>() {
            @Override public String toString(Player player) { return player != null ? player.getNickname() : ""; }
            @Override public Player fromString(String string) { return null; }
        });

        killerComboBox.setConverter(new StringConverter<>() {
            @Override public String toString(Player player) { return player != null ? player.getNickname() : ""; }
            @Override public Player fromString(String string) { return null; }
        });

        roundComboBox.setConverter(new StringConverter<>() {
            @Override public String toString(Round round) { return round != null ? "Round " + round.getRoundNumber() + " (" + round.getResultCode() + ")" : ""; }
            @Override public Round fromString(String string) { return null; }
        });

        // Selection Handlers
        mapInstanceListView.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                activeMapLabel.setText(newVal.getMap().getName());
                loadRounds(newVal.getId());
            } else {
                activeMapLabel.setText("Please select a map on the left");
                rounds.clear();
                playerStats.clear();
            }
        });

        roundComboBox.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                loadPlayerStats(newVal.getId());
            } else {
                playerStats.clear();
            }
        });

        teamSelectionComboBox.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                loadPlayersForTeam(newVal.getId());
                loadKillers();
            } else {
                playerComboBox.getItems().clear();
                killerComboBox.getItems().clear();
            }
        });
    }

    public void setMatch(Match match) {
        this.currentMatch = match;
        loadTeamsForMatch();
        loadMapPool();
        loadMapInstances();
    }

    private void loadTeamsForMatch() {
        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                matchTeams = matchService.getTeamsInMatch(currentMatch.getId());
                return null;
            }
        };

        task.setOnSucceeded(e -> {
            String title = "TBD vs TBD";
            if (matchTeams.size() >= 2) {
                title = matchTeams.get(0).getName() + " vs " + matchTeams.get(1).getName();
            } else if (matchTeams.size() == 1) {
                title = matchTeams.get(0).getName() + " vs TBD";
            }
            matchTitleLabel.setText(title);
            loadAllTeams();
        });

        new Thread(task).start();
    }

    private void loadAllTeams() {
        Task<List<Team>> task = new Task<>() {
            @Override
            protected List<Team> call() throws Exception {
                return teamService.getAll();
            }
        };
        task.setOnSucceeded(e -> teamSelectionComboBox.setItems(FXCollections.observableArrayList(task.getValue())));
        new Thread(task).start();
    }

    private void loadPlayersForTeam(int teamId) {
        Task<List<Player>> task = new Task<>() {
            @Override
            protected List<Player> call() throws Exception {
                return memberService.getPlayersByTeam(teamId);
            }
        };
        task.setOnSucceeded(e -> playerComboBox.setItems(FXCollections.observableArrayList(task.getValue())));
        new Thread(task).start();
    }

    private void loadKillers() {
        Task<List<Player>> task = new Task<>() {
            @Override
            protected List<Player> call() throws Exception {
                List<Player> allMatchPlayers = new ArrayList<>();
                for (Team t : matchTeams) {
                    allMatchPlayers.addAll(memberService.getPlayersByTeam(t.getId()));
                }
                return allMatchPlayers;
            }
        };
        task.setOnSucceeded(e -> killerComboBox.setItems(FXCollections.observableArrayList(task.getValue())));
        new Thread(task).start();
    }

    private String getPlayerTeamName(Player p) {
        if (p == null || currentMatch == null) return "Unknown";
        try {
            List<Contract> contracts = contractService.getByMember(p.getId());
            LocalDate matchDate = currentMatch.getDate();
            return contracts.stream()
                .filter(c -> !matchDate.isBefore(c.getStartDate()) && (c.getEndDate() == null || !matchDate.isAfter(c.getEndDate())))
                .map(c -> c.getTeam().getName())
                .findFirst()
                .orElse("Freelancer");
        } catch (Exception e) {
            return "Participant";
        }
    }

    private void loadMapPool() {
        Task<List<Map>> task = new Task<>() {
            @Override
            protected List<Map> call() throws Exception {
                return mapService.getAll();
            }
        };
        task.setOnSucceeded(e -> mapComboBox.setItems(FXCollections.observableArrayList(task.getValue())));
        new Thread(task).start();
    }

    private void loadMapInstances() {
        Task<List<MatchMapInstance>> task = new Task<>() {
            @Override
            protected List<MatchMapInstance> call() throws Exception {
                return mapInstanceService.getByMatch(currentMatch.getId());
            }
        };
        task.setOnSucceeded(e -> mapInstances.setAll(task.getValue()));
        new Thread(task).start();
    }

    private void loadRounds(int mapInstanceId) {
        Task<List<Round>> task = new Task<>() {
            @Override
            protected List<Round> call() throws Exception {
                return roundService.getByMapInstance(mapInstanceId);
            }
        };
        task.setOnSucceeded(e -> rounds.setAll(task.getValue()));
        new Thread(task).start();
    }

    private void loadPlayerStats(int roundId) {
        Task<List<IndividualStatistic>> task = new Task<>() {
            @Override
            protected List<IndividualStatistic> call() throws Exception {
                return statisticService.getByRound(roundId);
            }
        };
        task.setOnSucceeded(e -> playerStats.setAll(task.getValue()));
        new Thread(task).start();
    }

    @FXML
    private void onAddMapInstance() {
        Map selected = mapComboBox.getValue();
        String durStr = durationField.getText();
        if (selected == null || durStr.isEmpty()) return;

        try {
            MatchMapInstance inst = new MatchMapInstance(null);
            inst.setMatch(currentMatch);
            inst.setMap(selected);
            inst.setDurationMinutes(Integer.parseInt(durStr));

            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    mapInstanceService.save(inst);
                    return null;
                }
            };
            task.setOnSucceeded(e -> {
                loadMapInstances();
                durationField.clear();
            });
            new Thread(task).start();
        } catch (NumberFormatException e) {
            showAlertError("Error", "Duration must be a number");
        }
    }

    @FXML
    private void onDeleteMapInstance() {
        MatchMapInstance selected = mapInstanceListView.getSelectionModel().getSelectedItem();
        if (selected == null) return;

        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                mapInstanceService.delete(selected.getId());
                return null;
            }
        };
        task.setOnSucceeded(e -> loadMapInstances());
        new Thread(task).start();
    }

    @FXML
    private void onAddRound() {
        MatchMapInstance selectedMap = mapInstanceListView.getSelectionModel().getSelectedItem();
        if (selectedMap == null) return;

        TextInputDialog dialog = new TextInputDialog("TRCT");
        dialog.setTitle("Add Round");
        dialog.setHeaderText("New Round for " + selectedMap.getMap().getName());
        dialog.setContentText("Result Code (e.g. TRCT, ELCT):");
        
        dialog.showAndWait().ifPresent(code -> {
            Round r = new Round(null);
            r.setMapInstanceId(selectedMap.getId());
            r.setRoundNumber(rounds.size() + 1);
            r.setResultCode(code.toUpperCase());

            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    roundService.save(r);
                    return null;
                }
            };
            task.setOnSucceeded(e -> loadRounds(selectedMap.getId()));
            new Thread(task).start();
        });
    }

    @FXML
    private void onDeleteRound() {
        Round selected = roundComboBox.getSelectionModel().getSelectedItem();
        if (selected == null) return;

        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                roundService.delete(selected.getId());
                return null;
            }
        };
        task.setOnSucceeded(e -> loadRounds(selected.getMapInstanceId()));
        new Thread(task).start();
    }

    @FXML
    private void onSavePlayerStats() {
        Round selectedRound = roundComboBox.getSelectionModel().getSelectedItem();
        Player selectedPlayer = playerComboBox.getValue();
        Player selectedKiller = killerComboBox.getValue();
        if (selectedRound == null || selectedPlayer == null) return;

        try {
            IndividualStatistic stat = new IndividualStatistic();
            stat.setRound(selectedRound);
            stat.setPlayer(selectedPlayer);
            stat.setKills(Integer.parseInt(killsField.getText()));
            stat.setAssists(Integer.parseInt(assistsField.getText()));
            stat.setDamage(Integer.parseInt(damageField.getText()));
            stat.setHeadshots(Integer.parseInt(hsField.getText()));
            stat.setFlashAssists(Integer.parseInt(flashField.getText()));
            stat.setDied(diedCheckBox.isSelected());
            stat.setKilledBy(selectedKiller);

            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    statisticService.save(stat);
                    return null;
                }
            };
            task.setOnSucceeded(e -> loadPlayerStats(selectedRound.getId()));
            task.setOnFailed(e -> showAlertError("Save Error", task.getException().getMessage()));
            new Thread(task).start();
        } catch (NumberFormatException e) {
            showAlertError("Error", "Stats must be numeric");
        }
    }

    @FXML
    private void handleClose() {
        Stage stage = (Stage) matchTitleLabel.getScene().getWindow();
        stage.close();
    }

    @FXML
    private void onExportStats() {
        Round selectedRound = roundComboBox.getSelectionModel().getSelectedItem();
        if (selectedRound == null) {
            showAlertError("Export Failed", "Please select a round to export stats.");
            return;
        }

        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Export Round Statistics");
        fileChooser.setInitialFileName("match_" + currentMatch.getId() + "_round_" + selectedRound.getRoundNumber() + ".csv");
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("CSV Files", "*.csv"));
        
        File file = fileChooser.showSaveDialog(matchTitleLabel.getScene().getWindow());
        if (file != null) {
            Task<Void> exportTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    List<String> headers = Arrays.asList("Player", "Kills", "Assists", "Damage", "Headshots", "Flash Assists", "Died", "Killed By");
                    CsvExportUtil.exportToCsv(
                        playerStats.stream(),
                        headers,
                        stat -> Arrays.asList(
                            stat.getPlayer().getNickname(),
                            String.valueOf(stat.getKills()),
                            String.valueOf(stat.getAssists()),
                            String.valueOf(stat.getDamage()),
                            String.valueOf(stat.getHeadshots()),
                            String.valueOf(stat.getFlashAssists()),
                            stat.getDied() ? "Yes" : "No",
                            stat.getKilledBy() != null ? stat.getKilledBy().getNickname() : "-"
                        ),
                        file
                    );
                    return null;
                }
            };
            exportTask.setOnSucceeded(e -> showAlertInfo("Export Success", "Statistics exported to " + file.getName()));
            exportTask.setOnFailed(e -> showAlertError("Export Failed", exportTask.getException().getMessage()));
            new Thread(exportTask).start();
        }
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
