package com.bin.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_goods")
public class OrderGoods {

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
	 * 商品id
	 */
	@Column(name = "gid")
	private Integer gid;
	
	/**
	 * 商品价格
	 */
	@Column(name = "price")
	private BigDecimal price;
	
	/**
	 * 数量
	 */
	@Column(name = "num")
	private Integer num;
	
	/**
	 * 创建时间
	 */
	@Column(name = "createTime")
	private Date createTime;

	
	public OrderGoods() {
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

	public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "OrderGoods [id=" + id + ", oid=" + oid + ", gid=" + gid + ", price=" + price + ", num=" + num
				+ ", createTime=" + createTime + "]";
	}
	
}
