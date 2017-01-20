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

import com.bin.base.BaseController;
import com.bin.contant.ViewName;
import com.bin.context.UserContext;
import com.bin.model.Cart;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.model.Order;
import com.bin.model.OrderGood;
import com.bin.service.AddressService;
import com.bin.service.CartService;
import com.bin.service.GoodPropertyService;
import com.bin.service.OrderGoodService;
import com.bin.service.OrderService;
import com.bin.util.AjaxModel;
import com.bin.util.Creator;

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
	
	@RequestMapping(value = "/order", method = {RequestMethod.POST , RequestMethod.GET},
			produces = "text/html;charset=utf-8")
	public ModelAndView order(@RequestParam String ids){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_ORDER);
		List<Cart> carts = cartService.getListByIds(ids);
		BigDecimal totalValue = new BigDecimal(0);
		for(int i = 0 ; i < carts.size() ; i++){
			BigDecimal price = carts.get(i).getPrice();
			price = price.multiply(new BigDecimal(carts.get(i).getNum()));
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
	public String save(@RequestParam Order order , @RequestParam String cids) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
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
				orderService.rollback();
				return toJson(model);
			}else{
				//添加订单货物
				orderGood = new OrderGood();
				orderGood.setGid(cart.getGid());
				orderGood.setCreateTime(date);
				orderGood.setNum(cart.getNum());
				orderGood.setPrice(cart.getPrice());
				orderGood.setOid(oid);
				orderGoods.add(orderGood);
				
				//更新库存
				goodProperty.setNum(goodProperty.getNum() - cart.getNum());
				goodProperties.add(goodProperty);
				
				//删除购物车内对应的条目
				cartService.delete(Cart.class, cart.getId());
			}
		}
		orderGoodService.saveAll(orderGoods, OrderGood.class);
		goodPropertyService.updateAll(goodProperties, GoodProperty.class);
		return toJson(model);
	}
	
	
	@RequestMapping(value = "/payPage/{oid}" , method = RequestMethod.GET ,
			produces = "text/html;charset=utf-8")
	public ModelAndView payPage(@PathVariable Integer oid){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ORDER_PAY);
		Order order = orderService.get(Order.class, oid);
		modelAndView.addObject("order",order);
		return modelAndView;
	}
}
