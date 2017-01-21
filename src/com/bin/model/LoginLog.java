package com.bin.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "login_log")
public class LoginLog {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 登陆者
	 */
	@Column(name = "username")
	private String username;
	
	/**
	 * 登录IP
	 */
	@Column(name = "ip")
	private String ip;
	
	/**
	 * 退出登录的时间
	 */
	@Column(name = "logoutTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date logoutTime;
	
	/**
	 * 登录时间
	 */
	@Column(name = "loginTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date loginTime;
	
	public LoginLog() {
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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(Date logoutTime) {
		this.logoutTime = logoutTime;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	@Override
	public String toString() {
		return "LoginLog [id=" + id + ", username=" + username + ", ip=" + ip + ", logoutTime=" + logoutTime
				+ ", loginTime=" + loginTime + "]";
	}
	
}
