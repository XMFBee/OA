<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>

<script>
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';

function queryByWhe(){
	console.log($('#beginDate').datebox('getValue'))
	$("#datagrid").datagrid({
		queryParams: {
			beginDate:$('#beginDate').datebox('getValue'),
			endDate:$('#endDate').datebox('getValue'),
			empid:1
		}
	})
}

</script>

</head>
<body id= "body">
	<table id="datagrid" class="easyui-datagrid" style="height:100%;width:100%"  data-options="
		url:'report/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar',
		queryParams:{'empid':1}
	">  
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
	 <div id="toolbar" style="padding:5px;height:auto">
	 	<div align="left">
	 		<a class= "easyui-linkbutton" onclick = "showAdd()">新增日志</a>
	 	</div>
		<div style="margin-bottom:5px">
			开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date',formatter:myformatter,parser:myparser"></input>
			结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
			<a href="javascript:;" onclick = "queryByWhe()">查询</a>
		</div>
	</div>
	
	<div id="add_win" class="easyui-window" title="请假申请表单" data-options="closed:true" style="width:500px;height:200px;padding:5px;">
				<h2>工作日志</h2>
				<form id="add_form" method="post">
				<input name="report.employee.empId" value="1"/>
		    	<table cellpadding="5">
		    		<tr>
		    			<td>今日工作日志:</td>
		    			<td><input class="easyui-textbox" type="text" name="empleave.des" data-options="required:true,validType:'length[10,255]', required:true,missingMessage:'请填写今日工作日志',invalidMessage:'字数应在10-255字符以内'"></input></td>
		    		</tr>
		    		<tr>
		    			<td><a class= "easyui-linkbutton" onclick = "add('<%=path%>/report/save')">提交</td>
		    		</tr>
		    	</table>
		    </form>
		</div>
	
</body>
</html>