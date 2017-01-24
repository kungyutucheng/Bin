package com.bin.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.ViewName;

@Controller
@RequestMapping(value = "/home/me")
public class MeController extends BaseController{

	@RequestMapping(value = "/personInfo" , method = RequestMethod.GET)
	@MyException
	public ModelAndView personInfo(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ME);
		modelAndView.addObject("target", 1);
		return modelAndView;
	}
	
	@RequestMapping(value = "/address" , method = RequestMethod.GET)
	@MyException
	public ModelAndView address(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ME);
		modelAndView.addObject("target", 2);
		return modelAndView;
	}
	
	@RequestMapping(value = "/myOrder" , method = RequestMethod.GET)
	@MyException
	public ModelAndView myOrder(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ME);
		modelAndView.addObject("target", 3);
		return modelAndView;
	}
	
	@RequestMapping(value = "/myComment" , method = RequestMethod.GET)
	@MyException
	public ModelAndView myComment(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ME);
		modelAndView.addObject("target", 4);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/myRank" , method = RequestMethod.GET)
	@MyException
	public ModelAndView myRank(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ME);
		modelAndView.addObject("target", 5);
		return modelAndView;
	}
	
	@RequestMapping(value = "/myReturnAndChange" , method = RequestMethod.GET)
	@MyException
	public ModelAndView myReturnAndChange(){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_ME);
		modelAndView.addObject("target", 6);
		return modelAndView;
	}
}
