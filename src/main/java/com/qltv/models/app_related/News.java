package com.qltv.models.app_related;

import com.qltv.util.ValidationUtil;
import java.time.LocalDate;
import java.util.Objects;

public class News {
    private Integer id;
    private String title;
    private String content;
    private String imageUrl;
    private LocalDate postDate;

    public News(Integer id) {
        this.id = id;
    }

    public News(Integer id, String title, String content, String imageUrl, LocalDate postDate) {
        this.id = id;
        setTitle(title);
        setContent(content);
        setImageUrl(imageUrl);
        this.postDate = postDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        String sanitizedTitle = ValidationUtil.sanitizeInput(title);
        ValidationUtil.validateNewsTitle(sanitizedTitle);
        this.title = sanitizedTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = ValidationUtil.sanitizeInput(content);
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        String sanitizedUrl = ValidationUtil.sanitizeInput(imageUrl);
        if (sanitizedUrl.length() > 255) {
            throw new IllegalArgumentException("Image URL cannot exceed 255 characters.");
        }
        this.imageUrl = sanitizedUrl;
    }

    public LocalDate getPostDate() {
        return postDate;
    }

    public void setPostDate(LocalDate postDate) {
        this.postDate = postDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof News news)) return false;
        return Objects.equals(id, news.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return title;
    }
}
