package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "_comment")
public class Comment {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 评价等级
	 * 上限5
	 * 下限0
	 * 取整
	 */
	@Column(name = "score")
	private Integer score;
	
	/**
	 * 商品id
	 */
	@Column(name = "gid")
	private Integer gid;
	
	/**
	 * 用户id
	 */
	@Column(name = "uid")
	private Integer uid;
	
	/**
	 * 评价内容
	 */
	@Column(name = "content")
	private String content;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	/**
	 * 订单id
	 */
	@Column(name = "oid")
	private Integer oid;
	
	/**
	 * 商品属性id
	 */
	@Column(name = "gpid")
	private Integer gpid;
	
	/**
	 * 是否匿名
	 */
	@Column(name = "isAnonymous")
	private Integer isAnonymous;
	
	@Transient
	private Good good;
	
	@Transient
	private GoodProperty goodProperty;
	
	@Transient
	private Order order;
	
	@Transient
	private User user;
	
	public Comment() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getGpid() {
		return gpid;
	}

	public void setGpid(Integer gpid) {
		this.gpid = gpid;
	}

	public Integer getIsAnonymous() {
		return isAnonymous;
	}

	public void setIsAnonymous(Integer isAnonymous) {
		this.isAnonymous = isAnonymous;
	}

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public GoodProperty getGoodProperty() {
		return goodProperty;
	}

	public void setGoodProperty(GoodProperty goodProperty) {
		this.goodProperty = goodProperty;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", score=" + score + ", gid=" + gid + ", uid=" + uid + ", content=" + content
				+ ", createTime=" + createTime + ", oid=" + oid + ", gpid=" + gpid + ", isAnonymous=" + isAnonymous
				+ ", good=" + good + ", goodProperty=" + goodProperty + ", order=" + order + ", user=" + user + "]";
	}
	
}
