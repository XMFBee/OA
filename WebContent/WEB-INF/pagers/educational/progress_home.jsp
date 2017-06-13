<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程进度管理</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script>
	
	var jsonStr = '{"progress.progressId":"_progressId","progress.employees.name":"_empName","progress.des":"_des",'+
		'"progress.grades.name":"_gradeName","progress.progressDay":"_progressDay","progress.status":"_status","progress.empId":"_empId","progress.gradeId":"_gradeId"}';
	
	$(function() {
		setPagination("list");
	});
	
	function showAddProgressWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditProgressWin(){
		//var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = jsonStr.replace("_progressId",row.progressId).replace("_empId",row.empId).
				replace("_des",row.des).replace("_gradeId",row.gradeId).replace("_progressDay",row.progressDay).
				replace("_status",row.status).replace("_gradeName",row.grades.name).replace("_empName",row.employees.name);
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}
		
	}
	
	
	function addProgress() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/progress/progressSave",
				$("#addForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#addWin").window("close"); // 关闭窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	}
	
	function editProgress(){
		var rows = $("#list1").datagrid("getSelections");
		var row = rows[0];
		if($("#editForm").form("validate")){
			$.post("<%=path %>/progress/progressUpdate",
					$("#editForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#editWin").window("close"); // 关闭窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}
		else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	
	}
	
	function selectDept(){  // 选择部门
		$("#selectWin").window("open");
		$.get("<%=path %>/dep/pager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		
	}
	
	function selectGrade(){  // 选择班级
		$("#selectGradeWin").window("open");
		$.get("<%=path %>/grade/gradePager", function(data) {
			$("#list3").datagrid("loadData", data.rows);
		}, "json");
	}
	
	function closeDepWin(){ // 关闭部门窗口
		$("#selectWin").window("close");
	}
	 
	function closeEmpWin(){ // 关员工窗口
		$("#selectDepWin").window("close");
	}
	
	function closeGradeWin(){ // 关班級窗口
		$("#selectGradeWin").window("close");
	}
	
	function openDepWin(){  //打开了部门正在选择员工
		var rows = $("#list1").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个部门","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$.get("<%=path %>/employee/queryEmpsByDept?depId=" + row.depId,
					function(data) {
					$("#list2").datagrid("loadData", data.rows);
				}, "json");
				$("#selectDepWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个部门","info");
		}
		
	}
	
	function submitDepWin(){
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				document.getElementById("edit_empId").value = row.empId; // JS赋值
				$("#empName").textbox('setValue', row.name); //赋值
				
				document.getElementById("add_empId").value = row.empId; // JS赋值
				$("#add_empName").textbox('setValue', row.name); //赋值
				
				$("#selectWin").window("close");	//关闭窗口
				$("#selectDepWin").window("close");	
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个学生","info");
		}
	}
	
	function submitGradeWin(){
		var rows = $("#list3").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班級","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				document.getElementById("add_gradeId").value = row.gradeId; // JS赋值
				$("#add_gradeName").textbox('setValue', row.name); //赋值
				
				document.getElementById("edit_gradeId").value = row.gradeId;
				$("#edit_gradeName").textbox('setValue', row.name); //赋值
				
				$("#selectGradeWin").window("close");	
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班級","info");
		}
	}
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/progress/progressDisable?id=" + row.progressId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/progress/progressEnabled?id=" + row.progressId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload'); // 重新加载数据表
			},"json");
		}
		
	}
		
	
	var status = 0;
	function formatterOpt(value,row,index){  // 操作栏
		if(status == 1){
			return "<a href = 'javascript:;'onclick = 'disable("+index+")'>禁用</a>";
		}else if(status == 0){
			return "<a href = 'javascript:;'onclick = 'activate("+index+")'>启用</a>";
		}
		
	}
	
	function frozenActivate(value,row,index){  // 显示状态为可用或不可用
		if(value == 1){
			status = 1;
			return "可用";
		}else if(value == 0){
			status = 0;
			return "不可用";
		}
	}
	
	function showName(value){
		return value.name;
	}
	
	function queryByName(){
		var empName = $('#empName').textbox('getValue');
	    if (empName != "") {
	    	$.get("<%=path %>/progress/pagerByName?empName=" + empName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$('#list').datagrid('reload');
	    }
	}
	
</script>

<style type="text/css">
	*{
		padding:0px;
		margin:0px;
	}
</style>

</head>
<body>

<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			collapsible:true,
			url:'<%=path %>/progress/progressByPage',
			singleSelect:true,
			method:'get',
			autoRowHeight:true,
			remoteSort:false,
			rownumbers: true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
			<th data-options="field:'progressId',checkbox:true">课程进度编号</th>
				<th data-options="field:'employees',align:'center'" formatter="showName">教师</th>
				<th data-options="field:'grades',width:100,align:'center'" formatter="showName">班级</th>
				<th data-options="field:'des',width:150,align:'center'">进度详情</th>
				<th data-options="field:'progressDay',width:140,align:'center'">添加进度的时间</th>
				<th data-options="field:'status',width:80" formatter="frozenActivate" sortable="true">状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddProgressWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditProgressWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		<div>
			教师名称/班级名称: <input id="empName" class="easyui-textbox" style="width:80px">
			<a href="javascript:;" onclick = "queryByName()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加课程" data-options="closed:true" style="width:350px;height:300px;">
		<form id="addForm">
			<table>
				<tr>
					<td><input id="add_empId" type="hidden" name="progress.empId" /></td>
				</tr>
				<tr>
					<td><input id="add_gradeId" type="hidden" name="progress.gradeId" /></td>
				</tr>
				<tr>
					<td>教师名称</td>
					<td><input id="add_empName" class="easyui-validatebox easyui-textbox" name="progress.empId" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "selectDept()" >选择</a></td>
				</tr>
				<tr>
					<td>班级名称</td>
					<td><input id="add_gradeName" class="easyui-validatebox easyui-textbox" name="progress.gradeId" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "selectGrade()" >选择</a></td>
				</tr>
				<tr>
					<td>进度详情</td>
					<td><input class="easyui-validatebox easyui-textbox" name="progress.des" data-options="multiline:true" style="height:60px"/></td>
				</tr>
				<tr>
					<td>添加时间</td>
					<td><input class="easyui-validatebox easyui-datetimebox" name="progress.progressDay" /></td>
				</tr>
				
				<tr>
					<td>
						<a href="javascript:;" onclick="addProgress();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:60px;height:25px">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="selectWin" class="easyui-window" title="选择部门" data-options="closed:true" data-options="iconCls:'icon-update'" style="width:500px;height:350px;padding:5px;">
		<table id = "list1" class="easyui-datagrid"
			data-options="toolbar:'#tb1',
			singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
	<thead>  
        <tr>  
            <th data-options="field:'depId',checkbox:true,width:80" ></th> 
            <th data-options="field:'depName',width:80" >部门名称</th> 
            <th data-options="field:'empName',width:80">部门经理</th>
            <th data-options="field:'des',width:80">描述</th>  
            <th data-options="field:'status',width:80">状态</th>
        </tr>  
    </thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			    <a href="javascript:;" onclick = "openDepWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeDepWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
	</div>
	</div>
	
	<div id="selectDepWin" class="easyui-window" title="选择员工" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id = "list2"class="easyui-datagrid" 
			data-options="toolbar:'#tb2',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'name',align:'center'">名称</th>
				</tr>
			</thead>
		</table>
		<div id="tb" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "submitDepWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeEmpWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
	
	<div id="selectGradeWin" class="easyui-window" title="选择班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list3"class="easyui-datagrid" 
			data-options="toolbar:'#tb2',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',align:'center'">班级名称</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "submitGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
	</div>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改课程" data-options="closed:true" style="width:350px;height:300px;">
		<form id="editForm">
			
			<table>
				<tr>
					<td><input type="hidden" name="progress.progressId" /></td>
				</tr>
				<tr>
					<td><input type="hidden" id="edit_empId" name="progress.empId" /></td>
				</tr>
				<tr>
					<td><input type="hidden" id="edit_gradeId" name="progress.gradeId" /></td>
				</tr>
				<tr>
					<td>教师</td>
					<td><input id="empName" class="easyui-validatebox easyui-textbox" name="progress.employees.name" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "selectDept()" >选择</a></td>
				</tr>
				<tr>
					<td>班级</td>
					<td><input id="edit_gradeName" class="easyui-validatebox easyui-textbox" name="progress.grades.name" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "selectGrade()" >选择</a></td>
				</tr>
				<tr>
					<td>进度详情</td>
					<td><input class="easyui-validatebox easyui-textbox" name="progress.des" data-options="multiline:true" style="height:60px"/></td>
				</tr>
				<tr>
					<td>添加进度时间</td>
					<td><input class="easyui-validatebox easyui-textbox" name="progress.progressDay" /></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="progress.status" value= "1"/>启用
						<input type = "radio"  name="progress.status" value= "0"/>禁用
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editProgress();" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:60px;height:25px">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>