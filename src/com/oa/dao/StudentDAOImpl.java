package com.oa.dao;



import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.jdbc.Work;

import com.oa.bean.Grade;
import com.oa.bean.Student;
import com.oa.common.bean.Pager4EasyUI;

public class StudentDAOImpl extends AbstractBaseDAO<Student> implements StudentDAO {

	@Override
	public long countStatus(String stuStatus) {
		 Session session = sessionFactory.getCurrentSession();
	     Query query = session.createQuery("select  count(*) from Student t where t.stuStatus =:stustatus");
	     query.setParameter("stustatus", stuStatus);
	     long count = (long) query.uniqueResult();
	     return count;
	}
	
	@Override
	public Pager4EasyUI<Student> studentStatusPager(String stuStatus, Pager4EasyUI<Student> pager) {
		  Session session = sessionFactory.getCurrentSession();
	        Query query = session.createQuery("from Student t where t.stuStatus =:stustatus");
	        query.setParameter("stustatus", stuStatus);
	        query.setFirstResult(pager.getBeginIndex());
	        query.setMaxResults(pager.getPageSize());
	        List<Student> list = (List<Student>) query.list();
	        pager.setRows(list);
	        return pager;
	}

	@Override
	public Pager4EasyUI<Student> stuGradeById(String gradeId, Pager4EasyUI<Student> pager) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Student t where t.gradeId =:gradeid");
        query.setParameter("gradeid", gradeId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Student> list = (List<Student>) query.list();
        pager.setRows(list);
        return pager;
	}

	@Override
	public long countGradeID(String gradeId) {
		 Session session = sessionFactory.getCurrentSession();
	     Query query = session.createQuery("select  count(*) from Student t where t.gradeId = ?");
	     query.setString(0, gradeId);
	     long count = (long) query.uniqueResult();
	     return count;
	}

	@Override
	public Pager4EasyUI<Student> stuRoomById(String roomId, Pager4EasyUI<Student> pager) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Student t where t.roomId =:roomid");
        query.setParameter("roomid", roomId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Student> list = (List<Student>) query.list();
        pager.setRows(list);
        return pager;
	}

	@Override
	public long countRoomID(String roomId) {
		 Session session = sessionFactory.getCurrentSession();
	     Query query = session.createQuery("select  count(*) from Student t where t.roomId =:roomid");
	     query.setParameter("roomid", roomId);
	     long count = (long) query.uniqueResult();
	     return count;
	}

	@Override
	public Pager4EasyUI<Student> stuGradeRoomById(String roomGradeId, Pager4EasyUI<Student> pager) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Student  where "+roomGradeId+" = null and stuStatus = '正式'");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Student> list = (List<Student>) query.list();
        pager.setRows(list);
        return pager;
	}

	@Override
	public long stuGradeRoomById(String roomGradeId) {
		Session session = sessionFactory.getCurrentSession();
	     Query query = session.createQuery("select  count(*) from Student  where "+roomGradeId+" = null and stuStatus = '正式'");
	     long count = (long) query.uniqueResult();
	     return count;
	}

	@Override
	public void updateGradeIds(String[] ids, String gradeRoomId, String roomGradeId) {
		Session session = sessionFactory.getCurrentSession();
		session.doWork(new Work() {
			@Override
			public void execute(Connection conn) throws SQLException {
				Statement stmt = conn.createStatement();
				for (int i = 0, len = ids.length; i < len; i++) {
					stmt.addBatch("update t_stu set "+gradeRoomId+" = '" + roomGradeId + "' where stuid = '" + ids[i] + "'");
				}
				stmt.executeBatch();
			}
		});
	}

	@Override
	public Pager4EasyUI<Student> queryBySearch(Pager4EasyUI<Student> pager, String stuName,String stuStatus) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Student s where s.name like :name and s.stuStatus =:stustatus");
		 query.setParameter("name", "%" + stuName + "%");
		query.setParameter("stustatus", stuStatus);
		query.setFirstResult(pager.getBeginIndex());
	    query.setMaxResults(pager.getPageSize());
	    List<Student> list = (List<Student>) query.list();
	    pager.setRows(list);
	   return pager;
	}

	@Override
	public Pager4EasyUI<Student> queryByEmpId(Pager4EasyUI<Student> pager,String stuStatus, String empId) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Student t where t.stuStatus =:stustatus and t.empId =:empId");
        query.setParameter("stustatus", stuStatus);
        query.setParameter("empId", empId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<Student> list = (List<Student>) query.list();
        pager.setRows(list);
        return pager;
	}

	@Override
	public long countEmpID(String empId) {
		Session session = sessionFactory.getCurrentSession();
	     Query query = session.createQuery("select  count(*) from Student t where t.empId = ?");
	     query.setString(0, empId);
	     long count = (long) query.uniqueResult();
	     return count;
	}


	

	
	
}
