package com.oa.bean.info;

import java.util.Date;

// XMF
public class GoodsInfo {
	private String goodsId; //用品编号
	private String name; 	//用品名称
	private int quantity; 	//用品总数
	private String des; 	//用品描述
	private double unitPrice; 	//单价
	private Date buyDay; 		//购买时间
	private int status;			//状态，默认可用
	
	private String goodsTypeId;	// 类型id
	private String goodsTypeName;	// 类型名称
	
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Date getBuyDay() {
		return buyDay;
	}
	public void setBuyDay(Date buyDay) {
		this.buyDay = buyDay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(String goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}
	public String getGoodsTypeName() {
		return goodsTypeName;
	}
	public void setGoodsTypeName(String goodsTypeName) {
		this.goodsTypeName = goodsTypeName;
	}
	@Override
	public String toString() {
		return "GoodsInfo [goodsId=" + goodsId + ", name=" + name + ", quantity=" + quantity + ", des=" + des
				+ ", unitPrice=" + unitPrice + ", buyDay=" + buyDay + ", status=" + status + ", goodsTypeId="
				+ goodsTypeId + ", goodsTypeName=" + goodsTypeName + "]";
	}
	
}
