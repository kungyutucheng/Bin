package com.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "return_and_change")
public class ReturnAndChange {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 订单id
	 */
	@Column(name = "oid")
	private Integer oid;
	
	/**
	 * 商品编号
	 */
	@Column(name = "gNo")
	private String gNo;
	
	/**
	 * 申请时间
	 */
	@Column(name = "applyTime")
	private Date applyTime;
	
	/**
	 * 状态
	 * 1-处理中
	 * 2-已完成
	 */
	@Column(name = "_status")
	private Integer status;
	
	/**
	 * 类型
	 * 1-退货
	 * 2-换货
	 */
	@Column(name = "_type")
	private Integer type;
	
	/**
	 * 问题描述
	 */
	@Column(name = "description")
	private String description;
	
	/**
	 * 商品处理方式
	 * 1-退货
	 * 2-换货
	 */
	@Column(name = "dealWay")
	private Integer dealWay;
	
	/**
	 * 退款方式
	 * 1-返回余额
	 */
	@Column(name = "returnMoneyWay")
	private Integer returnMoneyWay;
	
	/**
	 * 寄送地址
	 */
	@Column(name = "resendAddr")
	private String resendAddr;
	
	/**
	 * 收货人
	 */
	@Column(name = "receiver")
	private String receiver;
	
	/**
	 * 联系电话
	 */
	@Column(name = "tel")
	private String tel;
	
	/**
	 * 运费
	 */
	@Column(name = "deliveryFare")
	private BigDecimal deliveryFare;
	
	/**
	 * 快递公司
	 */
	@Column(name = "express")
	private String express;
	
	/**
	 * 快递单号
	 */
	@Column(name = "expressNo")
	private String expressNo;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	private Date createTime;
	
	/**
	 * 换货信息
	 */
	@Column(name = "rechangeMsg")
	private String rechangeMsg;
	
	/**
	 * 重新寄送时间
	 */
	@Column(name = "resendTime")
	private Date resendTime;
	
	/**
	 * 审核通过时间
	 */
	@Column(name = "passTime")
	private Date passTime;
	
	/**
	 * 卖家收到货物时间
	 */
	@Column(name = "receiveTime")
	private Date receiveTime;
	
	/**
	 * 完成时间
	 */
	@Column(name = "finishTime")
	private Date finishTime;
	
	
	public ReturnAndChange() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getOid() {
		return oid;
	}


	public void setOid(Integer oid) {
		this.oid = oid;
	}


	public String getgNo() {
		return gNo;
	}


	public void setgNo(String gNo) {
		this.gNo = gNo;
	}


	public Date getApplyTime() {
		return applyTime;
	}


	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Integer getDealWay() {
		return dealWay;
	}


	public void setDealWay(Integer dealWay) {
		this.dealWay = dealWay;
	}


	public Integer getReturnMoneyWay() {
		return returnMoneyWay;
	}


	public void setReturnMoneyWay(Integer returnMoneyWay) {
		this.returnMoneyWay = returnMoneyWay;
	}


	public String getResendAddr() {
		return resendAddr;
	}


	public void setResendAddr(String resendAddr) {
		this.resendAddr = resendAddr;
	}


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public BigDecimal getDeliveryFare() {
		return deliveryFare;
	}


	public void setDeliveryFare(BigDecimal deliveryFare) {
		this.deliveryFare = deliveryFare;
	}


	public String getExpress() {
		return express;
	}


	public void setExpress(String express) {
		this.express = express;
	}


	public String getExpressNo() {
		return expressNo;
	}


	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public String getRechangeMsg() {
		return rechangeMsg;
	}


	public void setRechangeMsg(String rechangeMsg) {
		this.rechangeMsg = rechangeMsg;
	}


	public Date getResendTime() {
		return resendTime;
	}


	public void setResendTime(Date resendTime) {
		this.resendTime = resendTime;
	}


	public Date getPassTime() {
		return passTime;
	}


	public void setPassTime(Date passTime) {
		this.passTime = passTime;
	}


	public Date getReceiveTime() {
		return receiveTime;
	}


	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}


	public Date getFinishTime() {
		return finishTime;
	}


	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}


	@Override
	public String toString() {
		return "ReturnAndChange [id=" + id + ", oid=" + oid + ", gNo=" + gNo + ", applyTime=" + applyTime + ", status="
				+ status + ", type=" + type + ", description=" + description + ", dealWay=" + dealWay
				+ ", returnMoneyWay=" + returnMoneyWay + ", resendAddr=" + resendAddr + ", receiver=" + receiver
				+ ", tel=" + tel + ", deliveryFare=" + deliveryFare + ", express=" + express + ", expressNo="
				+ expressNo + ", createTime=" + createTime + ", rechangeMsg=" + rechangeMsg + ", resendTime="
				+ resendTime + ", passTime=" + passTime + ", receiveTime=" + receiveTime + ", finishTime=" + finishTime
				+ "]";
	}
	
}
