package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.ExceptionLogDao;
import com.bin.model.ExceptionLog;

@Repository
public class ExceptionLogDaoImpl extends BaseDaoImpl<ExceptionLog, Integer> implements ExceptionLogDao{

}
