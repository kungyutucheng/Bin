package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "backup_user")
public class BackupUser {
	
	public static final Integer ROLE_DEVELOPER = 1;
	public static final Integer ROLE_ADMIN = 2;
	public static final Integer ROLE_USER = 3;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	/**
	 * 创建者
	 */
	@Column(name = "creator")
	private String creator;
	
	/**
	 * 商家id
	 */
	@Column(name = "oid")
	private Integer oid;
	
	public BackupUser() {
	}
	
	public BackupUser(Integer id, String username, Integer role, Date createTime, String creator,
			Integer oid) {
		super();
		this.id = id;
		this.username = username;
		this.role = role;
		this.createTime = createTime;
		this.creator = creator;
		this.oid = oid;
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

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	@Override
	public String toString() {
		return "BackupUser [id=" + id + ", username=" + username + ", pwd=" + pwd + ", role=" + role + ", createTime="
				+ createTime + ", creator=" + creator + ", oid=" + oid + "]";
	}

	
}
