package com.bin.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bin.contant.ViewName;

@Controller
@RequestMapping("/index")
public class IndexController {

	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView(ViewName.INDEX);
	}
}
