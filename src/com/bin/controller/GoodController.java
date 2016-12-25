package com.bin.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.context.BackupUserContext;
import com.bin.context.UserContext;
import com.bin.databinder.helper.GoodPropertiesListForm;
import com.bin.model.Good;
import com.bin.model.GoodProperties;
import com.bin.service.GoodPropertiesService;
import com.bin.service.GoodService;
import com.bin.util.AjaxModel;
import com.bin.util.Creator;
import com.bin.util.Page;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
@RequestMapping(value = "/good")
public class GoodController extends BaseController{
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private GoodPropertiesService goodPropertiesService;

	
	@RequestMapping(value = "/searchgrid",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String searchgrid(){
		Page page = getPage();
		System.out.println(page.toString());
		return toJson(goodService.queryPage(page));
	}
	
	/**
	 * 保存商品
	 * @param good
	 * @param properties
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 * @return String
	 */
	@RequestMapping(value = "/save",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String save(Good good,GoodPropertiesListForm properties) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.SAVE_SUCCESS);
		Date date = new Date();
		good.setCreateTime(date);
		if(BackupUserContext.getContext() == null){
			System.out.println(1);
		}
		if(BackupUserContext.getContext().getUser() == null){
			System.out.println(2);
		}
		Integer oid = BackupUserContext.getContext().getUser().getOid();
		good.setNo(Creator.createGoodNo(oid));
		good.setOid(oid);
		good.setStatus(1);
		Integer gid = goodService.save(good);
		model.setData(gid);
		for(GoodProperties goodProperties : properties.getGoodProperties()){
			goodProperties.setCreateTime(date);
			goodProperties.setGid(gid);
			goodProperties.setIsDefault(1);
		}
		goodPropertiesService.saveAll(properties.getGoodProperties(), GoodProperties.class);
		return toJson(model);
	}
	
	/**
	 * 更新
	 * @param good
	 * @return
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String update(Good good , GoodPropertiesListForm goodPropertiesListForm) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		goodService.update(good);
		List<GoodProperties> updateProperties = new ArrayList<GoodProperties>();
		List<GoodProperties> newProperties = new ArrayList<GoodProperties>();
		
		List<String> columnNames = new ArrayList<String>();
		columnNames.add("name");
		columnNames.add("price");
		columnNames.add("num");
		
		Date date = new Date();
		for(GoodProperties goodProperties : goodPropertiesListForm.getGoodProperties()){
			if(goodProperties.getId() != null){
				updateProperties.add(goodProperties);
			}else{
				goodProperties.setGid(good.getId());
				goodProperties.setCreateTime(date);
				goodProperties.setIsDefault(1);
				newProperties.add(goodProperties);
			}
		}
		if(newProperties.size() > 0){
			goodPropertiesService.saveAll(newProperties, GoodProperties.class);
		}
		if(updateProperties.size() > 0){
			goodPropertiesService.updateAll(updateProperties, GoodProperties.class,columnNames);
		}
		return toJson(model);
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delete(String ids){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.DELETE_SUCCESS);
		goodService.batchDelete(Good.class, ids);
		return toJson(model);
	}
}
