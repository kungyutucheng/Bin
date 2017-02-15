package com.bin.vo;

import java.util.Date;

public class GoodChartVO {

	private Date date;
	private Integer num;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "GoodChartVO [date=" + date + ", num=" + num + "]";
	}
	
	
}
