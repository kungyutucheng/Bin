package com.bin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseService;
import com.bin.model.Cart;

@Repository
public class CartService extends BaseService<Cart, Integer>{

	public List<Cart> getListByUid(Integer uid){
		String hql = "select new Cart("
				+ "id,"
				+ "gid,"
				+ "uid,"
				+ "num,"
				+ "gpId,"
				+ "createTime,"
				+ "(select name from Good g where g.id = gid),"
				+ "(select name from GoodProperty gp where gp.id = gpId),"
				+ "(select price from GoodProperty gp where gp.id = gpId)"
				+ ") from Cart where uid = ? order by createTime desc";
		return queryList(hql, uid);
	}
	
	public List<Cart> getListByIds(String ids){
		StringBuilder hql = new StringBuilder("select new Cart("
				+ "id,"
				+ "gid,"
				+ "uid,"
				+ "num,"
				+ "gpId,"
				+ "createTime,"
				+ "(select name from Good g where g.id = gid),"
				+ "(select name from GoodProperty gp where gp.id = gpId),"
				+ "(select price from GoodProperty gp where gp.id = gpId)"
				+ ") from Cart where id in (");
		String [] idStrings = ids.split(",");
		List<Integer> params = new ArrayList<Integer>();
		for(int i = 0 ; i < idStrings.length ; i++){
			hql.append("?,");
			params.add(Integer.valueOf(idStrings[i]));
		}
		hql.deleteCharAt(hql.length() - 1);
		hql.append(") order by createTime desc");
		return queryList(hql.toString(), params.toArray());
	}
}
