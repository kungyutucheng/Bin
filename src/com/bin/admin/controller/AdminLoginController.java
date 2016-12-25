package com.bin.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bin.base.BaseController;
import com.bin.contant.ViewName;
import com.bin.context.BackupUserContext;
import com.bin.model.BackupUser;
import com.bin.service.BackupUserService;

@Controller
@RequestMapping("/admin/login")
public class AdminLoginController extends BaseController{

	@Autowired
	private BackupUserService backupUserService;
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String username,@RequestParam String pwd){
		if(backupUserService.getCount("select count(*) from BackupUser where username = ? and pwd = ?", 
				username,pwd) == 1l){
			BackupUser backupUser = backupUserService.queryUnique(""
					+ "select new BackupUser(id,username,role,createTime,creator,oid) from BackupUser where username=? and pwd = ?", username,pwd);
			session.setAttribute("backup_user", backupUser);
			ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_INDEX);
			modelAndView.addObject("user", backupUser);
			BackupUserContext.setContext(backupUser);
			return modelAndView;
		}else{
			ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_LOGIN_PAGE);
			modelAndView.addObject("message", "用户名或密码错误");
			return modelAndView;
		}
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(){
		ModelAndView modelAndView = new ModelAndView(ViewName.ADMIN_LOGIN_PAGE);
		session.removeAttribute("backup_user");
		return modelAndView;
	}
}
