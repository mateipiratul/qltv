package com.qltv.services;

import com.qltv.dao.app_related.CommentDAO;
import com.qltv.models.app_related.Comment;
import java.util.List;

public class CommentService extends BaseService<Comment, CommentDAO> {

    public CommentService() {
        super(new CommentDAO());
    }

    public List<Comment> getThreadByNews(int newsId) {
        return dao.getThreadByNews(newsId);
    }

    @Override
    public void save(Comment comment) {
        if (comment.getContent() == null || comment.getContent().trim().isEmpty()) {
            throw new IllegalArgumentException("Comment content cannot be empty");
        }
        super.save(comment);
        AuditService.getInstance().logAction("COMMENT", "News", "ID: " + comment.getNewsId());
    }
}
