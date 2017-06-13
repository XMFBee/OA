package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Room;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.RoomService;
import com.opensymphony.xwork2.ActionSupport;

public class RoomAction extends ActionSupport implements ServletRequestAware{

	

	private static final long serialVersionUID = -2136427053712486366L;
	private RoomService roomService;
	private HttpServletRequest req;
	
	private List<Room> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	private Room room;		// 宿舍
	private String id;   //  从页面获取宿舍ID 
	
	private String roomName;
	
	
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		
		this.room = room;
	}
	public List<Room> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	
	
	public void setId(String id) {
		this.id = id;
	}
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
	
	public String showRoom(){  // 转发到宿舍信息页面
		return "showRoom"; 
	}
	public String roomSave(){   // 添加宿舍
		room.setStatus(1);
		roomService.save(room);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "save";
	}

	public String roomDisable(){  // 禁用宿舍
		roomService.updateStatus("Room","roomId",0, id);
		return "disable";
	}
	
	public String roomActivate(){ // 启用宿舍
		roomService.updateStatus("Room","roomId",1, id); 
		return "activae";
	}
	public String roomUpdate(){ 
		room.setStatus(1);
		System.out.println(room.getStuId());
		roomService.update(room);
		resu = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
		
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}
	
	public String roomPager(){  // 分页显示宿舍信息
		Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = roomService.queryPager("Room", pager);
		pager.setTotal(roomService.count("Room"));
		total = pager.getTotal();
		for(Room r: pager.getRows()){
			r.setFact(roomService.queryByRoomId(r.getRoomId()));
		}
		rows = pager.getRows();
		return "pager";
	}
	public String pagerByName(){
		Pager4EasyUI<Room> pager = new Pager4EasyUI<Room>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = roomService.queryBySearch(pager, roomName);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		} else {
			resu =  ControllerRequest.getFailRequest("没有记录");
		}
		return "queryByName";
	}
}
