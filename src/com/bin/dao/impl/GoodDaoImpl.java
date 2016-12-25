package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.GoodDao;
import com.bin.model.Good;

@Repository
public class GoodDaoImpl extends BaseDaoImpl<Good, Integer> implements GoodDao{

}
