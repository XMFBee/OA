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
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';

	function queryByWhe(){//测试Boss
		$("#datagrid").datagrid({
			queryParams: {
				hasPass: $('#hasPass').val(),/* 这是为了测试,后期需要删除 */
				pass:$('#pass').val(),
				/* hasSecond:$('#hasPass').val(),是否审核通过 */
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empId:$('#empIds').combobox('getValue')
			}
		})
	}
	
	function updatePass(index,pass){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var da1 = new Date(row.endTime);
		var da2=new Date(row.startTime);
		
		var cha = parseInt(Math.abs(da1-da2)/ 1000 / 60 / 60 / 24);
		var leaveid = row.leaveId;
		$.post("<%=path%>/empleave/update",{
			leaveid:leaveid,
			pass:pass
		},function(data){
			$("#datagrid").datagrid("reload");
		})
	}
	

	
	selectEmps("empIds","<%=path%>");

</script>
<title>处理请假</title>
</head>
<body id="body">
	<table id="datagrid" class="easyui-datagrid" style="width:100%;height:100%;margin:0px"
			data-options="
			url:'<%=path %>/empleave/pager',
			method:'get',
			toolbar:'#toolbar',
			nowrap:false 
			">
			<thead>
				<tr>
					<th data-options="field:'empId',hidden:true"/>
					<th data-options="field:'depId',hidden:true"/>
					<th data-options="field:'leaveId',hidden:true"/>
					<th data-options="field:'empName',width:80">员工姓名</th>
					<th data-options="field:'depName',width:80">部门名称</th>
					<th data-options="field:'leaveDay',width:100">申请日期</th>
					<th data-options="field:'startAndEnd',width:130" formatter = "leaveTimeFormat">请假日期</th>
					<th data-options="field:'des',width:80,align:'right'">请假原由</th>
					<th data-options="field:'secondLeave',width:250" formatter="leaveFormat">审核进度</th>
					<th data-options="field:'aaa',width:60,align:'center'" formatter='doLeave'>操作</th>
				</tr>
			</thead>
		</table>
		<div id = "toolbar" align="right"><!-- 这是自己的,也就是以id查 -->
			<form id="wheQuery">
				<input type="hidden" name="depId" id="depId" value=""/>
				<select id="hasPass" name = "hasPass"> 
					<option value="" selected="selected" ></option>
					<option value="0">未审核</option>
					<option value="1">已经审核</option>
				</select>
				<select id="pass" name = "pass"> 
					<option value="" selected="selected" ></option>
					<option value="2">已通过</option>
					<option value="1">未通过</option>
				</select>
				员工:<input id="empIds" name="empId" class= "easyui-combobox"  data-options="
					valueField: 'key',
					textField: 'value'" />
				开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
				结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
				<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe()">提交</a> 
			</form>
		</div> 
</body>
</html>