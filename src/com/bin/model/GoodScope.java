package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "good_scope")
@Entity
public class GoodScope {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 类型名称
	 */
	@Column(name = "_name")
	private String name;
	
	/**
	 * 类型值
	 */
	@Column(name = "_value")
	private Integer value;
	
	/**
	 * 排序id
	 */
	@Column(name = "sort")
	private Integer sort;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
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

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
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
		return "GoodScope [id=" + id + ", name=" + name + ", value=" + value + ", sort=" + sort + ", createTime="
				+ createTime + "]";
	}
	
}
