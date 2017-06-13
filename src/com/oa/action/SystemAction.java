package com.oa.action;

import java.util.ArrayList;
import java.util.List;

import com.oa.bean.NoticeType;
import com.oa.common.bean.ComboBox4EasyUI;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.SystemService;

public class SystemAction extends BaseAction{

	// 郭玉清  公告类型编号
	private static final long serialVersionUID = -855626731783808900L;
	private SystemService systemService;

	private List<NoticeType> rows; // 返回rows结果集到easyUI页面
	private long total; // 返回total总记录数到easyUI页面
	private NoticeType noticeType;
	private String id;
	private List<ComboBox4EasyUI> request;
	
	public List<ComboBox4EasyUI> getRequest() {
		return request;
	}

	private ControllerRequest resu; // 返回提示信息到easyUI页面
	
	public void setId(String id) {
		this.id = id;
	}

	public ControllerRequest getResu() {
		return resu;
	}


	public NoticeType getNoticeType() {
		return noticeType;
	}

	public List<NoticeType> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setNoticeType(NoticeType noticeType) {
		this.noticeType = noticeType;
	}

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	public String showNoticeType() {
		return "showNoticeType";
	}

	public String noticeTypePager() { // 分页显示公告类型
		Pager4EasyUI<NoticeType> pager = new Pager4EasyUI<NoticeType>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(systemService.count("NoticeType"));
		pager = systemService.queryPager("NoticeType", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}

	public String addNoticeType() {
		noticeType.setStatus(1);
		systemService.save(noticeType);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "add";
	}

	public String updateNoticeType() {
		systemService.update(noticeType);
		resu = ControllerRequest.getSuccessRequest("修改成功");
		return "update";
	}
	
	
	public String noticeTypeActivate(){
		systemService.updateStatus("NoticeType", "noticetypeId", 1, id);
		return "activate";
	}
	
	public String noticeTypeDisable(){
		systemService.updateStatus("NoticeType", "noticetypeId", 0, id);
		return "disable";
	}
	
	//返回类型
	public String type(){
		List<NoticeType> list = systemService.queryAll("NoticeType");
		request = new ArrayList<ComboBox4EasyUI>();
		for(NoticeType type: list){
			ComboBox4EasyUI combox = new ComboBox4EasyUI(); 
			combox.setId(type.getNoticetypeId());
			combox.setText(type.getName());
			combox.setSelected(true);
			request.add(combox);
		}
		return "type";
	}

}














