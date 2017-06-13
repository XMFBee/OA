package com.oa.common.web;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class TempDate {
	public static SimpleDateFormat sdf =  new SimpleDateFormat("HH:mm:ss");
	public static SimpleDateFormat dateFormat =  new SimpleDateFormat("yyyy-MM-dd");
    public static final String TIME_FORMAT = "-";
	
    /**
     * 
     * @param month输入月份
     * @return返回该月的第一天的0点Date 与该月最后一天的0点Date
     */
	public static Date[] inMoth2Date(int month){
		Date[] dates = new Date[2];
		dates[0] =giveDate(0,month,1,0,0,-1);
		dates[1] = giveDate(0,month+1,1,0,0,-1);
		return dates;
	}
	
	public static Date[] inYearMonth2Date(int year ,int month) {
		Date[] dates = new Date[2];
		dates[0] =giveDate(year,month,1,0,0,-1);
		dates[1] = giveDate(year,month+1,1,0,0,-1);
		return dates;
	}
	
	/**
	 * 
	 * @param year 输入年份
	 * @return 返回该年的第一天0点至最后一天的所有考勤
	 */
	public static Date[] inYear2Date(int year){
		Date[] dates = new Date[2];
		dates[0] =giveDate(year,1,1,0,0,0);
		dates[1] = giveDate(year+1,0,0,0,0,0);
		return dates;
	}
	
	public static Date[] inDate2Date(Date date){
		Date[] dates = new Date[2];
		Calendar a=Calendar.getInstance();
		SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM");
		SimpleDateFormat sdf2= new SimpleDateFormat("dd");
		
		int year = Integer.valueOf(sdf0.format(date));
		int month = Integer.valueOf(sdf1.format(date));
		int day = Integer.valueOf(sdf2.format(date));
		
		dates[0] =giveDate(year,month,day,0,0,0);
		
		dates[1] = giveDate(year,month,day+1,0,0,-1);
		return dates;
	}
	
	
	
	public static Date giveDate(int year, int month, int day,int hour,int minute,int second){
		Date date = new Date();
		GregorianCalendar gc = new GregorianCalendar();
		if(year!=0){gc.set(Calendar.YEAR,year);}//设置年
		gc.set(Calendar.MONTH, month-1);//这里0是1月..以此向后推
		gc.set(Calendar.DAY_OF_MONTH, day);//设置天
		
		gc.set(Calendar.HOUR_OF_DAY,hour);
		gc.set(Calendar.MINUTE,minute);
		gc.set(Calendar.SECOND,second);
		date=gc.getTime();
		return date;
	}
	
	
	public static Time str2Time(String timeStr){
		Date date_util =null;
		Time time = null;
		if(timeStr!=null&&!timeStr.equals("")){
			try {
				date_util = sdf.parse(timeStr);
				time = new Time(date_util.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			} 
		}
		return time;
	}
	
	public static String date2Str(Date date) {
		if(date!=null){			return dateFormat.format(date);		}
		return "";
	}
	
	public static String time2Str(Time time){
		if(time!=null) {			return sdf.format(time);		}
		return "";
	}
}
