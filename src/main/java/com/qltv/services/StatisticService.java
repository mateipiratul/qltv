package com.qltv.services;

import com.qltv.dao.in_game.StatisticDAO;
import com.qltv.models.in_game.IndividualStatistic;
import java.util.List;

public class StatisticService extends BaseService<IndividualStatistic, StatisticDAO> {
    public StatisticService() {
        super(new StatisticDAO());
    }

    public List<IndividualStatistic> getByRound(int roundId) {
        return dao.getByRound(roundId);
    }
}
