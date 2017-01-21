package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "exception_log")
public class ExceptionLog {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 用户名
	 */
	@Column(name = "username")
	private String username;
	
	/**
	 * 异常代码
	 */
	@Column(name = "_name")
	private String name;
	
	/**
	 * 方法名
	 */
	@Column(name = "method")
	private String method;
	
	/**
	 * 参数
	 */
	@Column(name = "params")
	private String params;
	
	/**
	 * 详情
	 */
	@Column(name = "detail")
	private String detail;
	
	/**
	 * 描述
	 */
	@Column(name = "description")
	private String description;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	public ExceptionLog() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "ExceptionLog [id=" + id + ", username=" + username + ", name=" + name + ", method=" + method
				+ ", params=" + params + ", detail=" + detail + ", description=" + description + ", createTime="
				+ createTime + "]";
	}
	
}
