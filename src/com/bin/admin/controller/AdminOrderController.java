package com.bin.admin.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.contant.ViewName;
import com.bin.model.Express;
import com.bin.model.Order;
import com.bin.model.User;
import com.bin.service.ExpressService;
import com.bin.service.OrderService;
import com.bin.service.UserService;
import com.bin.util.AjaxModel;
import com.bin.util.Page;

@Controller
@RequestMapping(value = "/admin/order")
public class AdminOrderController extends BaseController{
	
	public static final Integer PAGE_SIZE = 2;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ExpressService expressService;

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
	
	@RequestMapping(value = "/deliverGood" , method = RequestMethod.POST , produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String deliverGood(@RequestParam Integer id , @RequestParam Integer eid , @RequestParam String expressNo){
		AjaxModel model = new AjaxModel();
		model.setMsg(TipMsg.DELIVER_GOOD_SUCCESS);
		Order order = orderService.get(Order.class, id);
		order.setStatus(Order.STATUS_RECEIVING);
		order.setEid(eid);
		Express express = expressService.get(Express.class, eid);
		order.setExpressName(express.getName());
		order.setExpressNo(expressNo);
		order.setOutTime(new Date());
		orderService.update(order);
		return toJson(model);
	}
}
