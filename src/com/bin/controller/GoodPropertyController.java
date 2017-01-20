package com.bin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.model.GoodProperty;
import com.bin.service.GoodPropertyService;
import com.bin.util.AjaxModel;
import com.bin.util.Page;

@Controller
@RequestMapping(value = "/goodProperty")
public class GoodPropertyController extends BaseController{

	@Autowired
	private GoodPropertyService goodPropertyService;
	
	/**
	 * 分页查询
	 * @return
	 */
	@RequestMapping(value = "/searchgrid",method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String searchgrid(){
		Page page = getPage();
		return toJson(goodPropertyService.queryPage(page));
	}
	
	@RequestMapping(value = "/delete/{id}", method=RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String delete(@PathVariable("id") Integer id){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.DELETE_SUCCESS);
		goodPropertyService.delete(GoodProperty.class, id);
		return toJson(model);
	}
}
