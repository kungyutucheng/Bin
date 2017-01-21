package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "address")
public class Address {
	
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
	 * 姓名
	 */
	@Column(name = "_name")
	private String name;
	
	/**
	 * 省份
	 */
	@Column(name = "province")
	private String province;
	
	/**
	 * 城市
	 */
	@Column(name = "city")
	private String city;
	
	/**
	 * 县区
	 */
	@Column(name = "county")
	private String county;
	
	/**
	 * 详细地址
	 */
	@Column(name = "address")
	private String address;
	
	/**
	 * 电话
	 */
	@Column(name = "tel")
	private String tel;
	
	/**
	 * 是否为默认地址
	 * 1-否
	 * 2-是
	 */
	@Column(name = "isDefault")
	private Integer isDefault;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	/**
	 * 逻辑删除标记
	 * 1-有效
	 * 2-无效
	 * 默认1
	 */
	@Column(name = "_disable")
	private Integer disable;

	public Address() {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getDisable() {
		return disable;
	}

	public void setDisable(Integer disable) {
		this.disable = disable;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", uid=" + uid + ", name=" + name + ", province=" + province + ", city=" + city
				+ ", county=" + county + ", address=" + address + ", tel=" + tel + ", isDefault=" + isDefault
				+ ", createTime=" + createTime + ", disable=" + disable + "]";
	}
	
	
}
