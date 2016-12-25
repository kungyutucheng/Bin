package com.bin.context;

import com.bin.model.User;

public class UserContext{
	private static ThreadLocal<UserContext> threadLocal = new ThreadLocal<UserContext>();
	
	private User user;
	
	private UserContext(User user){
		this.user = user;
	}
	
	public static UserContext getContext(){
		return threadLocal.get();
	}
	
	public static void setContext(User user){
		threadLocal.set(new UserContext(user));
	}
	
	public User getUser(){
		return user;
	}
}
