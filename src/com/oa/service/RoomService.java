package com.oa.service;

import com.oa.bean.Room;
import com.oa.common.bean.Pager4EasyUI;

public interface RoomService extends BaseService<Room>{
	public Pager4EasyUI<Room> queryBySearch(Pager4EasyUI<Room> pager,String roomName);
	/**某个宿舍下面有多少个学生
	 * 
	 * 
	 * @param gradeId
	 * @return
	 */
	public int queryByRoomId(String roomId);
}
