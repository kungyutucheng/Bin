package com.bin.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Creator {

	public static synchronized String createGoodNo(Integer oid){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + oid;
	}
}
