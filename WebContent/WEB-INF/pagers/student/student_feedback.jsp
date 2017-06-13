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
	var json = '{"gradeInfo.gradeId":"_gradeid","gradeInfo.name":"_name","gradeInfo.empName1":"_empName1","gradeInfo.empName2":"_empName2","gradeInfo.empName3":"_empName3","gradeInfo.quantity":"_quantity","gradeInfo.des":"_des","gradeInfo.status":"_status"}';
	$(function() {
		setPagination("list");
		setPagination("list2");
	});
	
	
	function showAddGradeWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditGradeWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = json.replace("_gradeid",row.gradeId).replace("_name",row.name).replace("_empName1",row.empName1).replace("_empName2",row.empName2).replace("_empName3",row.empName3).replace("_des",row.des).replace("_quantity",row.quantity).replace("_status",row.status);
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的班级","info");
		}
		
	}
	
	
	function addGrade() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/grade/gradeSave",
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
	

	
	function editGrade(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/stu/studentUpdate",
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
	var gradeId = "";
	function showFeedbackWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				gradeId = row.gradeId;
				$.get("<%=path %>/stuFeedback/stuFeedbackPager?gradeId=" + row.gradeId,
						function(data) {
						$("#list2").datagrid("loadData", data.rows);
					}, "json");
					$("#feedbackWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
	}

	function openGradeWin(){  // 打开班级选择学生
		$.get("<%=path %>/stu/stuGradeById?gradeId=" + gradeId,
			function(data) {
			$("#list3").datagrid("loadData", data.rows);
		}, "json");
		$("#selectGradeWin").window("open");
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
	
	
	function submitGradeWin(){ // 选择完学生
		var rows = $("#list3").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				document.getElementById("add_stuId").value = row.stuId; // JS赋值
				$("#add_stuName").textbox('setValue', row.name); //赋值
				
				$("#selectWin").window("close");
				$("#selectGradeWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个学生","info");
		}
	}
	
	function addstufeedback() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/stuFeedback/stuSave",
					$("#addForm").serialize(),
				function(data){
					if(data.resu.request == "success"){
						$("#addWin").window("close"); // 关闭窗口
						$("#list2").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示",data.resu.message,"info");
					}else if(data.resu.reuqest == "fail"){
						$.messager.alert("提示",data.resu.message,"info");
					}
			},"json");
		}else{
			$.messager.alert("提示","请输人正确的数据","info");
		}
	}
	
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			alert(row.feedbackId);
			$.post("<%=path %>/stuFeedback/feedbackDisable?id=" + row.feedbackId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			alert(row.feedbackId);
			$.post("<%=path %>/stuFeedback/feedbackActivate?id=" + row.feedbackId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload'); // 重新加载数据表
			},"json");
		}
		
	}
	

	function queryByName(){
		var stuName = $('#gradeName').textbox('getValue');
	    if (stuName != "") {
	    	$.get("<%=path %>/grade/pagerByName?gradeName=" + stuName,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.get("<%=path %>/grade/gradePager",
					function(data) {
					$("#list").datagrid("loadData", data.rows);
				}, "json");
	    }
	}
	
	
	function getStuName(value){  
		return value.name;
	}
	
	function showEmpName(value){
		return value.name;
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
<body id = "body">
	<table id = "list"class="easyui-datagrid" 
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/grade/gradePager',
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
				<th data-options="field:'name',align:'center'">班级名称</th>
				<th data-options="field:'empId1',align:'center'" formatter="showEmpName">班主任</th>
				<th data-options="field:'empId2',align:'center'" formatter="showEmpName">专业老师</th>
				<th data-options="field:'empId3',align:'center'" formatter="showEmpName">辅导老师</th>
				<th data-options="field:'des',align:'center'">班级描述</th>
				<th data-options="field:'quantity',align:'center'">班级最大人数</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
			</tr>
		</thead>
			
	</table>
	<div id="tb" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "showFeedbackWin()" class="easyui-linkbutton" iconCls="icon-edit">查看反馈</a>
			</div>
			<div>
			班级名称: <input class="easyui-textbox" id = "gradeName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
			</div>
	</div>

	
	
	<div id="addWin" class="easyui-window" title="添加班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:350px;height:280px;padding:5px;">
		<form id = "addForm">
			<table>
				<tr>
					<td><input id="add_stuId" type="hidden" name="stuFeedback.stuId" /></td>
				</tr>
				<tr>
					<td>学生姓名</td>
					<td><input id="add_stuName" class="easyui-textbox" name="stuFeedback.stu.name" data-options="'disabled':true"/></td>
					<td><a href="javascript:;" onclick = "openGradeWin()" >选择</a></td>
				</tr>
				<tr>
					<td>反馈时间</td>
					<td><input class="easyui-datetimebox" name="stuFeedback.feedbackDay" data-options=""/></td>
				</tr>
			
				<tr>
					<td>反馈详情</td>
					<td><input class="easyui-textbox" name="stuFeedback.des" data-options="multiline:true" style = "height:60px;"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addstufeedback();"class="easyui-linkbutton" data-options="iconCls:'icon-add'"  style="width:70px;height:28px;">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	
	
	<div id="editWin" class="easyui-window" title="修改班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "gradeInfo.roomId"/></td></tr>
				<tr>
					<td>班级名称</td>
					<td><input class="easyui-validatebox textbox" name="gradeInfo.name" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>选择班主任</td>
					<td><input class="easyui-validatebox textbox"  name="gradeInfo.empName1" onclick = "" data-options = "required:true, 'disabled':true" /></td>
				</tr>
				<tr>
					<td>选择专业老师</td>
					<td><input class="easyui-validatebox textbox"  name="gradeInfo.empName2" onclick = "" data-options = "required:true, 'disabled':true" /></td>
				</tr>
				<tr>
					<td>选择辅导老师</td>
					<td><input class="easyui-validatebox textbox"  name="gradeInfo.empName3" onclick = "" data-options = "required:true, 'disabled':true" /></td>
				</tr>
				<tr>
					<td>班级最大人数</td>
					<td><input class="easyui-validatebox textbox" name="gradeInfo.quantity" data-options = "required:true" /></td>
				</tr>
				
				<tr>
					<td>描述</td>
					<td><input class="easyui-validatebox textbox"  name="gradeInfo.des" onclick = "" data-options = "required:true" style = "height:50px;" /></td>
				</tr>
				<tr>
					<td>班级状态</td>
					<td>
						<input type = "radio"  name="gradeInfo.status" value= "1"/>可用
						<input type = "radio"  name="gradeInfo.status" value= "0"/>禁用
					</td>
				</tr>
				<tr>
					<td> 
						<a href="javascript:;" onclick="editGrade();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="feedbackWin" class="easyui-window" title="查看反馈" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:700px;height:460px;padding:5px;">
			<div id="tb" style="padding:5px;height:auto">
				<div style="margin-bottom:5px">
						<a href="javascript:;" onclick = "showAddGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
						<a href="javascript:;" onclick = "showEditGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
				</div>
					<div>
					姓名:  <input class="easyui-textbox" style="width:80px">
					<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
				</div>
			</div>
			<table id = "list2" class="easyui-datagrid" 
			data-options="toolbar:'#t',singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:83%;"
			>
		<thead>
			<tr>
				<th data-options="field:'feedbackId',checkbox:true"></th>
				<th data-options="field:'stu',align:'center'" formatter = "getStuName">学生姓名</th>
				<th data-options="field:'feedbackDay',align:'center'" style="width:100px;">反馈时间</th>
				<th data-options="field:'des',align:'center'" style="width:120px;">反馈详情</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
		</table>
	</div>
	
	<div id="selectGradeWin" class="easyui-window" title="选择学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id = "list3" class="easyui-datagrid" 
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
					<th data-options="field:'name',align:'center'">学生名称</th>
				</tr>
			</thead>
		</table>
		<div id="tb2" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "submitGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
	
	
</body>
</html>