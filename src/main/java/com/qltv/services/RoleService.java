package com.qltv.services;

import com.qltv.dao.in_game.RoleDAO;
import com.qltv.models.in_game.Role;

public class RoleService extends BaseService<Role, RoleDAO> {
    public RoleService() {
        super(new RoleDAO());
    }
}
