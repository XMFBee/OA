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
<title>物品管理 	XMF</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script type="text/javascript">
	$(function() {
		setPagination("list");
	});
	
	var status = 0;
	var jsonStr = '{"goods.goodsId":"_goodsId","goods.name":"_name","goods.quantity":"_quantity"'
		+ ',"goods.des":"_des","goods.unitPrice":"_unitPrice","goods.buyDay":"_buyDay","goods.status":"_status"'
		+ ',"goods.goodsTypeId":"_goodsTypeId","goods.goodsTypeName":"_goodsTypeName"}';

		function authority(methodName, jsonStr, method,index) {
			$.get("<%=path %>/aut/authority?methodName=" + methodName,
				function(data) {
					if (data.resu.request == "success") {
						if (method == "save") {
							$("#addForm").form("clear"); // 清除表单的内容
							$("#addWin").window("open"); // 打开窗口
						} else if (method == "update") {
							$("#editForm").form("load", JSON.parse(jsonStr));
							$("#editWin").window("open");
						}else if(method == "disable"){
							var row = $('#list').datagrid('getData').rows[index];
							if(row){
								$.post("<%=path%>/goods/gtDisable?gId=" + row.goodsId,
									function(data){
										$('#list').datagrid('reload');
								},"json");
							}
						}else if(method == "activate"){
							var row = $('#list').datagrid('getData').rows[index];
							if(row){
								$.post("<%=path%>/goods/gtActivate?gId=" + row.goodsId,
									function(data){
										$('#list').datagrid('reload'); // 重新加载数据表
								},"json");
							}
						}
					} else if (data.resu.request == "fail") {
						$.messager.alert("提示", data.resu.message, "error");
					}
				}, "json");
		}	
		
		
		
	function showAddGoodsWin() {
		authority('com.oa.action.GoodsAction.save', "", "save",'');
		$.get("<%=path%>/goodsType/comboBox",
			function(data){
				$("#type").combobox("loadData", data.results);
				$("#gtype").combobox("loadData", data.results);
			}, "json");
	}
	
	function addGoods() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path%>/goods/save", 
				$("#addForm").serialize(), 
				function(data) {
					if (data.regoods.request == "success") {
						$("#addWin").window("close"); // 关闭指定的窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示", data.regoods.message, "info");
					} else if (data.regoods.request == "fail") {
						$.messager.alert("提示", data.regoods.message, "info");
					}
				}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}
	
	function showEditGoodsWin() {
		// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) { // 有选中的行
				var jsonStr1 = jsonStr.replace("_goodsId", row.goodsId).replace("_name",row.name).
					replace("_quantity", row.quantity).replace("_des", row.des).
					replace("_unitPrice", row.unitPrice).replace("_buyDay", row.buyDay).
					replace("_goodsTypeId",row.goodsTypeId).replace("_goodsTypeName",row.goodsTypeName).
					replace("_status", row.status);
					authority('com.oa.action.GoodsAction.update', jsonStr1, "update",'');
				$.get("<%=path%>/goodsType/comboBox",
					function(data){
						$("#goodsType").combobox("loadData", data.results);
					}, "json");
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
		}
	}
	
	function editGoods() {
		if ($("#editForm").form("validate")) {
			$.post("<%=path%>/goods/update", $("#editForm").serialize(), 
				function(data) {
				if (data.regoods.request == "success") {
					$("#editWin").window("close"); // 关闭指定的窗口
					$("#list").datagrid("reload"); // 重新加载指定数据网格数据
					$.messager.alert("提示", data.regoods.message, "info");
				} else if (data.regoods.request == "fail") {
					$.messager.alert("提示", data.regoods.message, "info");
				}
			}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}
	
	function disable(index){   //冻结
		authority('com.oa.action.GoodsAction.gtDisable', '', "disable",index);
		
	}
		
	function activate(index){  // 激活
		authority('com.oa.action.GoodsAction.gtActivate', '', "activate",index);
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
	
	
	function formatterOpt(value,row,index){ // 操作栏
		if(status == 1){
			return "<a href = 'javascript:;'onclick = 'disable("+index+")'>冻结</a>";
		}else if(status == 0){
			return "<a href = 'javascript:;'onclick = 'activate("+index+")'>激活</a>";
		}
	}
	
	function queryByNameOrType() {
		var goodsName = document.getElementById("gname").value;
	    if (goodsName != null) {
	    	$.get("<%=path %>/goods/queryNameByAll?gName=" + goodsName,
				function(data) {
			   		if(data.regoods.request == "success"){
			   			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
						$.messager.alert("提示",data.regoods.message,"info");
					}else{
						$.messager.alert("提示",data.regoods.message,"info");
					}
				}, "json");
	    } else {
	    	$("#list").datagrid("reload");
	    }
	}
	
</script>

</head>

<body style="height:100%;">

	<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/goods/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:98%;">
		<thead>
			<tr>
				<!-- <th data-options="field:'ck',checkbox:true">编号</th> -->
				<th data-options="field:'goodsId',align:'center',checkbox:true"></th>
				<th data-options="field:'name',align:'center',width:100">名称</th>
				<th data-options="field:'quantity',align:'center',width:100">总数</th>
				<th data-options="field:'des',align:'center',width:100">描述</th>
				<th data-options="field:'unitPrice',align:'center',width:100">单价</th>
				<th data-options="field:'buyDay',align:'center',width:150">购买时间</th>
				<th data-options="field:'goodsTypeName',align:'center',width:100">物品类型</th>
				<th data-options="field:'status',align:'center',width:80" formatter="frozenActivate">状态</th>
				<th data-options="field:'operation',align:'center',width:100" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddGoodsWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditGoodsWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
			<input id="gname" type="text" placeholder="输入要查找的用品名称" style="width:150px;height:25px;" >
			<!-- <input id="gtype" class="easyui-combobox" name="goods.goodsTypeId.goodsTypeId"
				data-options="required:true,
					valueField:'id',
					textField:'text',
					panelHeight:'auto',
					selected:'true' "/> -->
			<%-- <s:select label="物品类型" list="goodsTypes" id="goodsTypeId" /> --%>
			<a href="javascript:;" onclick = "queryByNameOrType()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<!-- 添加物品 -->
	<div id="addWin" class="easyui-window" title="添加物品" data-options="closed:true" style="width:300px;height:280px;">
		<form id="addForm">
			<table>
				<tr>
					<td>物品名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="goods.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>物品总数</td>
					<td><input class="easyui-numberbox" name="goods.quantity" data-options="required:true,min:0"/></td>
				</tr>
				<tr>
					<td>物品描述</td>
					<td><input class="easyui-textbox" name="goods.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>物品单价</td>
					<td><input class="easyui-numberbox" name="goods.unitPrice" data-options="required:true,min:1,precision:2"/></td>
				</tr>
				<tr>
					<td>物品购买时间</td>
					<td><input class="easyui-datetimebox" name="goods.buyDay" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>物品类型</td>
					<td>
						<input id="type" class="easyui-combobox" name="goods.goodsTypeId.goodsTypeId"
							data-options="required:true,
								valueField:'id',
								textField:'text',
								panelHeight:'auto',
								selected:'true' "/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addGoods();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 更新物品 -->
	<div id="editWin" class="easyui-window" title="更新物品" data-options="closed:true" style="width:300px;height:280px;">
		<form id="editForm">
			<input type="hidden"  name="goods.goodsId"  />
			<table>
				<tr>
					<td>物品名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="goods.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>物品总数</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="goods.quantity" data-options="required:true,min:0,precision:0"/></td> 
				</tr>
				<tr>
					<td>物品描述</td>
					<td><input class="easyui-textbox" name="goods.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>物品单价</td>
					 <td><input class="easyui-validatebox easyui-numberbox" name="goods.unitPrice" data-options="required:true,min:1,precision:2"/></td>
				</tr>
				<tr>
					<td>物品类型</td>
					<td>
						<input class="easyui-combobox" id="goodsType" name="goods.goodsTypeId"
							data-options="required:true,method:'get',
								valueField: 'id',textField: 'text',panelHeight:'auto'"/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editGoods();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>