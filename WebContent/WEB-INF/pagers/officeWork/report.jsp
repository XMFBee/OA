<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href ="http://static.hdslb.com/images/favicon.ico" />
<title>工作日志</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>

</head>
<body class="easyui-tabs" id="body" style="height:100%">
	<div title = "他人的">
		<iframe scrolling="auto" frameborder="0"  src="<%=path %>/report/otherReport" style="width:100%;height:100%;"></iframe>
		
	</div>
	<div title = "自己的">
		<iframe scrolling="auto" frameborder="0"  src="<%=path %>/report/myReport" style="width:100%;height:100%;"></iframe>
	</div>
</body>
</html>