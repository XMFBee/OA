package com.oa.action.info;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.coyote.http11.filters.BufferedInputFilter;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.EmpChecking;
import com.oa.bean.EmpCheckingInfo;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpCheckingVOInfo;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpCheckingService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 目前写到把页面导出到xls并下载
 * @author 程燕
 *
 */
public class ExcelPOIAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private EmpCheckingService empCheckingService;
	private String defaultName="default.xls";
	
	private String fileName;
	private File file;
	

/**
 * 
 * @return 把页面上的数据输出为excel文件返回给用户
 */
	public String excelOut(){
		String checkingIds = request.getParameter("checkingIds");
		
		List<EmpCheckingVOInfo> rows= empCheckingService.queryByIds(checkingIds);
		HSSFWorkbook workBook =  saveExcel(rows);
		OutputStream out = null;
		String realPath = request.getServletContext().getRealPath("/excel");
		createFile(realPath);
		try {
			out = new FileOutputStream(realPath+"/" + getFileName());
			workBook.write(out);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        System.out.println("数据库导出成功");
        return "excelOut";
	}
	
	/**
	 * 
	 * @return 用户传入excel,存入数据库
	 */
	public String excelIn(){
		System.out.println("excelIn");
		if(file!=null) {
			giveData(file);
		}
		return "excelIn";
	}
	
	public InputStream getOutExcelFile(){
		
		String realPath = request.getServletContext().getRealPath("/excel");
		String path  = realPath;
		path+="/" +getFileName();
		InputStream inStream = null;
		try {
			inStream = new FileInputStream(path);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return inStream;
	}
	
	

	
	/**
	 * get/set
	 * @param fileName
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName(){
		if(fileName==null || fileName.equals("")){
			fileName = defaultName;
		}
		return fileName;
	}

	public void setEmpCheckingService(EmpCheckingService empCheckingService) {
		this.empCheckingService = empCheckingService;
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * 
	 * @param rows 页面上datagrid的数据
	 * @return 表格对象,放入outputStream,则可以保存在本地
	 */
	private HSSFWorkbook saveExcel(List<EmpCheckingVOInfo> rows) {
		String[] columnNames = {"部门","工号","姓名","打卡日期","时间1","时间2","时间3","时间4","时间5","时间6","时间7","时间8"};
		EmpCheckingVOInfo empCheckingVOInfo = null;
		HSSFWorkbook workBook = new HSSFWorkbook();//创建xsl
		HSSFSheet sheet = workBook.createSheet();
		HSSFRow titleRow = sheet.createRow(0);
		HSSFCell[] columns =  new HSSFCell[columnNames.length];
		for(int i = 0,len=columnNames.length; i<len; i++){
			columns[i] = titleRow.createCell(i);
			columns[i].setCellValue(columnNames[i]);
		}

		for(int i = 0,len=rows.size(); i<len; i++){
			HSSFRow row = sheet.createRow(i+1);
			empCheckingVOInfo = rows.get(i);
			
			HSSFCell cell1 = row.createCell(0); cell1.setCellValue(empCheckingVOInfo.getDepName());
			HSSFCell cell2 = row.createCell(1); cell2.setCellValue(empCheckingVOInfo.getEmpId());
			HSSFCell cell3 = row.createCell(2);cell3.setCellValue(empCheckingVOInfo.getEmpName());
			HSSFCell cell4 = row.createCell(3);cell4.setCellValue(TempDate.date2Str(empCheckingVOInfo.getCheckingDay()));
			HSSFCell cell5 = row.createCell(4);cell5.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime1()));
			HSSFCell cell6 = row.createCell(5);cell6.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime2()));
			HSSFCell cell7 = row.createCell(6);cell7.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime3()));
			HSSFCell cell8 = row.createCell(7);cell8.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime4()));
			HSSFCell cell9 = row.createCell(8);cell9.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime5()));
			HSSFCell cell10 = row.createCell(9);cell10.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime6()));
			HSSFCell cell11 = row.createCell(10);cell11.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime7()));
			HSSFCell cell12 = row.createCell(11);cell12.setCellValue(TempDate.time2Str(empCheckingVOInfo.getTime8()));
			
		}
		return workBook;
	}
	
	
	private  File createFile(String path) {
		 File file = new File(path);
		 if(!file.exists()){ file.mkdir();} 
		 return file;
	}
	
	
	/**
	 * 
	 * @param hssfCell 表格中的某个单元格,返回单元格的值
	 * @return
	 */
	 private String getValue(HSSFCell hssfCell) {
		 if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
	            // 返回布尔类型的值
	            return String.valueOf(hssfCell.getBooleanCellValue());
	        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
	            // 返回数值类型的值
	            return String.valueOf(hssfCell.getNumericCellValue());
	        } else {
	            // 返回字符串类型的值
	            return String.valueOf(hssfCell.getStringCellValue());
	        }
	 }
	 /**
	  * 把需要导入到数据库的数据做为参数传递进来,导入进数据库
	  * @param datas
	  */
	 private void saveExcelDatas(Map<One,EmpChecking> datas){
		 for(One o : datas.keySet()){
			 EmpChecking empChecking = datas.get(o);
			 empCheckingService.save(empChecking);
		 }
	 }
	 
	 /**
	  * 
	  * @param file从页面传进来的文件
	  */
	 private void giveData(File file){
		EmpChecking empChecking=null;
		
		Map<One,EmpChecking> empCheckings=new HashMap<One,EmpChecking>();
		if(file!=null) {
			try {
				InputStream is = new FileInputStream(file);
				HSSFWorkbook workBook = new HSSFWorkbook(is);
				 for (int numSheet = 0; numSheet < workBook.getNumberOfSheets(); numSheet++) {
					 HSSFSheet sheet = workBook.getSheetAt(numSheet);
					 if (sheet == null) {			                continue;			            }
					 for(int numRow = 1; numRow <=sheet.getLastRowNum();numRow++){
						 HSSFRow row = sheet.getRow(numRow);
						 if (row == null) {			                    continue;			                }
						 empChecking=new EmpChecking();
						 One one = new One();
						 Employee employee = new Employee();
						 empChecking.setEmployee(employee);
						 HSSFCell cell2 = row.getCell(1); if(cell2!=null){employee.setEmpId(getValue(cell2));one.setEmpid(getValue(cell2));}
						 HSSFCell cell4 = row.getCell(3);if(cell4!=null){empChecking.setCheckingDay(WebUtil.str2Date(getValue(cell4),"yyyy-MM-dd"));one.setDate(getValue(cell4));}
						 HSSFCell cell5 = row.getCell(4);if(cell5!=null){empChecking.setTime1(TempDate.str2Time(getValue(cell5)));}
						 HSSFCell cell6 = row.getCell(5);if(cell6!=null){empChecking.setTime2(TempDate.str2Time(getValue(cell6)));}
						 HSSFCell cell7 = row.getCell(6);if(cell7!=null){empChecking.setTime3(TempDate.str2Time(getValue(cell7)));}
						 HSSFCell cell8 = row.getCell(7);if(cell8!=null){empChecking.setTime4(TempDate.str2Time(getValue(cell8)));}
						 HSSFCell cell9 = row.getCell(8);if(cell9!=null){empChecking.setTime5(TempDate.str2Time(getValue(cell9)));}
						 HSSFCell cell10 = row.getCell(9);if(cell10!=null){empChecking.setTime6(TempDate.str2Time(getValue(cell10)));}
						 HSSFCell cell11 = row.getCell(10);if(cell11!=null){empChecking.setTime7(TempDate.str2Time(getValue(cell11)));}
						 HSSFCell cell12 = row.getCell(11);if(cell12!=null){empChecking.setTime8(TempDate.str2Time(getValue(cell12)));}
						 empCheckings.put(one,empChecking);
					 }
				 }
				 saveExcelDatas(empCheckings);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	 }
	 public static void main(String[] args) {
		Map map = new HashMap<String,String>();
		
		map.put("1", "a");
		map.put("2", "b");
		map.put("3", "c");
		map.put("1", "d");
		map.put("4", "a");
		System.out.println(map);
	}
	 /**
	  * 用于对比重复项
	  * @author 内部类
	  *
	  */
	 private class One{
		 private String date;
		 private String empid;
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getEmpid() {
			return empid;
		}
		public void setEmpid(String empid) {
			this.empid = empid;
		}
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + getOuterType().hashCode();
			result = prime * result + ((date == null) ? 0 : date.hashCode());
			result = prime * result + ((empid == null) ? 0 : empid.hashCode());
			return result;
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			One other = (One) obj;
			if (!getOuterType().equals(other.getOuterType()))
				return false;
			if (date == null) {
				if (other.date != null)
					return false;
			} else if (!date.equals(other.date))
				return false;
			if (empid == null) {
				if (other.empid != null)
					return false;
			} else if (!empid.equals(other.empid))
				return false;
			return true;
		}
		private ExcelPOIAction getOuterType() {
			return ExcelPOIAction.this;
		}
	 }
}

