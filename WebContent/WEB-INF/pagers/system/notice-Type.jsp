<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加公告类型</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script>
	
	var jsonStr = '{"noticeType.noticetypeId":"_noticetypeId","noticeType.name":"_name","noticeType.des":"_des","noticeType.status":"_status"}';
	
	$(function() {
		setPagination("list");
	});
	
	function showAddNoticeWin() {
		$("#addForm").form("clear"); // 清除表单里的所有数据
		$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	function addNoticeType() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path %>/noticeType/addNoticeType",
				$("#addForm").serialize(),
				function (data) {
					if (data.resu.request == "success") {
						$("#addWin").window("close"); // 关闭指定的窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示", data.resu.message, "info");
					} else if (data.resu.request == "fail") {
						$.messager.alert("提示", data.resu.message, "info");
					}
			}, "json"
			);
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}
	
	function showEditNoticeWin() {
		// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的商品", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) { // 有选中的行
				// var jsonStr = '{"product.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
				var jsonStr1 = jsonStr.replace("_noticetypeId", row.noticetypeId).replace("_name", row.name).replace("_status", row.status).replace("_des", row.des);
				$("#editForm").form("load", JSON.parse(jsonStr1));
				//打开窗口
			 	$("#editWin").window("open");
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的商品", "info");
		}
	}
	
/* 	function showEditProductWin1(index) {
		 var row = $('#list').datagrid('getData').rows[index];
		 if (row) { // 有选中的行
			// var jsonStr = '{"product.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
			var jsonStr1 = jsonStr.replace("_id", row.id).replace("_title", row.title).replace("_price", row.price).replace("_des", row.des);
			$("#editForm").form("load", JSON.parse(jsonStr1));
		 	$("#editWin").window("open");
		}
	} */
	
	function editNotice() {
		if ($("#editForm").form("validate")) {
			$.post("<%=path %>/noticeType/updateNoticeType",
					$("#editForm").serialize(),
					function (data) {
						if (data.resu.request == "success") {
							$("#editWin").window("close"); // 关闭指定的窗口
							$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							$.messager.alert("提示", data.resu.message, "info");
						} else if (data.resu.request == "fail") {
							$.messager.alert("提示", data.resu.message, "info");
						}
				}, "json"
				);
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}
		
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/noticeType/noticeTypeDisable?id=" + row.noticetypeId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/noticeType/noticeTypeActivate?id=" + row.noticetypeId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload'); // 重新加载数据表
			},"json");
		}
		
	}
	

	var status = 0;
	function formatterOpt(value,row,index){ // 操作栏
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
	
</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/noticeType/noticeTypePager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			fitColumns:true,<!-- 表格面积是否全部占满 -->
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'Id',checkbox:true,align:'center'">公告编号</th>
				<th data-options="field:'name',width:100,align:'center'">类型标题</th>
				<th data-options="field:'des',width:180,align:'center'">公告描述</th>
				<th data-options="field:'status',width:100,align:'center'" formatter="frozenActivate">状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddNoticeWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditNoticeWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加公告类型" data-options="closed:true" style="width:500px;height:300px;">
		<form id="addForm">
			<table>
				<tr>
					<td>公告类型标题</td>
					<td><input class="easyui-validatebox easyui-textbox" name="noticeType.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>公告描述</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="noticeType.des" style="height:100px;"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addNoticeType();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改公告类型" data-options="closed:true" style="width:500px;height:300px;">
		<form id="editForm">
			<input type="hidden" name="noticeType.noticetypeId" />
			<table>
				<tr>
					<td>类型名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="noticeType.name" data-options="required:true,validType:'length[2,30]'"/></td>
				</tr>
				<tr>
					<td>类型描述</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="noticeType.des" style="height:100px;"/></td>
				</tr>
				<tr>
					<td>公告类型状态</td>
					<td>
					<input type = "radio"  name="noticeType.status" value= "1" />激活
					<input type = "radio"  name="noticeType.status" value= "0"/>未激活
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editNotice();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>