package com.bin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.dao.BrandDao;
import com.bin.model.Brand;
import com.bin.util.Page;

@Repository
public class BrandSerivce extends BaseService<Brand, Integer>{

	@Autowired
	private BrandDao brandDao;
	
	public Page queryPage(Page page) {
		StringBuilder hql = new StringBuilder("from Brand where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(page.getParams().get("id") != null){
			hql.append(" and id = ?");
			params.add(Integer.valueOf(page.getParams().get("id").toString()));
		}
		Page page2 = new Page();
		page2.setRows(brandDao.getPageResult(hql.toString(), page.getPage(), page.getPageSize(), params.toArray()));
		page2.setPage(page.getPage());
		page2.setPageSize(page.getPageSize());
		page2.setTotal(brandDao.getCount(hql.toString(), params.toArray()));
		return page2;
	}

}
