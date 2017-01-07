package com.bin.admin.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.context.BackupUserContext;
import com.bin.context.UserContext;
import com.bin.databinder.helper.GoodPropertiesListForm;
import com.bin.model.Good;
import com.bin.model.GoodProperties;
import com.bin.model.Image;
import com.bin.service.GoodPropertiesService;
import com.bin.service.GoodService;
import com.bin.util.AjaxModel;
import com.bin.util.Creator;
import com.bin.util.Page;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
@RequestMapping(value = "/admin/good")
public class AdminGoodController extends BaseController{
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private GoodPropertiesService goodPropertiesService;

	@Value("${file.upload.directory}")
	private String fileUploadDirectory;
	
	@RequestMapping(value = "/searchgrid",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String searchgrid(){
		Page page = getPage();
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
		Integer oid = BackupUserContext.getContext().getUser().getOid();
		good.setNo(Creator.createGoodNo(oid));
		good.setOid(oid);
		good.setStatus(1);
		good.setSoldNum(0);
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
	 * 商品下架
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/remove",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	public String remove(String ids){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		goodService.removeGoods(ids);
		return toJson(model);
	}
	
	/**
	 * 商品上架
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/push",method = RequestMethod.POST,produces = "text/html;charset=utf-8")
	@ResponseBody
	public String push(String ids){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		goodService.pushGoods(ids);
		return toJson(model);
	}
	
	@RequestMapping(value = "/uploadPicSm",method = RequestMethod.POST)
	@ResponseBody
	public void uploadPicSm(Integer gid , MultipartHttpServletRequest request,HttpServletResponse response){
		Iterator<String> iterable = request.getFileNames();
		MultipartFile multipartFile;
		Good good = goodService.get(Good.class, gid);
		
		while(iterable.hasNext()){
			multipartFile = request.getFile(iterable.next());
			//设置文件名
			String fileName = good.getNo() + "-sm" + multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
			File file = new File(fileUploadDirectory + "/" + fileName);
			try{
				multipartFile.transferTo(file);
				good.setPicSm(fileName);
				goodService.update(good);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
	@RequestMapping(value = "/uploadPicMid",method = RequestMethod.POST)
	@ResponseBody
	public void uploadPicMid(Integer gid , MultipartHttpServletRequest request,HttpServletResponse response){
		Iterator<String> iterable = request.getFileNames();
		MultipartFile multipartFile;
		Good good = goodService.get(Good.class, gid);
		
		while(iterable.hasNext()){
			multipartFile = request.getFile(iterable.next());
			//设置文件名
			String fileName = good.getNo() + "-mid" + multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
			File file = new File(fileUploadDirectory + "/" + fileName);
			try{
				multipartFile.transferTo(file);
				good.setPicMid(fileName);
				goodService.update(good);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/uploadPicSeriesSm",method = RequestMethod.POST)
	@ResponseBody
	public void uploadPicSeriesSm(Integer gid , MultipartHttpServletRequest request,HttpServletResponse response){
		Iterator<String> iterable = request.getFileNames();
		MultipartFile multipartFile;
		Good good = goodService.get(Good.class, gid);
		Integer index = 0;
		String picSeriesSm = good.getSeriesSm();
		if(picSeriesSm == null){
			index = 0;
		}else{
			index = Integer.valueOf(picSeriesSm.substring(picSeriesSm.lastIndexOf("-") + 1, picSeriesSm.lastIndexOf(".")));
			index++;
		}
		String fileName = null;
		while(iterable.hasNext()){
			multipartFile = request.getFile(iterable.next());
			//设置文件名
			fileName = good.getNo() + "-series-sm-" + (index) + multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
			File file = new File(fileUploadDirectory + "/" + fileName);
			try{
				multipartFile.transferTo(file);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		good.setSeriesSm(picSeriesSm == null ? fileName : picSeriesSm + ";" + fileName);
		goodService.update(good);
	}
	
	@RequestMapping(value = "/uploadPicSeriesLg",method = RequestMethod.POST)
	@ResponseBody
	public void uploadPicSeriesLg(Integer gid , MultipartHttpServletRequest request,HttpServletResponse response){
		Iterator<String> iterable = request.getFileNames();
		MultipartFile multipartFile;
		Good good = goodService.get(Good.class, gid);
		
		while(iterable.hasNext()){
			multipartFile = request.getFile(iterable.next());
			//设置文件名
			String fileName = good.getNo() + "-mid" + multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
			File file = new File(fileUploadDirectory + "/" + fileName);
			try{
				multipartFile.transferTo(file);
				good.setPicMid(fileName);
				goodService.update(good);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
