package com.bin.home.controller;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.bin.model.Cart;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.model.Order;
import com.bin.model.OrderGood;
import com.bin.service.AddressService;
import com.bin.service.CartService;
import com.bin.service.GoodPropertyService;
import com.bin.service.GoodService;
import com.bin.service.OrderGoodService;
import com.bin.service.OrderService;
import com.bin.util.AjaxModel;
import com.bin.util.Creator;
import com.bin.util.Page;

@Controller
@RequestMapping(value = "/home/order")
public class OrderController extends BaseController{

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private GoodPropertyService goodPropertyService;
	
	@Autowired
	private OrderGoodService orderGoodService;
	
	@Autowired
	private GoodService goodService;
	
	
	@RequestMapping(value = "/order", method = {RequestMethod.POST , RequestMethod.GET},
			produces = "text/html;charset=utf-8")
	@MyException
	public ModelAndView order(@RequestParam String ids){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_ORDER);
		List<Cart> carts = cartService.getListByIds(ids);
		BigDecimal totalValue = new BigDecimal(0);
		Cart cart = null;
		for(int i = 0 ; i < carts.size() ; i++){
			cart = carts.get(i);
			cart.setPicSmall(goodService.get(Good.class, cart.getGid()).getPicSm());
			BigDecimal price = cart.getPrice();
			price = price.multiply(new BigDecimal(cart.getNum()));
			totalValue = totalValue.add(price);
		}
		modelAndView.addObject("carts", carts);
		modelAndView.addObject("totalValue", totalValue.doubleValue());
		modelAndView.addObject("cids", ids);
		return modelAndView;
	}
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String save(Order order ,@RequestParam String cids) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		AjaxModel model = new AjaxModel(true);
		model.setMsg("提交订单成功");
		
		Date date = new Date();
		
		//保存订单
		order.setCreateTime(date);
		String orderNo = Creator.createOrderNo();
		order.setNo(orderNo);
		order.setScore((int) Math.floor(order.getTotalValue().doubleValue()));
		order.setStatus(1);
		order.setUid(UserContext.getContext().getUser().getId());
		Integer oid = orderService.save(order);
		
		model.setData(oid);
		
		String [] cidStrings = cids.split(",");
		OrderGood orderGood;
		Cart cart;
		GoodProperty goodProperty;
		List<OrderGood> orderGoods = new ArrayList<OrderGood>();
		List<GoodProperty> goodProperties = new ArrayList<GoodProperty>();
		for(int i = 0 ;i < cidStrings.length ; i++){
			cart = cartService.get(Cart.class, Integer.valueOf(cidStrings[i]));
			goodProperty = goodPropertyService.get(GoodProperty.class, cart.getGpId());
			//购物车中的商品数量是否超过库存数量
			if(goodProperty.getNum() < cart.getNum()){
				model.setSuccess(false);
				model.setMsg(goodProperty.getName() + "数量超过库存，库存为" + goodProperty.getNum());
				orderService.delete(order);
				return toJson(model);
			}else{
				//添加订单货物
				orderGood = new OrderGood();
				orderGood.setGid(cart.getGid());
				orderGood.setCreateTime(date);
				orderGood.setNum(cart.getNum());
				orderGood.setPrice(goodProperty.getPrice());
				orderGood.setOid(oid);
				orderGood.setGpid(goodProperty.getId());
				orderGoods.add(orderGood);
				
				//更新库存
				goodProperty.setNum(goodProperty.getNum() - cart.getNum());
				goodProperties.add(goodProperty);
				
				//删除购物车内对应的条目
				cartService.delete(cart);
			}
		}
		orderGoodService.saveAll(orderGoods, OrderGood.class);
		goodPropertyService.updateAll(goodProperties, GoodProperty.class);
		return toJson(model);
	}
	
	
	@RequestMapping(value = "/payPage/{oid}" , method = RequestMethod.GET ,
			produces = "text/html;charset=utf-8")
	@MyException
	public ModelAndView payPage(@PathVariable Integer oid){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_PAY);
		Order order = orderService.get(Order.class, oid);
		modelAndView.addObject("order",order);
		return modelAndView;
	}
	
	@RequestMapping(value = "/pay/{id}",method = {RequestMethod.GET , RequestMethod.POST})
	@MyException
	public ModelAndView pay(@PathVariable Integer id){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_PAY_SUCCESS);
		Order order = orderService.get(Order.class, id);
		order.setPayTime(new Date());
		orderService.update(order);
		modelAndView.addObject("oid", id);
		return modelAndView;
	}
	
	@RequestMapping(value = "/detail/{id}", method = {RequestMethod.POST , RequestMethod.GET})
	@MyException
	public ModelAndView detail(@PathVariable Integer id){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_DETAIL);
		Order order = orderService.get(Order.class, id);
		List<OrderGood> orderGoods = 
				orderGoodService.queryList("from OrderGood where oid = ?", id);
		BigDecimal totalValue = new BigDecimal(0);
		for(int i = 0 ;i < orderGoods.size() ; i++){
			totalValue = totalValue.add(orderGoods.get(i).getPrice().multiply(new BigDecimal(orderGoods.get(i).getNum())));
			orderGoods.get(i).setGood(goodService.get(Good.class, orderGoods.get(i).getGid()));
		}
		Address address = addressService.get(Address.class, order.getAid());
		modelAndView.addObject("order", order);
		modelAndView.addObject("orderGoods", orderGoods);
		modelAndView.addObject("totalValue" , totalValue);
		modelAndView.addObject("address", address);
		return modelAndView;
	}
	
	@RequestMapping(value = "/list/{pageNo}" , method = RequestMethod.GET)
	@MyException
	public ModelAndView list(@PathVariable Integer pageNo , Integer status , Integer timeLimited , String no){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_LIST);
		Page page = orderService.queryPageHome(pageNo, status, timeLimited, no);
		List<Order> orders = page.getRows();
		Order order = null;
		List<OrderGood> orderGoods;
		OrderGood orderGood;
		for(int i = 0 ;i < orders.size() ; i++){
			order = orders.get(i);
			orderGoods = orderGoodService.queryList("from OrderGood where oid = ?", 
					order.getId());
			for(int j = 0 ; j < orderGoods.size() ; j++){
				orderGood = orderGoods.get(j);
				orderGood.setGood(goodService.get(Good.class, orderGood.getGid()));
				orderGood.setGoodProperty(goodPropertyService.get(GoodProperty.class , orderGood.getGpid()));
			}
			order.setOrderGoods(orderGoods);
			order.setAddress(addressService.get(Address.class, order.getAid()));
		}
		modelAndView.addObject("orders", orders);
		if(no == null || no.trim().equals("")){
			if(status == null){
				modelAndView.addObject("status", 0);
			}else{
				modelAndView.addObject("status", status);
			}
			if(timeLimited == null){
				modelAndView.addObject("timeLimited", 0);
			}else{
				modelAndView.addObject("timeLimited", timeLimited);
			}
		}else{
			modelAndView.addObject("status", 0);
			modelAndView.addObject("timeLimited" , 0);
			modelAndView.addObject("no", no);
		}
		
		//通过数据总记录数得出页数
		Long pageCount = page.getTotal() % 2 == 0l ? page.getTotal() / 2 : (page.getTotal() / 2 + 1);
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.addObject("pageNo", pageNo);
		return modelAndView;
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.GET , 
			produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String delete(@PathVariable Integer id){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.DELETE_SUCCESS);
		Order order = orderService.get(Order.class, id);
		order.setDisable(2);
		orderService.update(order);
		return toJson(model);
	}
	
	@RequestMapping(value = "/confirm/{id}" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String confirm(@PathVariable Integer id) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		AjaxModel model = new AjaxModel();
		model.setMsg(TipMsg.CONFIRM_SUCCESS);
		Order order = orderService.get(Order.class, id);
		order.setConfirmTime(new Date());
		order.setStatus(Order.STATUS_COMMENTING);
		order.setScore(order.getTotalValue().intValue());
		orderService.update(order);
		
		//更新商品销售数量
		List<OrderGood> orderGoods = orderGoodService.queryList("from OrderGood where oid = ?", 
				order.getId());
		Good good;
		List<Good> goods = new ArrayList<Good>();
		for(OrderGood orderGood : orderGoods){
			good = goodService.get(Good.class, orderGood.getGid());
			good.setSoldNum(good.getSoldNum() + orderGood.getNum());
			goods.add(good);
		}
		goodService.updateAll(goods, Good.class);
		return toJson(model);
	}
	
	@RequestMapping(value = "/commentPage/{id}" , method = RequestMethod.GET )
	@MyException
	public ModelAndView commentPage(@PathVariable Integer id){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_COMMENT);
		Order order = orderService.get(Order.class, id);
		List<OrderGood> orderGoods = orderGoodService.queryList("from OrderGood where oid = ?", order.getId());
		for(OrderGood orderGood : orderGoods){
			orderGood.setGood(goodService.get(Good.class, orderGood.getGid()));
			orderGood.setGoodProperty(goodPropertyService.get(GoodProperty.class, orderGood.getGpid()));
		}
		order.setOrderGoods(orderGoods);
		modelAndView.addObject("order", order);
		return modelAndView;
	}
}
