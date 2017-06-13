package com.oa.service.info;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.info.PayInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.info.PayInfoDAO;


//郭玉清
public class PayInfoServiceImpl implements PayInfoService {

	private PayInfoDAO piDAO;
	public PayInfoDAO getPiDAO() {
		return piDAO;
	}

	public void setPiDAO(PayInfoDAO piDAO) {
		this.piDAO = piDAO;
	}

	@Override
	public PayInfo save(PayInfo t) {
		return piDAO.save(t);
	}

	@Override
	public void delete(PayInfo t) {
		piDAO.delete(t);
	}

	@Override
	public void update(PayInfo t) {
		piDAO.update(t);
	}

	@Override
	public PayInfo queryById(Class<?> clazz, Serializable id) {
		return piDAO.queryById(clazz, id);
	}

	@Override
	public List<PayInfo> queryAll(Serializable beanName) {
		return piDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<PayInfo> queryPager(String beanName, Pager4EasyUI<PayInfo> pager) {
		return piDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return piDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		piDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<PayInfo> queryPayInfoPage(int status, Pager4EasyUI<PayInfo> pager) {
		return piDAO.queryPayInfoPage(status, pager);
	}


}
