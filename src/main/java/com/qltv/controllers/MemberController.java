package com.qltv.controllers;

import com.qltv.models.personnel.Member;
import com.qltv.models.personnel.Player;
import com.qltv.models.personnel.Coach;
import com.qltv.models.logistics.Country;
import com.qltv.services.MemberService;
import com.qltv.services.CountryService;
import com.qltv.services.UserService;
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
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.util.StringConverter;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.HashSet;
import java.util.Set;

public class MemberController {

    @FXML private TableView<Member> memberTable;
    @FXML private TableColumn<Member, Void> colFavorite;
    @FXML private TableColumn<Member, String> colNickname;
    @FXML private TableColumn<Member, String> colFullName;
    @FXML private TableColumn<Member, String> colType;

    @FXML private TextField searchField;
    @FXML private ComboBox<String> typeFilter;
    @FXML private Button addButton;
    @FXML private Button editButton;
    @FXML private Button deleteButton;

    @FXML private StackPane dynamicContentArea;
    @FXML private Pagination pagination;

    private final MemberService memberService = new MemberService();
    private final CountryService countryService = new CountryService();
    private final UserService userService = new UserService();
    private final ObservableList<Member> memberList = FXCollections.observableArrayList();
    private FilteredList<Member> filteredData;
    private SortedList<Member> sortedData;
    private final ObservableList<Member> currentPageList = FXCollections.observableArrayList();
    private static final int ROWS_PER_PAGE = 20;

    private final Set<Integer> favoriteMemberIds = new HashSet<>();

    @FXML
    public void initialize() {
        // RBAC Check
        boolean isAdmin = SessionManager.getInstance().isAdmin();
        addButton.setVisible(isAdmin);
        addButton.setManaged(isAdmin);
        editButton.setVisible(isAdmin);
        editButton.setManaged(isAdmin);
        deleteButton.setVisible(isAdmin);
        deleteButton.setManaged(isAdmin);

        // Data setup
        filteredData = new FilteredList<>(memberList, p -> true);
        sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(memberTable.comparatorProperty());
        memberTable.setItems(currentPageList);

        // pagination and filtering
        filteredData.addListener((ListChangeListener<Member>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<Member>) c -> updatePagination());
        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateTablePage(newVal.intValue()));

        // search field updates predicate
        searchField.textProperty().addListener((observable, oldValue, newValue) -> filteredData.setPredicate(this::matchesFilter));

        // Column Mappings
        setupFavoriteColumn();
        colNickname.setCellValueFactory(new javafx.scene.control.cell.PropertyValueFactory<>("nickname"));
        colFullName.setCellValueFactory(cellData -> 
            new SimpleStringProperty(cellData.getValue().getFirstName() + " " + cellData.getValue().getLastName())
        );
        colType.setCellValueFactory(cellData -> 
            new SimpleStringProperty(cellData.getValue() instanceof Player ? "Player" : "Coach")
        );

        // Setup type filter
        typeFilter.setItems(FXCollections.observableArrayList("All", "Players", "Coaches"));
        typeFilter.setValue("All");
        typeFilter.valueProperty().addListener((obs, old, newVal) -> filteredData.setPredicate(this::matchesFilter));

