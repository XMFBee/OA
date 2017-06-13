<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

		<h2 align="center">学生基本详情</h2>
		<br />
		<table>
			<tr>
				<td>学号: ${requestScope.stu.stuNo}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>名称: ${requestScope.stu.name}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>身份证: ${requestScope.stu.idCard}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>手机号: ${requestScope.stu.phone}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>qq: ${requestScope.stu.qq}</td>
			</tr>
			<tr>
				<td>微信: ${requestScope.stu.weChat}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>年龄: ${requestScope.stu.age}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>生日: ${requestScope.stu.birthday}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>性别: ${requestScope.stu.gender}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>毕业学校: ${requestScope.stu.school}</td>
			</tr>
			<tr>
				<td>地址: ${requestScope.stu.address}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>籍贯${requestScope.stu.nation}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>户口性质: ${requestScope.stu.residence}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>家长手机号: ${requestScope.stu.parentPhone}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>家长名称: ${requestScope.stu.parentName}</td>
			</tr>
			<tr>
				<td>入学时间: ${requestScope.stu.startDay}</td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td>描述: ${requestScope.stu.des}</td>
			</tr>
		</table>
</body>
</html>