package com.oa.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

/**
 * 物品领用表
 * @author 程燕
 *
 */
public class GoodsUse {
	private String useId; 			//物品使用记录id

	private int quantity;		//领用物品的 数量
	private Date useDay;			//信用时间
	private Date eReturnDay;		//预估归还时间
	private Date returnDay;		//归还时间
	
	
	private Goods goods;
	private Employee employee;
	public GoodsUse(){}
	public GoodsUse(String useId,int quantity,Date useDay,Date eReturnDay,Date returnDay,String goodsId,String empId,String goodsname,String empname,String depId,String depName){
		Department dept = new Department();
		this.goods = new Goods();
		this.employee = new Employee();
		this.employee.setDepartment(dept);
		this.useId= useId;
		this.quantity = quantity;
		this.useDay = useDay;
		this.eReturnDay = eReturnDay;
		this.returnDay = returnDay;
		this.goods.setGoodsId(goodsId);
		this.employee.setEmpId(empId);
		this.goods.setName(goodsname);
		this.employee.setName(empname);
		dept.setDepId(depId);
		dept.setName(depName);
	}
	
	
	public String getUseId() {
		return useId;
	}
	public void setUseId(String useId) {
		this.useId = useId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getUseDay() {
		return useDay;
	}
	public void setUseDay(Date useDay) {
		this.useDay = useDay;
	}
	public Date geteReturnDay() {
		return eReturnDay;
	}

	public void seteReturnDay(Date eReturnDay) {
		this.eReturnDay = eReturnDay;
	}


	public Date getReturnDay() {
		return returnDay;
	}
	public void setReturnDay(Date returnDay) {
		this.returnDay = returnDay;
	}
	@Override
	public String toString() {
		return "GoodsUse [useId=" + useId + ", quantity=" + quantity + ", useDay=" + useDay + ", eReturnDay="
				+ eReturnDay + ", returnDay=" + returnDay + "]";
	}
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
}
