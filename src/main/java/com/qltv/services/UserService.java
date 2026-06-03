package com.qltv.services;

import com.qltv.dao.app_related.UserDAO;
import com.qltv.models.app_related.User;
import com.qltv.models.personnel.Team;
import com.qltv.models.personnel.Member;
import java.util.List;
import java.util.stream.Stream;

public class UserService extends BaseService<User, UserDAO> {

    private final AuthService authService = new AuthService();

    public UserService() {
        super(new UserDAO());
    }

    public void updateProfile(int userId, String profilePicUrl, com.qltv.models.logistics.Country nationality) {
        User user = dao.getById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
        user.setProfilePictureUrl(profilePicUrl);
        user.setNationality(nationality);
        dao.update(user);
        AuditService.getInstance().logAction("UPDATE_PROFILE", "User", user.getUsername());
    }

    public void updatePassword(int userId, String oldPassword, String newPassword, String confirmPassword) {
        User user = dao.getById(userId).orElseThrow(() -> new IllegalArgumentException("User not found"));
        
        if (!user.getPasswordHash().equals(authService.hashPassword(oldPassword))) {
            throw new IllegalArgumentException("Current password is incorrect");
        }

        com.qltv.util.ValidationUtil.validatePasswordStrength(newPassword);
        if (!newPassword.equals(confirmPassword)) {
            throw new IllegalArgumentException("New passwords do not match");
        }

        user.setPasswordHash(authService.hashPassword(newPassword));
        dao.update(user);
        AuditService.getInstance().logAction("CHANGE_PASSWORD", "User", user.getUsername());
    }

    public void toggleFavoriteTeam(int userId, Team team) {
        if (dao.isTeamFavorited(userId, team.getId())) {
            dao.removeFavoriteTeam(userId, team.getId());
            AuditService.getInstance().logAction("UNFAVORITE", "Team", team.getName());
        } else {
            dao.addFavoriteTeam(userId, team.getId());
            AuditService.getInstance().logAction("FAVORITE", "Team", team.getName());
        }
    }

    public void toggleFavoriteMember(int userId, Member member) {
        if (dao.isMemberFavorited(userId, member.getId())) {
            dao.removeFavoriteMember(userId, member.getId());
            AuditService.getInstance().logAction("UNFAVORITE", "Member", member.getNickname());
        } else {
            dao.addFavoriteMember(userId, member.getId());
            AuditService.getInstance().logAction("FAVORITE", "Member", member.getNickname());
        }
    }

    public boolean isTeamFavorited(int userId, int teamId) {
        return dao.isTeamFavorited(userId, teamId);
    }

    public boolean isMemberFavorited(int userId, int memberId) {
        return dao.isMemberFavorited(userId, memberId);
    }

    public List<Team> getFavoriteTeams(int userId) {
        try (Stream<Team> stream = dao.streamFavoriteTeams(userId)) {
            return stream.toList();
        }
    }

    public List<Member> getFavoriteMembers(int userId) {
        try (Stream<Member> stream = dao.streamFavoriteMembers(userId)) {
            return stream.toList();
        }
    }
}
