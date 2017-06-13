package com.oa.dao;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Check;
import com.oa.bean.info.EmpCheckInfo;
import com.oa.common.bean.Pager4EasyUI;
/**
 * 员工值班DAOimpl
 * @author 程燕
 *
 */
public class EmpCheckDAOImpl extends AbstractBaseDAO<Check> implements EmpCheckDAO{

	/**
	 * save
	 * delete
	 * update
	 * queryById
	 * queryPager
	 * 以上是自带
	 */
	@Override
	public Check save(Check t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Check t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Check t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Check queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Check> queryPager(String beanName, Pager4EasyUI<Check> pager) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 自己添加的一些功能
	 */
	@Override
	public Pager4EasyUI<EmpCheckInfo> queryByPager(Pager4EasyUI<EmpCheckInfo> pager,Date beginDate,Date endDate ,String addType ,String address, String empid,String empName,String sort,String order){
		Session session = getSessionFactory().getCurrentSession();
		String sel = "select c.checkid za, d.depId zb, d.name zc,e.empid zd,e.name ze,r.roomid zf,r.name zg,g.gradeid zh,g.name zi,c.des zj,c.weekday zk,c.checktime zl "
				+ " from t_check c left join t_emp e on c.empid = e.empid "
				+ " left join t_dept d on e.depid = d.depid "
				+ "  left join t_room r on c.roomid = r.roomid "
				+ " left join t_grade g on c.gradeid = g.gradeid  ";
		StringBuffer whe = new StringBuffer(" where c.weekday <=:endDate ");
		String orderbyStr = "";
		if(sort!=null&&sort.equals("")&&order!=null&&order.equals("")){
			orderbyStr = " order by "+ sort + " " + order;
		}
		if(beginDate!=null){			whe.append(" and c.weekday >= :beginDate ");		}
		if(beginDate==null){ endDate = new Date();}
		if(addType !=null && !addType.equals("")){
			if(addType.equals("room")){
				whe.append(" and c.roomid is not null and c.roomid != '' ");
			}else {
				whe.append(" and c.gradeid is not null and c.gradeid != '' ");
			}
			if(address!=null &&!address.equals("")){
				whe.append(" and " + addType+ "id" + " = :address") ;
			}
		}
		if(empName!=null&&!empName.equals("")){			whe.append(" and e.name like :empName ");		}
		if(empid!=null && !empid.equals("")){			whe.append(" and empid = :empid");		}
		
		String sql = sel +whe.toString()+ orderbyStr;
		SQLQuery query = session.createSQLQuery(sql);
		if(beginDate!=null){	query.setParameter("beginDate", beginDate);}
		query.setParameter("endDate", endDate);
		if(addType!=null && !addType.equals("")){
			if(address!=null && !address.equals("")){				query.setParameter("address", address);			}
		}
		if(empid!=null && !empid.equals("")){			query.setParameter("empid", empid);		}
		if(empName!=null&&!empName.equals("")){			query.setParameter("empName", empName);		}
		
		query.setFirstResult((pager.getPageNo()-1)*pager.getPageSize());
		query.setMaxResults(pager.getPageSize());
		List list = query.list();
		List empCheckInfos = list2EmpCheckInfos(list);
		pager.setRows(empCheckInfos);
		return pager;
	}

	@Override
	public int countNorm( Date[] date, String addType, String address, String empid) {
		Session session = getSessionFactory().getCurrentSession();
		String sel = " select count(c.checkid) from t_check c left join t_emp e on c.empid = e.empid "
				+ "left join t_dept d on e.depid = d.depid "
				+ "left join t_room r on c.roomid = r.roomid "
				+ "left join t_grade g on c.gradeid = g.gradeid  ";
		String wheDate = " where weekday >= ? and weekday <=?";
		String wheAdd = "";
		String wheEmp = "";
		String wheA = "";
		int paramCount= 2;
		if(addType !=null && !addType.equals("")){
			if(addType.equals("room")){
				wheAdd = " and c.roomid is not null and c.roomid != '' ";
			}else {
				wheAdd = " and c.gradeid is not null and c.gradeid != '' ";
			}
			if(address!=null &&!address.equals("")){
				wheA = " and " + wheAdd+ "id" + " = ?" ;
				paramCount+=1;
			}
		}
		if(empid!=null &&  !empid.equals("")){
			wheEmp = " and c.empid = ?";
			paramCount +=1;
		}
		String sql = sel + wheDate + wheAdd + wheA+  wheEmp ;
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter(0, date[0]);
		query.setParameter(1, date[1]);
		if(addType!=null && !addType.equals("")){
			if(address!=null && !address.equals("")){
				query.setParameter(2, address);
			}else {
				if(empid!=null && !empid.equals("")){
					query.setParameter(3, empid);
				}
			}
		}else if(empid!=null && !empid.equals("")){
			query.setParameter(2, empid);
		}
		BigInteger bigInt = (BigInteger) query.uniqueResult();
		
		return bigInt.intValue();
	}
	
	
	
	/**
	 * t
	 * @param result 是查询出的结果贪集,放入EmpCheckInfo
	 * @return 返回组装好的List<EmpCheckInfo>
	 */
	private List<EmpCheckInfo> list2EmpCheckInfos(List<Object[]> result){
		List<EmpCheckInfo> empCheckInfos = new ArrayList<EmpCheckInfo>();
		for(int i = 0,len = result.size(); i<len; i++){
			Object[] obj = result.get(i);
			EmpCheckInfo empCheckInfo = new EmpCheckInfo();
			
			empCheckInfo.setCheckId(obj[0].toString());
			empCheckInfo.setDepId(obj[1].toString());;
			empCheckInfo.setDepName(obj[2].toString());
			empCheckInfo.setEmpId(obj[3].toString());
			empCheckInfo.setEmpName(obj[4].toString());
			
			if(obj[5]!=null && !obj[5].equals("")){
				empCheckInfo.setRoomId(obj[5].toString());
				empCheckInfo.setRoomName(obj[6].toString());}
			
			if(obj[7]!=null && !obj[7].equals("")){
				empCheckInfo.setGradeId(obj[7].toString());
				empCheckInfo.setGradeName(obj[8].toString());}
			
			empCheckInfo.setDes(obj[9].toString());
			empCheckInfo.setWeekday((Date) obj[10]);
			empCheckInfo.setCheckTime((Time) obj[11]);
			empCheckInfos.add(empCheckInfo);
		}
		return empCheckInfos;
	}
}
