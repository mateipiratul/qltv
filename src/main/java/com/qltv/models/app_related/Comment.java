package com.qltv.models.app_related;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Comment {
    private Integer id;
    private Integer newsId;
    private User user;
    private Integer parentId;
    private String content;
    private LocalDateTime postDate;
    
    private List<Comment> replies = new ArrayList<>();

    public Comment(Integer id) {
        this.id = id;
    }

    public Comment(Integer id, Integer newsId, User user, Integer parentId, String content, LocalDateTime postDate) {
        this.id = id;
        this.newsId = newsId;
        this.user = user;
        this.parentId = parentId;
        this.content = content;
        this.postDate = postDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getPostDate() {
        return postDate;
    }

    public void setPostDate(LocalDateTime postDate) {
        this.postDate = postDate;
    }

    public List<Comment> getReplies() {
        return replies;
    }

    public void setReplies(List<Comment> replies) {
        this.replies = replies != null ? replies : new ArrayList<>();
    }

    public int getTotalReplyCount() {
        int count = replies.size();
        for (Comment reply : replies) {
            count += reply.getTotalReplyCount();
        }
        return count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Comment comment)) return false;
        return Objects.equals(id, comment.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return user.getUsername() + ": " + content;
    }
}
