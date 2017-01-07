package com.bin.service;

import java.util.ArrayList;
import java.util.Date;
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
		if(page.getParams().get("status") != null && (Integer.valueOf(page.getParams().get("status").toString()) != 0)){
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
		page2.setTotal(goodDao.getCount(hql, params.toArray()));
		page2.setPage(page.getPage());
		page2.setPageSize(page.getPageSize());
		return page2;
	}
	
	
	public void pushGoods(String ids){
		String [] idStrings = ids.split(",");
		for(int i = 0 ;i < idStrings.length ; i++){
			Integer id = Integer.valueOf(idStrings[i]);
			Good good = goodDao.get(Good.class, id);
			good.setStatus(2);
			goodDao.update(good);
		}
	}
	
	
	public void removeGoods(String ids){
		String [] idStrings = ids.split(",");
		for(int i = 0 ;i < idStrings.length ; i++){
			Integer id = Integer.valueOf(idStrings[i]);
			Good good = goodDao.get(Good.class, id);
			if(good.getStatus() == 2){
				good.setStatus(3);
				good.setRemoveTime(new Date());
				goodDao.update(good);
			}
		}
	}
	
	public Page search(Page page){
		StringBuilder hql = new StringBuilder("from Good where 1=1");
		Page page2 = new Page();
		List<Object> params = new ArrayList<Object>();
		if(page.getParams().get("keyword") != null){
			hql.append(" and name like ?");
			params.add("%" + page.getParams().get("keyword") + "%");
		}
		if(page.getParams().get("startPrice") != null 
				&& Integer.valueOf(page.getParams().get("startPrice").toString()) != 0){
			hql.append(" and price >= ?");
			params.add(Double.valueOf(page.getParams().get("startPrice").toString()));
		}
		if(page.getParams().get("endPrice") != null
				&& Integer.valueOf(page.getParams().get("endPrice").toString()) != 0){
			hql.append(" and price <= ?");
			params.add(Double.valueOf(page.getParams().get("endPrice").toString()));
		}
		if(page.getParams().get("brands") != null
				&& !page.getParams().get("brands").toString().trim().equals("")){
			String brands[] = page.getParams().get("brands").toString().split(",");
			if(brands.length > 0){
				hql.append(" and brand in (");
				for(int i = 0 ;i < brands.length ; i++){
					hql.append("?,");
					params.add(brands[i]);
				}
				hql.deleteCharAt(hql.length() - 1);
				hql.append(")");
			}
		}
		if(page.getParams().get("orderby") != null){
			Integer orderby = Integer.valueOf(page.getParams().get("orderby").toString());
			hql.append(" order by");
			if(orderby == 1){
				hql.append(" soldNum desc");
			}else if(orderby == 2){
				hql.append(" price desc");
			}else if(orderby == 3){
				hql.append(" commentNum desc");
			}else if(orderby == 4){
				hql.append(" createTime desc");
			}
		}
		page2.setRows(goodDao.getPageResult(hql.toString(), page.getPage(), 30, params.toArray()));
		page2.setTotal(goodDao.getCount(hql.toString(), params.toArray()));
		page2.setPage(page.getPage());
		page2.setPageSize(30);
		return page2;
	}

}
