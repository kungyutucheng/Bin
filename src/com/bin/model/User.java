package com.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "_user")
public class User {

	
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 账户，邮箱或手机号
	 */
	@Column(name = "account")
	private String account;
	
	/**
	 * 密码
	 */
	@Column(name = "pwd")
	private String pwd;
	
	/**
	 * 昵称
	 */
	@Column(name = "_name")
	private String name;
	
	/**
	 * 积分
	 * 默认0
	 */
	@Column(name = "score")
	private Integer score;
	
	/**
	 * 性别
	 * 1-男性
	 * 2-女性
	 * 3-保密
	 */
	@Column(name = "gender")
	private Integer gender;
	
	/**
	 * 生日
	 */
	@Column(name = "birthday")
	private Date birthday;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	private Date createTime;
	
	/**
	 * 账户余额
	 */
	@Column(name = "balance")
	private BigDecimal balance;
	
	public User() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", pwd=" + pwd + ", name=" + name + ", score=" + score
				+ ", gender=" + gender + ", birthday=" + birthday + ", createTime=" + createTime + ", balance="
				+ balance + "]";
	}
	
	
}
