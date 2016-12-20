package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "growth_value")
public class GrowthValue {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 用户id
	 */
	@Column(name = "_uid")
	private Integer uid;
	
	/**
	 * 成长值
	 */
	@Column(name = "_value")
	private Integer value;
	
	/**
	 * 来源
	 * 1-登录
	 * 2-购物
	 * 3-评价
	 * 4-退货
	 */
	@Column(name = "source")
	private Integer source;
	
	/**
	 * 发放或扣减时间
	 */
	@Column(name = "createTime")
	private Date createTime;
	
	/**
	 * 来源详情
	 */
	@Column(name = "detail")
	private String detail;
	
	public GrowthValue() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Integer getSource() {
		return source;
	}

	public void setSource(Integer source) {
		this.source = source;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "GrowthValue [id=" + id + ", uid=" + uid + ", value=" + value + ", source=" + source + ", createTime="
				+ createTime + ", detail=" + detail + "]";
	}
	
}
