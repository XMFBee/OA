<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看自己请假</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>

<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';

function queryByWhe(){//正在测试id
	console.log($('#empId').val())
 	$("#datagrid").datagrid({
		queryParams: {
			hasPass: $('#hasPass').val(),
			pass: $('#pass').val(),
			beginDate:$('#beginDate').datebox('getValue'),
			endDate:$('#endDate').datebox('getValue'),
			empId:$('#empId').val()
		}
	})
}

</script>


</head>
<body>
<table id="datagrid" class="easyui-datagrid" style="width:100%;height:100%;margin:0px"
			data-options="
			queryParams: {
				empId:1
			},
			url:'<%=path %>/empleave/pager',
			method:'get',
			toolbar:'#toolbar',
			queryParams:{empId:1},
			nowrap:false 
			">
			<thead>
				<tr>
					<th data-options="field:'empId',hidden:true"/>
					<th data-options="field:'depId',hidden:true"/>
					<th data-options="field:'leaveId',hidden:true"/>
					<th data-options="field:'leaveDay',width:100">申请日期</th>
					<th data-options="field:'startAndEnd',width:130" formatter = "leaveTimeFormat">请假日期</th>
					<th data-options="field:'des',width:80,align:'right'">请假原由</th>
					<th data-options="field:'firstLeave',width:80,align:'right'" formatter="statuFormat">一级审核</th>
					<th data-options="field:'secondLeave',width:250" formatter="statuFormat">二级审核</th>
					<th data-options="field:'pass',width:60,align:'center'"	formatter="statuFormat" >审核状态</th>
				</tr>
			</thead>
		</table>
		<!-- 工具栏 -->
		<div id = "toolbar">
			<div align="left">
				<a class= "easyui-linkbutton" onclick = "showAdd()" >我要请假</a>
			</div>
			<div align="right"><!-- 这是自己的,也就是以id查 -->
				<form id="wheQuery">
					<input type="hidden" name="depId" id="depId" value=""/>
	    			empId:
	    			<input id="empId" type="text" name="empleave.employee.empId" data-options="required:true"></input>
					审核状态:<select id="hasPass" name = "pass"> 
						<option value="" selected="selected"></option>
						<option value="1">已经审核</option><!-- pass为1 -->
						<option value="0">未审核</option><!-- pass为0 -->
					</select>
					<select id="pass" name = "pass"> 
						<option value="" selected="selected"></option>
						<option value="2">通过</option><!-- pass为2 -->
						<option value="1">未通过</option><!-- pass为1 -->
					</select>
					开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
					结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
					<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe()">查询</a> 
				</form>
			</div>
		</div> 
		
		<!-- 提交请假申请表 -->
		<div id="add_win" class="easyui-window" title="请假申请表单" data-options="closed:true" style="width:500px;height:200px;padding:5px;">
				<h2>员工请假条</h2>
				<form id="add_form" method="post">
		    	<table cellpadding="5">
		    		<tr>
		    			<td>empId:</td>
		    			<td><input class="easyui-textbox" type="text" name="empleave.employee.empId" data-options="required:true"></input></td>
		    		</tr>
		    		<tr>
		    			<td>请假起止时间:</td>
		    			<td><input id="startDate"class="easyui-datetimebox" name="startDate"  data-options="validType:'date' , required:true,missingMessage:'请输选择请假开始时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter1,parser:myparser1"></input></td>
		    			<td><input id="endDate"class="easyui-datetimebox" name="endDate"  data-options="validType:'date' ,required:true,missingMessage:'请输选择请假结束时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter1,parser:myparser1"></input></td>
		    		</tr>
		    		<tr>
		    			<td>请假原由:</td>
		    			<td><input class="easyui-textbox" type="text" name="empleave.des" data-options="required:true,validType:'length[3,255]', required:true,missingMessage:'请填写请假原由',invalidMessage:'字数应在10-255字符以内'"></input></td>
		    		</tr>
		    		<tr>
		    			<td><a class= "easyui-linkbutton" onclick = "add('<%=path%>/empleave/save')">提交</td>
		    		</tr>
		    	</table>
		    </form>
		</div>
</body>
</html>