package com.oa.action;

import java.util.List;
import java.util.Map;

import com.oa.bean.Goods;
import com.oa.bean.info.GoodsInfo;
import com.oa.common.bean.ComboBox4EasyUI;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GoodsService;

/**
 * 物品Action
 * @author XMF
 */

public class GoodsAction extends BaseAction{

	private static final long serialVersionUID = -9027916988467624486L;
	
	private GoodsService goodsService;
	private Goods goods;
	private List<GoodsInfo> rows;
	private long total;
	private ControllerRequest regoods;
	
	
	private String gId;
	
	private String gName;
	
	private List<ComboBox4EasyUI> results;
	
	private Map<String,String> goodsTypes;
	
	
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public List<GoodsInfo> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	public ControllerRequest getRegoods() {
		return regoods;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public List<ComboBox4EasyUI> getResults() {
		return results;
	}
	public Map<String, String> getGoodsTypes() {
		return goodsTypes;
	}
	
	public String save() {
		String roleId = WebUtil.getRoleId(req);
		if(autService.queryAuthority(roleId, "com.oa.action.GoodsAction.save")){
			goods.setStatus(1);
			goods = goodsService.save(goods);
			regoods = ControllerRequest.getSuccessRequest("添加成功");
		}else{
			regoods = ControllerRequest.getFailRequest("您的权限不足");
		}
		return "save";
	}
	
	public String update() {
		String roleId = WebUtil.getRoleId(req);
		if(autService.queryAuthority(roleId, "com.oa.action.GoodsAction.update")){
			goods.setStatus(1);
			goods.setBuyDay(goods.getBuyDay());
			goodsService.updateGoods(goods);
			regoods = ControllerRequest.getSuccessRequest("更新成功");
		}else{
			regoods = ControllerRequest.getFailRequest("您的权限不足");
		}
		return "update";
	}
	
	// 分页显示全部数据
	public String queryAll() {
		Pager4EasyUI<GoodsInfo> pager = new Pager4EasyUI<GoodsInfo>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = goodsService.queryInfoPaer(pager);
		pager.setTotal(goodsService.count("Goods"));
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	// 根据用品名称查询
	public String queryNameByAll() {
		Pager4EasyUI<GoodsInfo> pager = new Pager4EasyUI<GoodsInfo>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = goodsService.queryByName(pager, gName);
		rows = pager.getRows();
		total = pager.getTotal();
		if(rows != null) {
			regoods = ControllerRequest.getSuccessRequest("查询成功");
		} else {
			regoods = ControllerRequest.getFailRequest("没有符合的");
		}
		return "queryNameByAll";
	}

	
	 
	public String gtDisable(){  // 禁用
		String roleId = WebUtil.getRoleId(req);
		if(autService.queryAuthority(roleId, "com.oa.action.GoodsAction.gtDisable")){
			System.out.println("-------------------");
			goodsService.updateStatus("Goods","goodsId",0, gId);
		}else{
			regoods = ControllerRequest.getFailRequest("您的权限不足");
		}
		return "disable";
	}
	
	public String gtActivate(){  // 启用
		String roleId = WebUtil.getRoleId(req);
		System.out.println("laos"+roleId);
		if(autService.queryAuthority(roleId, "com.oa.action.GoodsAction.gtActivate")){
			System.out.println("++++++++++++++++++++++");
			goodsService.updateStatus("Goods","goodsId",1, gId);
		}else{
			regoods = ControllerRequest.getFailRequest("您的权限不足");
		}
		return "activate";
	}
	
	// 跳转到物品管理页面
	public String goodsPager() {
		return "goodsPager";
	}
	
}
