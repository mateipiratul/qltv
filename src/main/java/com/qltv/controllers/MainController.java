package com.qltv.controllers;

import com.qltv.models.app_related.Comment;
import com.qltv.models.app_related.News;
import com.qltv.models.personnel.Team;
import com.qltv.models.personnel.Player;
import com.qltv.models.logistics.Tournament;
import com.qltv.models.logistics.Sponsor;
import com.qltv.models.in_game.Role;
import com.qltv.services.*;
import com.qltv.util.SessionManager;
import com.qltv.util.CsvExportUtil;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.chart.PieChart;
import javafx.stage.FileChooser;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Arrays;
import java.util.stream.Collectors;

public class MainController {

    @FXML private VBox newsContainer;
    @FXML private Button postNewsButton;
    @FXML private Button exportAuditButton;
    @FXML private Pagination pagination;

    // Statistics / Charts - Matching fx:id in main.fxml
    @FXML private Label teamsCountLabel;
    @FXML private Label playersCountLabel;
    @FXML private Label tournamentsCountLabel;
    @FXML private Label sponsorsCountLabel;
    @FXML private ListView<String> topTeamsListView;
    @FXML private PieChart roleChart;

    private final NewsService newsService = new NewsService();
    private final CommentService commentService = new CommentService();
    private final AuditService auditService = AuditService.getInstance();

    private final ObservableList<News> newsList = FXCollections.observableArrayList();
    private FilteredList<News> filteredData;
    private SortedList<News> sortedData;
    private static final int ROWS_PER_PAGE = 20;

    @FXML
    public void initialize() {
        filteredData = new FilteredList<>(newsList, p -> true);
        sortedData = new SortedList<>(filteredData);
        // Default sort news by date desc
        sortedData.setComparator((n1, n2) -> n2.getPostDate().compareTo(n1.getPostDate()));

        // update pagination when the filtered/sorted data changes
        filteredData.addListener((ListChangeListener<News>) c -> updatePagination());
        sortedData.addListener((ListChangeListener<News>) c -> updatePagination());

        pagination.currentPageIndexProperty().addListener((obs, oldVal, newVal) -> updateNewsPage(newVal.intValue()));

        // RBAC: Only admins can post news and export audit log
        boolean isAdmin = SessionManager.getInstance().isAdmin();
        postNewsButton.setVisible(isAdmin);
        postNewsButton.setManaged(isAdmin);
        exportAuditButton.setVisible(isAdmin);
        exportAuditButton.setManaged(isAdmin);

        loadNewsFeed();
        loadDashboardStatistics();
    }

    private void loadNewsFeed() {
        newsContainer.getChildren().clear();
        ProgressIndicator pi = new ProgressIndicator();
        newsContainer.getChildren().add(pi);

        Task<List<News>> task = new Task<>() {
            @Override
            protected List<News> call() throws Exception {
                return newsService.getAll();
            }
        };

        task.setOnSucceeded(e -> {
            newsList.setAll(task.getValue());
            updatePagination();
        });

        task.setOnFailed(e -> {
            newsContainer.getChildren().clear();
            newsContainer.getChildren().add(new Label("Failed to load news feed."));
        });

        new Thread(task).start();
    }

