package com.bin.home.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.contant.ViewName;
import com.bin.context.UserContext;
import com.bin.model.Cart;
import com.bin.model.GoodProperty;
import com.bin.service.CartService;
import com.bin.service.GoodPropertyService;
import com.bin.util.AjaxModel;

@Controller
@RequestMapping(value = "/home/cart")
public class CartController extends BaseController{
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private GoodPropertyService goodPropertiesService;
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST , 
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String save(Cart cart){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.SAVE_SUCCESS);
		cart.setCreateTime(new Date());
		cart.setUid(UserContext.getContext().getUser().getId());
		model.setData(cartService.save(cart));
		return toJson(model);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String update(Cart cart){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		cartService.update(cart);
		return toJson(model);
	}
	
	@RequestMapping(value = "/delete", method = {RequestMethod.POST,RequestMethod.GET},
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delete(String ids){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.DELETE_SUCCESS);
		cartService.batchDelete(Cart.class, ids);
		return toJson(model);
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_CART_LIST);
		modelAndView.addObject("carts", cartService.getListByUid(UserContext.getContext().getUser().getId()));
		return modelAndView;
	}

	@RequestMapping(value = "/changeNum" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String changeNum(Integer id , Integer num){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		Cart cart = cartService.get(Cart.class, id);
		GoodProperty goodProperties = goodPropertiesService.get(GoodProperty.class, cart.getGpId());
		if(num > goodProperties.getNum()){
			model.setSuccess(false);
			model.setMsg("数量超出库存数量");
		}else{
			cart.setNum(num);
			//此处不知道为什么使用update方法无法成功更新数据库
			cartService.execute("update Cart set num = ? where id = ?", num,id);
			//cartService.update(cart);
		}
 		return toJson(model);
	}
}
