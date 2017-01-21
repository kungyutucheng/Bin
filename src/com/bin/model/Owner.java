package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "_owner")
public class Owner {
	
	public static final Integer TYPE_SELF = 1;
	public static final Integer TYPE_OTHER = 2;
	
	public static final Integer STATUS_UNDER_REVIEW = 1;
	public static final Integer STATUS_PASSED = 2;
	public static final Integer STATUS_LEAVE = 3;
	

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
	 * 图片地址
	 */
	@Column(name = "logo")
	private String logo;
	
	/**
	 * 商家类型
	 * 1-自营
	 * 2-第三方
	 */
	@Column(name = "_type")
	private Integer type;
	
	/**
	 * 评分
	 * 默认5
	 */
	@Column(name = "score")
	private Double score;
	
	/**
	 * 状态
	 * 1-审核中
	 * 2-审核通过
	 * 3-撤离
	 * 默认1
	 */
	@Column(name = "_status")
	private Integer status;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	/**
	 * 审核通过时间
	 */
	@Column(name = "passTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date passTime;
	
	public Owner() {
	}

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

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getPassTime() {
		return passTime;
	}

	public void setPassTime(Date passTime) {
		this.passTime = passTime;
	}

	@Override
	public String toString() {
		return "Owner [id=" + id + ", name=" + name + ", logo=" + logo + ", type=" + type + ", score=" + score
				+ ", status=" + status + ", createTime=" + createTime + ", passTime=" + passTime + "]";
	}
	
	
}
