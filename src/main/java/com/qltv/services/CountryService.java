package com.qltv.services;

import com.qltv.dao.logistics.CountryDAO;
import com.qltv.models.logistics.Country;

public class CountryService extends BaseService<Country, CountryDAO> {
    public CountryService() {
        super(new CountryDAO());
    }
}
