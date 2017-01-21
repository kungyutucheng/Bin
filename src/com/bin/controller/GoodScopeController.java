package com.bin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.model.GoodScope;
import com.bin.service.GoodScopeService;

@Controller
@RequestMapping(value = "/goodScope")
public class GoodScopeController extends BaseController{

	@Autowired
	private GoodScopeService goodScopeService;
	
	/**
	 * 获取全部类别
	 * @return String
	 */
	@RequestMapping(value = "/getAll",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String getAll(){
		return toJson(goodScopeService.getAll(GoodScope.class));
	}
}
