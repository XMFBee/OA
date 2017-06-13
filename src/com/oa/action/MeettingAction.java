package com.oa.action;

import java.util.List;
import com.oa.bean.Employee;
import com.oa.bean.Meetting;
import com.oa.bean.info.MeettingInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.MeettingService;
import com.opensymphony.xwork2.ActionSupport;

public class MeettingAction extends BaseAction{
	
	//研讨会管理 郭昶
	
	private static final long serialVersionUID = -927524878487822663L;
	
	public MeettingService meettingService;
	
	private ControllerRequest resu;
	
	private Meetting meetting;
	private MeettingInfo meettingInfo;
	
	private List<Meetting> rows;
	
	private String id;
	
	private long total;
	
	
	
	public void setId(String id) {
		this.id = id;
	}

	public void setMeettingService(MeettingService meettingService) {
		this.meettingService = meettingService;
	}

	public Meetting getMeetting() {
		return meetting;
	}
	
	public void setMeetting(Meetting meetting) {
		this.meetting = meetting;
	}

	public List<Meetting> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	public MeettingInfo getMeettingInfo() {
		return meettingInfo;
	}

	public void setMeettingInfo(MeettingInfo meettingInfo) {
		this.meettingInfo = meettingInfo;
	}

	public String meettingByPage(){	//分页查询
		Pager4EasyUI<Meetting> pager = new Pager4EasyUI<Meetting>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = meettingService.queryPager("Meetting", pager);
		pager.setTotal(meettingService.count("Meetting"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "page";
	}
	
	public String meettingSave(){//添加会议
		meetting.setStatus(1);
		meettingService.save(meetting);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "save";
	}
	
	public String meettingUpdate(){ //更新会议
		meetting = new Meetting();
		meetting.setMeettingId(meettingInfo.getMeettingId());
		meetting.setDes(meettingInfo.getDes());
		meetting.setStatus(meettingInfo.getStatus());
		meetting.setMeettingDay(meettingInfo.getMeettingDay());
		meetting.setCreatedDay(meettingInfo.getCreatedDay());
		meetting.setEmpId(meettingInfo.getEmpId());
		meettingService.update(meetting);
		resu = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	public String meettingDisable(){  // 禁用会议
		meettingService.updateStatus("Meetting","meettingId",0, id);
		return "dis";
	}
	
	public String meettingEnabled(){  // 启用会议
		meettingService.updateStatus("Meetting", "meettingId", 1, id);
		return "ena";
	}
	public String showMeetting(){ //转发页面
		Employee emp = (Employee)WebUtil.getSessionValue(req, "employee");
		if(autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.MeettingAction.showMeetting")){
			return "showmeetting";
		}else{
			return ERROR;
		}
	}

}
