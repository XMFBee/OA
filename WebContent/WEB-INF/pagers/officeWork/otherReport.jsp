<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>

<script>
	function queryByWhe(){
		console.log($('#beginDate').datebox('getValue'))
		$("#datagrid").datagrid({
			queryParams: {
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empid:$('#empIds').combobox('getValue')
			}
		})
	}

	selectEmps("empIds","<%=path%>");
</script>

<title>Insert title here</title>
</head>
<body id= "body">
	<table id="datagrid" class="easyui-datagrid"  data-options="
		url:'report/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'
	"
	>  
	    <thead>  
	        <tr>  
	            <th data-options="field:'depId',hidden:true" ></th> 
	            <th data-options="field:'empId',hidden:true" ></th> 
	            <th data-options="field:'reportId',hidden:true" ></th> 
	            <th data-options="field:'empName',width:80" >员工名</th> 
	            <th data-options = "field:'depName',width:80" >部门名称</th>
	            <th data-options = "field:'reportday',width:80" >提交时间</th>
	            <th data-options="field:'des',width:80">描述</th>  
	        </tr>  
	    </thead>  
	</table>  
	<!-- 工具 -->
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<input id="empIds" name="empId" class= "easyui-combobox"  data-options="
					valueField: 'key',
					textField: 'value'" />
			开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date',formatter:myformatter,parser:myparser"></input>
			结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
			<a href="javascript:;" onclick = "queryByWhe()">查询</a>
				
		</div>
	</div>
</body>
</html>