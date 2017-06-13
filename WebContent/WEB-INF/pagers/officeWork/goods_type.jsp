<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物品类型 	XMF</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>
<script type="text/javascript" src="<%=path %>/js/goodsType.js"></script>

</head>

<body style="height:100%;">

	<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/goodsType/pager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:98%;">
		<thead>
			<tr>
				<!-- <th data-options="field:'ck',checkbox:true">编号</th> -->
				<th data-options="field:'goodsTypeId',align:'center',checkbox:true"></th>
				<th data-options="field:'name',align:'center',width:100">物品类型</th>
				<th data-options="field:'des',align:'center',width:220">描述</th>
				<th data-options="field:'status',align:'center',width:80" formatter="frozenActivate">状态</th>
				<th data-options="field:'operation',align:'center',width:150" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddGoodsTypeWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditGoodsTypeWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
	</div>
	
	<!-- 添加物品类型 -->
	<div id="addWin" class="easyui-window" title="添加物品类型" data-options="closed:true" style="width:300px;height:180px;">
		<form id="addForm">
			<table>
				<tr>
					<td>物品类型</td>
					<td><input class="easyui-validatebox easyui-textbox" name="gts.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>物品描述</td>
					<td><input class="easyui-validatebox easyui-textbox" name="gts.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addGoodsType();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 更新物品类型 	不需要从数据库里获取已经有的物品类型	 -->
	<div id="editWin" class="easyui-window" title="更新物品类型" data-options="closed:true" style="width:300px;height:180px;">
		<form id="editForm">
			<input type="hidden" name="gts.goodsTypeId" />
			<table>
				<tr>
					<td>物品类型</td>
					<td><input class="easyui-validatebox easyui-textbox" name="gts.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>物品描述</td>
					<td><input class="easyui-validatebox easyui-textbox" name="gts.des" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="gts.status" value= "0"/>冻结
						<input type = "radio"  name="gts.status" value= "1"/>激活
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editGoodsType();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>