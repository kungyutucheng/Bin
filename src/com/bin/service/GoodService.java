package com.bin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.dao.GoodDao;
import com.bin.model.Good;
import com.bin.util.Page;

@Repository
public class GoodService extends BaseService<Good, Integer>{
	
	@Autowired
	private GoodDao goodDao;
	
	public Page queryPage(Page page) {
		Page page2 = new Page();
		List<Object> params = new ArrayList<Object>();
		String hql = "from Good where 1= 1";
		if(page.getParams().get("id") != null){
			hql += " and id = ?";
			params.add(Integer.valueOf(page.getParams().get("id").toString()));
		}
		if(page.getParams().get("name") != null){
			hql += " and name like ?";
			params.add("%" + page.getParams().get("name") + "%");
		}
		if(page.getParams().get("no") != null){
			hql += " and no like ?";
			params.add("%" + page.getParams().get("no") + "%");
		}
		if(page.getParams().get("oid") != null){
			hql += " and oid = ?";
			params.add(Integer.valueOf(page.getParams().get("oid").toString()));
		}
		if(page.getParams().get("status") != null){
			hql += " and status = ?";
			params.add(Integer.valueOf(page.getParams().get("status").toString()));
		}
		if(page.getParams().get("msg") != null){
			hql += " and msg like ?";
			params.add("%" + page.getParams().get("msg") + "%");
		}
		if(page.getParams().get("soldNum") != null){
			hql += " and soldNum = ?";
			params.add(Integer.valueOf(page.getParams().get("soldNum").toString()));
		}
		if(page.getParams().get("brand") != null){
			hql += " and brand like ?";
			params.add("%" + page.getParams().get("brand") + "%");
		}
		if(page.getParams().get("scope") != null){
			hql += " and scope = ?";
			params.add(Integer.valueOf(page.getParams().get("scope").toString()));
		}
		if(page.getParams().get("type") != null){
			hql += " and type like ?";
			params.add("%" + page.getParams().get("type") + "%");
		}
		if(page.getParams().get("startCreateTime") != null){
			hql += " and createTime >= STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s')";
			params.add(page.getParams().get("startCreateTime"));
		}
		if(page.getParams().get("endCreateTime") != null){
			hql += " and createTime <= STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s')";
			params.add(page.getParams().get("endCreateTime"));
		}
		if(page.getParams().get("startRemoveTime") != null){
			hql += " and removeTime >= STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s')";
			params.add(page.getParams().get("startRemoveTime"));
		}
		if(page.getParams().get("endRemoveTime") != null){
			hql += " and removeTime >= STR_TO_DATE(?,'%Y-%m-%d %H:%i:%s')";
			params.add(page.getParams().get("endRemoveTime"));
		}
		if(page.getParams().get("startGrossWeight") != null){
			hql += " and grossWeight >= ?";
			params.add(Double.valueOf(page.getParams().get("startGrossWeight").toString()));
		}
		if(page.getParams().get("endGrossWeight") != null){
			hql += " and grossWeight <= ?";
			params.add(Double.valueOf(page.getParams().get("endGrossWeight").toString()));
		}
		if(page.getParams().get("startNetWeight") != null){
			hql += " and netWeight >= ?";
			params.add(Double.valueOf(page.getParams().get("startNetWeight").toString()));
		}
		if(page.getParams().get("endNetWeight") != null){
			hql += " and netWeight <= ?";
			params.add(Double.valueOf(page.getParams().get("endNetWeight").toString()));
		}
		hql += " order by createTime desc";
		page2.setRows(goodDao.getPageResult(hql, page.getPage(), page.getPageSize(), params.toArray()));
		page2.setPage(page.getPage());
		page2.setPageSize(page.getPageSize());
		return page2;
	}

}
