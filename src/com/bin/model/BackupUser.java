package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "backup_user")
public class BackupUser {

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
	 * 密码
	 */
	@Column(name = "pwd")
	private String pwd;
	
	/**
	 * 角色
	 * 1-开发者
	 * 2-管理员
	 * 3-商户
	 */
	@Column(name = "role")
	private Integer role;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	private Date createTime;
	
	/**
	 * 创建者
	 */
	@Column(name = "creator")
	private String creator;
	
	public BackupUser() {
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	@Override
	public String toString() {
		return "BackupUser [id=" + id + ", username=" + username + ", pwd=" + pwd + ", role=" + role + ", createTime="
				+ createTime + ", creator=" + creator + "]";
	}
	
}
