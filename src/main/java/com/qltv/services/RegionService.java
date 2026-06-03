package com.qltv.services;

import com.qltv.dao.logistics.RegionDAO;
import com.qltv.models.logistics.Region;

public class RegionService extends BaseService<Region, RegionDAO> {
    public RegionService() {
        super(new RegionDAO());
    }
}
