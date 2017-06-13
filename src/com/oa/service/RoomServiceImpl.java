package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Room;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.RoomDAO;

public class RoomServiceImpl implements RoomService{

	private RoomDAO roomDAO;
	
	
	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}

	@Override
	public Room save(Room t) {
		return roomDAO.save(t);
	}

	@Override
	public void delete(Room t) {
		roomDAO.delete(t);
	}

	@Override
	public void update(Room t) {
		roomDAO.update(t);
	}

	@Override
	public Room queryById(Class<?> clazz, Serializable id) {
		return roomDAO.queryById(clazz, id);
	}

	@Override
	public List<Room> queryAll(Serializable beanName) {
		return roomDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Room> queryPager(String beanName, Pager4EasyUI<Room> pager) {
		return roomDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return roomDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		roomDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Room> queryBySearch(Pager4EasyUI<Room> pager, String roomName) {
		return roomDAO.queryBySearch(pager, roomName);
	}

	@Override
	public int queryByRoomId(String roomId) {
		return roomDAO.queryByRoomId(roomId);
	}

}
