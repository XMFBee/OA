package com.oa.action;

import java.util.List;

import com.oa.bean.Talk;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.TalkService;

public class TalkAction extends BaseAction{


	private static final long serialVersionUID = 1749016789742819710L;
	
	private TalkService talkService;
	private ControllerRequest resu; // 返回提示信息到easyUI页面

	private List<Talk> rows;
	private Talk talk;// 返回total总记录数到easyUI页面
	private long total;
	
	private String id;
	
	

	public void setId(String id) {
		this.id = id;
	}
	public Talk getTalk() {
		return talk;
	}

	public void setTalk(Talk talk) {
		this.talk = talk;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public List<Talk> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTalkService(TalkService talkService) {
		this.talkService = talkService;
	}
	
	//显示页面
	public String showTalk(){
		return "showTalk";
	}
	
	//分页查询所有
	public String pager(){
		Pager4EasyUI<Talk> pager = new Pager4EasyUI<Talk>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(talkService.count("Talk"));
		pager = talkService.queryPager("Talk", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	
	public String addTalk(){
		talkService.save(talk);
		resu = ControllerRequest.getSuccessRequest("添加成功！");
		return "add";
	}
	
	public String updateTalk(){
		talkService.update(talk);
		resu = ControllerRequest.getSuccessRequest("更新成功！");
		return "update";
	}
	
	public String talkDisable(){  // 禁用意向学生
		talkService.updateStatus("Talk","talkId",0, id);
		return "disable";
	}
	
	public String talkActivate(){  // 启用意向学生
		talkService.updateStatus("Talk","talkId",1, id);
		return "activate";
	}
	
}


















