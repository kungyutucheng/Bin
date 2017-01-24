package com.bin.home.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.bin.context.UserContext;
import com.bin.model.User;
import com.bin.service.UserService;
import com.bin.util.AjaxModel;

@Controller
@RequestMapping(value = "/home/user")
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/personInfo" , method = RequestMethod.GET)
	@MyException
	public ModelAndView personInfo(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_USER_PERSON_INFO);
		modelAndView.addObject("user", userService.get(User.class, 
				UserContext.getContext().getUser().getId()));
		return modelAndView;
	}
	
	@RequestMapping(value = "/update" , method = RequestMethod.POST, 
			produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String update(@RequestParam String name,@RequestParam Integer gender ,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,@RequestParam Integer id){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		User user = userService.get(User.class, id);
		user.setName(name);
		user.setBirthday(birthday);
		user.setGender(gender);
		userService.update(user);
		return toJson(model);
	}
}
