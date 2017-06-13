package com.oa.dao.info;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface CommonDAO {
	public List mohu(DetachedCriteria dc);
}
