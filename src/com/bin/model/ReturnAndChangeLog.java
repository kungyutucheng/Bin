package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "return_and_change_log")
public class ReturnAndChangeLog {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 退货/换货id
	 */
	@Column(name = "rid")
	private Integer rid;
	
	/**
	 * 信息
	 */
	@Column(name = "msg")
	private String msg;
	
	/**
	 * 操作人
	 */
	@Column(name = "operator")
	private String operator;
	
	/**
	 * 操作时间
	 */
	@Column(name = "oeprateTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date operateTime;
	
	public ReturnAndChangeLog() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Date getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Override
	public String toString() {
		return "ReturnAndChangeLog [id=" + id + ", rid=" + rid + ", msg=" + msg + ", operator=" + operator
				+ ", operateTime=" + operateTime + "]";
	}

}