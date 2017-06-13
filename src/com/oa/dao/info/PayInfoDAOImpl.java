package com.oa.dao.info;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.info.PayInfo;
import com.oa.common.bean.Pager4EasyUI;


//郭玉清
public class PayInfoDAOImpl extends AbstractBaseDAO<PayInfo> implements PayInfoDAO {

	@Override
	public Pager4EasyUI<PayInfo> queryPayInfoPage(int status, Pager4EasyUI<PayInfo> pager) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select p.payid,e.name as empName,pt.name as ptName,p.payday,p.des,p.pay,p.toname,p.tophone,pt.status,e.empid as empId "
				+ "from t_emp e,t_pay p,t_paytype pt "
				+ "where p.empid=e.empid and p.paytypeid=pt.paytypeid and pt.status="+status);
		query.setFirstResult(pager.getBeginIndex());
		query.setMaxResults(pager.getPageSize());
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		List<PayInfo> pis = new ArrayList<PayInfo>();
		for(Object[] obj : list) {
			PayInfo pi = new PayInfo();
			pi.setPayId((String) obj[0]);
			pi.setEmpName((String) obj[1]);
			pi.setPayTypeName((String) obj[2]);
			pi.setPayDay((Date) obj[3]);
			pi.setDes((String) obj[4]);
			pi.setPay((double) obj[5]);
			pi.setToName((String) obj[6]);
			pi.setToPhone((String) obj[7]);
			pi.setPayTypeStatus((int) obj[8]);
			pi.setEmpId((String) obj[9]);
			pis.add(pi);
		}
		pager.setRows(pis);
		return pager;
	}
	

}
