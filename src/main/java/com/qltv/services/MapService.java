package com.qltv.services;

import com.qltv.dao.in_game.MapsDAO;
import com.qltv.models.in_game.Map;

public class MapService extends BaseService<Map, MapsDAO> {
    public MapService() {
        super(new MapsDAO());
    }
}
