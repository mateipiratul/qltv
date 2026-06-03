package com.qltv.util;

import com.qltv.dao.BaseDAO;

public class DatabaseWriter {
    private static DatabaseWriter instance;

    private DatabaseWriter() {}

    public static synchronized DatabaseWriter getInstance() {
        if (instance == null) {
            instance = new DatabaseWriter();
        }
        return instance;
    }

    public <T> void save(BaseDAO<T> dao, T entity) {
        dao.save(entity);
    }

    public <T> void update(BaseDAO<T> dao, T entity) {
        dao.update(entity);
    }

    public <T> void delete(BaseDAO<T> dao, int id) {
        dao.delete(id);
    }
}
