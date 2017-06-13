package com.oa.service;

import java.util.Map;

import com.oa.bean.GoodsType;
import com.oa.dao.BaseDAO;

/**
 * @author XMF
 */

public interface GoodsTypeService extends BaseDAO<GoodsType> {
	
	public Map<String,String> queryIdAndName();

}