    private void loadDashboardStatistics() {
        Task<DashboardStats> task = new Task<>() {
            @Override
            protected DashboardStats call() throws Exception {
                TeamService ts = new TeamService();
                MemberService ms = new MemberService();
                TournamentService tourService = new TournamentService();
                SponsorService ss = new SponsorService();

                List<Team> teams = ts.getAll();
                List<Player> players = ms.getAllPlayers();
                List<Tournament> tournaments = tourService.getAll();
                List<Sponsor> sponsors = ss.getAll();

                return new DashboardStats(teams, players, tournaments.size(), sponsors.size());
            }
        };

        task.setOnSucceeded(e -> {
            DashboardStats stats = task.getValue();
            if (stats == null) return;
            
            if (teamsCountLabel != null) teamsCountLabel.setText(String.valueOf(stats.teams.size()));
            if (playersCountLabel != null) playersCountLabel.setText(String.valueOf(stats.players.size()));
            if (tournamentsCountLabel != null) tournamentsCountLabel.setText(String.valueOf(stats.totalTournaments));
            if (sponsorsCountLabel != null) sponsorsCountLabel.setText(String.valueOf(stats.totalSponsors));

            // Populate Top 10 Teams
            if (stats.teams != null && topTeamsListView != null) {
                List<String> topTeamsList = stats.teams.stream()
                    .filter(t -> t.getRank() instanceof Team.Ranked)
                    .sorted((t1, t2) -> {
                        int r1 = ((Team.Ranked) t1.getRank()).rankValue();
                        int r2 = ((Team.Ranked) t2.getRank()).rankValue();
                        return Integer.compare(r1, r2);
                    })
                    .limit(10)
                    .map(t -> String.format("#%d - %s", ((Team.Ranked) t.getRank()).rankValue(), t.getName()))
                    .collect(Collectors.toList());
                topTeamsListView.getItems().setAll(topTeamsList);
            }

            // Update Role PieChart
            if (stats.players != null && roleChart != null) {
                roleChart.getData().clear();
                Map<Role, Long> roleCounts = stats.players.stream()
                    .filter(p -> p.getRole() != null)
                    .collect(Collectors.groupingBy(Player::getRole, Collectors.counting()));
                
                for (Map.Entry<Role, Long> entry : roleCounts.entrySet()) {
                    roleChart.getData().add(new PieChart.Data(entry.getKey().getName(), entry.getValue()));
                }
            }
        });

        task.setOnFailed(e -> {
            Throwable ex = task.getException();
            ex.printStackTrace();
            showAlertError("Dashboard Statistics Error", "Failed to load dashboard metrics: " + ex.getMessage());
        });

        new Thread(task).start();
    }

    private void updatePagination() {
        int total = sortedData == null ? 0 : sortedData.size();
        int pageCount = (int) Math.ceil((double) Math.max(total, 1) / ROWS_PER_PAGE);
        pagination.setPageCount(pageCount == 0 ? 1 : pageCount);
        int currentIndex = Math.min(pagination.getCurrentPageIndex(), Math.max(0, pageCount - 1));
        pagination.setCurrentPageIndex(currentIndex);
        updateNewsPage(currentIndex);
    }

    private void updateNewsPage(int pageIndex) {
        if (sortedData == null) return;
        newsContainer.getChildren().clear();
        
        int fromIndex = pageIndex * ROWS_PER_PAGE;
        int toIndex = Math.min(fromIndex + ROWS_PER_PAGE, sortedData.size());
        
        List<News> currentPage = sortedData.subList(fromIndex, toIndex);
        if (currentPage.isEmpty()) {
            newsContainer.getChildren().add(new Label("No news to display on this page."));
        } else {
            for (News news : currentPage) {
                newsContainer.getChildren().add(createNewsCard(news));
            }
        }
    }

    @FXML
    private void onRefresh() {
        loadNewsFeed();
        loadDashboardStatistics();
    }

    @FXML
    private void onPostNews() {
        Dialog<News> dialog = new Dialog<>();
        dialog.setTitle("Post New Announcement");
        dialog.setHeaderText("Create a news post for the community");

        ButtonType postBtnType = new ButtonType("Post", ButtonBar.ButtonData.OK_DONE);
        dialog.getDialogPane().getButtonTypes().addAll(postBtnType, ButtonType.CANCEL);

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(20, 20, 20, 20));

        TextField title = new TextField();
        title.setPromptText("Title");
        TextArea content = new TextArea();
        content.setPromptText("Content...");
        content.setWrapText(true);

        grid.add(new Label("Title:"), 0, 0);
        grid.add(title, 1, 0);
        grid.add(new Label("Content:"), 0, 1);
        grid.add(content, 1, 1);

        dialog.getDialogPane().setContent(grid);

        dialog.setResultConverter(dialogButton -> {
            if (dialogButton == postBtnType) {
                News n = new News(null);
                n.setTitle(title.getText());
                n.setContent(content.getText());
                n.setPostDate(java.time.LocalDate.now());
                return n;
            }
            return null;
        });

