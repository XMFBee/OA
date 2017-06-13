package com.oa.service;

import com.oa.bean.IncomeType;

public interface IncomeTypeService extends BaseService<IncomeType>{
	public IncomeType  queryByName(String name);
}
