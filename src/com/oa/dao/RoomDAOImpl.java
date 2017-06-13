 package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Course;
import com.oa.bean.Room;
import com.oa.common.bean.Pager4EasyUI;

public class RoomDAOImpl extends AbstractBaseDAO<Room> implements RoomDAO{

	@Override
	public Pager4EasyUI<Room> queryBySearch(Pager4EasyUI<Room> pager, String roomName) {
		Session session = this.getSessionFactory().getCurrentSession();
        Criteria c = session.createCriteria(Room.class).add(Restrictions.like("name", "%"+roomName+"%"));
        @SuppressWarnings("unchecked")
		List<Room> list = (List<Room>)c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}

	@Override
	public int queryByRoomId(String roomId) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(t.stuId) from Student t where t.roomId =:roomid");
        query.setParameter("roomid", roomId);
        Long count = (long) query.uniqueResult();
        return count.intValue();
	}

}
