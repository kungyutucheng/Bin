package com.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "_order")
public class Order {
	
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
	 * 收货地址id
	 */
	@Column(name = "aid")
	private Integer aid;
	
	/**
	 * 订单号
	 */
	@Column(name = "_no")
	private String no;
	
	/**
	 * 状态
	 * 1-待付款
	 * 2-已取消
	 * 3-待收货
	 * 4-待评价
	 * 5-已完成
	 */
	@Column(name = "_status")
	private Integer status;
	
	/**
	 * 支付方式
	 * 1-在线支付
	 * 2-货到付款
	 */
	@Column(name = "payWay")
	private Integer payWay;
	
	/**
	 * 付款时间
	 */
	@Column(name = "payTime")
	private Date payTime;
	
	/**
	 * 商品总额
	 */
	@Column(name = "totalValue")
	private BigDecimal totalValue;
	
	/**
	 * 发票抬头
	 */
	@Column(name = "receiptName")
	private String receiptName;
	
	/**
	 * 发票内容
	 */
	@Column(name = "receiptContent")
	private String receiptContent;
	
	/**
	 * 发货时间
	 */
	@Column(name = "outTime")
	private Date outTime;
	
	/**
	 * 完成时间
	 */
	@Column(name = "confirmTime")
	private Date confirmTime;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	private Date createTime;
	
	/**
	 * 成长值
	 */
	@Column(name = "score")
	private Integer score;
	
	public Order() {
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

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPayWay() {
		return payWay;
	}

	public void setPayWay(Integer payWay) {
		this.payWay = payWay;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public BigDecimal getTotalValue() {
		return totalValue;
	}

	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue;
	}

	public String getReceiptName() {
		return receiptName;
	}

	public void setReceiptName(String receiptName) {
		this.receiptName = receiptName;
	}

	public String getReceiptContent() {
		return receiptContent;
	}

	public void setReceiptContent(String receiptContent) {
		this.receiptContent = receiptContent;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public Date getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(Date confirmTime) {
		this.confirmTime = confirmTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", uid=" + uid + ", aid=" + aid + ", no=" + no + ", status=" + status + ", payWay="
				+ payWay + ", payTime=" + payTime + ", totalValue=" + totalValue + ", receiptName=" + receiptName
				+ ", receiptContent=" + receiptContent + ", outTime=" + outTime + ", confirmTime=" + confirmTime
				+ ", createTime=" + createTime + ", score=" + score + "]";
	}
	
	
}