        Optional<News> result = dialog.showAndWait();
        result.ifPresent(news -> {
            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    newsService.save(news);
                    return null;
                }
            };
            task.setOnSucceeded(e -> loadNewsFeed());
            new Thread(task).start();
        });
    }

    @FXML
    private void onExportAuditLog() {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Export System Audit Log");
        fileChooser.setInitialFileName("audit_log_export_" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmm")) + ".csv");
        fileChooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("CSV Files", "*.csv"));
        
        File file = fileChooser.showSaveDialog(newsContainer.getScene().getWindow());
        if (file != null) {
            Task<Void> task = new Task<>() {
                @Override
                protected Void call() throws Exception {
                    List<String> headers = Arrays.asList("Timestamp", "Action", "Entity", "Details");
                    CsvExportUtil.exportToCsv(
                        auditService.getAuditLogStream(),
                        headers,
                        line -> Arrays.asList(line.split(",", 4)),
                        file
                    );
                    return null;
                }
            };
            task.setOnSucceeded(e -> showAlertInfo("Export Success", "Audit log exported to " + file.getName()));
            task.setOnFailed(e -> showAlertError("Export Failed", task.getException().getMessage()));
            new Thread(task).start();
        }
    }

    private VBox createNewsCard(News news) {
        VBox card = new VBox(15);
        card.getStyleClass().add("news-card");
        card.setPadding(new Insets(20));

        Label titleLabel = new Label(news.getTitle());
        titleLabel.getStyleClass().add("news-title");
        titleLabel.setWrapText(true);

        Label dateLabel = new Label(news.getPostDate().format(DateTimeFormatter.ofPattern("MMM dd, yyyy")));
        dateLabel.getStyleClass().add("news-date");

        Label contentLabel = new Label(news.getContent());
        contentLabel.getStyleClass().add("news-content");
        contentLabel.setWrapText(true);

        VBox commentsSection = new VBox(10);
        commentsSection.setPadding(new Insets(10, 0, 0, 20));
        
        Label commentsHeader = new Label("Discussion");
        commentsHeader.setStyle("-fx-font-weight: bold; -fx-text-fill: #3b82f6; -fx-font-size: 14px;");
        
        VBox threadContainer = new VBox(12);
        loadThread(news.getId(), threadContainer);

        // Quick Post Area for root comments
        HBox postArea = new HBox(10);
        postArea.setPadding(new Insets(10, 0, 0, 0));
        TextField commentInput = new TextField();
        commentInput.setPromptText("Write a comment...");
        HBox.setHgrow(commentInput, Priority.ALWAYS);
        Button postBtn = new Button("Post");
        postBtn.getStyleClass().add("primary-button");
        
        postBtn.setOnAction(e -> {
            String txt = commentInput.getText().trim();
            if (!txt.isEmpty()) {
                Comment c = new Comment(null);
                c.setNewsId(news.getId());
                c.setUser(SessionManager.getInstance().getCurrentUser());
                c.setContent(txt);
                c.setPostDate(LocalDateTime.now());
                
                Task<Void> saveTask = new Task<>() {
                    @Override
                    protected Void call() throws Exception {
                        commentService.save(c);
                        return null;
                    }
                };
                saveTask.setOnSucceeded(ev -> {
                    commentInput.clear();
                    loadThread(news.getId(), threadContainer);
                });
                new Thread(saveTask).start();
            }
        });
        postArea.getChildren().addAll(commentInput, postBtn);

        commentsSection.getChildren().addAll(new Separator(), commentsHeader, threadContainer, postArea);

        card.getChildren().addAll(titleLabel, dateLabel, contentLabel, commentsSection);
        return card;
    }

    private void loadThread(int newsId, VBox container) {
        container.getChildren().clear();
        ProgressIndicator pi = new ProgressIndicator();
        pi.setPrefSize(20, 20);
        container.getChildren().add(pi);

        Task<List<Comment>> task = new Task<>() {
            @Override
            protected List<Comment> call() throws Exception {
                return commentService.getThreadByNews(newsId);
            }
        };

        task.setOnSucceeded(e -> {
            container.getChildren().clear();
            List<Comment> roots = task.getValue();
            if (roots.isEmpty()) {
                Label emptyLabel = new Label("No comments yet. Be the first to start the discussion!");
                emptyLabel.setStyle("-fx-text-fill: #94a3b8; -fx-font-style: italic;");
                container.getChildren().add(emptyLabel);
            } else {
                displayCommentsRecursive(roots, container, 0);
            }
        });

        task.setOnFailed(e -> {
            container.getChildren().clear();
            container.getChildren().add(new Label("Failed to load comments."));
        });

        new Thread(task).start();
    }

    private void displayCommentsRecursive(List<Comment> comments, VBox container, int depth) {
        for (Comment comment : comments) {
            VBox commentBox = new VBox(5);
            // Indentation logic for threads
            commentBox.setPadding(new Insets(5, 0, 5, depth * 20));
            
            HBox header = new HBox(10);
            header.setAlignment(Pos.CENTER_LEFT);
            Label userLabel = new Label(comment.getUser().getUsername());
            userLabel.setStyle("-fx-font-weight: bold; -fx-text-fill: #1e293b;");
            Label dateLabel = new Label(comment.getPostDate().format(DateTimeFormatter.ofPattern("HH:mm, MMM dd")));
            dateLabel.setStyle("-fx-text-fill: #94a3b8; -fx-font-size: 10px;");
            
            // Requirement: Recursive Metric Display
            int replyCount = comment.getTotalReplyCount();
            Label replyCountLabel = new Label(replyCount > 0 ? "(" + replyCount + " total replies)" : "");
            replyCountLabel.setStyle("-fx-text-fill: #3b82f6; -fx-font-size: 10px; -fx-font-style: italic;");
            
            header.getChildren().addAll(userLabel, dateLabel, replyCountLabel);
            
            Label contentLabel = new Label(comment.getContent());
            contentLabel.setWrapText(true);
            contentLabel.setStyle("-fx-text-fill: #475569;");
            
            Button replyBtn = new Button("Reply");
            replyBtn.getStyleClass().add("text-button");
            replyBtn.setStyle("-fx-font-size: 11px; -fx-padding: 0;");
            
            // Inline reply logic
            replyBtn.setOnAction(e -> {
                // If a reply field already exists in this box, don't add another
                if (commentBox.getChildren().stream().anyMatch(n -> n instanceof TextField)) return;
                
                TextField replyInput = new TextField();
                replyInput.setPromptText("Reply to " + comment.getUser().getUsername() + "...");
                replyInput.setOnAction(ev -> {
                    String txt = replyInput.getText().trim();
                    if (!txt.isEmpty()) {
                        Comment reply = new Comment(null);
                        reply.setNewsId(comment.getNewsId());
                        reply.setUser(SessionManager.getInstance().getCurrentUser());
                        reply.setParentId(comment.getId());
                        reply.setContent(txt);
                        reply.setPostDate(LocalDateTime.now());
                        
                        Task<Void> saveTask = new Task<>() {
                            @Override
                            protected Void call() throws Exception {
                                commentService.save(reply);
                                return null;
                            }
                        };
                        saveTask.setOnSucceeded(res -> loadNewsFeed());
                        new Thread(saveTask).start();
                    }
                });
                commentBox.getChildren().add(replyInput);
                replyInput.requestFocus();
            });

            commentBox.getChildren().addAll(header, contentLabel, replyBtn);
            container.getChildren().add(commentBox);
            
            if (!comment.getReplies().isEmpty()) {
                displayCommentsRecursive(comment.getReplies(), container, depth + 1);
            }
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

    private static class DashboardStats {
        List<Team> teams;
        List<Player> players;
        int totalTournaments;
        int totalSponsors;

        DashboardStats(List<Team> teams, List<Player> players, int totalTournaments, int totalSponsors) {
            this.teams = teams;
            this.players = players;
            this.totalTournaments = totalTournaments;
            this.totalSponsors = totalSponsors;
        }
    }
}
