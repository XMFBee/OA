package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Talk;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.TalkDAO;

public class TalkServiceImpl implements TalkService{

	private TalkDAO talkDAO;
	
	public void setTalkDAO(TalkDAO talkDAO) {
		this.talkDAO = talkDAO;
	}

	@Override
	public Talk save(Talk t) {
		return talkDAO.save(t);
	}

	@Override
	public void delete(Talk t) {
		talkDAO.delete(t);
	}

	@Override
	public void update(Talk t) {
		talkDAO.update(t);
	}

	@Override
	public Talk queryById(Class<?> clazz, Serializable id) {
		return talkDAO.queryById(clazz, id);
	}

	@Override
	public List<Talk> queryAll(Serializable beanName) {
		return talkDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Talk> queryPager(String beanName, Pager4EasyUI<Talk> pager) {
		return talkDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return talkDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		talkDAO.updateStatus(beanName, beanId, status, id);
	}
	
	
}
