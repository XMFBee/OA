package com.oa.action;

import java.util.ArrayList;
import java.util.List;

import com.oa.bean.PayType;
import com.oa.common.bean.ComboBox4EasyUI;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.PayTypeService;


	/*郭玉清*/
public class PayTypeAction extends BaseAction{


	private static final long serialVersionUID = 4754939624797214068L;
	
	private PayTypeService payTypeService;
	private ControllerRequest resu;

	private List<PayType> rows;
	private PayType payType;
	private long total;

	private String id;

	private List<ComboBox4EasyUI> request;
	
	public List<ComboBox4EasyUI> getRequest() {
		return request;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPayTypeService(PayTypeService payTypeService) {
		this.payTypeService = payTypeService;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public List<PayType> getRows() {
		return rows;
	}

	public PayType getPayType() {
		return payType;
	}

	public void setPayType(PayType payType) {
		this.payType = payType;
	}

	public long getTotal() {
		return total;
	}

/*	显示页面*/
	public String showPayType(){
		return "showPayType";
	}
	
	
	//分页查询所有
	public String pager(){
		Pager4EasyUI<PayType> pager = new Pager4EasyUI<PayType>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(payTypeService.count("PayType"));
		pager = payTypeService.queryPager("PayType", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	
	//下拉支出状态框	
	public String type(){
		List<PayType> list = payTypeService.queryAll("PayType");
		request = new ArrayList<ComboBox4EasyUI>();
		for(PayType type: list){
			ComboBox4EasyUI combox = new ComboBox4EasyUI(); 
			combox.setId(type.getPayTypeId());
			combox.setText(type.getName());
			combox.setSelected(true);
			request.add(combox);
		}
		return "type";
	}
	
	

	public String addPayType(){
		payType.setStatus(1);
		payTypeService.save(payType);
		resu = ControllerRequest.getSuccessRequest("添加成功！");
		return "add";
	}
	
	public String updatePayType(){
		payTypeService.update(payType);
		resu = ControllerRequest.getSuccessRequest("更新成功！");
		return "update";
	}
	
	public String payTypeDisable(){  // 禁用支出
		payTypeService.updateStatus("PayType","payTypeId",0, id);
		return "disable";
	}
	
	public String payTypeActivate(){  // 启用
		payTypeService.updateStatus("PayType","payTypeId",1, id);
		return "activate";
	}
	

}




















