package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "express")
public class Express {
	
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	

	/**
	 * 名称
	 */
	@Column(name = "_name")
	private String name;
	
	/**
	 * 排序id
	 */
	@Column(name = "sort")
	private Integer sort;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Express [id=" + id + ", name=" + name + ", sort=" + sort + ", createTime=" + createTime + "]";
	}
	
	
	
}
