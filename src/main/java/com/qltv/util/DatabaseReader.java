package com.qltv.util;

import com.qltv.dao.BaseDAO;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

public class DatabaseReader {
    private static DatabaseReader instance;

    private DatabaseReader() {}

    public static synchronized DatabaseReader getInstance() {
        if (instance == null) {
            instance = new DatabaseReader();
        }
        return instance;
    }

    public <T> List<T> readAll(BaseDAO<T> dao) {
        return dao.getAll();
    }

    public <T> Stream<T> streamAll(BaseDAO<T> dao) {
        return dao.streamAll();
    }

    public <T> Optional<T> readById(BaseDAO<T> dao, int id) {
        return dao.getById(id);
    }
}
