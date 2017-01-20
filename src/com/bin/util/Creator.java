package com.bin.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.bin.context.UserContext;
import com.mysql.fabric.xmlrpc.base.Data;

public class Creator {

	public static synchronized String createGoodNo(Integer oid){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + oid;
	}
	
	public static synchronized String createOrderNo(){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
				+ UserContext.getContext().getUser().getId();
	}
}
