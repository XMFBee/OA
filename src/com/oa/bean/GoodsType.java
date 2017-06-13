package com.oa.bean;
//郭昶 用品类型表

import java.util.Set;

public class GoodsType {

	private String goodsTypeId; //用品类型编号
	private String name; //类型名称
	private String des; //类型描述
	private int status; //状态，默认可用
	
	private Set<Goods> goods;	// 一个物品类型有多个物品	XMF
	
	public String getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(String goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Set<Goods> getGoods() {
		return goods;
	}
	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}
	
}
