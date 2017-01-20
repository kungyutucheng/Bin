package com.bin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.context.UserContext;
import com.bin.dao.AddressDao;
import com.bin.model.Address;

@Repository
public class AddressService extends BaseService<Address, Integer>{

	@Autowired
	private AddressDao addressDao;
	
	public void batchDelete(Integer id) {
		StringBuilder hql = new StringBuilder();
		hql.append("update Address set disable = 2 where id = ?");
		addressDao.execute(hql.toString(), id);
	}

	public void setDeafult(Integer id) {
		StringBuilder hql = new StringBuilder("update Address set isDefault = 1 where uid = ?");
		addressDao.execute(hql.toString(), UserContext.getContext().getUser().getId());
		hql = new StringBuilder("update Address set isDefault = 2 where id = ?");
		addressDao.execute(hql.toString(), id);
	}

	
}
