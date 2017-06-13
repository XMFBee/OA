package com.oa.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.GoodsType;
import com.oa.common.bean.ComboBox4EasyUI;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GoodsTypeService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 物品类型Action
 * @author XMF
 */

public class GoodsTypeAction extends BaseAction{

	private static final long serialVersionUID = -9027916988467624486L;
	
	private GoodsTypeService gtService;
	private GoodsType gts;
	private List<GoodsType> rows;
	private long total;
	private ControllerRequest regt;
	private String gtId;
	
	private Employee emp;
	
	private List<ComboBox4EasyUI> results;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setGtService(GoodsTypeService gtService) {
		this.gtService = gtService;
	}
	public GoodsType getGts() {
		return gts;
	}
	public void setGts(GoodsType gts) {
		this.gts = gts;
	}
	public List<GoodsType> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	public ControllerRequest getRegt() {
		return regt;
	}
	public void setGtId(String gtId) {
		this.gtId = gtId;
	}
	public List<ComboBox4EasyUI> getResults() {
		return results;
	}
	
	public String save() {
		gts.setStatus(1);
		gtService.save(gts);
		regt = ControllerRequest.getSuccessRequest("添加成功");
		return "save";
	}
	
	public String update() {
		gts.setStatus(1);
		gtService.update(gts);
		regt = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	public String pager() {
		Pager4EasyUI<GoodsType> pager = new Pager4EasyUI<GoodsType>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = gtService.queryPager("GoodsType", pager);
		pager.setTotal(gtService.count("GoodsType"));
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String gtDisable(){  // 禁用
		gtService.updateStatus("GoodsType","goodsTypeId",0, gtId);
		return "disable";
	}
	
	public String gtActivate(){  // 启用
		gtService.updateStatus("GoodsType","goodsTypeId",1, gtId);
		return "activate";
	}
	
	// 下拉列表
	public String comboBox() {
		List<GoodsType> goodsType = new ArrayList<GoodsType>();
		results = new ArrayList<ComboBox4EasyUI>();
		goodsType = gtService.queryAll("GoodsType");
		for (GoodsType gt : goodsType) {
			ComboBox4EasyUI combo = new ComboBox4EasyUI();
			combo.setId(gt.getGoodsTypeId());
			combo.setText(gt.getName());
			results.add(combo);
		}
		return "comboBox";
	}
		
	
	/**
	 * 跳转页面
	 * @return goods_type.jsp
	 */
	public String gtype() {
		 emp = (Employee)WebUtil.getSessionValue(req, "employee");
		if(autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.GoodsTypeAction.gtype")){
			return "gtype";
		}else{
			return ERROR;
		}
	}

}
