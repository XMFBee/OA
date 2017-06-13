<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script>

	var jsonStr = '{"incomeType.incomeTypeId":"_incomeTypeId","incomeType.name":"_name","incomeType.des":"_des","incomeType.status":"_status"}'
	
	$(function() {
		setPagination("list");
	});
	
	/* 打开添加员工工资信息窗口  */
	function showAddWin() {
		$("#addWin").window("open");
		$("#addForm").form("clear"); // 清除表单数据
	}
	
	/* 添加员工工资信息  */
	function add() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path %>/it/addIncomeType",
				$("#addForm").serialize(),
				function (data) {
					$("#addWin").window("close"); // 关闭指定的窗口
					$("#list").datagrid("reload"); // 重新加载指定数据网格数据
					$.messager.alert("提示", data.result.message, "info");
			}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}
	
	/* 打开编辑员工工资信息窗口  */
	function showEditWin() {
		var rows=$("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的员工信息", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) {
				var jsonStr1 = jsonStr.replace("_name", row.name).replace("_des", row.des).replace("_status", row.status).replace("_incomeTypeId", row.incomeTypeId);
				$("#editForm").form("load", JSON.parse(jsonStr1));
				$("#editWin").window("open");
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的员工信息", "info");
		}
	}
	
	/* 编辑员工工资信息  */
	function edit() {
		if ($("#editForm").form("validate")) {
			$.post("<%=path %>/it/updataIncomeType",
				$("#editForm").serialize(),
				function (data) {
					$("#editWin").window("close"); // 关闭指定的窗口
					$("#list").datagrid("reload"); // 重新加载指定数据网格数据
					$.messager.alert("提示", data.result.message, "info");
			}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}
	
	function selectDept(){  // 选择部门
		$("#selectWin").window("open");
		$.get("<%=path %>/dep/pager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		
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
	function combitEmp(){
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个部门","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				alert(row.empId);
				alert(row.name);
				
				document.getElementById("empId").value = row.empId; // JS赋值
				$("#empName").textbox('setValue', row.name); //赋值
				$("#selectDepWin").window("close");
				$("#selectWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个部门","info");
		}
	}
	
	function disable(index){   
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/it/disable?id=" + row.incomeTypeId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
	
	function enable(index){
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/it/enable?id=" + row.incomeTypeId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}

	
	var status = 1;
	function formatterOpt(value,row,index){ // 操作栏
		if(status == 1){
			return "<a href = 'javascript:;'onclick = 'disable("+index+")'>冻结</a>";
		}else if(status == 0){
			return "<a href = 'javascript:;'onclick = 'enable("+index+")'>解冻</a>";
		}
		
	}
	
	function formatterStatus(value) {
		if (value == 0) {
			status = 0;
			return "禁用";
		} else if (value == 1) {
			status = 1;
			return "启用";
		}
	}
</script>

<body style="width:100%; margin:0px;">
	<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/it/incomeTypePager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'incomeTypeId',checkbox:true">编号</th>
				<th data-options="field:'name',width:200">收入类型</th>
				<th data-options="field:'des',width:200">收入描述</th>
				<th data-options="field:'status', width:200" formatter="formatterStatus">状态</th>
				<th data-options="field:'option',width:200" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- 工具栏 -->
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddWin();" class="easyui-linkbutton" iconCls="icon-add">新增</a>
			<a href="javascript:;" onclick="showEditWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加" data-options="closed:true" style="width:300px;height:200px;">
		<form id="addForm">
			<table>
				<tr>
					<td>收入类型</td>
					<td>
						<input class="easyui-validatebox easyui-textbox"  name="incomeType.name"  data-options="required:true" style="width:175px;"/>
					</td>
				</tr>
				<tr>
					<td>描述</td>
					<td>
						<input class="easyui-textbox" name="incomeType.des" data-options="required:true, multiline:true" style="width:175px;height:100px">
					</td>
				</tr>	
				<tr>
					<td>
						<a href="javascript:;" onclick="add();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window" title="编辑" data-options="closed:true" style="width:335px;height:260px;">
		<form id="editForm">
			<input type="hidden" name="incomeType.incomeTypeId" />
			<table>
				<tr>
					<td>收入类型</td>
					<td><input class="easyui-validatebox easyui-textbox" name="incomeType.name" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>描述</td>
					<td><input class="easyui-textbox" name="incomeType.des" data-options="required:true,precision:2,multiline:true" style="width:175px;height:100px"/></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="incomeType.status" value= "1" />激活
						<input type = "radio"  name="incomeType.status" value= "0"/>未激活
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="edit();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
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
	<div id="selectDepWin" class="easyui-window" title="选择部门" data-options="closed:true" data-options="iconCls:'icon-update'" style="width:500px;height:350px;padding:5px;">
		<table id="list2" class="easyui-datagrid" data-options="
			autoRowHeight:true,
			pagination:true,
			toolbar:'#toolbar'">
	    <thead>  
	        <tr>  
	            <th data-options="field:'empId',checkbox:true,width:80" ></th>  
	            <th data-options="field:'name',width:80" >姓名</th>  
	        </tr>  
	    </thead>  
	</table>  
		<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			    <a href="javascript:;" onclick = "combitEmp()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
		</div>
	</div>
	</div>
</body>
</html>

				
