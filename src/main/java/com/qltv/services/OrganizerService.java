package com.qltv.services;

import com.qltv.dao.logistics.OrganizerDAO;
import com.qltv.models.logistics.Organizer;
import com.qltv.util.ValidationUtil;
import java.util.List;

public class OrganizerService extends BaseService<Organizer, OrganizerDAO> {

    public OrganizerService() {
        super(new OrganizerDAO());
    }

    @Override
    public void save(Organizer organizer) {
        com.qltv.util.ValidationUtil.validateOrganizerName(organizer.getName());
        com.qltv.util.ValidationUtil.validateWebsite(organizer.getWebsite());
        if (organizer.getEmail() != null && !organizer.getEmail().isBlank()) {
            com.qltv.util.ValidationUtil.validateEmail(organizer.getEmail(), 50);
        }
        
        boolean isNew = organizer.getId() == null;
        super.save(organizer);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Organizer", organizer.getName());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(o -> {
            super.delete(id);
            AuditService.getInstance().logAction("DELETE", "Organizer", o.getName());
        });
    }
}
