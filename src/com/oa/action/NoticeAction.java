package com.oa.action;

import java.util.List;

import com.oa.bean.Notice;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.NoticeService;

public class NoticeAction extends BaseAction {

	private static final long serialVersionUID = 7863667932724212981L;

	private NoticeService noticeService;
	private ControllerRequest resu; // 返回提示信息到easyUI页面

	private List<Notice> rows;
	private long total;// 返回total总记录数到easyUI页面
	private Notice notice;
	private String empId;
	
	private String noticeName;

	private String id;
	
	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public List<Notice> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	public ControllerRequest getResu() {
		return resu;
	}
	
	public String showNotice() {
		return "showNotice";
	}
	public String noticePager() { // 分页显示公告类型
		Pager4EasyUI<Notice> pager = new Pager4EasyUI<Notice>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(noticeService.count("Notice"));
		pager = noticeService.queryPager("Notice", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "notice-pager";
	}

	public String addNotice() {
		notice.setStatus(1);
		notice.setEmpId(empId);
		noticeService.save(notice);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "notice-add";
	}

	public String updateNotice() {
		notice.setEmpId(empId);
		noticeService.update(notice);
		resu = ControllerRequest.getSuccessRequest("修改成功");
		return "notice-update";
	}

	public String noticeActivate(){
		noticeService.updateStatus("Notice", "noticeId", 1, id);
		return "activate";
	}
	
	public String noticeDisable(){
		noticeService.updateStatus("Notice", "noticeId", 0, id);
		return "disable";
	}
	
	public String pagerByName(){
		Pager4EasyUI<Notice> pager = new Pager4EasyUI<Notice>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = noticeService.queryBySearch(pager, noticeName);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows == null) {
			resu =  ControllerRequest.getFailRequest("没有您查询的记录");
		}
		resu = ControllerRequest.getSuccessRequest("查询成功");
		return "queryByName";
	}
	
	
}


















