package com.bin.admin.controller;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.contant.ViewName;
import com.bin.context.BackupUserContext;
import com.bin.databinder.helper.GoodPropertiesListForm;
import com.bin.home.controller.GoodController;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.model.Owner;
import com.bin.service.GoodPropertyService;
import com.bin.service.GoodService;
import com.bin.service.OwnerService;
import com.bin.util.AjaxModel;
import com.bin.util.Creator;
import com.bin.util.Page;

@Controller
@RequestMapping(value = "/admin/good")
public class AdminGoodController extends BaseController{
	
	public static final Integer PAGE_SIZE = 10;
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private GoodPropertyService goodPropertyService;
	
	@Autowired
	private OwnerService ownerService;

	@Value("${file.upload.directory}")
	private String fileUploadDirectory;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	@MyException
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_GOOD_LIST);
		Page page = goodService.queryPage(getPage());
		Long pageCount = page.getTotal() % page.getPageSize() == 0 ?
				page.getTotal() / page.getPage() : (page.getTotal() / page.getPageSize() + 1l);
		List<Good> goods = page.getRows();
		for(Good good : goods){
			good.setOwner(ownerService.get(Owner.class, good.getOid()));
		}
		modelAndView.addObject("goods", page.getRows());
		modelAndView.addObject("page", page.getPage());
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.addObject("params", getPage().getParams());
		return modelAndView;
	}
	
	@RequestMapping(value = "/getById/{id}" , method = RequestMethod.POST , produces = "text/html;charset=utf-8")
	@MyException
	@ResponseBody
	public String getById(@PathVariable Integer id){
		Good good = goodService.get(Good.class, id);
		good.setOwner(ownerService.get(Owner.class, good.getOid()));
		return toJson(good);
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
		for(GoodProperty goodProperties : properties.getGoodProperties()){
			goodProperties.setCreateTime(date);
			goodProperties.setGid(gid);
			goodProperties.setIsDefault(1);
		}
		goodPropertyService.saveAll(properties.getGoodProperties(), GoodProperty.class);
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
		List<GoodProperty> updateProperties = new ArrayList<GoodProperty>();
		List<GoodProperty> newProperties = new ArrayList<GoodProperty>();
		
		List<String> columnNames = new ArrayList<String>();
		columnNames.add("name");
		columnNames.add("price");
		columnNames.add("num");
		
		Date date = new Date();
		for(GoodProperty goodProperties : goodPropertiesListForm.getGoodProperties()){
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
			goodPropertyService.saveAll(newProperties, GoodProperty.class);
		}
		if(updateProperties.size() > 0){
			goodPropertyService.updateAll(updateProperties, GoodProperty.class,columnNames);
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
	@MyException
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
	@MyException
	public String push(String ids){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		goodService.pushGoods(ids);
		return toJson(model);
	}
	
	@RequestMapping(value = "/uploadPicSm",method = RequestMethod.POST)
	@ResponseBody
	@MyException
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
	@MyException
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
	@MyException
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
	@MyException
	public void uploadPicSeriesLg(Integer gid , MultipartHttpServletRequest request,HttpServletResponse response){
		Iterator<String> iterable = request.getFileNames();
		MultipartFile multipartFile;
		Good good = goodService.get(Good.class, gid);
		String seriesLg = good.getSeriesLg();
		Integer index = 0;
		if(seriesLg == null){
			index = 0;
		}else{
			index = Integer.valueOf(seriesLg.substring(seriesLg.lastIndexOf("-") + 1, seriesLg.lastIndexOf(".")));
			index++;
		}
		while(iterable.hasNext()){
			multipartFile = request.getFile(iterable.next());
			//设置文件名
			String fileName = good.getNo() + "-lg-" + (index) + multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
			File file = new File(fileUploadDirectory + "/" + fileName);
			try{
				multipartFile.transferTo(file);
			}catch(Exception e){
				e.printStackTrace();
			}
			good.setSeriesLg(seriesLg == null ? fileName : seriesLg + ";" + fileName);
			goodService.update(good);
		}
	}
	
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	@MyException
	public ModelAndView detail(@PathVariable Integer id){
		ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_GOOD_DATA_COUNT);
		modelAndView.addObject("good", goodService.get(Good.class, id));
		return modelAndView;
	}
	
	@RequestMapping(value = "/countByMonth" , method = RequestMethod.POST , produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String countByMonth(@RequestParam Integer id , @RequestParam Integer year){
		return toJson(goodService.countByMonth(id, year));
	}
	
	@RequestMapping(value = "/countByDay" , method = RequestMethod.POST , produces = "text/html;charset=utf-8")
	@ResponseBody
	@MyException
	public String countByDay(@RequestParam Integer id , @RequestParam String time){
		String [] temp = time.split("-");
		Integer year = Integer.valueOf(temp[0]);
		Integer month = Integer.valueOf(temp[1]);
		return toJson(goodService.countByDay(id, year, month));
	}
}
