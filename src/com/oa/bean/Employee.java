package com.oa.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

/**
 * Created by 邱康 on 2016/12/20. Employee 员工表
 */
public class Employee {
	private String empId; // 员工编号

	private Department department;// 部门
	private Role role;// 角色

	private String name; // 姓名
	private String pwd; // 密码
	private String idCard; // 身份证号
	private String nation; // 籍贯
	private String gender; // 性别
	private String fingerNo; // 指纹编号
	private Date birthday; // 出生日期
	private String email; // 邮箱
	private String phone; // 手机号
	private String qq; // qq号
	private String weChat; // 微信号
	private String address; // 家庭地址
	private String married; // 是否结婚
	private String contactName; // 联系人姓名
	private String contactPhone; // 联系人手机号
	private String college; // 毕业院校
	private String major; // 专业
	private String eduBack; // 学历
	private String bankName; // 开户行名称
	private String accountName; // 银行卡姓名
	private String accountNo; // 银行账号
	private String alipay; // 支付宝账号
	private Date hireDay; // 入职时间
	private Date resignDay; // 离职时间
	private Integer status; // 状态，默认可用

	/**
	 * 其它的关联到员工表
	 * 
	 * @return duty1-8 为值班 empCheckings 为员工考勤表 report 为员工日志表 department1 经理关联到部门
	 *         grades1-3班级的老师们
	 */
	private Set<Duty> duty1;
	private Set<Duty> duty2;
	private Set<Duty> duty3;
	private Set<Duty> duty4;
	private Set<Duty> duty5;
	private Set<Duty> duty6;
	private Set<Duty> duty7;
	private Set<Duty> duty8;

	private Set<EmpChecking> empCheckings;

	private Set<Report> reports;

	private Set<Grade> grades1;
	private Set<Grade> grades2;
	private Set<Grade> grades3;

	private Set<Student> stus; // 一个招生老师招多个学生
	
	private Set<Talk> talks;

	private Set<Meetting> meettings;
	private Set<Check> checks;

	private Set<Empappeal> empAppeals;

	private Set<Progress> progress;

	private Set<GoodsUse> goodsUses;

	private Set<GoodsApp> appEmps; // XMF 一个员工可申购多次

	private Set<Notice> notice; // 郭玉清 一个员工多个公告
	
	// 赖泰君
	private Set<SalaryInfo> salaryInfos;
	private Set<Salary> salarys; // 工资发放情况
	private Set<Income> incomes;

	
	@JSON(serialize = false)
	public Set<Income> getIncomes() {
		return incomes;
	}

	public void setIncomes(Set<Income> incomes) {
		this.incomes = incomes;
	}

	public Set<Notice> getNotice() {
		return notice;
	}

	public void setNotice(Set<Notice> notice) {
		this.notice = notice;
	}

	@JSON(serialize = false)
	public Set<Salary> getSalarys() {
		return salarys;
	}

	public void setSalarys(Set<Salary> salarys) {
		this.salarys = salarys;
	}

	@JSON(serialize = false)
	public Set<SalaryInfo> getSalaryInfos() {
		return salaryInfos;
	}

	public void setSalaryInfos(Set<SalaryInfo> salaryInfos) {
		this.salaryInfos = salaryInfos;
	}

	public Set<Progress> getProgress() {
		return progress;
	}

	public void setProgress(Set<Progress> progress) {
		this.progress = progress;
	}

	public Set<Talk> getTalks() {
		return talks;
	}

