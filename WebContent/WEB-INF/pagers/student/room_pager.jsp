<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% String path = request.getContextPath(); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/json2.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>

<script>
	var json = '{"room.roomId":"_roomid","room.stuId":"_stuid","room.name":"_name","room.stu.name":"_stuName","room.quantity":"_quantity","room.status":"_status"}';
	$(function() {
		setPagination("list");
	});
	
	function showAddRoomWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditRoomWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的宿舍","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = json.replace("_roomid",row.roomId).replace("_status",row.status).replace("_name",row.name).replace("_quantity",row.quantity).replace("_stuid",row.stuId);
				if(row.stu != null){
					json1 = json1.replace("_stuName",row.stu.name);
				}else{
					json1 = json1.replace("_stuName","暂无宿舍长");
				}
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的宿舍","info");
		}
		
	}
	
	
	function addRoom() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/room/roomSave",
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
	

	
	function editRoom(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/room/roomUpdate",
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

	function selectGrade(){  // 选择班级
		$.get("<%=path %>/grade/gradePager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		$("#selectWin").window("open");
	}
	
	function closeGradeWin(){ // 关闭班级窗口
		$("#selectWin").window("close");
	}
	
	function closeStudentWin(){ // 关学生窗口
		$("#selectGradeWin").window("close");
	}
	
	function openGradeWin(){  // 打开班级选择学生
		var rows = $("#list1").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$.get("<%=path %>/stu/stuGradeById?gradeId=" + row.gradeId,
					function(data) {
					$("#list2").datagrid("loadData", data.rows);
				}, "json");
				$("#selectGradeWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
		
	}
	
	function submitGradeWin(){ // 选择完宿舍长
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#studentId").val(row.stuId);
				$("#studentName").val(row.name);
				$("#selectWin").window("close");
				$("#selectGradeWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个学生","info");
		}
	}

	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/room/roomDisable?id=" + row.roomId,
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/room/roomActivate?id=" + row.roomId,
				function(data){
					$('#list').datagrid('reload'); // 重新加载数据表
			},"json");
		}
		
	}
	
	function showAllStudentWin(){ // 某个宿舍下的所有学生
		$("#tb3").hide()
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个宿舍","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$.get("<%=path %>/stu/stuRoomById?roomId=" + row.roomId,
					function(data) {
					$("#list3").datagrid("loadData", data.rows);
				}, "json");
				$("#selectRoomWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个宿舍","info");
		}
	}
	var roomId = "";
	function showAddStudentWin(){ // 某个宿舍下添加学生
		$("#tb3").show()
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个宿舍","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				roomId = row.roomId;
				$.get("<%=path %>/stu/stuRoomNullById",
					function(data) {
					$("#list3").datagrid("loadData", data.rows);
				}, "json");
				$("#selectRoomWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个宿舍","info");
		}
	}
	
	function combitStuWin(){ // 批量添加学生
		
		var rows = $("#list3").datagrid("getSelections");
		if(rows.length > 0){
			var ids = "";
			for(var i = 0, len = rows.length; i < len; i++){
				if(ids == ""){
					ids = rows[i].stuId;
				}else{
					ids += ","+rows[i].stuId
				}
			}
			if(ids != ""){
				$.get("<%=path%>/stu/addStuOnRoom?stuIds=" + ids + "&roomId="+roomId,
					function(data){
						if(data.resu.request == "success"){
							$("#selectRoomWin").window("close"); // 关闭窗口
							$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else if(data.resu.reuqest == "fail"){
							$.messager.alert("提示",data.resu.message,"info");
						}
				},"json");
			}
		}else{
			$.messager.alert("提示","请选中你要添加的学生","info");
		}
		
	}
	
	function queryByName(){
		var stuName = $('#roomName').textbox('getValue');
	    if (stuName != "") {
	    	$.get("<%=path %>/room/pagerByName?roomName=" + stuName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.post("<%=path %>/room/roomPager",
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
	
	function showName(value){
		if(value == null){
			return "暂无宿舍长";
		}else{
			return value;
		}
	}
	
	function showStuName(value){
		if(value == null){
			return "暂无宿舍长"
		}else{
			return value.name;
		}
	}
	function showEmpName(value){
		return value.name;
	}
</script>
</head>
<body id = "body">
	<table id = "list"class="easyui-datagrid" 
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/room/roomPager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:100%;"
			>
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',align:'center'">宿舍名称</th>
				<th data-options="field:'quantity',align:'center'">宿舍最大人数</th>
				<th data-options="field:'fact',align:'center'">宿舍实际人数</th>
			 	<th data-options="field:'stu',align:'center'" formatter = "showStuName">宿舍长</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">宿舍状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "showAddRoomWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
				<a href="javascript:;" onclick = "showEditRoomWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
				<a href="javascript:;" onclick = "showAllStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">查看学生</a>
				<a href="javascript:;" onclick = "showAddStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">添加学生</a>
		</div>
		<div>
			宿舍名称: <input class="easyui-textbox" id = "roomName" style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加宿舍" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:300px;height:180px;padding:5px;">
		<form id = "addForm">
			<table>
				<tr>
					<td>宿舍名称</td>
					<td><input class="easyui-validatebox textbox" name="room.name" data-options="required:true"/></td>
				</tr>
			
				
				<tr>
					<td>最大人数</td>
					<td><input class="easyui-validatebox textbox" name="room.quantity" data-options = "required:true" /></td>
				</tr>
			
				<tr>
					<td>
						<a href="javascript:;" onclick="addRoom();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="selectWin" class="easyui-window" title="选择班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
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
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',align:'center'">班级名称</th>
				<th data-options="field:'empId1',align:'center'" formatter = "showEmpName">班主任</th>
				<th data-options="field:'empId2',align:'center'" formatter = "showEmpName">专业老师</th>
				<th data-options="field:'empId3',align:'center'" formatter = "showEmpName">辅导老师</th>
				<th data-options="field:'des',align:'center'">班级描述</th>
				<th data-options="field:'quantity',align:'center'">班级最大人数</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "openGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
	</div>
	</div>
	
	<div id="selectGradeWin" class="easyui-window" title="选择学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
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
					<a href="javascript:;" onclick = "submitGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
	
	<div id="selectRoomWin" class="easyui-window" title="查看学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list3"class="easyui-datagrid" 
			data-options="toolbar:'#b',singleSelect:false,
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
				<th data-options="field:'stuNo',align:'center',width:100">学号</th>
				<th data-options="field:'name',align:'center'">名称</th>
				<th data-options="field:'phone',align:'center',width:100">手机号</th>
				<th data-options="field:'qq',align:'center',width:100">qq</th>
				<th data-options="field:'age',align:'center'">年龄</th>
				<th data-options="field:'gender',align:'center'">性别</th>
			</tr>
		</thead>
	</table>
		<div id="tb3" style="padding:5px;height:auto">
				<div style="margin-bottom:5px">
						<a href="javascript:;" onclick = "combitStuWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				</div>
		</div>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改宿舍" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:380px;height:250px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "room.roomId"/></td></tr>
				<tr>
					<td>宿舍名称</td>
					<td><input class="easyui-validatebox textbox" name="room.name" data-options="required:true "/></td>
				</tr>
				
				<tr><td><input type="hidden" id = "studentId" name = "room.stuId"/></td></tr>
				<tr>
					<td>选择宿舍长</td>
					<td><input class="easyui-validatebox textbox"  id = "studentName" name="room.stu.name" data-options="required:true,'disabled':true" /></td>
					<td><a  href="javascript:;" onclick = "selectGrade()">选择</a></td>
				</tr>
				<tr>
					<td>宿舍最大人数</td>
					<td><input class="easyui-validatebox textbox" name="room.quantity" data-options = "required:true" /></td>
				</tr>
				
				<tr>
					<td>宿舍状态</td>
					<td>
						<input type = "radio"  name="room.status" value= "1"/>可用
						<input type = "radio"  name="room.status" value= "0"/>禁用
					</td>
				</tr>
				<tr>
					<td> 
						<a href="javascript:;" onclick="editRoom();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>