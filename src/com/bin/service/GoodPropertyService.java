package com.bin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.dao.GoodDao;
import com.bin.dao.GoodPropertyDao;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.util.Page;

@Repository
public class GoodPropertyService extends BaseService<GoodProperty, Integer>{

	@Autowired
	private GoodPropertyDao goodPropertyDao;
	
	public Page queryPage(Page page){
		Page page2 = new Page();
		String hql = "from GoodProperty where 1=1";
		List<Object> params = new ArrayList<Object>();
		if(page.getParams().get("gid") != null){
			hql += " and gid = ?";
			params.add(Integer.valueOf(page.getParams().get("gid").toString()));
		}
		hql += " order by createTime desc";
		if(page.getParams().get("isShowAll") != null){
			page2.setRows(goodPropertyDao.queryList(hql, params.toArray()));
		}else{
			page2.setRows(goodPropertyDao.getPageResult(hql, page.getPage(), page.getPageSize(), params.toArray()));
		}
		page2.setTotal(goodPropertyDao.getCount(hql, params.toArray()));
		page2.setPageSize(page.getPageSize());
		page2.setPage(page.getPage());
		return page2;
	}
}
