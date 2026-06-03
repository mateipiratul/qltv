package com.qltv.services;

import com.qltv.dao.app_related.NewsDAO;
import com.qltv.models.app_related.News;
import java.util.List;

public class NewsService extends BaseService<News, NewsDAO> {

    public NewsService() {
        super(new NewsDAO());
    }

    @Override
    public void save(News news) {
        com.qltv.util.ValidationUtil.validateNotNull(news.getTitle(), "News title");
        com.qltv.util.ValidationUtil.validateNotNull(news.getContent(), "News content");
        
        boolean isNew = news.getId() == null;
        super.save(news);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "News", news.getTitle());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(n -> {
            super.delete(id);
            AuditService.getInstance().logAction("DELETE", "News", n.getTitle());
        });
    }
}
