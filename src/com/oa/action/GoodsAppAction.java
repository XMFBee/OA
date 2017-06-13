package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oa.bean.Employee;
import com.oa.bean.GoodsApp;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GoodsAppService;

/**
 * 物品申购Action
 * @author XMF
 */

public class GoodsAppAction extends BaseAction{

	private static final long serialVersionUID = -9027916988467624486L;
	
	private HttpServletRequest req;
	private GoodsAppService goodsAppService;
	private GoodsApp goodsApp;
	private List<GoodsApp> rows;
	private long total;
	private ControllerRequest regoodsApp;
	private Employee emp;
	private String gId;
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setGoodsAppService(GoodsAppService goodsAppService) {
		this.goodsAppService = goodsAppService;
	}

	public GoodsApp getGoodsApp() {
		return goodsApp;
	}
	public void setGoodsApp(GoodsApp goodsApp) {
		this.goodsApp = goodsApp;
	}
	public List<GoodsApp> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	public ControllerRequest getRegoodsApp() {
		return regoodsApp;
	}

	public void setgId(String gId) {
		this.gId = gId;
	}
	
	public String saveGoodsApp() {
		System.out.println(goodsApp);
		Employee e = new Employee();
		e.setEmpId("4028809959641d0701596422a1c20001");
		goodsApp.setEmp(e);
		goodsApp.setStatus(1);	//	可用或不可用
		goodsApp.setAppStatus(0);	// 默认为0 审核中	
		goodsApp.setAppDay(new Date());
		goodsApp = goodsAppService.save(goodsApp);
		regoodsApp = ControllerRequest.getSuccessRequest("保存成功");
		return "save";
	}
	
	public String updateGoodsApp() {
		goodsAppService.updateGoodsApp(goodsApp);
		System.out.println(goodsApp);
		regoodsApp = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	// 分页显示全部数据
	public String queryAll() {
		Pager4EasyUI<GoodsApp> pager = new Pager4EasyUI<GoodsApp>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		emp = (Employee)WebUtil.getSessionValue(req, "employee");
		if(autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.GoodsAppAction.queryAll")){
			pager.setTotal(goodsAppService.count("GoodsApp"));
			pager = goodsAppService.queryPager("GoodsApp", pager);
		}else{
			// 查询自己的
			
		}
		pager.setTotal(goodsAppService.count("GoodsApp"));
		pager = goodsAppService.queryPager("GoodsApp", pager);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String gtDisable(){  // 禁用
		goodsAppService.updateStatus("GoodsApp","goodsAppId",0, gId);
		return "disable";
	}
	
	public String gtActivate(){  // 启用
		goodsAppService.updateStatus("GoodsApp","goodsAppId",1, gId);
		return "activate";
	}
	
	// 跳转到物品申购页面
	public String goodsAppPager() {
		return "goodsAppPager";
	}
	
}
