package com.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name = "return_and_change")
public class ReturnAndChange {

	
	public static final Integer STATUS_DEALING = 1;
	public static final Integer STATUS_PASS = 2;
	public static final Integer STATUS_RECEIVE = 3;
	public static final Integer STATUS_REOUT = 4;
	public static final Integer STATUS_PAY = 5;
	public static final Integer STATUS_FINISH = 6;
	
	public static final Integer TYPE_RETURN = 1;
	public static final Integer TYPE_CHANGE = 2;
	
	public static final Integer FINAL_TYPE_RETURN = 1;
	public static final Integer FINAL_TYPE_CHANGE = 2;
	
	
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 订单id
	 */
	@Column(name = "ogid")
	private Integer ogid;
	
	/**
	 * 商品编号
	 */
	@Column(name = "gNo")
	private String gNo;
	
	/**
	 * 申请时间
	 */
	@Column(name = "applyTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date applyTime;
	
	/**
	 * 状态
	 * 1-已提交
	 * 2-已审核
	 * 3-已收货
	 * 4-已发货
	 * 5-已退款
	 * 6-已完成
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
	@Column(name = "province")
	private String province;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "county")
	private String county;
	
	@Column(name = "address")
	private String address;
	
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
	@NumberFormat(style = Style.NUMBER)
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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date resendTime;
	
	/**
	 * 审核通过时间
	 */
	@Column(name = "passTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date passTime;
	
	/**
	 * 卖家收到货物时间
	 */
	@Column(name = "receiveTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date receiveTime;
	
	/**
	 * 完成时间
	 */
	@Column(name = "finishTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date finishTime;
	
	/**
	 * 数量
	 */
	@Column(name = "num")
	private Integer num;
	
	/**
	 * 退款金额
	 */
	@Column(name = "returnMoney")
	private BigDecimal returnMoney;
	
	/**
	 * 售后服务单号
	 */
	@Column(name = "no")
	private String no;
	
	/**
	 * 所属用户id
	 */
	private Integer uid;
	
	@Transient
	private OrderGood orderGood;
	
	public ReturnAndChange() {
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getOgid() {
		return ogid;
	}


	public void setOgid(Integer ogid) {
		this.ogid = ogid;
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
	
	public Integer getNum() {
		return num;
	}


	public void setNum(Integer num) {
		this.num = num;
	}
	
	public String getNo() {
		return no;
	}


	public void setNo(String no) {
		this.no = no;
	}

	public OrderGood getOrderGood() {
		return orderGood;
	}


	public void setOrderGood(OrderGood orderGood) {
		this.orderGood = orderGood;
	}


	public BigDecimal getReturnMoney() {
		return returnMoney;
	}


	public void setReturnMoney(BigDecimal returnMoney) {
		this.returnMoney = returnMoney;
	}


	public Integer getUid() {
		return uid;
	}


	public void setUid(Integer uid) {
		this.uid = uid;
	}


	@Override
	public String toString() {
		return "ReturnAndChange [id=" + id + ", ogid=" + ogid + ", gNo=" + gNo + ", applyTime=" + applyTime
				+ ", status=" + status + ", type=" + type + ", description=" + description + ", dealWay=" + dealWay
				+ ", returnMoneyWay=" + returnMoneyWay + ", province=" + province + ", city=" + city + ", county="
				+ county + ", address=" + address + ", receiver=" + receiver + ", tel=" + tel + ", deliveryFare="
				+ deliveryFare + ", express=" + express + ", expressNo=" + expressNo + ", createTime=" + createTime
				+ ", rechangeMsg=" + rechangeMsg + ", resendTime=" + resendTime + ", passTime=" + passTime
				+ ", receiveTime=" + receiveTime + ", finishTime=" + finishTime + ", num=" + num + ", returnMoney="
				+ returnMoney + ", no=" + no + ", uid=" + uid + ", orderGood=" + orderGood + "]";
	}


	
}
