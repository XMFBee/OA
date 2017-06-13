package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.Score;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.ScoreDAO;

public class ScoreServiceImpl implements ScoreService{

	private ScoreDAO scoreDAO;
	
	
	
	public void setScoreDAO(ScoreDAO scoreDAO) {
		this.scoreDAO = scoreDAO;
	}

	@Override
	public Score save(Score t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Score t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Score t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Score queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Score> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Score> queryPager(String beanName, Pager4EasyUI<Score> pager) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count(Serializable beanName) {
		return scoreDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
	}

	@Override
	public Pager4EasyUI<Score> queryPagerByGradeId(Pager4EasyUI<Score> pager, Serializable gradeId) {
		return scoreDAO.queryPagerByGradeId(pager, gradeId);
	}

	@Override
	public Pager4EasyUI<Score> queryBySearch(Pager4EasyUI<Score> pager, String course) {
		return scoreDAO.queryBySearch(pager, course);
	}

}
