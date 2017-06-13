<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path= request.getContextPath(); %>
<!DOCTYPE html>
<html>
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
<script type = "text/javascript" src = "<%=path %>/js/datagrid-groupview.js"></script>

<title>员工考勤</title>
</head>
<body>

<table id="datagrid" class="easyui-datagrid" style="height:100%;" data-options="
		url:'empChecking/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'
	"
	>  
    <thead>  
        <tr>  
            <th data-options="field:'empname',align:'center',width:80" >员工姓名</th> 
            <th data-options="field:'depname',align:'center',width:80">所在部门</th>
            <th data-options="field:'laterCount',align:'center',width:80">迟到</th>  
            <th data-options="field:'forgetCount',align:'center',width:80">未打卡</th>  
            <th data-options="field:'leaveCount',align:'center',width:80">请假</th>  
        </tr>  
    </thead>  
	</table>
		
	<!-- 工具 -->
	<div id= "toolbar" style="padding:5px;height:auto;width:100%" >
		<div align="left" style="display:inline-block">
			<h2 id="dateTime" ></h2>
		</div>
		<div align="right" style="float:right">
			<input  class="easyui-datebox" name = "beginDate" data-options="formatter:myformatter,parser:myparser">
			<input  class="easyui-datebox" name = "endDate" data-options="formatter:myformatter,parser:myparser">
			<a class= "easyui-linkbutton" onclick="query()">查询</a>
		</div>
	</div>	
	
	<script>
		$(function(){
			var date = new Date();
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			$("#dateTime").text(y+"年"+m+"月");
		})
		
	</script>
</body>
</html>