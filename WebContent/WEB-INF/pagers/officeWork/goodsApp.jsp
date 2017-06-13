<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ taglib prefix="s" uri="/struts-tags" %>
    
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物品申购 	XMF</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script type="text/javascript">

	var jsonStr = '{"goodsApp.goodsAppId":"_goodsAppId","goodsApp.appDay":"_appDay"'
			+ ',"goodsApp.empName":"_empName","goodsApp.emp":"_emp"'
			+ ',"goodsApp.goodsName":"_goodsName","goodsApp.quantity":"_quantity"' 
			+ ',"goodsApp.des":"_des","goodsApp.status":"_status","goodsApp.appStatus":"_appStatus"}';

	$(function() {
		setPagination("list");
	});

	function showAddGoodsAppWin() {
		$("#addForm").form("clear"); // 清除表单里的所有数据
		$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}

	function addGoodsApp() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path%>/goodsApp/saveGoodsApp", $("#addForm").serialize(),
					function(data) {
						/* console.log(data) */
						if (data.regoodsApp.request == "success") {
							$("#addWin").window("close"); // 关闭指定的窗口
							$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							$.messager.alert("提示", data.regoodsApp.message,"info");
						} else if (data.regoodsApp.request == "fail") {
							$.messager.alert("提示", data.regoodsApp.message,"info");
						}
					}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}

	function showEditGoodsAppWin() {
		// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) { // 有选中的行
				var jsonStr1 = jsonStr.replace("_goodsAppId", row.goodsAppId).replace("_appDay",row.appDay)
					.replace("_empName", row.empName).replace("_emp", row.empId)
					.replace("_goodsName", row.goodsName).replace("_quantity", row.quantity)
					.replace("_des", row.des).replace("_status", row.status)
					.replace("_appStatus", row.appStatus);
				$("#editForm").form("load", JSON.parse(jsonStr1));
				$("#editWin").window("open");
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
		}
	}

	function editGoodsApp(index) {
		if ($("#editForm").form("validate")) {
			var row = "";
			if (index != null) {
				row = $('#list').datagrid('getData').rows[index];
			}
			row = $('#list').datagrid('getSelected');
			console.log(row)
			$.post("<%=path%>/goodsApp/updateGoodsApp?gId=" + row.goodsAppId, $(
					"#editForm").serialize(), function(data) {
				console.log(row)
				if (data.regoodsApp.request == "success") {
					$("#editWin").window("close"); // 关闭指定的窗口
					$("#list").datagrid("reload"); // 重新加载指定数据网格数据
					$.messager.alert("提示", data.regoodsApp.message, "info");
				} else if (data.regoodsApp.request == "fail") {
					$.messager.alert("提示", data.regoodsApp.message, "info");
				}
			}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}

	function disable(index) { //冻结
		var row = $('#list').datagrid('getData').rows[index];
		if (row) {
			$.post("<%=path%>/goodsApp/gtDisable?gId=" + row.goodsAppId, 
				$("#editForm").serialize(), function(data) {
					$('#list').datagrid('reload');
				}, "json");
		}
	}

	function activate(index) { // 激活
		var row = $('#list').datagrid('getData').rows[index];
		if (row) {
			$.post("<%=path%>/goodsApp/gtActivate?gId=" + row.goodsAppId,
				$("#editForm").serialize(), function(data) {
					$('#list').datagrid('reload'); // 重新加载数据表
			}, "json");
		}
	}

	function frozenActivate(value, row, index) { // 显示状态为可用或不可用
		if (value == 1) {
			status = 1;
			return "可用";
		} else if (value == 0) {
			status = 0;
			return "不可用";
		}
	}
	
	function Emp_Name(value){
		if(value == null){
			return "暂无";
		}else{
			return value.name;
		}
		
	}
	function formatterOpt(value, row, index) { // 操作栏
		var status = row.status;
		if (status == 1) {
			return "<a href = 'javascript:;'onclick = 'disable(" + index + ")'>冻结</a>";
		} else if (status == 0) {
			return "<a href = 'javascript:;'onclick = 'activate(" + index + ")'>激活</a>";
		} 
		var appStatus = row.appStatus;
		if(appStatus == 0) {	// 审核中
			return "<a href = 'javascript:;'onclick = 'activateCheck(" + index + ")'>同意</a>"
				+ "&nbsp;&nbsp;&nbsp;<a href = 'javascript:;'onclick = 'disableCheck(" + index + ")'>拒绝</a>";
		}
	}
	
	function checkActivate(value, row, index) { // 显示状态为可用或不可用
		if (value == 1) {
			appStatus = 1;
			return "已同意";
		} else if (value == 2) {
			appStatus = 2;
			return "已拒绝";
		} else if(value == 0) {
			appStatus = 0;
			return "审核中";
		}
	}
	
	function disableCheck(index) { //拒绝
		var row = $('#list').datagrid('getData').rows[index];
		if (row) {
			$.post("<%=path%>/goodsApp/gtDisable?gId=" + row.goodsAppId, 
				$("#editForm").serialize(), function(data) {
					$('#list').datagrid('reload');
				}, "json");
		}
	}

	function activateCheck(index) { // 同意
		var row = $('#list').datagrid('getData').rows[index];
		if (row) {
			$.post("<%=path%>/goodsApp/gtActivate?gId=" + row.goodsAppId,
				$("#editForm").serialize(), function(data) {
					$('#list').datagrid('reload'); // 重新加载数据表
			}, "json");
		}
	}
	
</script>

</head>

<body style="height:100%;">

	<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/goodsApp/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:98%;">
		<thead>
			<tr>
				<!-- <th data-options="field:'ck',checkbox:true">编号</th> -->
				<th data-options="field:'goodsAppId',align:'center',checkbox:true"></th>
				<th data-options="field:'emp',align:'center',width:100" formatter="Emp_Name">申购人</th>
				<th data-options="field:'goodsName',align:'center',width:100">申购用品名称</th>
				<th data-options="field:'quantity',align:'center',width:100">申购总数</th>
				<th data-options="field:'des',align:'center',width:100">描述</th>
				<th data-options="field:'appDay',align:'center',width:150">申购时间</th>
				<!-- 此处状态表示此申购是否有效，和appStatus是不一样的意思 -->
				<th data-options="field:'status',align:'center',width:80" formatter="frozenActivate">状态</th>
				<th data-options="field:'appStatus',align:'center',width:80" formatter="checkActivate">申购审核</th>
				<th data-options="field:'operation',align:'center',width:100" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddGoodsAppWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditGoodsAppWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
	</div>
	
	<!-- 添加物品申购 -->
	<div id="addWin" class="easyui-window" title="添加物品申购" data-options="closed:true" style="width:400px;height:250px;">
		<form id="addForm">
			<table>
				<tr>
					<td>申购物品的名称</td>
					<td><input name="goodsApp.goodsName" onclick="showGT();" class="easyui-validatebox easyui-textbox" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				
				<tr>
					<td>申购物品数量</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="goodsApp.quantity" data-options="min:0,precision:0"/></td>
				</tr>
				<tr>
					<td>申购此物品原因</td>
					<td><input class="easyui-textbox" name="goodsApp.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addGoodsApp();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 更新申购的物品 -->
	<div id="editWin" class="easyui-window" title="更新申购物品" data-options="closed:true" style="width:500px;height:300px;">
		<form id="editForm">
			<input type="hidden" name="goodsApp.goodsAppId" />
			<table>
				<tr>
					<td>申购的物品的名称</td>
					<td><input name="goodsApp.goodsName" class="easyui-validatebox easyui-textbox" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>申购物品的数量</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="goodsApp.quantity" data-options="min:0"/></td>
				</tr>
				<tr>
					<td>申购此物品的原因</td>
					<td><input class="easyui-textbox" name="goodsApp.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>状态</td>	<!-- 此处状态表示此申购是否有效，和appStatus是不一样的意思 -->
					<td>
						<input type = "radio"  name="goodsApp.status" value= "0"/>冻结
						<input type = "radio"  name="goodsApp.status" value= "1"/>激活
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editGoodsApp();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>