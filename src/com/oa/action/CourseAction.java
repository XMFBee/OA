package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.bean.Course;
import com.oa.bean.Employee;
import com.oa.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;

public class CourseAction extends BaseAction{
	
	private static final long serialVersionUID = -6535576395072254987L;

	//郭昶 教务管理中的课程表
	
	public CourseService courseService;

	public ControllerRequest resu;
	
	private Course course;
	
	private List<Course> rows;
	
	private String id;
	
	private long total;
	
	private String courseName;
	
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	public Course getCourse() {
		return course;
	}
	
	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Course> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}
	
	public String courseDisable(){  // 禁用课程
			courseService.updateStatus("Course","courseId", 0, id);
			return "disable";
	}
	
	public String courseEnabled(){  // 启用课程
			courseService.updateStatus("Course","courseId",1, id);
			return "enabled";
	}
	
	public String courseByPage(){	//分页查询课程
		Pager4EasyUI<Course> pager = new Pager4EasyUI<Course>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = courseService.queryPager("Course", pager);
		pager.setTotal(courseService.count("Course"));
		total = pager.getTotal();
		rows = pager.getRows();
		return "page";
		
	}
	
	public String showCourse(){//转发到显示课程页面
		return "showcourse";
	}
	
	public String courseUpdate(){ //更新课程
			courseService.update(course);
			resu = ControllerRequest.getSuccessRequest("更新成功");
			return "update";
	}
	
	public String courseById(){
		return "id";
	}
	
	public String courseSave(){	//添加课程
			course.setStatus(1);
			courseService.save(course);
			resu = ControllerRequest.getSuccessRequest("添加成功");
			return "save";
	}

	public String pagerByName(){	//课程模糊查询
		Pager4EasyUI<Course> pager = new Pager4EasyUI<Course>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager = courseService.queryBySearch(pager, courseName);
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu = ControllerRequest.getSuccessRequest("查询成功");
		}else{
			resu = ControllerRequest.getFailRequest("没有您查询的记录");
		}
		return "queryByName";
	}
	
	
}
