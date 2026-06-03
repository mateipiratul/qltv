package com.qltv.controllers;

import com.qltv.models.logistics.Sponsor;
import com.qltv.services.SponsorService;
import com.qltv.util.SessionManager;
import javafx.application.Platform;
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

import java.util.List;
import java.util.Optional;

public class SponsorController {

    @FXML private TableView<Sponsor> sponsorTable;
    @FXML private TableColumn<Sponsor, String> colName;
    @FXML private TableColumn<Sponsor, String> colIndustry;
    @FXML private TableColumn<Sponsor, String> colWebsite;

    @FXML private VBox formContainer;
    @FXML private TextField nameField;
    @FXML private TextField industryField;
    @FXML private TextField websiteField;
    @FXML private TextField searchField;
    
    @FXML private Button addButton;
    @FXML private Button editButton;
    @FXML private Button deleteButton;
    @FXML private Pagination pagination;

    private final ObservableList<Sponsor> sponsorList = FXCollections.observableArrayList();
    private final SponsorService sponsorService = new SponsorService();
    
    private FilteredList<Sponsor> filteredData;
    private SortedList<Sponsor> sortedData;
    private final ObservableList<Sponsor> currentPageList = FXCollections.observableArrayList();
    private static final int ROWS_PER_PAGE = 20;

    @FXML
    public void initialize() {
        filteredData = new FilteredList<>(sponsorList, p -> true);
        sortedData = new SortedList<>(filteredData);
        sortedData.comparatorProperty().bind(sponsorTable.comparatorProperty());
        sponsorTable.setItems(currentPageList);

        // update pagination when the filtered/sorted data changes
        filteredData.addListener((ListChangeListener<Sponsor>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<Sponsor>) c -> updatePagination());

        // react to pagination page changes
        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateTablePage(newVal.intValue()));

        searchField.textProperty().addListener((observable, oldValue, newValue) -> {
            filteredData.setPredicate(s -> {
                if (newValue == null || newValue.isEmpty()) return true;
                String lower = newValue.toLowerCase();
                return s.getName().toLowerCase().contains(lower)
                    || (s.getIndustry() != null && s.getIndustry().toLowerCase().contains(lower));
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
        colName.setCellValueFactory(new PropertyValueFactory<>("name"));
        colIndustry.setCellValueFactory(new PropertyValueFactory<>("industry"));
        colWebsite.setCellValueFactory(new PropertyValueFactory<>("website"));

        // Selection Listener
        sponsorTable.getSelectionModel().selectedItemProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal != null && isAdmin) {
                populateFields(newVal);
            }
        });

        // Disable buttons when no row is selected
        editButton.disableProperty().bind(sponsorTable.getSelectionModel().selectedItemProperty().isNull());
        deleteButton.disableProperty().bind(sponsorTable.getSelectionModel().selectedItemProperty().isNull());

        loadSponsors();
    }

    private void loadSponsors() {
        ProgressIndicator progress = new ProgressIndicator();
        sponsorTable.setPlaceholder(progress);

        Task<List<Sponsor>> task = new Task<>() {
            @Override
            protected List<Sponsor> call() throws Exception {
                return sponsorService.getAll();
            }
        };

        task.setOnSucceeded(e -> {
            sponsorList.setAll(task.getValue());
            sponsorTable.setPlaceholder(new Label("No sponsors found"));
            updatePagination();
        });

        task.setOnFailed(e -> {
            sponsorTable.setPlaceholder(new Label("Failed to load sponsors"));
            showAlertError("Load failed", task.getException().getMessage());
        });

        new Thread(task).start();
    }

    @FXML
    private void onRefresh() {
        loadSponsors();
    }

    @FXML
    private void onEditSponsor() {
        Sponsor selected = sponsorTable.getSelectionModel().getSelectedItem();
        if (selected != null) {
            populateFields(selected);
        }
    }

    @FXML
    private void handleSave() {
        String name = nameField.getText();
        String industry = industryField.getText();
        String website = websiteField.getText();

        Sponsor selected = sponsorTable.getSelectionModel().getSelectedItem();
        Sponsor sToSave = (selected != null) ? selected : new Sponsor(null);
        
        sToSave.setName(name);
        sToSave.setIndustry(industry);
        sToSave.setWebsite(website);

        Task<Void> saveTask = new Task<>() {
            @Override
            protected Void call() throws Exception {
                sponsorService.save(sToSave);
                return null;
            }
        };

        saveTask.setOnSucceeded(e -> {
            loadSponsors();
            handleClear();
            showAlertInfo("Saved", "Sponsor saved successfully.");
        });

        saveTask.setOnFailed(e -> showAlertError("Save failed", saveTask.getException().getMessage()));

        new Thread(saveTask).start();
    }

    @FXML
    private void handleDelete() {
        Sponsor selected = sponsorTable.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showAlertError("Selection Required", "Please select a sponsor to remove.");
            return;
        }

        Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
        confirm.setTitle("Remove Sponsor");
        confirm.setHeaderText("Confirm removal");
        confirm.setContentText("Remove sponsor " + selected.getName() + "?");
        Optional<ButtonType> result = confirm.showAndWait();

        if (result.isPresent() && result.get() == ButtonType.OK) {
            Task<Void> deleteTask = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    sponsorService.delete(selected.getId());
                    return null;
                }
            };
            deleteTask.setOnSucceeded(e -> {
                loadSponsors();
                handleClear();
                showAlertInfo("Removed", "Sponsor removed successfully.");
            });
            deleteTask.setOnFailed(e -> showAlertError("Delete failed", deleteTask.getException().getMessage()));
            new Thread(deleteTask).start();
        }
    }

    @FXML
    private void handleClear() {
        nameField.clear();
        industryField.clear();
        websiteField.clear();
        sponsorTable.getSelectionModel().clearSelection();
    }

    private void populateFields(Sponsor s) {
        nameField.setText(s.getName());
        industryField.setText(s.getIndustry());
        websiteField.setText(s.getWebsite());
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
