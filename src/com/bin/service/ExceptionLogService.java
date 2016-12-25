package com.bin.service;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.dao.ExceptionLogDao;
import com.bin.model.ExceptionLog;

@Repository
public class ExceptionLogService extends BaseService<ExceptionLog, Integer>{

	@Autowired
	private ExceptionLogDao exceptionDao;
	
	@Override
	public Integer save(ExceptionLog log) {
		//此处需要重新开启一个新的session，不然则会沿用先前的事务，而先前事务由于发生异常产生回滚，所以会导致异常数据无法插入
		Session session = null;
		Integer id = null;
		try{
			session  = exceptionDao.getSession().getSessionFactory().openSession();
			Transaction transaction = session.getTransaction();
			transaction.begin();
			id = (Integer) session.save(log);
			transaction.commit();
		}finally {
			if(session != null){
				session.close();
			}
		}
		return id;
	}
}
