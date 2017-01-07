package com.bin.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bin.base.BaseController;
import com.bin.contant.ViewName;
import com.bin.model.Brand;
import com.bin.service.BrandSerivce;
import com.bin.service.GoodService;
import com.bin.util.Page;

@Controller
@RequestMapping(value = "/home/good")
public class GoodController extends BaseController{

	@Autowired
	private GoodService goodService;
	
	@Autowired
	private BrandSerivce brandService;
	
	@RequestMapping(value = "/search",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView search(@RequestParam String keyword){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(ViewName.HOME_SEARCH_RESULT_PAGE);
		modelAndView.addObject("keyword",keyword);
		List<Brand> brands = brandService.queryList("from Brand where keyword like ?","%" +keyword + "%");
		modelAndView.addObject("brands", brands);
		modelAndView.addObject("brandsLength", brands.size());
		return modelAndView;
	}
	
	@RequestMapping(value = "/getGoodList", method = {RequestMethod.GET,RequestMethod.POST},produces = "text/html;charset=utf-8")
	@ResponseBody
	public String getGoodList(){
		Page page = getPage();
		Page page2 = goodService.search(page);
		return toJson(page2);
	}
}
