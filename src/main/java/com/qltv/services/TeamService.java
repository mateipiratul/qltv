package com.qltv.services;

import com.qltv.dao.personnel.TeamDAO;
import com.qltv.models.personnel.Team;

import java.util.List;
import java.util.TreeSet;
import java.util.stream.Stream;

public class TeamService extends BaseService<Team, TeamDAO> {

    public TeamService() {
        super(new TeamDAO());
    }

    @Override
    public void save(Team team) {
        com.qltv.util.ValidationUtil.validateTeamName(team.getName());
        com.qltv.util.ValidationUtil.validateTeamTag(team.getTag());
        if (team.getRank() instanceof Team.Ranked(int rankValue)) {
            com.qltv.util.ValidationUtil.validateWorldRanking(rankValue);
        }
        
        boolean isNew = team.getId() == null;
        super.save(team);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Team", team.getName());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(team -> {
            super.delete(id);
            AuditService.getInstance().logAction("DELETE", "Team", team.getName());
        });
    }

    public List<Team> getTeamsSortedByRanking() {
        TreeSet<Team> sortedTeams = new TreeSet<>((t1, t2) -> {
            int r1 = (t1.getRank() instanceof Team.Ranked(int rankValue)) ? rankValue : Integer.MAX_VALUE;
            int r2 = (t2.getRank() instanceof Team.Ranked(int rankValue)) ? rankValue : Integer.MAX_VALUE;
            
            if (r1 != r2) {
                return Integer.compare(r1, r2);
            }
            // Tie-break by name
            return t1.getName().compareTo(t2.getName());
        });
        
        try (Stream<Team> stream = streamAll()) {
            stream.forEach(sortedTeams::add);
        }
        return sortedTeams.stream().toList();
    }
}
