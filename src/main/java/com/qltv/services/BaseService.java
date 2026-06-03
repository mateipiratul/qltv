package com.qltv.services;

import com.qltv.dao.BaseDAO;
import com.qltv.util.DatabaseReader;
import com.qltv.util.DatabaseWriter;

import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public abstract class BaseService<T, D extends BaseDAO<T>> {

    protected final D dao;

    public BaseService(D dao) {
        this.dao = dao;
    }

    public List<T> getAll() {
        return DatabaseReader.getInstance().readAll(dao);
    }

    public Stream<T> streamAll() {
        return DatabaseReader.getInstance().streamAll(dao);
    }

    public Optional<T> getById(int id) {

        return DatabaseReader.getInstance().readById(dao, id);
    }

    public void save(T entity) {
        DatabaseWriter.getInstance().save(dao, entity);
    }

    public void update(T entity) {
        DatabaseWriter.getInstance().update(dao, entity);
    }

    public void delete(int id) {
        DatabaseWriter.getInstance().delete(dao, id);
    }
}
