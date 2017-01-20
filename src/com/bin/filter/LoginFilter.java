package com.bin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.bin.context.BackupUserContext;
import com.bin.context.UserContext;
import com.bin.model.BackupUser;
import com.bin.model.User;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse rep, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		if(request.getSession().getAttribute("user") != null){
			UserContext.setContext((User)request.getSession().getAttribute("user"));
		}
		if(request.getSession().getAttribute("backup_user") != null){
			BackupUserContext.setContext((BackupUser) request.getSession().getAttribute("backup_user"));
		}
		chain.doFilter(req, rep);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
