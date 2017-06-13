<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工反馈管理</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script>
	
	var jsonStr = '{"empfeedbackinfo.feedbackId":"_feedbackId","empfeedbackinfo.empId":"_empId","empfeedbackinfo.des":"_des",'+
		'"empfeedbackinfo.feedbackDay":"_feedbackDay","empfeedbackinfo.status":"_status","empfeedbackinfo.empName":"_empName"}';
	
	$(function() {
		setPagination("list");
	});
	
	function showAddEmpfeedbackWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditEmpfeedbackWin(){
		//var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = jsonStr.replace("_feedbackId",row.feedbackId).replace("_empId",row.empId).
				replace("_des",row.des).replace("_gradeId",row.gradeId).replace("_feedbackDay",row.feedbackDay).
				replace("_status",row.status).replace("_empName",row.empName);
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}
		
	}
	
	
	function addEmpfeedback() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/empfeedback/empfeedbackSave",
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
	
	function editEmpfeedback(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/empfeedback/empfeedbackUpdate",
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
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	
	}
	
	function selectempfeedback(){  // 选择部门
		$("#selectWin").window("open");
		$.get("<%=path %>/dep/pager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		
	}
	
	function closeDepWin(){ // 关闭部门窗口
		$("#selectWin").window("close");
	}
	 
	function closeEmpWin(){ // 关员工窗口
		$("#selectDepWin").window("close");
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
				document.getElementById("empId").value = row.empId; // 修改时JS赋值
				$("#empName").textbox('setValue', row.name); //修改时赋值
				document.getElementById("add_empId").value = row.empId; // 添加时JS赋值
				$("#add_empName").textbox('setValue', row.name); //添加时赋值
				
				$("#selectWin").window("close");	//关闭窗口
				$("#selectDepWin").window("close");	
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个学生","info");
		}
	}
	
	
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/empfeedback/empfeedbackDisable?id=" + row.feedbackId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/empfeedback/empfeedbackEnabled?id=" + row.feedbackId,
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
	
	function queryByName(){
		var empName = $('#emppName').textbox('getValue');
	    if (empName != "") {
	    	$.get("<%=path %>/empfeedbackinfo/pagerByName?empName=" + empName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
						}else if(data.resu.request == "fail"){
							$.messager.alert("提示",data.resu.message,"info");
						}
				}, "json");
	    } else {
	    	$('#list').datagrid('reload');
	    }
	}
	
	function showSelfEmpfeedbackWin(){
		
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
			url:'<%=path %>/empfeedback/empfeedbackBySele',
			singleSelect:true,
			method:'get',
			autoRowHeight:true,
			remoteSort:false,
			rownumbers: true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
			<th data-options="field:'feedbackId',checkbox:true">反馈编号</th>
				<!-- <th data-options="field:'empName',align:'center'">反馈员工</th> -->
				<th data-options="field:'des',width:150,align:'center'">反馈详情</th>
				<th data-options="field:'feedbackDay',width:140,align:'center'">反馈时间</th>
				<th data-options="field:'status',width:80" formatter="frozenActivate" sortable="true">状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddEmpfeedbackWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditEmpfeedbackWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		<div>
			反馈员工/反馈详情/反馈时间: <input id="emppName" class="easyui-textbox" style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加课程" data-options="closed:true" style="width:350px;height:300px;">
		<form id="addForm">
			<table>
				<tr>
					<td><input id="add_empId" type="hidden" name="empfeedback.empId" /></td>
				</tr>
				<!-- <tr>
					<td>反馈员工</td>
					<td><input id="add_empName" class="easyui-validatebox easyui-textbox" name="empfeedback.empName" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "selectempfeedback()" >选择</a></td>
				</tr> -->
				<tr>
					<td>反馈时间</td>
					<td><input class="easyui-validatebox easyui-datetimebox" name="empfeedback.feedbackDay" /></td>
				</tr>
				<tr>
					<td>反馈详情</td>
					<td><input class="easyui-validatebox easyui-textbox" name="empfeedback.des" data-options="multiline:true" style="height:60px"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addEmpfeedback();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:60px;height:25px">确认</a>
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
	
	<div id="editWin" class="easyui-window" title="修改课程" data-options="closed:true" style="width:350px;height:300px;">
		<form id="editForm">
			
			<table>
				<tr>
					<td><input type="hidden" name="empfeedbackinfo.feedbackId" /></td>
				</tr>
				<tr>
					<td><input type="hidden" id="empId" name="empfeedbackinfo.empId" /></td>
				</tr>
				<!-- <tr>
					<td>反馈员工</td>
					<td><input id="empName" class="easyui-validatebox easyui-textbox" name="empfeedbackinfo.empName" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "selectempfeedback()" >选择</a></td>
				</tr> -->
				<tr>
					<td>反馈详情</td>
					<td><input class="easyui-validatebox easyui-textbox" name="empfeedbackinfo.des" data-options="multiline:true" style="height:60px;"/></td>
				</tr>
				<tr>
					<td>反馈时间</td>
					<td><input class="easyui-validatebox easyui-datetimebox" name="empfeedbackinfo.feedbackDay" /></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="empfeedbackinfo.status" value= "1"/>启用
						<input type = "radio"  name="empfeedbackinfo.status" value= "0"/>禁用
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editEmpfeedback();" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:60px;height:25px">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>