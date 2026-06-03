package com.qltv.services;

import com.qltv.dao.personnel.MemberDAO;
import com.qltv.models.personnel.Coach;
import com.qltv.models.personnel.Member;
import com.qltv.models.personnel.Player;
import java.util.List;
import java.util.stream.Stream;

public class MemberService extends BaseService<Member, MemberDAO> {

    public MemberService() {
        super(new MemberDAO());
    }

    @Override
    public void save(Member member) {
        if (member == null) throw new IllegalArgumentException("Member cannot be null");
        
        com.qltv.util.ValidationUtil.validateNickname(member.getNickname());
        com.qltv.util.ValidationUtil.validateMemberName(member.getFirstName(), "First name");
        com.qltv.util.ValidationUtil.validateMemberName(member.getLastName(), "Last name");

        // Ensure nickname uniqueness (allow update to keep same nickname)
        boolean conflict;
        try (Stream<Member> stream = streamAll()) {
            conflict = stream.anyMatch(m -> m.getNickname() != null
                            && m.getNickname().equalsIgnoreCase(member.getNickname())
                            && (member.getId() == null || !member.getId().equals(m.getId())));
        }
        
        if (conflict) {
            throw new IllegalArgumentException("Nickname already in use");
        }

        if (member instanceof Player p) {
            com.qltv.util.ValidationUtil.validateSensitivity(p.getSensitivity());
            com.qltv.util.ValidationUtil.validateNonNegativeNumber((double) (p.getMouseDpi() != null ? p.getMouseDpi() : 0), "Mouse DPI");
        } else if (member instanceof Coach c) {
            com.qltv.util.ValidationUtil.validateNonNegativeNumber(Double.valueOf(c.getYearsOfExperience()), "Years of experience");
        }

        boolean isNew = member.getId() == null;
        super.save(member);
        AuditService.getInstance().logAction(isNew ? "CREATE" : "UPDATE", "Member", member.getNickname());
    }

    @Override
    public void delete(int id) {
        dao.getById(id).ifPresent(m -> {
            super.delete(id);
            AuditService.getInstance().logAction("DELETE", "Member", m.getNickname());
        });
    }

    public List<Player> getAllPlayers() {
        try (Stream<Member> stream = streamAll()) {
            return stream
                    .filter(m -> m instanceof Player)
                    .map(m -> (Player) m)
                    .toList();
        }
    }

    public List<Coach> getAllCoaches() {
        try (Stream<Member> stream = streamAll()) {
            return stream
                    .filter(m -> m instanceof Coach)
                    .map(m -> (Coach) m)
                    .toList();
        }
    }

    public List<Player> getPlayersByTeam(int teamId) {
        return dao.getPlayersByTeam(teamId);
    }
}
