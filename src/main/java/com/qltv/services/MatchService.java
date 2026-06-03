package com.qltv.services;

import com.qltv.dao.in_game.MatchDAO;
import com.qltv.models.in_game.Match;
import com.qltv.models.personnel.Team;
import java.util.List;

public class MatchService extends BaseService<Match, MatchDAO> {

    public MatchService() {
        super(new MatchDAO());
    }

    @Override
    public void save(Match match) {
        com.qltv.util.ValidationUtil.validateNotNull(match.getTournament(), "Tournament");
        com.qltv.util.ValidationUtil.validateNotNull(match.getDate(), "Match date");
        com.qltv.util.ValidationUtil.validateStringLength(match.getFormat(), 3, 3, "Match format"); // BO1, BO3, BO5
        
        boolean isNew = match.getId() == null;
        super.save(match);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Match", "ID: " + match.getId());
    }

    @Override
    public void delete(int id) {
        super.delete(id);
        AuditService.getInstance().logAction("DELETE", "Match", "ID: " + id);
    }

    public List<Team> getTeamsInMatch(int matchId) {
        return dao.getTeamsInMatch(matchId);
    }

    public List<Match> getMatchesByTournament(int tournamentId) {
        return dao.getMatchesByTournament(tournamentId);
    }

    public List<Match> getMatchesByPlayer(int playerId) {
        return dao.getMatchesByPlayer(playerId);
    }
}
