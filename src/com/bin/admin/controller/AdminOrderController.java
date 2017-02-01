package com.bin.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.ViewName;
import com.bin.model.Order;
import com.bin.model.User;
import com.bin.service.OrderService;
import com.bin.service.UserService;
import com.bin.util.Page;

@Controller
@RequestMapping(value = "/admin/order")
public class AdminOrderController extends BaseController{
	
	public static final Integer PAGE_SIZE = 2;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/list")
	@MyException
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_ORDER_LIST);
		Page page = orderService.queryPage(getPage());
		List<Order> orders = page.getRows();
		for(Order order : orders){
			order.setUser(userService.get(User.class, order.getUid()));
		}
		modelAndView.addObject("orders", orders);
		modelAndView.addObject("pageNo", page.getPage());
		modelAndView.addObject("pageCount", 
				page.getTotal() % PAGE_SIZE == 0 ? page.getTotal() / PAGE_SIZE : 
					(page.getTotal() / PAGE_SIZE + 1));
		modelAndView.addObject("params", getPage().getParams());
		return modelAndView;
	}
}
