package com.oa.dao;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.GoodsType;

/**
 * @author XMF
 */

public class GoodsTypeDAOImpl extends AbstractBaseDAO<GoodsType> implements GoodsTypeDAO {
	
	@Override
	public long count(Serializable beanName) {
		return super.count(beanName);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Map<String, String> queryIdAndName() {
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery("select gt.goodsTypeId , gt.name from GoodsType gt where gt.status=1");
		List resultList = query.list();
		Map<String,String> select = null;
		if(resultList != null){
			select = new HashMap<String,String>();
			for(int i = 0,len = resultList.size(); i<len; i++) {
				Object[] obj = (Object[]) resultList.get(i);
				select.put(obj[0].toString(),obj[1].toString() );
			}
		}
		return select;
	}

}
