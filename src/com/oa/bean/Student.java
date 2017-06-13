package com.oa.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Created by 赖泰君 on 2016/12/21. 学生表
 */
public class Student {
	private String stuId; // 学生编号
	private String stuNo; // 学号
	private String name; // 姓名

	private String pwd; // 密码
	private String idCard; // 身份证号
	private String phone; // 手机号
	private String qq; // QQ号
	private String weChat; // 微信号
	private String school; // 毕业学校
	private int age; // 年龄
	private Date birthday; // 生日
	private String gender; // 性别
	private String address; // 地址ַ
	private String nation; // 籍贯
	private String residence; // 户口性质

	private String gradeId; // 班级编号
	private String roomId; // 宿舍 编号
	private String empId;	// 招生老师编号
	private String stuStatus; // 学生状态̬
	private int status; // 状态̬
	private String des; // 描述
	private String employeeId; // 招生老师编号
	private Date startDay; // 入学时间
	private String parentPhone; // 家长电话
	private String parentName; // 家长姓名
	
	private Room room; // 多个人对应一个宿舍
	private Grade grade;  // 多个学生对应一个班级
	private String role; // 班干部角色

	private Employee emp; // 多个学生对应一个招生老师
	
	private Set<StudentFeedback> stuFks; // 一个学生对应多个反馈
	private Set<Score> scores; // 一个学生有多个成绩

	private Set<StudentChecking> stucks; // 一个学生多个考勤信息
	
	private Set<Job> jobs; 		// 一个学生多个就业
	
	private Set<Talk> talks;   // 一个学生多次谈心
	
	private Set<StudentLeave> stuLeaves;  // 一个学生对应对个请假
	
	private Set<Income> incomes;
	
	@JSON(serialize = false)
	public Set<Income> getIncomes() {
		return incomes;
	}

	public void setIncomes(Set<Income> incomes) {
		this.incomes = incomes;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	@JSON(serialize=false)
	public Set<StudentLeave> getStuLeaves() {
		return stuLeaves;
	}

	public void setStuLeaves(Set<StudentLeave> stuLeaves) {
		this.stuLeaves = stuLeaves;
	}

	@JSON(serialize = false)
	public Set<Talk> getTalks() {
		return talks;
	}

	public void setTalks(Set<Talk> talks) {
		this.talks = talks;
	}

	@JSON(serialize = false)
	public Set<Job> getJobs() {
		return jobs;
	}

	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}

	@JSON(serialize = false)
	public Set<StudentChecking> getStucks() {
		return stucks;
	}

	public void setStucks(Set<StudentChecking> stucks) {
		this.stucks = stucks;
	}

	@JSON(serialize = false)
	public Set<Score> getScores() {
		return scores;
	}

	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}

	@JSON(serialize = false)
	public Set<StudentFeedback> getStuFks() {
		return stuFks;
	}

	public void setStuFks(Set<StudentFeedback> stuFks) {
		this.stuFks = stuFks;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getStuNo() {
		return stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWeChat() {
		return weChat;
	}

	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthDay(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getStuStatus() {
		return stuStatus;
	}

	public void setStuStatus(String stuStatus) {
		this.stuStatus = stuStatus;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public String getParentPhone() {
		return parentPhone;
	}

	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "Student{" + "stuId='" + stuId + '\'' + ", stuNo='" + stuNo + '\'' + ", name='" + name + '\'' + ", pwd='"
				+ pwd + '\'' + ", idCard='" + idCard + '\'' + ", phone='" + phone + '\'' + ", qq='" + qq + '\''
				+ ", weChat='" + weChat + '\'' + ", school='" + school + '\'' + ", age=" + age + ", birthday="
				+ birthday + ", gender='" + gender + '\'' + ", address='" + address + '\'' + ", nation='" + nation
				+ '\'' + ", residence='" + residence + '\'' + ", gradeId='" + gradeId + '\'' + ", stuStatus='"
				+ stuStatus + '\'' + ", status=" + status + ", des='" + des + '\'' + ", employeeId='" + employeeId
				+ '\'' + ", startDay=" + startDay + ", parentPhone='" + parentPhone + '\'' + ", parentName='"
				+ parentName + '\'' + ", role='" + role + '\'' + '}';
	}
}
