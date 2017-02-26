package com.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "cart")
public class Cart {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 用户id
	 */
	@Column(name = "uid")
	private Integer uid;
	
	/**
	 * 商品id
	 */
	@Column(name = "gid")
	private Integer gid;
	
	/**
	 * 数量
	 */
	@Column(name = "num")
	private Integer num;
	
	/**
	 * 商品特性
	 */
	@Column(name = "gpId")
	private Integer gpId;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	@Transient
	private String goodName;
	
	@Transient
	private String goodPropertyName;
	
	@Transient
	private BigDecimal price;
	
	@Transient
	private String picSmall;
	
	public Cart() {
	}
	
	public Cart(Integer id, Integer gid, Integer uid, Integer num, Integer gpId, Date createTime, String goodName,
			String goodPropertyName, BigDecimal price,String picSmall) {
		super();
		this.id = id;
		this.uid = uid;
		this.gid = gid;
		this.num = num;
		this.gpId = gpId;
		this.createTime = createTime;
		this.goodName = goodName;
		this.goodPropertyName = goodPropertyName;
		this.price = price;
		this.picSmall = picSmall;
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

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	
	public Integer getGpId() {
		return gpId;
	}

	public void setGpId(Integer gpId) {
		this.gpId = gpId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getGoodPropertyName() {
		return goodPropertyName;
	}

	public void setGoodPropertyName(String goodPropertyName) {
		this.goodPropertyName = goodPropertyName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getPicSmall() {
		return picSmall;
	}

	public void setPicSmall(String picSmall) {
		this.picSmall = picSmall;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", uid=" + uid + ", gid=" + gid + ", num=" + num + ", gpId=" + gpId + ", createTime="
				+ createTime + ", goodName=" + goodName + ", goodPropertyName=" + goodPropertyName + ", price=" + price
				+ ", picSmall=" + picSmall + "]";
	}

}
