<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <% String path = request.getContextPath(); %>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/json2.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
</head>
<script>
	$(function() {
		setTimeout(function(){
			  $(".messager-body").window('close');  
			},3000);
		$.messager.alert("错误","您的权限不足","error");
	});
</script>
<body>
	
</body>
</html>
