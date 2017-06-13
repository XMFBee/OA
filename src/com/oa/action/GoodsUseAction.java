package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.GoodsUse;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GoodsService;
import com.oa.service.GoodsUseService;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsUseAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private GoodsUseService goodsUseService;
	private GoodsService goodsService;

	private GoodsUse goodsUse;
	
	private Pager4EasyUI<GoodsUse> pager = new Pager4EasyUI<GoodsUse>();
	
	private List<GoodsUse> rows;
	private int total;
	
	/**
	 * 功能
	 */

	public String save(){
		String ereturnday= request.getParameter("ereturnday");		
		String useday = request.getParameter("useday");
		Date eReturn = WebUtil.str2Date(ereturnday, "yyyy-MM-dd");	
		Date useDay = WebUtil.str2Date(useday, "yyyy-MM-dd");
		goodsUse.seteReturnDay(eReturn);		goodsUse.setUseDay(useDay);
		goodsUseService.save(goodsUse);
		goodsService.updateQuantity(goodsUse.getGoods().getGoodsId(), -goodsUse.getQuantity());
		return "save";
	}



	public String update(){
		goodsUseService.returnGoods(goodsUse.getUseId());
		goodsService.updateQuantity(goodsUse.getGoods().getGoodsId(), goodsUse.getQuantity());
		return "update";
	}
	
	public String pager(){
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		
		goodsUseService.queryByAll(pager, null, null, null, null, null, null, null, null);
		rows = pager.getRows();
		return "pager";
	}
	
	public String showGoodsUse(){
		return "showGoodsUse";
	}
	
	/**
	 * Override
	 */
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * get/set
	 * @return
	 */
	public List<GoodsUse> getRows() {
		return rows;
	}

	public int getTotal() {
		return total;
	}
	
	public GoodsUse getGoodsUse() {
		return goodsUse;
	}

	public void setGoodsUse(GoodsUse goodsUse) {
		this.goodsUse = goodsUse;
	}

	public void setGoodsUseService(GoodsUseService goodsUseService) {
		this.goodsUseService = goodsUseService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

}
