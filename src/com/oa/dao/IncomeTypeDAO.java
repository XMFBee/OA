package com.oa.dao;

import com.oa.bean.IncomeType;

public interface IncomeTypeDAO extends BaseDAO<IncomeType>{
		
	public IncomeType  queryByName(String name);
}
