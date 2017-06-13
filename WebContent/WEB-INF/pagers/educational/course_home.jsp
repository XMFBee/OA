<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>

<script>
	
	var jsonStr = '{"course.courseId":"_courseId","course.name":"_name","course.des":"_des",'+
		'"course.totalHour":"_totalHour","course.term":"_term","course.courseOrder":"_courseOrder","course.status":"_status"}';
	$(function() {
		setPagination("list");
	});
	
	function showAddCourseWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditCourseWin(){
		//var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = jsonStr.replace("_courseId",row.courseId).replace("_name",row.name).
				replace("_des",row.des).replace("_totalHour",row.totalHour).replace("_term",row.term).
				replace("_courseOrder",row.courseOrder).replace("_status",row.status);
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}
		
	}
	
	
	function addCourse() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/course/courseSave",
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
	
	function editCourse(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/course/courseUpdate",
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
	
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/course/courseDisable?id=" + row.courseId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/course/courseEnabled?id=" + row.courseId,
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
		var courseName = $('#courseName').textbox('getValue');
	    if (courseName != "") {
	    	$.get("<%=path %>/course/pagerByName?courseName=" + courseName,
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
			url:'<%=path %>/course/courseByPage',
			singleSelect:true,
			method:'get',
			autoRowHeight:true,
			pagination:true,
			remoteSort:false,
			rownumbers: true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
			<th data-options="field:'courseId',checkbox:true">课程编号</th>
				<th data-options="field:'name',align:'center'">课程名称</th>
				<th data-options="field:'des',width:160,align:'center'">课程描述</th>
				<th data-options="field:'totalHour',align:'center'">总课时数</th>
				<th data-options="field:'term',align:'center'" sortable="true">学期</th>
				<th data-options="field:'courseOrder',align:'center'">课程顺序</th>
				<th data-options="field:'status',width:80" formatter="frozenActivate" sortable="true">状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick="showAddCourseWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
			<a href="javascript:;" onclick="showEditCourseWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		<div>
			课程名/描述: <input id="courseName" class="easyui-textbox" style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加课程" data-options="closed:true" style="width:500px;height:300px;">
		<form id="addForm">
			<table>
				<tr>
					<td>课程名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>课程描述</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.des" data-options="multiline:true,required:true,validType:'length[2,80]'" style="height:70px;"/></td>
				</tr>
				<tr>
					<td>总课时数</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.totalHour" /></td>
				</tr>
				<tr>
					<td>学期</td>
					<td>
					<select id="cc" class="easyui-combobox" name="course.term" style="width:173px;">
   						<option value="1">第一学期</option>
   			 			<option value="2">第二学期</option>
    					<option value="3">第三学期</option>
    					<option value="4">第四学期</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>课程顺序</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.courseOrder" /></td>
				</tr>
				
				<tr>
					<td>
						<a href="javascript:;" onclick="addCourse();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:60px;height:25px">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改课程" data-options="closed:true" style="width:350px;height:300px;">
		<form id="editForm">
			
			<table>
				<tr>
					<td><input type="hidden" name="course.courseId" /></td>
				</tr>
				<tr>
					<td>课程名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.name" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>课程描述</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.des" data-options="multiline:true,required:true,validType:'length[1,300]'" style="height:70px;"/></td>
				</tr>
				<tr>
					<td>总课时数</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.totalHour" /></td>
				</tr>
				<tr>
					<td>学期</td>
					<td>
					<select id="cc" class="easyui-combobox" name="course.term" style="width:173px;">
   						<option value="1">第一学期</option>
   			 			<option value="2">第二学期</option>
    					<option value="3">第三学期</option>
    					<option value="4">第四学期</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>课程顺序</td>
					<td><input class="easyui-validatebox easyui-textbox" name="course.courseOrder" /></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="course.status" value= "1"/>启用
						<input type = "radio"  name="course.status" value= "0"/>禁用
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editCourse();" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:60px;height:25px">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>