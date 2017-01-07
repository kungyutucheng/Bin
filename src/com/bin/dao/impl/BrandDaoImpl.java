package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.BrandDao;
import com.bin.model.Brand;

@Repository
public class BrandDaoImpl extends BaseDaoImpl<Brand, Integer> implements BrandDao{

}
