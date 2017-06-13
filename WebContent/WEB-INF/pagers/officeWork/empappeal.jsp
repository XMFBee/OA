<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE>
<html style="height:100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href ="http://static.hdslb.com/images/favicon.ico" />

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>


<title>申诉</title>
</head>
<body class="easyui-tabs" id="body" style="height:100%">
	<!-- 部门测试与大Boss测试 -->
	<div title="我的审核">
		<iframe scrolling="auto" frameborder="0"  src="<%=path %>/empAppeal/doEmpappeal" style="width:100%;height:100%;"></iframe>
	</div>
	
	<!-- 个人测试 -->
	 <div title="我是申请" >
		<iframe scrolling="auto" frameborder="0"  src="<%=path %>/empAppeal/seeEmpappeal" style="width:100%;height:100%;"></iframe>
	</div> 
	
</body>

	
	
</html>