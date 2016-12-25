package com.bin.context;

import com.bin.model.BackupUser;

public class BackupUserContext {

	private static ThreadLocal<BackupUserContext> threadLocal = new ThreadLocal<BackupUserContext>();
	
	private BackupUser user;
	
	private BackupUserContext(BackupUser user){
		this.user = user;
	}
	
	public static BackupUserContext getContext(){
		return threadLocal.get();
	}
	
	public static void setContext(BackupUser user){
		threadLocal.set(new BackupUserContext(user));
	}
	
	public BackupUser getUser(){
		return user;
	}
	
}
