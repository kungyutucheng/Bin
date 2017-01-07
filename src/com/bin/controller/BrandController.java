package com.bin.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.context.BackupUserContext;
import com.bin.model.Brand;
import com.bin.service.BrandSerivce;
import com.bin.util.AjaxModel;
import com.bin.util.Page;

import sun.reflect.generics.tree.Tree;

@Controller
@RequestMapping(value = "/brand")
public class BrandController extends BaseController{

	@Autowired
	private BrandSerivce brandService;
	
	@RequestMapping(value = "/searchgrid",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String searchgrid(){
		Page page = getPage();
		return toJson(brandService.queryPage(page));
	}
	
	
	@RequestMapping(value = "/save",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String save(Brand brand){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.SAVE_SUCCESS);
		brand.setCreator(BackupUserContext.getContext().getUser().getUsername());
		brand.setCreateTime(new Date());
		model.setData(brandService.save(brand));
		return toJson(model);
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String update(Brand brand){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		brandService.update(brand);
		return toJson(model);
	}
	
	@RequestMapping(value = "/delete",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String delete(String ids){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.DELETE_SUCCESS);
		brandService.batchDelete(Brand.class, ids);
		return toJson(model);
	}
}
