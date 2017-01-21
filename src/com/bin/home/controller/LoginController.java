package com.bin.home.controller;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Date;

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
import com.bin.model.User;
import com.bin.service.UserService;
import com.bin.util.AjaxModel;

@RequestMapping(value = "/home/login")
@Controller
public class LoginController extends BaseController{

	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/loginPage",method = RequestMethod.GET)
	@MyException
	public ModelAndView loginPage(){
		return new ModelAndView(ViewName.HOME_LOGIN_PAGE);
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String login(String account,String pwd) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.LOGIN_SUCCESS);
		User user = new User();
		if(userService.getCount("select count(*) from User where account=? and pwd = ?", account,pwd) == 0l){
			model.setSuccess(false);
			model.setMsg(TipMsg.LOGIN_FAILURE);
		}else{
			model.setData("/index/index");
			user = userService.queryUnique("from User where account=? and pwd = ?", account,pwd);
			session.setAttribute("user", user);
		}
		return toJson(model);
	}
	
	
	@RequestMapping(value = "/register" , method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String register(User user , String verifyCode) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		AjaxModel model = new AjaxModel(true);
		
		//校验验证码
		String expectedCode = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if(verifyCode == null || !verifyCode.equals(expectedCode)){
			model.setSuccess(false);
			model.setMsg(TipMsg.VERIFY_CODE_ERROR);
			return toJson(model);
		}
		
		//查询账户是否已被注册
		if(userService.getCount("select count(*) from User where account=?", user.getAccount()) != 0l){
			model.setSuccess(false);
			model.setMsg("邮箱已被注册");
			return toJson(model);
		}
		model.setMsg(TipMsg.REGISTER_SUCCESS);
		user.setBalance(new BigDecimal(0));
		user.setCreateTime(new Date());
		user.setScore(0);
		user.setGender(3);
		userService.save(user);
		return toJson(model);
	}
	
}
