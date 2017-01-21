package com.bin.base;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.WebApplicationContext;

import com.bin.model.User;
import com.bin.util.Page;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class BaseController {

	protected User user;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected ApplicationContext applicationContext;
	
	/**
	 * ModelAttribute属性会在此controller的每个方法执行前被执行
	 * @param request
	 * @param response
	 */
	@ModelAttribute
	public void setRequestAndResponse(HttpServletRequest request,HttpServletResponse response){
		try{
			request.setCharacterEncoding("utf-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		this.user = (User) this.session.getAttribute("bin_user");
		this.applicationContext = (WebApplicationContext) request.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
	}
	
	public Map<String, Object> getAllParams(boolean isAllowNull){
		Map<String, Object> map = new HashMap<String,Object>();
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String key = (String) params.nextElement();
			String value = request.getParameter(key);
			if(isAllowNull){
				if(value == null || value.equals("")){
					map.put(key, null);
				}else{
					map.put(key, value);
				}
			}else{
				map.put(key, value);
			}
		}
		return map;
	}
	
	/**
	 * 获取string类型的参数
	 * @param name
	 * @return
	 */
	public String getString(String name){
		try{
			return request.getParameter(name);
		}catch(Exception e){
			return null;
		}
	}
	
	/**
	 * 获取int类型的参数
	 * @param name
	 * @return
	 */
	public Integer getInt(String name){
		try{
			return Integer.valueOf(request.getParameter(name));
		}catch(Exception e){
			return null;
		}
	}
	
	/**
	 * 获取float类型的参数
	 * @param name
	 * @return
	 */
	public Float getFloat(String name){
		try{
			return Float.valueOf(request.getParameter(name));
		}catch(Exception e){
			return null;
		}
	}
	
	/**
	 * 获取double类型的参数
	 * @param name
	 * @return
	 */
	public Double getDouble(String name){
		try{
			return Double.valueOf(request.getParameter(name));
		}catch(Exception e){
			return null;
		}
	}
	
	/**
	 * 获取bool类型的参数
	 * @param name
	 * @return
	 */
	public Boolean getBool(String name){
		try{
			return Boolean.valueOf(request.getParameter(name));
		}catch(Exception e){
			return null;
		}
	}
	
	/**
	 * 根据参数组建分页类 
	 * @return
	 */
	public Page getPage(){
		
		Page page = new Page();
		if(getInt(Page.PAGE_NO) != null){
			page.setPage(getInt(Page.PAGE_NO).intValue());
		}else{
			page.setPage(1);
		}
		if(request.getParameter(Page.PAGE_SIZE) != null){
			String pageSize = request.getParameter(Page.PAGE_SIZE);
			if(pageSize.trim().equals("全部")){
				page.setShowAll(true);
			}else{
				page.setPageSize(getInt(Page.PAGE_SIZE).intValue());
			}
		}else{
			page.setPageSize(1);
		}
		
		if(request.getParameter(Page.IS_SHOW_ALL) != null){
			page.setShowAll(Boolean.valueOf(request.getParameter(Page.IS_SHOW_ALL)));
		}
		page.setParams(getAllParams(true));
		return page;
	}
	
	public String toJson(Object value){
		GsonBuilder builder = new GsonBuilder();
		builder.serializeNulls();
		Gson gson = builder.create();
		return gson.toJson(value);
	}
	
	
}
