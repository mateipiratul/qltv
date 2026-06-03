package com.qltv.services;

import com.qltv.dao.logistics.SponsorshipDAO;
import com.qltv.models.logistics.Sponsorship;
import java.util.List;

public class SponsorshipService extends BaseService<Sponsorship, SponsorshipDAO> {

    public SponsorshipService() {
        super(new SponsorshipDAO());
    }

    public List<Sponsorship> getByTeam(int teamId) {
        return dao.getByTeam(teamId);
    }

    @Override
    public void save(Sponsorship sponsorship) {
        if (sponsorship.getEndDate() != null && sponsorship.getEndDate().isBefore(sponsorship.getStartDate())) {
            throw new IllegalArgumentException("End date cannot be before start date");
        }
        super.save(sponsorship);
        AuditService.getInstance().logAction("LINK_SPONSOR", "Team", "Team ID: " + sponsorship.getTeam().getId() + " - Sponsor: " + sponsorship.getSponsor().getName());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(s -> {
            super.delete(id);
            AuditService.getInstance().logAction("UNLINK_SPONSOR", "Team", "Team ID: " + s.getTeam().getId() + " - Sponsor: " + s.getSponsor().getName());
        });
    }
}
