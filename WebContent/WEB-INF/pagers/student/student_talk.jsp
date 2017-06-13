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
	var json = '{"talk.talkId":"_talkId","talk.empId":"_empId","talk.stuId":"_stuId","talk.talkDay":"_talkDay","talk.status":"_status","talk.des":"_des"}';
	$(function() {
		setPagination("list");
	});
	
	function showAddTalkWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditTalkWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的行","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = json.replace("_TalkId",row.TalkId).replace("_des",row.des).replace("_empId",row.empId).replace("_stuId",row.stuId).replace("_status",row.status).replace("_talkDay",row.talkDay);
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的宿舍","info");
		}
		
	}
	
	
	function addTalk() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/talk/addTalk",
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
	

	
	function editTalk(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/talk/updateTalk",
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
		$.get("<%=path %>/gradeInfo/gradePager", function(data) {
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
	

	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/talk/talkDisable?id=" + row.talkId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/talk/talkActivate?id=" + row.talkId,
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
	function showName(value){
		return value.name;
	}
</script>
</head>
<body id = "body">
	<table id = "list"class="easyui-datagrid" 
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/talk/pager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style = "height:100%;"
			>
		<thead>
			<tr>
				<th data-options="field:'talkId',checkbox:true"></th>
				<th data-options="field:'emp',align:'center'" formatter="showName">教师名字</th>
				<th data-options="field:'stu',align:'center'" formatter="showName">学生姓名</th>
				<th data-options="field:'talkDay',width:180,align:'center'">谈话时间</th>
				<th data-options="field:'des',width:180,align:'center'">谈话内容</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">谈心状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "showAddTalkWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
				<a href="javascript:;" onclick = "showEditTalkWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		 <div>
			谈心内容: <input class="easyui-textbox" style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加谈心记录" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:300px;height:180px;padding:5px;">
		<form id = "addForm">
			<table>
				<tr>
					<td>教师名字</td>
					<td><input class="easyui-validatebox textbox" name="talk.empId" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>学生名字</td>
					<td><input class="easyui-validatebox textbox" name="talk.stuId" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>谈心时间</td>
					<td><input class="easyui-datetimebox" name="talk.talkDay" /></td>
				</tr>	
				<tr>
					<td>谈心描述</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="talk.des" style="height:100px;"/></td>
				</tr>	
				<tr>
					<td>
						<a href="javascript:;" onclick="addTalk();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>

	
	<div id="editWin" class="easyui-window" title="修改谈心内容" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:380px;height:250px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "talk.talkId"/></td></tr>
				<tr>
					<td>教师名字</td>
					<td><input class="easyui-validatebox textbox" name="talk.empId" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>学生名字</td>
					<td><input class="easyui-validatebox textbox" name="talk.stuId" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>谈心时间</td>
					<td><input class="easyui-datetimebox" name="talk.talkDay" /></td>
				</tr>	
				<tr>
					<td>谈心描述</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="talk.des" style="height:100px;"/></td>
				</tr>
				<tr>
					<td>状态更改</td>
					<td>
						<input type = "radio"  name="talk.status" value= "1"/>激活
						<input type = "radio"  name="talk.status" value= "0"/>冻结
					</td>
				</tr>
				<tr>
					<td> 
						<a href="javascript:;" onclick="editTalk();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>