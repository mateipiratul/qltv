package com.qltv.services;

import com.qltv.dao.in_game.RoundDAO;
import com.qltv.models.in_game.Round;
import java.util.List;

public class RoundService extends BaseService<Round, RoundDAO> {
    public RoundService() {
        super(new RoundDAO());
    }

    public List<Round> getByMapInstance(int instanceId) {
        return dao.getByMapInstance(instanceId);
    }
}
