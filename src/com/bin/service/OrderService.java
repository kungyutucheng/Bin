package com.bin.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bin.admin.controller.AdminOrderController;
import com.bin.base.BaseService;
import com.bin.context.BackupUserContext;
import com.bin.context.UserContext;
import com.bin.dao.OrderDao;
import com.bin.model.BackupUser;
import com.bin.model.Order;
import com.bin.util.Page;

@Repository
public class OrderService extends BaseService<Order, Integer>{

	
	@Autowired
	private OrderDao orderDao;
	
	public Page queryPageHome(Integer pageNo , Integer status , Integer timeLimited , String no){
		StringBuilder hql = new StringBuilder("from Order where uid = ? and disable = 1");
		List<Object> params = new ArrayList<Object>();
		params.add(UserContext.getContext().getUser().getId());
		if(no != null && !no.trim().equals("")){
			hql.append(" and no = ?");
			params.add(no);
		}else{
			if(status != null && status != 0){
				hql.append(" and status = ?");
				params.add(status);
			}
			if(timeLimited != null && timeLimited != 0){
				Date date = new Date();
				switch (timeLimited) {
				case 1:
					date.setMonth(date.getMonth() - 3);
					hql.append(" and createTime >= '")
					.append(new SimpleDateFormat("yyyy-MM-dd").
							format(date))
					.append(" 00:00:00'");
					break;
				case 2:
					Integer year = date.getYear() + 1900;
					hql.append(" and createTime >= '").append(year).append("-01-01 00:00:00' and createTime <= '")
					.append(year).append("-12-31 23:59:59'");
					break;
				case 3:
					Integer lastYear = date.getYear() + 1900 - 1;
					hql.append(" and createTime >= '").append(lastYear).append("-01-01 00:00:00' and createTime <= '")
					.append(lastYear).append("-12-31 23:59:59'");
					break;
				case 4:
					Integer theYearBeforeLastYear = date.getYear() + 1900 - 2;
					hql.append(" and createTime >= '").append(theYearBeforeLastYear).append("-01-01 00:00:00' and createTime <= '")
					.append(theYearBeforeLastYear).append("-12-31 23:59:59'");
					break;
				case 5:
					theYearBeforeLastYear = date.getYear() + 1900 - 3;
					hql.append(" and createTime <= '").append(theYearBeforeLastYear).append("-12-31 23:59:59'");
					break;
				default:
					break;
				}
			}
		}
		hql.append(" order by createTime desc");
		Page page = new Page();
		page.setRows(orderDao.getPageResult(hql.toString(), pageNo, 2, params.toArray()));
		page.setTotal(orderDao.getCount(hql.toString(), params.toArray()));
		return page;
		
	}

	public Page queryPage(Page page) {
		StringBuilder hql = new StringBuilder("from Order where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(BackupUserContext.getContext().getUser().getRole() == BackupUser.ROLE_USER){
			params.add(BackupUserContext.getContext().getUser().getId());
			hql.append(" and uid = ?");
		}
		if(page.getParams().get("no") != null){
			params.add(page.getParams().get("no"));
			hql.append(" and no = ?");
		}
		if(page.getParams().get("status") != null &&
				Integer.valueOf(page.getParams().get("status").toString()) != 0){
			params.add(Integer.valueOf(page.getParams().get("status").toString()));
			hql.append(" and status = ?");
		}
		hql.append(" order by createTime desc");
		Page page2 = new Page();
		page2.setRows(orderDao.getPageResult(hql.toString(), page.getPage(), AdminOrderController.PAGE_SIZE, params.toArray()));
		page2.setPage(page.getPage());
		page2.setTotal(orderDao.getCount(hql.toString(), params.toArray()));
		return page2;
	}
	
}
