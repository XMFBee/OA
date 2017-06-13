<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
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
<title>巡查</title>
<script>
		function changecolumn(whe){
			$('#addType').val(whe);
			 $('#tt').datagrid({
				queryParams: {
						addType: whe,
						empName: $('#empName').val(),
						beginDate:$('#beginDate').datebox('getValue'),
						endDate:$('#endDate').datebox('getValue'),
						
				},
				columns:[[
							{field:'checkId',hidden:true,width:80},
							{field:'empId',hidden:true,width:80},
							{field:whe+'Id',hidden:true,width:80},
							{field:'weekday',title:'日期',width:80},
							{field:'empName',title:'值班员工姓名',width:80},
							{field:'checkTime',title:'时间',width:80},
							{field:whe+'Name',title:'巡查地址名称',width:80},
							{field:'des',title:'值班描述',width:80}
							]]
			}) 
		}
		
		selectEmps("empId","<%=path%>");
	</script>
</head>
<body>
	<table id="tt"  class="easyui-datagrid" style="height:100%"	data-options="
			url:'<%=path %>/check/pager',
			method:'get',
			autoRowHeight:true,
			pagination:true,
			toolbar:'#toolbar',
			groupField:'weekday',
			view:groupview,
			groupFormatter:function(value, rows){
				return value ;
		    }
			">
			<thead>
				<tr>  
		            <th data-options="field:'checkId',hidden:true" /> 
		            <th data-options="field:'empId',hidden:true" />
		            <th data-options="field:'gradeId',hidden:true"/>
		            <th data-options ="field:'weekday',width:80" formatter="dateFormat">日期</th>
		            <th data-options="field:'empName',width:80">值班员工姓名</th>  
		            <th data-options="field:'checkTime',width:80" formatter="timeFormate">时间</th> 
		            <th data-options="field:'gradeName',width:80">巡查班级名称</th>
		            <th data-options="field:'des',width:80">值班描述</th>
		        </tr>  
			</thead>
	</table>  
	<div id="toolbar" align="right">
		<form id = "queryWhe" >
			值班员工: <input id="empName" name="empName" />
			开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
			结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
			<input id="addType" type="hidden" name="addType" />
			<a href="javascript:;" class= "easyui-linkbutton" onclick="changecolumn('grade')">班级查询</a>
			<a href="javascript:;" class= "easyui-linkbutton" onclick="changecolumn('room')">宿舍</a>
		</form>
	</div>
</body>
</html>