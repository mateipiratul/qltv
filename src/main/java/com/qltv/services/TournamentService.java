package com.qltv.services;

import com.qltv.dao.logistics.TournamentDAO;
import com.qltv.models.logistics.Tournament;
import com.qltv.models.personnel.Team;
import java.util.List;
import java.util.stream.Stream;

public class TournamentService extends BaseService<Tournament, TournamentDAO> {

    public TournamentService() {
        super(new TournamentDAO());
    }

    @Override
    public void save(Tournament tournament) {
        com.qltv.util.ValidationUtil.validateTournamentName(tournament.getName());
        com.qltv.util.ValidationUtil.validateCity(tournament.getLocation());
        com.qltv.util.ValidationUtil.validateNonNegativeNumber(tournament.getTotalPrizeUsd(), "Prize pool");
        com.qltv.util.ValidationUtil.validateDateRange(tournament.getStartDate(), tournament.getEndDate());
        
        boolean isNew = tournament.getId() == null;
        super.save(tournament);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Tournament", tournament.getName());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(t -> {
            super.delete(id);
            AuditService.getInstance().logAction("DELETE", "Tournament", t.getName());
        });
    }

    public List<Team> getParticipatingTeams(int tournamentId) {
        return dao.getParticipatingTeams(tournamentId);
    }

    public List<Tournament> getTournamentsByCriteria(java.time.LocalDate start, java.time.LocalDate end, Double minPrize) {
        try (Stream<Tournament> stream = streamAll()) {
            return stream
                    .filter(t -> (start == null || !t.getStartDate().isBefore(start)))
                    .filter(t -> (end == null || (t.getEndDate() != null && !t.getEndDate().isAfter(end))))
                    .filter(t -> (minPrize == null || t.getTotalPrizeUsd() >= minPrize))
                    .sorted((t1, t2) -> Double.compare(t2.getTotalPrizeUsd(), t1.getTotalPrizeUsd())) // Sort by prize desc
                    .toList();
        }
    }
}
