package com.bin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.dao.ReturnAndChangeDao;
import com.bin.model.ReturnAndChange;
import com.bin.util.Page;

@Repository
public class ReturnAndChangeService extends BaseService<ReturnAndChange, Integer>{

	public static final Integer PAGE_SIZE = 10;
	
	@Autowired
	private ReturnAndChangeDao returnAndChangeDao;
	
	public Page queryPage(Page page , Integer pageNo){
		StringBuilder hql = new StringBuilder();
		hql.append("from ReturnAndChange where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(page.getParams().get("no") != null){
			params.add(page.getParams().get("no"));
			hql.append(" and no = ?");
		}
		if(page.getParams().get("status") != null && 
				Integer.valueOf(page.getParams().get("status").toString()) != 0){
			params.add(Integer.valueOf(page.getParams().get("status").toString()));
			hql.append(" and status = ?");
		}
		hql.append(" order by applyTime desc");
		Page page2 = new Page();
		page2.setRows(returnAndChangeDao.getPageResult(hql.toString(), pageNo, PAGE_SIZE, params.toArray()));
		page2.setTotal(returnAndChangeDao.getCount(hql.toString(), params.toArray()));
		return page2;
	}
}
