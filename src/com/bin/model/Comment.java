package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

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
	@Column(name = "star")
	private Integer star;
	
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

	public Comment() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
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

	@Override
	public String toString() {
		return "Comment [id=" + id + ", star=" + star + ", gid=" + gid + ", uid=" + uid + ", content=" + content
				+ ", createTime=" + createTime + "]";
	}
	
}
