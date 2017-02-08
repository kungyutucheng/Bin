package com.bin.admin.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Path;

import org.apache.catalina.tribes.util.Logs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.contant.ViewName;
import com.bin.context.BackupUserContext;
import com.bin.model.Express;
import com.bin.model.Order;
import com.bin.model.OrderGood;
import com.bin.model.ReturnAndChange;
import com.bin.model.ReturnAndChangeLog;
import com.bin.model.User;
import com.bin.service.ExpressService;
import com.bin.service.OrderGoodService;
import com.bin.service.OrderService;
import com.bin.service.ReturnAndChangeLogService;
import com.bin.service.ReturnAndChangeService;
import com.bin.service.UserService;
import com.bin.util.AjaxModel;
import com.bin.util.Page;
import com.mysql.jdbc.log.Log;


@Controller
@RequestMapping(value = "/admin/rac")
public class AdminRacController extends BaseController{
	
	
	
	@Autowired
	private ReturnAndChangeService returnAndChangeService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderGoodService orderGoodService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ExpressService expressService;
	
	@Autowired
	private ReturnAndChangeLogService returnAndChangeLogService;
	
	
	@RequestMapping(value = "/list/{pageNo}" , method = {RequestMethod.GET,RequestMethod.POST})
	@MyException
	public ModelAndView list(@PathVariable Integer pageNo){
		ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_RAC_LIST);
		Page page = returnAndChangeService.queryPage(getPage(), pageNo);
		List<ReturnAndChange> returnAndChanges = page.getRows();
		User user;
		Order order;
		OrderGood orderGood;
		for(ReturnAndChange returnAndChange : returnAndChanges){
			user = userService.get(User.class, returnAndChange.getUid());
			order = orderService.get(Order.class, returnAndChange.getOid());
			orderGood = orderGoodService.get(OrderGood.class, returnAndChange.getOgid());
			returnAndChange.setUser(user);
			returnAndChange.setOrder(order);
			returnAndChange.setOrderGood(orderGood);
		}
		modelAndView.addObject("racs", returnAndChanges);
		modelAndView.addObject("pageNo", pageNo);
		modelAndView.addObject("pageCount", (page.getTotal() % ReturnAndChangeService.PAGE_SIZE == 0 ?
				page.getTotal() / ReturnAndChangeService.PAGE_SIZE : (page.getTotal() / ReturnAndChangeService.PAGE_SIZE + 1l)));
		return modelAndView;
	}
	
	@RequestMapping(value = "/deliverGood" , method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String deliverGood(String expressNo , Integer eid , Integer rid){
		AjaxModel model = new AjaxModel();
		model.setMsg(TipMsg.DELIVER_GOOD_SUCCESS);
		ReturnAndChange returnAndChange = returnAndChangeService.get(ReturnAndChange.class, rid);
		returnAndChange.setStatus(ReturnAndChange.STATUS_REOUT);
		returnAndChange.setEid(eid);
		returnAndChange.setExpressNo(expressNo);
		Express express = expressService.get(Express.class, eid);
		returnAndChange.setExpressName(express.getName());
		Date resendTime = new Date();
		returnAndChange.setResendTime(resendTime);
		returnAndChangeService.update(returnAndChange);
		
		//记录日志
		ReturnAndChangeLog log = new ReturnAndChangeLog();
		log.setRid(rid);
		log.setOperateTime(resendTime);
		log.setMsg("卖家已重新发货,快递公司：【" + express.getName() + "】，快递单号：【" + expressNo + "】");
		log.setOperator(BackupUserContext.getContext().getUser().getUsername());
		returnAndChangeLogService.save(log);
		return toJson(model);
	}
	
	@RequestMapping(value = "/pass/{id}" , method = RequestMethod.GET , produces = "text/html;charset=utf-8")
	@MyException
	@ResponseBody
	public String pass(@PathVariable Integer id){
		AjaxModel model = new AjaxModel();
		model.setMsg(TipMsg.PASS_SUCCESS);
		ReturnAndChange returnAndChange = returnAndChangeService.get(ReturnAndChange.class, id);
		returnAndChange.setStatus(ReturnAndChange.STATUS_PASS);
		Date passTime = new Date();
		returnAndChange.setPassTime(passTime);
		returnAndChange.setDealWay(returnAndChange.getType());
		returnAndChangeService.update(returnAndChange);
		
		ReturnAndChangeLog log = new ReturnAndChangeLog();
		log.setRid(id);
		log.setOperateTime(passTime);
		log.setOperator(BackupUserContext.getContext().getUser().getUsername());
		log.setMsg("审核通过");
		returnAndChangeLogService.save(log);
		return toJson(model);
	}
	
	@RequestMapping(value = "/receive/{id}" , method = RequestMethod.GET)
	@MyException
	@ResponseBody
	public String receive(@PathVariable Integer id){
		AjaxModel model = new AjaxModel();
		model.setMsg(TipMsg.RECEIVE_SUCCESS);
		ReturnAndChange returnAndChange = returnAndChangeService.get(ReturnAndChange.class, id);
		returnAndChange.setStatus(ReturnAndChange.STATUS_RECEIVE);
		returnAndChangeService.update(returnAndChange);
		
		ReturnAndChangeLog log = new ReturnAndChangeLog();
		log.setRid(id);
		log.setOperateTime(new Date());
		log.setOperator(BackupUserContext.getContext().getUser().getUsername());
		log.setMsg("卖家已收货");
		returnAndChangeLogService.save(log);
		return toJson(model);
	}
	
	@RequestMapping(value = "/returnMoney/{id}" , method = RequestMethod.GET)
	@MyException
	@ResponseBody
	public String returnMoney(@PathVariable Integer id){
		AjaxModel model = new AjaxModel();
		model.setMsg(TipMsg.RECEIVE_SUCCESS);
		ReturnAndChange returnAndChange = returnAndChangeService.get(ReturnAndChange.class, id);
		returnAndChange.setStatus(ReturnAndChange.STATUS_RETURN_MONEY);
		
		OrderGood orderGood = orderGoodService.get(OrderGood.class, returnAndChange.getOgid());
		BigDecimal returnMoney = orderGood.getPrice().multiply(new BigDecimal(returnAndChange.getNum()));
		returnAndChange.setReturnMoney(returnMoney);
		returnAndChangeService.update(returnAndChange);
		
		//更新用户余额
		User user = userService.get(User.class, returnAndChange.getUid());
		user.setBalance(user.getBalance().add(returnMoney));
		userService.update(user);
		
		ReturnAndChangeLog log = new ReturnAndChangeLog();
		log.setRid(id);
		log.setOperateTime(new Date());
		log.setOperator(BackupUserContext.getContext().getUser().getUsername());
		log.setMsg("卖家已退款，退款金额：【" + returnMoney.doubleValue() + "】");
		returnAndChangeLogService.save(log);
		return toJson(model);
	}
	

}
