package com.oa.dao;

import com.oa.common.bean.Pager4EasyUI;

import java.io.Serializable;
import java.util.List;

/**
 * Created by xiao-kang on 2016/12/13.
 */
public interface BaseDAO<T> {
    public T save(T t);

    public void delete(T t);

    public void update(T t);

    public T queryById(Class<?> clazz, Serializable id);


    public List<T> queryAll(Serializable beanName);

    public Pager4EasyUI<T> queryPager(String beanName,Pager4EasyUI<T> pager);

    public long count(Serializable beanName);
    
    public void updateStatus(String beanName,String beanId,int status,String id);
}
