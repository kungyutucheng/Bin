package com.bin.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.ViewName;
import com.bin.model.Brand;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.model.Owner;
import com.bin.service.BrandSerivce;
import com.bin.service.CommentService;
import com.bin.service.GoodPropertyService;
import com.bin.service.GoodService;
import com.bin.service.OwnerService;
import com.bin.util.Page;
import com.sun.org.apache.bcel.internal.generic.LNEG;

@Controller
@RequestMapping(value = "/home/good")
public class GoodController extends BaseController{

	@Autowired
	private GoodService goodService;
	
	@Autowired
	private BrandSerivce brandService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private GoodPropertyService goodPropertyService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/search",method = {RequestMethod.GET,RequestMethod.POST})
	@MyException
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
	@MyException
	public String getGoodList(){
		Page page = getPage();
		Page page2 = goodService.search(page);
		return toJson(page2);
	}
	
	@RequestMapping(value = "/detail/{id}",method = {RequestMethod.POST,RequestMethod.GET})
	@MyException
	public ModelAndView detail(@PathVariable Integer id){
		if (id == null || id == 0) {
			return new ModelAndView(ViewName.ERROR_404);
		}else{
			Good good = goodService.get(Good.class, id);
			Owner owner = ownerService.get(Owner.class, good.getOid());
			List<GoodProperty> goodProperties = goodPropertyService.queryList(
					"from GoodProperty where gid = ?", good.getId());
			ModelAndView modelAndView = new ModelAndView(ViewName.HOME_GOOD_DETAIL);
			Long goodCount = commentService.getCount("from Comment where gid = ? and score > 3", id);
			Long midCount = commentService.getCount("from Comment where gid = ? and score = 3", id);
			Long badCount = commentService.getCount("from Comment where gid = ? and score < 3", id);
			double goodPercent = Math.floor(goodCount * 100 / (goodCount + midCount + badCount));
			modelAndView.addObject("good", good);
			modelAndView.addObject("owner", owner);
			modelAndView.addObject("goodProperties", goodProperties);
			modelAndView.addObject("goodCount", goodCount);
			modelAndView.addObject("midCount" , midCount);
			modelAndView.addObject("badCount", badCount);
			modelAndView.addObject("goodPercent", goodPercent);
			return modelAndView;
		}
	}
}
