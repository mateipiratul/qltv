package com.qltv.services;

import com.qltv.dao.personnel.ContractDAO;
import com.qltv.models.personnel.Contract;
import java.time.LocalDate;
import java.util.List;

public class ContractService extends BaseService<Contract, ContractDAO> {
    public ContractService() {
        super(new ContractDAO());
    }

    public List<Contract> getByMember(int memberId) {
        return dao.getByMember(memberId);
    }

    public List<Contract> getByTeam(int teamId) {
        return dao.getByTeam(teamId);
    }


    @Override
    public void save(Contract contract) {
        if (contract.getEndDate() != null && contract.getEndDate().isBefore(contract.getStartDate())) {
            throw new IllegalArgumentException("End date cannot be before start date.");
        }

        validateOverlaps(contract);

        boolean isNew = contract.getId() == null;
        super.save(contract);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Contract", "Member ID: " + contract.getMember().getId());
    }

    private void validateOverlaps(Contract contract) {
        List<Contract> existing = getByMember(contract.getMember().getId());
        for (Contract other : existing) {
            // skip the same contract if updating
            if (contract.getId() != null && contract.getId().equals(other.getId())) {
                continue;
            }

            LocalDate s1 = contract.getStartDate();
            LocalDate e1 = contract.getEndDate();
            LocalDate s2 = other.getStartDate();
            LocalDate e2 = other.getEndDate();

            // Overlap condition: (s1 <= e2 || e2 == null) && (s2 <= e1 || e1 == null)
            boolean overlap = (e2 == null || !s1.isAfter(e2)) && (e1 == null || !s2.isAfter(e1));

            if (overlap) {
                String error = String.format("Contract overlaps with an existing contract (%s to %s)", 
                        s2, (e2 == null ? "Present" : e2));
                throw new IllegalArgumentException(error);
            }
        }
    }
}
