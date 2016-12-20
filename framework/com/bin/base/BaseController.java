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
import com.google.gson.Gson;

public class BaseController {

	protected User user;
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	protected ApplicationContext applicationContext;
	
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
	
	public String toJson(Object value){
		return new Gson().toJson(value);
	}
	
}
