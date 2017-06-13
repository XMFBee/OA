package com.oa.dao;

import com.oa.common.bean.Pager4EasyUI;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.Serializable;
import java.util.List;



public abstract class AbstractBaseDAO<T> {

    public SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public T save(T t){
        Session session = sessionFactory.getCurrentSession();
        session.save(t);
        return t;
    }

    public void delete(T t){
        Session session = sessionFactory.getCurrentSession();
        session.delete(t);
    }

    public void update(T t){
        Session session = sessionFactory.getCurrentSession();
        session.update(t);
        
    }
    public T queryById(Class<?> clazz, Serializable id){
        Session session = sessionFactory.getCurrentSession();
        T t = (T)session.get(clazz,id);
        return t; 
    }

    public List<T> queryAll(Serializable beanName){
        Session session = sessionFactory.getCurrentSession();
        Query query =  session.createQuery("from " + beanName);
        List<T> t = (List<T>)query.list();
       return t;
    }

  
	public Pager4EasyUI<T> queryPager(String beanName,Pager4EasyUI<T> pager){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from " + beanName);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<T> list = (List<T>) query.list();
        pager.setRows(list);
        return pager;
    }

    public long count(Serializable beanName){
        Session session = sessionFactory.getCurrentSession();
        long count = (long) session.createQuery("select  count(*) from " + beanName).uniqueResult();
        return count;
    }
    
    // 邱康 			新增 更新状态
    public void updateStatus(String beanName,String beanId,int status,String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update "+beanName+" set status = :status where "+beanId+"= :id";
		Query query = session.createQuery(hql);
		query.setParameter("status", status);
		query.setParameter("id", id);
		query.executeUpdate();
	}
}
