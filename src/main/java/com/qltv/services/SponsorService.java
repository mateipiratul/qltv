package com.qltv.services;

import com.qltv.dao.logistics.SponsorDAO;
import com.qltv.models.logistics.Sponsor;
import com.qltv.util.ValidationUtil;
import java.util.List;

public class SponsorService extends BaseService<Sponsor, SponsorDAO> {

    public SponsorService() {
        super(new SponsorDAO());
    }

    @Override
    public void save(Sponsor sponsor) {
        com.qltv.util.ValidationUtil.validateSponsorName(sponsor.getName());
        com.qltv.util.ValidationUtil.validateIndustry(sponsor.getIndustry());
        com.qltv.util.ValidationUtil.validateWebsite(sponsor.getWebsite());
        
        boolean isNew = sponsor.getId() == null;
        super.save(sponsor);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Sponsor", sponsor.getName());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(s -> {
            super.delete(id);
            AuditService.getInstance().logAction("DELETE", "Sponsor", s.getName());
        });
    }
}
