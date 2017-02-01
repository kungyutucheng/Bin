package com.bin.home.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.contant.ViewName;
import com.bin.context.UserContext;
import com.bin.model.Address;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.model.Order;
import com.bin.model.OrderGood;
import com.bin.model.Owner;
import com.bin.model.ReturnAndChange;
import com.bin.model.ReturnAndChangeLog;
import com.bin.service.AddressService;
import com.bin.service.GoodPropertyService;
import com.bin.service.GoodService;
import com.bin.service.OrderGoodService;
import com.bin.service.OrderService;
import com.bin.service.OwnerService;
import com.bin.service.ReturnAndChangeLogService;
import com.bin.service.ReturnAndChangeService;
import com.bin.util.AjaxModel;
import com.bin.util.Creator;

@Controller
@RequestMapping(value = "/home/returnAndChange")
public class ReturnAndChangeController extends BaseController{
	
	private static final Integer PAGE_SIZE = 2;

	@Autowired
	private ReturnAndChangeService returnAndChangeService;
	
	@Autowired
	private OrderGoodService orderGoodService;
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private GoodPropertyService goodPropertyService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private ReturnAndChangeLogService returnAndChangeLogService;
	
	@RequestMapping(value = "/index/{ogid}",method = RequestMethod.GET)
	@MyException
	public ModelAndView index(@PathVariable Integer ogid){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_RETURN_AND_CHANGE_INDEX);
		OrderGood orderGood = orderGoodService.get(OrderGood.class, ogid);
		Good good = goodService.get(Good.class, orderGood.getGid());
		good.setOwner(ownerService.get(Owner.class, good.getOid()));
		GoodProperty goodProperty = goodPropertyService.get(GoodProperty.class, orderGood.getGpid());
		Order order = orderService.get(Order.class, orderGood.getOid());
		Address address = addressService.get(Address.class, order.getAid());
		modelAndView.addObject("orderGood", orderGood);
		modelAndView.addObject("order", order);
		modelAndView.addObject("good", good);
		modelAndView.addObject("goodProperty", goodProperty);
		modelAndView.addObject("address", address);
		return modelAndView;
	}
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	@MyException
	public ModelAndView save(ReturnAndChange returnAndChange , @RequestParam String pcc){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_RETURN_AND_CHANGE_SUCCESS);
		Date date = new Date();
		returnAndChange.setCreateTime(date);
		returnAndChange.setStatus(ReturnAndChange.STATUS_DEALING);
		String [] pccs = pcc.split("/");
		returnAndChange.setProvince(pccs[0]);
		returnAndChange.setCity(pccs[1]);
		returnAndChange.setCounty(pccs[2]);
		returnAndChange.setApplyTime(new Date());
		returnAndChange.setNo(Creator.createRACNo(returnAndChange.getOgid()));
		returnAndChange.setUid(UserContext.getContext().getUser().getId());
		Integer rid = returnAndChangeService.save(returnAndChange);
		modelAndView.addObject("id", rid);
		
		//记录日志
		ReturnAndChangeLog log = new ReturnAndChangeLog();
		log.setMsg("您已提交申请，请等待商家审核");
		log.setOperator("系统");
		log.setOperateTime(date);
		log.setRid(rid);
		returnAndChangeLogService.save(log);
		return modelAndView;
	}
	
	@RequestMapping(value = "/detail/{id}" , method = RequestMethod.GET)
	@MyException
	public ModelAndView detail(@PathVariable Integer id){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_RETURN_AND_CHANGE_DETAIL);
		ReturnAndChange returnAndChange = returnAndChangeService.get(ReturnAndChange.class, id);
		OrderGood orderGood = orderGoodService.get(OrderGood.class, returnAndChange.getOgid());
		Good good = goodService.queryUnique("from Good where no = ?", returnAndChange.getgNo());
		Order order = orderService.get(Order.class, orderGood.getOid());
		GoodProperty goodProperty = goodPropertyService.get(GoodProperty.class, orderGood.getGpid());
		orderGood.setGood(good);
		orderGood.setGoodProperty(goodProperty);
		Owner owner = ownerService.get(Owner.class, good.getOid());
		good.setOwner(owner);
		returnAndChange.setOrderGood(orderGood);
		modelAndView.addObject("rac", returnAndChange);
		
		//获取售后日志
		List<ReturnAndChangeLog> logs = returnAndChangeLogService.queryList(
				"from ReturnAndChangeLog where rid = ?", id);
		modelAndView.addObject("logs", logs);
		return modelAndView;
	}
	
	@RequestMapping(value = "/list/{pageNo}" , method = RequestMethod.GET)
	@MyException
	public ModelAndView list(@PathVariable Integer pageNo){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_RETURN_AND_CHANGE_LIST);
		List<ReturnAndChange> returnAndChanges = returnAndChangeService.getPageResult(
				"from ReturnAndChange where uid = ?", pageNo, PAGE_SIZE, 
				UserContext.getContext().getUser().getId());
		OrderGood orderGood;
		for(ReturnAndChange returnAndChange : returnAndChanges){
			orderGood = orderGoodService.get(OrderGood.class, returnAndChange.getOgid());
			orderGood.setGood(goodService.get(Good.class, orderGood.getGid()));
			orderGood.setGoodProperty(goodPropertyService.get(GoodProperty.class, orderGood.getGpid()));
			orderGood.setOrder(orderService.get(Order.class, orderGood.getOid()));
			returnAndChange.setOrderGood(orderGood);
		}
		modelAndView.addObject("racs", returnAndChanges);
		modelAndView.addObject("pageNo", pageNo);
		Long total = returnAndChangeService.getCount("from ReturnAndChange where uid = ?", 
				UserContext.getContext().getUser().getId());
		Long pageCount = total % PAGE_SIZE == 0l ? total / PAGE_SIZE : (total / PAGE_SIZE + 1l);
		modelAndView.addObject("pageCount", pageCount);
		return modelAndView;
	}
}