        // Selection Listener
        memberTable.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null) {
                loadMemberDetailView(newVal);
            }
        });

        // Disable buttons when no row is selected
        editButton.disableProperty().bind(memberTable.getSelectionModel().selectedItemProperty().isNull());
        deleteButton.disableProperty().bind(memberTable.getSelectionModel().selectedItemProperty().isNull());

        loadMembers();
    }

    private void setupFavoriteColumn() {
        colFavorite.setCellFactory(param -> new TableCell<>() {
            private final Button btn = new Button();
            {
                btn.getStyleClass().add("text-button");
                btn.setStyle("-fx-font-size: 14px; -fx-padding: 0;");
                btn.setOnAction(event -> {
                    Member member = getTableView().getItems().get(getIndex());
                    toggleFavorite(member);
                });
            }

            @Override
            protected void updateItem(Void item, boolean empty) {
                super.updateItem(item, empty);
                if (empty) {
                    setGraphic(null);
                } else {
                    Member member = getTableView().getItems().get(getIndex());
                    if (favoriteMemberIds.contains(member.getId())) {
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

    private void toggleFavorite(Member member) {
        int userId = SessionManager.getInstance().getCurrentUser().getId();
        Task<Void> task = new Task<>() {
            @Override
            protected Void call() throws Exception {
                userService.toggleFavoriteMember(userId, member);
                return null;
            }
        };
        task.setOnSucceeded(e -> {
            if (favoriteMemberIds.contains(member.getId())) {
                favoriteMemberIds.remove(member.getId());
            } else {
                favoriteMemberIds.add(member.getId());
            }
            memberTable.refresh();
        });
        new Thread(task).start();
    }

    private void loadMembers() {
        ProgressIndicator pi = new ProgressIndicator();
        memberTable.setPlaceholder(pi);

        Task<List<Member>> task = new Task<>() {
            @Override
            protected List<Member> call() throws Exception {
                // Load favorites first
                int userId = SessionManager.getInstance().getCurrentUser().getId();
                List<Member> favs = userService.getFavoriteMembers(userId);
                favoriteMemberIds.clear();
                favs.forEach(m -> favoriteMemberIds.add(m.getId()));

                return memberService.getAll();
            }
        };

        task.setOnSucceeded(e -> {
            memberList.setAll(task.getValue());
            memberTable.setPlaceholder(new Label("No members found."));
            updatePagination();
        });

        task.setOnFailed(e -> {
            memberTable.setPlaceholder(new Label("Failed to load members."));
            showAlertError("Error", task.getException().getMessage());
        });

        new Thread(task).start();
    }

    @FXML
    private void onRefresh() {
        loadMembers();
    }

    @FXML
    private void onAddMember() {
        showMemberDialog(null);
    }

    @FXML
    private void onEditMember() {
        Member selected = memberTable.getSelectionModel().getSelectedItem();
        if (selected != null) {
            showMemberDialog(selected);
        }
    }

    @FXML
    private void onDeleteMember() {
        Member selected = memberTable.getSelectionModel().getSelectedItem();
        if (selected == null) return;

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Delete Member");
        confirm.setHeaderText("Delete " + selected.toString() + "?");
        confirm.setContentText("This action cannot be undone.");
        
        confirm.showAndWait().ifPresent(btn -> {
            if (btn == ButtonType.OK) {
                Task<Void> task = new Task<>() {
                    @Override
                    protected Void call() throws Exception {
                        memberService.delete(selected.getId());
                        return null;
                    }
                };
                task.setOnSucceeded(e -> {
                    showAlertInfo("Success", "Member deleted.");
                    loadMembers();
                });
                task.setOnFailed(e -> showAlertError("Error", task.getException().getMessage()));
                new Thread(task).start();
            }
        });
    }

    private void showMemberDialog(Member member) {
        Dialog<Member> dialog = new Dialog<>();
        dialog.setTitle(member == null ? "Add Member" : "Edit Member");
        ButtonType saveBtn = new ButtonType("Save", ButtonBar.ButtonData.OK_DONE);
        dialog.getDialogPane().getButtonTypes().addAll(saveBtn, ButtonType.CANCEL);
        dialog.getDialogPane().setMinWidth(500);
        try { dialog.getDialogPane().getStylesheets().add(getClass().getResource("/css/style.css").toExternalForm()); } catch(Exception ignored) {}

        ComboBox<String> typeBox = new ComboBox<>(FXCollections.observableArrayList("Player", "Coach"));
        TextField firstField = new TextField();
        TextField lastField = new TextField();
        TextField nickField = new TextField();
        DatePicker birthPicker = new DatePicker();
        ComboBox<Country> countryBox = new ComboBox<>();
        TextField picUrlField = new TextField();

        // Load countries
        Task<List<Country>> countryTask = new Task<>() {
            @Override
            protected List<Country> call() throws Exception {
                return countryService.getAll();
            }
        };
        countryTask.setOnSucceeded(e -> countryBox.setItems(FXCollections.observableArrayList(countryTask.getValue())));
        new Thread(countryTask).start();

        countryBox.setConverter(new StringConverter<Country>() {
            @Override public String toString(Country c) { return c != null ? c.getName() : ""; }
            @Override public Country fromString(String s) { return null; }
        });

        if (member != null) {
            typeBox.setValue(member instanceof Player ? "Player" : "Coach");
            typeBox.setDisable(true); // Don't allow changing type once created
            firstField.setText(member.getFirstName());
            lastField.setText(member.getLastName());
            nickField.setText(member.getNickname());
            birthPicker.setValue(member.getBirthDate());
            countryBox.setValue(member.getCountry());
            picUrlField.setText(member.getProfilePictureUrl());
        } else {
            typeBox.setValue("Player");
        }

        GridPane grid = new GridPane();
        grid.setHgap(10); grid.setVgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));
        
        javafx.scene.layout.ColumnConstraints labelCol = new javafx.scene.layout.ColumnConstraints();
        labelCol.setMinWidth(120);
        grid.getColumnConstraints().add(labelCol);

        grid.add(new Label("Type:"), 0, 0); grid.add(typeBox, 1, 0);
        grid.add(new Label("First Name:"), 0, 1); grid.add(firstField, 1, 1);
        grid.add(new Label("Last Name:"), 0, 2); grid.add(lastField, 1, 2);
        grid.add(new Label("Nickname:"), 0, 3); grid.add(nickField, 1, 3);
        grid.add(new Label("Birth Date:"), 0, 4); grid.add(birthPicker, 1, 4);
        grid.add(new Label("Nationality:"), 0, 5); grid.add(countryBox, 1, 5);
        grid.add(new Label("Profile Pic URL:"), 0, 6); grid.add(picUrlField, 1, 6);

        dialog.getDialogPane().setContent(grid);

        dialog.setResultConverter(btn -> {
            if (btn == saveBtn) {
                Member m = ("Player".equals(typeBox.getValue())) ? 
                    new Player(member == null ? null : member.getId()) : 
                    new Coach(member == null ? null : member.getId());
                
                m.setFirstName(firstField.getText());
                m.setLastName(lastField.getText());
                m.setNickname(nickField.getText());
                m.setBirthDate(birthPicker.getValue());
                m.setCountry(countryBox.getValue());
                m.setProfilePictureUrl(picUrlField.getText());
                return m;
            }
            return null;
        });

        dialog.showAndWait().ifPresent(m -> {
            Task<Void> saveTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    memberService.save(m);
                    return null;
                }
            };
            saveTask.setOnSucceeded(e -> {
                showAlertInfo("Success", "Member saved.");
                loadMembers();
            });
            saveTask.setOnFailed(e -> showAlertError("Error", saveTask.getException().getMessage()));
            new Thread(saveTask).start();
        });
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

    private boolean matchesFilter(Member member) {
        if (member == null) return false;
        String search = searchField.getText();
        boolean matchesSearch = (search == null || search.isEmpty()) ||
                member.toString().toLowerCase().contains(search.toLowerCase());
        
        String type = typeFilter.getValue();
        if ("Players".equals(type)) return matchesSearch && member instanceof Player;
        if ("Coaches".equals(type)) return matchesSearch && member instanceof Coach;
        return matchesSearch;
    }

    private void loadMemberDetailView(Member member) {
        String fxmlPath = (member instanceof Coach) ? "/views/coach_details.fxml" : "/views/player_details.fxml";
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource(fxmlPath));
            Parent detailView = loader.load();
            if (member instanceof Player p) {
                PlayerDetailController controller = loader.getController();
                controller.setPlayerData(p);
            } else if (member instanceof Coach c) {
                CoachDetailController controller = loader.getController();
                controller.setCoachData(c);
            }
            dynamicContentArea.getChildren().setAll(detailView);
        } catch (IOException e) {
            e.printStackTrace();
            showAlertError("UI Error", "Could not load detail view.");
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
