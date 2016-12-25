package com.bin.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bin.base.BaseController;
import com.bin.contant.ViewName;

@Controller
@RequestMapping("/admin/index")
public class AdminIndexController extends BaseController{

	@RequestMapping(value = "/index")
	public ModelAndView index(){
		return new ModelAndView(ViewName.ADMIN_INDEX);
	}
}
