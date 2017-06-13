package com.oa.common.bean;

import java.util.List;

public class Pager4EasyUI<T> {
	
	private int pageNo; // 当前页
	private int pageSize; // 每页显示多少条记录
	
	private List<T> rows; // 返回easyui结果集
	private long total;   // 返回easyui总记录数
	
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
	public int getBeginIndex() {
		return (pageNo - 1) * pageSize;
	}
	@Override
	public String toString() {
		return "Pager4EasyUI [pageNo=" + pageNo + ", pageSize=" + pageSize + ", rows=" + rows + ", total=" + total
				+ "]";
	}
	
}
