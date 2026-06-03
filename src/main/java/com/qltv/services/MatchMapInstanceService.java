package com.qltv.services;

import com.qltv.dao.in_game.MatchMapInstanceDAO;
import com.qltv.models.in_game.MatchMapInstance;
import java.util.List;

public class MatchMapInstanceService extends BaseService<MatchMapInstance, MatchMapInstanceDAO> {
    public MatchMapInstanceService() {
        super(new MatchMapInstanceDAO());
    }

    public List<MatchMapInstance> getByMatch(int matchId) {
        return dao.getByMatch(matchId);
    }
}
