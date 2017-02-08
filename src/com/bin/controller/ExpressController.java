package com.bin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bin.base.BaseController;
import com.bin.model.Express;
import com.bin.service.ExpressService;

@RequestMapping(value = "/express")
@Controller
public class ExpressController extends BaseController{

	
	@Autowired
	private ExpressService expressService;
	
	@RequestMapping(value = "/getAll" , method = {RequestMethod.GET,RequestMethod.POST} , produces = "text/html;charset=utf-8")
	@ResponseBody
	public String getAll(){
		return toJson(expressService.getAll(Express.class));
	}
	
}
