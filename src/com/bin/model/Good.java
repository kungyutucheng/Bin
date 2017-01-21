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
@Table(name = "good")
public class Good {
	
	public static final Integer STATUS_PREPARING = 1;
	public static final Integer STATUS_ONLINE = 2;
	public static final Integer STATUS_OFFLINE = 3;
	

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	
	/**
	 * 商品名称
	 */
	@Column(name = "_name")
	private String name;
	
	/**
	 * 商品编号
	 */
	@Column(name = "_no")
	private String no;
	
	
	/**
	 * 商家id
	 */
	@Column(name = "oid")
	private Integer oid;
	
	@Transient
	private String owner;
	
	/**
	 * 状态
	 * 1-上架中
	 * 2-已上架
	 * 3-已下架
	 */
	@Column(name = "_status")
	private Integer status;
	
	/**
	 * 信息
	 */
	@Column(name = "msg")
	private String msg;
	
	/**
	 * 已售数量
	 */
	@Column(name = "soldNum")
	private Integer soldNum;
	
	/**
	 * 品牌
	 */
	@Column(name = "brand")
	private String brand;
	
	/**
	 * 属性
	 */
	@Column(name = "attr")
	private String attr;
	
	/**
	 * 大类别
	 */
	@Column(name = "scope")
	private Integer scope;
	
	/**
	 * 小类别
	 */
	@Column(name = "_type")
	private String type;
	
	/**
	 * 列表页图片
	 */
	@Column(name = "picMid")
	private String picMid;
	
	/**
	 * 详情页面系列小图
	 */
	@Column(name = "seriesSm")
	private String seriesSm;
	
	/**
	 * 详情页面系列大图
	 */
	@Column(name = "seriesLg")
	private String seriesLg;
	
	/**
	 * 订单等页面商品图
	 */
	@Column(name = "picSm")
	private String picSm;
	
	/**
	 * 上架时间
	 */
	@Column(name = "createTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	/**
	 * 下架时间
	 */
	@Column(name = "removeTime")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date removeTime;
	
	
	/**
	 * 毛重
	 */
	@Column(name = "grossWeight")
	private Double grossWeight;
	
	/**
	 * 净重
	 */
	@Column(name = "netWeight")
	private Double netWeight;
	
	
	/**
	 * 评论数
	 */
	@Column(name = "commentNum")
	private Integer commentNum;
	
	/**
	 * 价格
	 */
	@Column(name = "price")
	@NumberFormat(style = Style.NUMBER)
	private BigDecimal price;
	
	public Good() {
	}
	
	public Good(Integer id, String name, String no, Integer oid, String owner, Integer status, String msg,
			Integer soldNum, String brand, String attr, Integer scope, String type, String picMid, String seriesSm,
			String seriesLg, String picSm, Date createTime, Date removeTime, Double grossWeight, Double netWeight,
			Integer commentNum, BigDecimal price) {
		super();
		this.id = id;
		this.name = name;
		this.no = no;
		this.oid = oid;
		this.owner = owner;
		this.status = status;
		this.msg = msg;
		this.soldNum = soldNum;
		this.brand = brand;
		this.attr = attr;
		this.scope = scope;
		this.type = type;
		this.picMid = picMid;
		this.seriesSm = seriesSm;
		this.seriesLg = seriesLg;
		this.picSm = picSm;
		this.createTime = createTime;
		this.removeTime = removeTime;
		this.grossWeight = grossWeight;
		this.netWeight = netWeight;
		this.commentNum = commentNum;
		this.price = price;
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

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getSoldNum() {
		return soldNum;
	}

	public void setSoldNum(Integer soldNum) {
		this.soldNum = soldNum;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getAttr() {
		return attr;
	}

	public void setAttr(String attr) {
		this.attr = attr;
	}

	public Integer getScope() {
		return scope;
	}

	public void setScope(Integer scope) {
		this.scope = scope;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPicMid() {
		return picMid;
	}

	public void setPicMid(String picMid) {
		this.picMid = picMid;
	}

	public String getSeriesSm() {
		return seriesSm;
	}

	public void setSeriesSm(String seriesSm) {
		this.seriesSm = seriesSm;
	}

	public String getSeriesLg() {
		return seriesLg;
	}

	public void setSeriesLg(String seriesLg) {
		this.seriesLg = seriesLg;
	}

	public String getPicSm() {
		return picSm;
	}

	public void setPicSm(String picSm) {
		this.picSm = picSm;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getRemoveTime() {
		return removeTime;
	}

	public void setRemoveTime(Date removeTime) {
		this.removeTime = removeTime;
	}

	public Double getGrossWeight() {
		return grossWeight;
	}

	public void setGrossWeight(Double grossWeight) {
		this.grossWeight = grossWeight;
	}

	public Double getNetWeight() {
		return netWeight;
	}

	public void setNetWeight(Double netWeight) {
		this.netWeight = netWeight;
	}

	public Integer getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(Integer commentNum) {
		this.commentNum = commentNum;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Good [id=" + id + ", name=" + name + ", no=" + no + ", oid=" + oid + ", status=" + status + ", msg="
				+ msg + ", soldNum=" + soldNum + ", brand=" + brand + ", attr=" + attr + ", scope=" + scope + ", type="
				+ type + ", picMid=" + picMid + ", seriesSm=" + seriesSm + ", seriesLg=" + seriesLg + ", picSm=" + picSm
				+ ", createTime=" + createTime + ", removeTime=" + removeTime + ", grossWeight=" + grossWeight
				+ ", netWeight=" + netWeight + ", commentNum=" + commentNum + ", price=" + price + "]";
	}

}

