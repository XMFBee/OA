<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    	String path = request.getContextPath();
    %>
    <%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加公告</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script>
	
	var jsonStr = '{"notice.noticeId":"_noticeId","notice.noticetype.name":"_noticetype","notice.noticetype.noticetypeId":"_typeId","notice.name":"_name","notice.typeId":"_typeId","notice.des":"_des","notice.noticeDay":"_noticeDay","notice.status":"_status","notice.empId":"_empId"}';
	
	$(function() {
		setPagination("list");
	});
	
	function showAddNoticeWin() {
		$("#addForm").form("clear"); // 清除表单里的所有数据
		$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		//类型下拉菜单的级联查询
		$.get("<%=path%>/noticeType/type",
			function(data){
			$("#type").combobox("loadData", data.request);
		}, "json");
		
	}
	
	function addNotice() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path %>/notice/addNotice",
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
		//类型下拉菜单的级联查询
		$.get("<%=path%>/noticeType/type",
			function(data){
			$("#types").combobox("loadData", data.request);
		}, "json");
		// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的商品", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) { // 有选中的行
				// var jsonStr = '{"product.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
				var jsonStr1 = jsonStr.replace("_noticeId", row.noticeId).
				replace("_name", row.name).replace("_status", row.status).
				replace("_typeId", row.typeId).replace("_des", row.des).
				replace("_noticetype", row.noticetype.name).
				replace("_typeId",row.noticetype.noticetypeId).
				replace("_empId", row.empId).replace("_noticeDay", row.noticeDay);
				$("#editForm").form("load", JSON.parse(jsonStr1));
				//打开窗口
			 	$("#editWin").window("open");
			 
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的商品", "info");
		}
	}

	
	function editNotice() {
		if ($("#editForm").form("validate")) {
			$.post("<%=path %>/notice/updateNotice",
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
	
	function removeProduct() {
		var row = $("#list").datagrid("getSelected");
			if (row) {
				$.messager.confirm("提示", "确定删除吗？", function (r) {
					if (r) { // 点击了确定按键
						$.get("<%=path %>/product/del?id=" + row.id, function (data) {
							$("#list").datagrid("reload");
						}, "json");
					}
				})
		} else {
			$.messager.alert("提示", "请先选择需要删除的商品", "info");
		}
	}
	

	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/notice/noticeDisable?id=" + row.noticeId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/notice/noticeActivate?id=" + row.noticeId,
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
	
	function showType(value){
		return value.name;
	}
	
	function showEmp(value){
		return value.name;
	}
	
	function selectEmployee(){  // 选择员工打开table表
		$.get("<%=path %>/employee/pager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		$("#selectWin").window("open");
	}
	function submitEmployee(){ // 添加选择完员工
		var rows = $("#list1").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个员工","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#empId").val(row.empId);
				$("#empName").val(row.name);
				$("#selectWin").window("close");
				$("#selectGradeWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个员工","info");
		}
	}
	
	function selectEmployees(){  // 修改选择员工打开table表
		$.get("<%=path %>/employee/pager", function(data) {
			$("#list2").datagrid("loadData", data.rows);
		}, "json");
		$("#selectWins").window("open");
	}
	function submitEmployees(){ // 修改选择完员工
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个员工","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#empIds").val(row.empId);
				$("#empNames").val(row.name);
				$("#selectWins").window("close");
				$("#selectGradeWins").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个员工","info");
		}
	}
	
	//模糊查询
	function queryByName(){
		var noticeName = $('#findName').textbox('getValue');
	    if (noticeName != "") {
	    	$.get("<%=path %>/notice/pagerByName?noticeName=" + noticeName,
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

</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/notice/noticePager',
			method:'get',
			rownumbers:true,
			fitColumns:true,<!-- 表格面积是否全部占满 -->
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'noticeId',align:'center',checkbox:true">公告编号</th>
				<th data-options="field:'name',align:'center',width:100">公告标题</th>
				<th data-options="field:'des',align:'center',width:100">公告描述</th>
				<th data-options="field:'noticetype',align:'center',width:80"  formatter="showType">公告类型</th>
				<th data-options="field:'noticeDay',align:'center',width:180">公告时间</th>
				<th data-options="field:'emp',align:'center',width:80" formatter="showEmp">发布人</th>
				<th data-options="field:'status',align:'center',width:80" formatter="frozenActivate">公告状态</th>
				<th data-options="field:'caozuo',align:'center',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddNoticeWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditNoticeWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		<div>
			公告标题/公告描述: <input id="findName" class="easyui-textbox" style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加公告" data-options="closed:true" style="width:500px;height:300px;">
		<form id="addForm">
			<table>
				<tr>
					<td>公告标题</td>
					<td><input class="easyui-validatebox easyui-textbox" name="notice.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>公告类型</td>
					<td><input id="type" class="easyui-combobox" name="notice.noticetypeid" data-options="required:true,
						valueField:'id',
						textField:'text',
						panelHeight:'auto',
						selected:'true' "/>
					</td>
				</tr>
				<tr>
					<td>公告描述</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="notice.des" style="height:100px;"/></td>
				</tr>
				<!-- 隐藏域  员工ID -->
				<tr><td><input type="hidden" id = "empId" name = "empId"/></td></tr>
				<tr>
					<td>发布人:</td>
					<td><input  id="empName" class="easyui-validatebox textbox" name="empName" data-options="required:true"/>
					<a name="empId" id="Employee" onclick = "selectEmployee()">选择</a>
					</td>
				</tr>
				<tr>
					<td>公告时间</td>
					<td><input class="easyui-datetimebox" name="notice.noticeDay" /></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addNotice();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改公告类型" data-options="closed:true" style="width:500px;height:300px;">
		<form id="editForm">
			<input type="hidden" name="notice.noticeId" />
			<table>
				<tr>
					<td>类型名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="notice.name" data-options="required:true,validType:'length[2,30]'"/></td>
				</tr>
				<tr>
					<td>公告描述</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="notice.des"/></td>
				</tr>
				<tr>
					<td>公告类型</td>
					<td><input id="types" class="easyui-combobox" name="notice.noticetypeid" data-options="required:true,
						valueField:'id',
						textField:'text',
						panelHeight:'auto',
						selected:'true' "/>
					</td>
				</tr>
				<tr>
					<td>公告时间</td>
					<td><input class="easyui-datetimebox" data-options="multiline:true" name="notice.noticeDay" /></td>
				</tr>
				<!-- 隐藏域  员工ID -->
				<tr><td><input type="hidden" id = "empIds" name = "empId"/></td></tr>
				<tr>
					<td>发布人:</td>
					<td><input  id="empNames" class="easyui-validatebox textbox" name="empName" data-options="required:true"/>
					<a name="empIds" id="Employees" onclick = "selectEmployees()">选择</a>
					</td>
				</tr>
				<tr>
					<td>公告类型状态</td>
					<td>
					<input type = "radio"  name="notice.status" value= "1" />激活
					<input type = "radio"  name="notice.status" value= "0"/>未激活
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
	
	<div id="selectWin" class="easyui-window" title="选择员工" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list1"class="easyui-datagrid" 
			data-options="toolbar:'#tb1',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
	    <thead>  
	        <tr>  
	            <th data-options="field:'empId',checkbox:true,width:80" ></th>  
	            <th data-options="field:'name',width:80" >姓名</th>  
	            <!-- <th data-options="field:'depId',width:80,hidden:true"></th>
	            <th data-options="field:'roleId',width:80,hidden:true"></th> -->
	            <th data-options="field:'depName',width:80">所在部门</th>
	            <th data-options="field:'roleName',width:80">角色</th>
	           <!--  <th data-options="field:'nation',width:80">籍贯</th>  --> 
	            <th data-options="field:'gender',width:80">性别</th>  
	            <!-- <th data-options="field:'birthday',width:80">出生日期</th>  
	            <th data-options="field:'email',width:80">邮箱</th>  
	            <th data-options="field:'hireDay',width:80">入职时间</th>  
	            <th data-options="field:'resignDay',width:80">离职时间</th>   -->
	        </tr>  
	    </thead>  
	</table>
		<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "submitEmployee()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
		</div>
	</div>

	<div id="selectWins" class="easyui-window" title="选择员工" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list2"class="easyui-datagrid" 
			data-options="toolbar:'#tb1',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:80%;"
			>
	    <thead>  
	        <tr>  
	            <th data-options="field:'empId',checkbox:true,width:80" ></th>  
	            <th data-options="field:'name',width:80" >姓名</th>  
	            <!-- <th data-options="field:'depId',width:80,hidden:true"></th>
	            <th data-options="field:'roleId',width:80,hidden:true"></th> -->
	            <th data-options="field:'depName',width:80">所在部门</th>
	            <th data-options="field:'roleName',width:80">角色</th>
	           <!--  <th data-options="field:'nation',width:80">籍贯</th>  --> 
	            <th data-options="field:'gender',width:80">性别</th>  
	            <!-- <th data-options="field:'birthday',width:80">出生日期</th>  
	            <th data-options="field:'email',width:80">邮箱</th>  
	            <th data-options="field:'hireDay',width:80">入职时间</th>  
	            <th data-options="field:'resignDay',width:80">离职时间</th>   -->
	        </tr>  
	    </thead>  
	</table>
		<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "submitEmployees()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWins()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
		</div>
	</div>

</body>
</html>






























