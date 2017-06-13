package com.oa.bean;

import java.util.Date;

public class Goods {
	//郭昶 用品表
	
	private String goodsId; //用品编号
	private String name; 	//用品名称
	private int quantity; 	//用品总数
	private String des; 	//用品描述
	private double unitPrice; 	//单价
	private Date buyDay; 		//购买时间
	private GoodsType goodsTypeId;		//物品类型编号，来源于物品类型表	XMF
	private int status;			//状态，默认可用
	
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

	public GoodsType getGoodsTypeId() {
		return goodsTypeId;
	}

	public void setGoodsTypeId(GoodsType goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
