<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String path = request.getContextPath();%>
<!DOCTYPE>
<html>
<head>
<title>员工登陆</title>
	<meta http-equiv="<%=path %>/Content-Type" content="text/html; charset=utf-8">
	<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/templatemo_style.css" rel="stylesheet" type="text/css">
	<link href="<%=path %>/css/bootstrap-social.css"  rel="stylesheet" type="text/css">
	<link href="<%=path %>/js/bootstrap.min.js" rel="stylesheet" type="text/js">
<%-- <link rel = "stylesheet" href = "<%=path %>/css/admin_login.css"/> --%>

</head>
<body class="b" background="<%=path %>/image/back3.jpg">
	
	<div class="lg" >
		<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15" style="color: white;">宏图OA系统</h1>
			<form
				class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30"
				role="form" action="<%=path %>/login/emplogin" method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper">
							<label for="username" class="control-label fa-label">
							<i class="fa fa-user fa-medium"></i>
							</label> 
					<input type="text" class="form-control" id="phone" name="employee.phone" placeholder="请员工输入用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<label for="password" class="control-label fa-label"><i
								class="fa fa-lock fa-medium"></i></label> <input type="password"
								class="form-control" id="pwd" name="employee.pwd" placeholder="请员工输入密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper" style="text-align: center;">
							<input type="submit"  style="margin-left: -10px;" value="登录" class="btn btn-info">
							<input type="reset" style="margin-left: 40px;" value="重置" class="btn btn-info">
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="col-md-12">					
						<label  class="control-label fa-label" style=" margin-left: 34px">
						<i class="icon-phone"></i>
						联系我们：0797-8988888
						</label>
						<div class="inline-block">
							<a href="#"  style=" margin-left: 175px">宏图官网</i></a>
						</div>
					</div>
				</div>
			</form>
			<div class="text-center" style="margin-top: -30px;">
				<a href="<%=path %>/login/showStudent" class="templatemo-create-new">
				 <b style="color: white;">学生登陆</b>
				</a>
			</div>
		</div>
	</div>
	</div>
</body>
</html>