	public void setTalks(Set<Talk> talks) {
		this.talks = talks;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty1() {
		return duty1;
	}

	public void setDuty1(Set<Duty> duty1) {
		this.duty1 = duty1;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty2() {
		return duty2;
	}

	public void setDuty2(Set<Duty> duty2) {
		this.duty2 = duty2;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty3() {
		return duty3;
	}

	public void setDuty3(Set<Duty> duty3) {
		this.duty3 = duty3;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty4() {
		return duty4;
	}

	public void setDuty4(Set<Duty> duty4) {
		this.duty4 = duty4;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty5() {
		return duty5;
	}

	public void setDuty5(Set<Duty> duty5) {
		this.duty5 = duty5;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty6() {
		return duty6;
	}

	public void setDuty6(Set<Duty> duty6) {
		this.duty6 = duty6;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty7() {
		return duty7;
	}

	public void setDuty7(Set<Duty> duty7) {
		this.duty7 = duty7;
	}

	@JSON(serialize = false)
	public Set<Duty> getDuty8() {
		return duty8;
	}

	public void setDuty8(Set<Duty> duty8) {
		this.duty8 = duty8;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {// TODO
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getIdCard() {// TODO
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFingerNo() {
		return fingerNo;
	}

	public void setFingerNo(String fingerNo) {
		this.fingerNo = fingerNo;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMarried() {
		return married;
	}

	public void setMarried(String married) {
		this.married = married;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getEduBack() {
		return eduBack;
	}

	public void setEduBack(String eduBack) {
		this.eduBack = eduBack;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAlipay() {
		return alipay;
	}

	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}

	public Date getHireDay() {
		return hireDay;
	}

	public void setHireDay(Date hireDay) {
		this.hireDay = hireDay;
	}

	public Date getResignDay() {
		return resignDay;
	}

	public void setResignDay(Date resignDay) {
		this.resignDay = resignDay;
	}

	public Integer getStatus() {
		return status;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", name=" + name + ", pwd=" + pwd + ", idCard=" + idCard + ", nation="
				+ nation + ", gender=" + gender + ", fingerNo=" + fingerNo + ", birthday=" + birthday + ", email="
				+ email + ", phone=" + phone + ", qq=" + qq + ", weChat=" + weChat + ", address=" + address
				+ ", married=" + married + ", contactName=" + contactName + ", contactPhone=" + contactPhone
				+ ", college=" + college + ", major=" + major + ", eduBack=" + eduBack + ", bankName=" + bankName
				+ ", accountName=" + accountName + ", accountNo=" + accountNo + ", alipay=" + alipay + ", hireDay="
				+ hireDay + ", resignDay=" + resignDay + ", status=" + status + "]";
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@JSON(serialize = false)
	public Set<EmpChecking> getEmpCheckings() {
		return empCheckings;
	}

	public void setEmpCheckings(Set<EmpChecking> empCheckings) {
		this.empCheckings = empCheckings;
	}

	@JSON(serialize = false)
	public Set<Report> getReports() {
		return reports;
	}

	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}

	@JSON(serialize = false)
	public Set<Meetting> getMeettings() {
		return meettings;
	}

	public void setMeettings(Set<Meetting> meettings) {
		this.meettings = meettings;
	}

	@JSON(serialize = false)
	public Set<Grade> getGrades1() {
		return grades1;
	}

	public void setGrades1(Set<Grade> grades1) {
		this.grades1 = grades1;
	}

	@JSON(serialize = false)
	public Set<Grade> getGrades2() {
		return grades2;
	}

	public void setGrades2(Set<Grade> grades2) {
		this.grades2 = grades2;
	}

	@JSON(serialize = false)
	public Set<Grade> getGrades3() {
		return grades3;
	}

	public void setGrades3(Set<Grade> grades3) {
		this.grades3 = grades3;
	}

	@JSON(serialize = false)
	public Set<Check> getChecks() {
		return checks;
	}

	public void setChecks(Set<Check> checks) {
		this.checks = checks;
	}

	@JSON(serialize = false)
	public Set<Empappeal> getEmpAppeals() {
		return empAppeals;
	}

	public void setEmpAppeals(Set<Empappeal> empAppeals) {
		this.empAppeals = empAppeals;
	}

	@JSON(serialize = false)
	public Set<GoodsUse> getGoodsUses() {
		return goodsUses;
	}

	@JSON(serialize = false)
	public Set<GoodsApp> getAppEmps() {
		return appEmps;
	}

	public void setAppEmps(Set<GoodsApp> appEmps) {
		this.appEmps = appEmps;
	}

	public void setGoodsUses(Set<GoodsUse> goodsUses) {
		this.goodsUses = goodsUses;
	}
	@JSON(serialize = false)
	public Set<Student> getStus() {
		return stus;
	}

	public void setStus(Set<Student> stus) {
		this.stus = stus;
	}
	
}
