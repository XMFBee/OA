package com.oa.common.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oa.bean.Employee;

public class WebUtil {

    public static final int PAGE_SIZE = 20;


    public static int getPageNo(HttpServletRequest req) {
        String pageStr = req.getParameter("page");
        if (pageStr != null && !pageStr.equals("")) {
            return Integer.valueOf(pageStr);
        }
        return 1;
    }

    public static int getPageSize(HttpServletRequest req) {
        String rowsPage = req.getParameter("rows");
        if (rowsPage != null && !rowsPage.equals("")) {
            return Integer.valueOf(rowsPage);
        }
        return PAGE_SIZE;
    }
    
    public static Date str2Date(String dateStr ,String fromatTest) {
    	Date date = null;
		if(fromatTest!=null && !fromatTest.equals("") && dateStr.hashCode()!=0) {
	    	DateFormat formate = new SimpleDateFormat(fromatTest);
	    	
	    	try {
				 date =  formate.parse(dateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
    	return date;
    }
    
    public static String date2Str(Date date) {
    	String dateStr = "";
    	if(date!=null) {
    		SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		 dateStr=formate.format(date);
    	}
    	return dateStr;
    }
    
    public static String[] idsStr2Strs(String sou, String split){
    	String[] ids = sou.split(split);
    	return ids;
    }
    
    /**
     * 
     * @param sou源,如'张三'
     * @return sql语句中的模糊用,如'%张%三%'
     */
    public static String vague(String sou){
		String reg = "(.{1})";
		StringBuffer sb = new StringBuffer(sou.replaceAll(reg, "$1%"));
		sb.insert(0, "%");
		return sb.toString();
	}
    
    public static Object getSessionValue(HttpServletRequest req,String value){
    	return req.getSession().getAttribute(value);
    }
    
    public static String getRoleId(HttpServletRequest req){
    	Employee emp = (Employee)req.getSession().getAttribute("employee");
    	return emp.getRole().getRoleId();
    }
}
