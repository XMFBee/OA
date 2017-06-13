<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% 
    	String path = request.getContextPath(); 
    %>
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
	var json = '{"grade.gradeId":"_gradeid","grade.empIds1":"_empIds1","grade.empIds2":"_empIds2","grade.empIds3":"_empIds3","grade.name":"_name","grade.empId1.name":"_empName1","grade.empId2.name":"_empName2","grade.empId3.name":"_empName3","grade.quantity":"_quantity","grade.des":"_des","grade.status":"_status"}';
	
	
	$(function() {
		setPagination("list");
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
				var json1 = json.replace("_gradeid",row.gradeId).replace("_name",row.name).
				replace("_empIds1",row.empIds1).replace("_empIds2",row.empIds2).replace("_empIds3",row.empIds3).
				replace("_empName1",row.empId1.name).replace("_empName2",row.empId2.name).
				replace("_empName3",row.empId3.name).replace("_des",row.des).
				replace("_quantity",row.quantity).replace("_status",row.status);
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
			$.post("<%=path %>/grade/gradeUpdate",
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
	var ids = 0; 
	function showDep(id){ // 查询所有部门
		ids = id;
		$.get("<%=path %>/dep/pager",
				function(data) {
				$("#dep").datagrid("loadData", data.rows);
			}, "json");
		$("#selectDepWin").window("open");
	}
	
	function closeDepWin(){ // 关门部门
		$("#selectDepWin").window("close");
	}
	
	function closeEmpWin(){ // 关门员工
		$("#selectEmpWin").window("close");
	}
	
	function openEmpWin(){ // 打开部门选择员工
		var rows = $("#dep").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个部门","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$.get("<%=path %>/employee/queryEmpsByDept?depId=" + row.depId,
					function(data) {
					$("#emp").datagrid("loadData", data.rows);
				}, "json");
				$("#selectEmpWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个部门","info");
		}
		
	}
	
	function showStuWin(){ // 某个班级下的所有学生
		$("#tb3").hide()
			var rows = $("#list").datagrid("getSelections");
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
	var gradeId = "";
	function showAddStuWin(){// 给某个班添加学生
		$("#tb3").show()
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				gradeId = row. gradeId
				$.get("<%=path %>/stu/stuGradeNullById",
						function(data) {
						$("#list2").datagrid("loadData", data.rows);
					}, "json");
					$("#selectGradeWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
}
	
	
	function combitStuWin(){ // 批量添加学生
		var rows = $("#list2").datagrid("getSelections");
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
				$.get("<%=path%>/stu/addStuOnGrade?stuIds=" + ids + "&gradeId="+gradeId,
					function(data){
						if(data.resu.request == "success"){
							$("#selectGradeWin").window("close"); // 关闭窗口
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
	
	
	function combitEmpWin(empId1){
		var rows = $("#emp").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个员工","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				console.log(row)
				if(ids == 1 ){
					$("#empId1").val(row.empId);
					$("#empName1").val(row.name);
					$("#editEmpId1").val(row.empId);
					$("#editEmpName1").val(row.name);
				}else if(ids == 2){
					$("#empId2").val(row.empId);
					$("#empName2").val(row.name);
					$("#editEmpId2").val(row.empId);
					$("#editEmpName2").val(row.name);
				}else if(ids == 3){
					$("#empId3").val(row.empId);
					$("#empName3").val(row.name);
					$("#editEmpId3").val(row.empId);
					$("#editEmpNamee").val(row.name);
				}
				$("#selectDepWin").window("close");
				$("#selectEmpWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个员工","info");
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
	
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/room/roomActivate?id=" + row.roomId,
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
	function showEmpName(value){
		return value.name;
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
				<th data-options="field:'fact',align:'center'">班级实际人数</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" onclick = "showAddGradeWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
			<a href="javascript:;" onclick = "showEditGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
			<a href="javascript:;" onclick = "showStuWin()" class="easyui-linkbutton" iconCls="icon-edit">查看学生</a>
			<a href="javascript:;" onclick = "showAddStuWin()" class="easyui-linkbutton" iconCls="icon-edit">添加学生</a>
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
					<td>班级名称</td>
					<td><input class="easyui-validatebox textbox" name="grade.name" data-options="required:true"/></td>
				</tr>
				
				<tr><td><input type="hidden" id = "empId1" name = "empId1"/></td></tr>
				
				<tr>
					<td>选择班主任</td>
					<td>
					<input class="easyui-validatebox textbox" id = "empName1"  data-options = "required:true,'disabled':true " />
					</td>
					<td><a href="javascript:;" onclick = "showDep(1)">选择</a></td>
				</tr>
				<tr><td><input type="hidden" id = "empId2" name = "empId2"/></td></tr>
				<tr>
					<td>选择任课老师</td>
					<td><input class="easyui-validatebox textbox"  id = "empName2"  data-options = "required:true, 'disabled':true" /></td>
					<td><a href="javascript:;" onclick = "showDep(2)">选择</a></td>
				</tr>
				<tr><td><input type="hidden" id = "empId3" name = "empId3"/></td></tr>
				<tr>
					<td>选择辅导老师</td>
					<td><input class="easyui-validatebox textbox" id = "empName3"  data-options = "required:true, 'disabled':true" /></td>
					<td><a href="javascript:;" onclick = "showDep(3)">选择</a></td>
				</tr>
				
				<tr>
					<td>最大人数</td>
					<td><input class="easyui-validatebox textbox" name="grade.quantity" data-options = "required:true" /></td>
				</tr>
			
				<tr>
					<td>描述</td>
					<td><input class="easyui-validatebox textbox" name="grade.des"  style = "height:50px;"/></td>
				</tr>
				
				<tr>
					<td>
						<a href="javascript:;" onclick="addGrade();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	
	
	<div id="editWin" class="easyui-window" title="修改班级" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "grade.gradeId"/></td></tr>
				<tr>
					<td>班级名称</td>
					<td><input class="easyui-validatebox textbox" name="grade.name" data-options="required:true"/></td>
				</tr>
				<tr><td><input type="hidden" id = "editEmpId1" name = "grade.empIds1"/></td></tr>
				<tr>
					<td>选择班主任</td>
					<td>
						<input class="easyui-validatebox textbox"  id = "editEmpName1" name="grade.empId1.name"  data-options = "required:true,'disabled':true" />
					</td>
					<td><a href="javascript:;" onclick = "showDep(1)">选择</a></td>
					
				</tr>
				<tr><td><input type="hidden" id = "editEmpId2" name = "grade.empIds2"/></td></tr>
				<tr>
					<td>选择专业老师</td>
					<td><input class="easyui-validatebox textbox"  id = "editEmpName2" name="grade.empId2.name"  data-options = "required:true,'disabled':true " /></td>
					<td><a href="javascript:;" onclick = "showDep(2)">选择</a></td>
				</tr>
				<tr><td><input type="hidden" id = "editEmpId3" name = "grade.empIds3"/></td></tr>
				<tr>
					<td>选择辅导老师</td>
					<td><input class="easyui-validatebox textbox"  id = "editEmpName3" name="grade.empId3.name"  data-options = "required:true,'disabled':true " /></td>
					<td><a href="javascript:;" onclick = "showDep(3)">选择</a></td>
				</tr>
				<tr>
					<td>班级最大人数</td>
					<td><input class="easyui-validatebox textbox" name="grade.quantity" data-options = "required:true" /></td>
				</tr>
				
				<tr>
					<td>描述</td>
					<td><input class="easyui-validatebox textbox"  name="grade.des" style = "height:50px;" /></td>
				</tr>
				<tr>
					<td>班级状态</td>
					<td>
						<input type = "radio"  name="grade.status" value= "1"/>可用
						<input type = "radio"  name="grade.status" value= "0"/>禁用
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
	
	<div id="selectGradeWin" class="easyui-window" title="查看学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
		<table id = "list2"class="easyui-datagrid" 
			data-options="toolbar:'#1',singleSelect:false,
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
	
	<div id="selectDepWin" class="easyui-window" title="查看部门" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;padding:5px;">
		<table id="dep" class="easyui-datagrid" data-options="
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'"
		style = "height:80%;"
		>  
    <thead>  
        <tr>  
            <th data-options="field:'depId',checkbox:true,width:80" ></th> 
            <th data-options="field:'depName',width:80" >部门名称</th> 
            <th data-options = "field:'empId',width:80,hidden:true" >经理id</th>
            <th data-options="field:'empName',width:80">部门经理</th>
            <th data-options="field:'des',width:80">描述</th>  
            <th data-options="field:'status',width:80" formatter="frozenActivate">状态</th>
        </tr>  
    </thead>  
	</table>  
		<div id="tb2" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
					<a href="javascript:;" onclick = "openEmpWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
					<a href="javascript:;" onclick = "closeDepWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
			</div>
		</div>
	</div>
	
	<div id="selectEmpWin" class="easyui-window" title="查看员工" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:350px;height:350px;padding:5px;">
			<table id="emp" class="easyui-datagrid" data-options="
			autoRowHeight:true,
			pagination:true,
			toolbar:'#toolbar'"
			style = "height:80%;"
		>  
	   		 <thead>  
	      	  <tr>  
	            <th data-options="field:'empId',checkbox:true,width:80" ></th>  
	            <th data-options="field:'name',width:80" >姓名</th>  
	       	 </tr>  
	   		 </thead>  
		</table>  
	
	<!-- 其它工具 -->
		<div id="#toolbar" style="padding:5px;height:auto">
				<div style="margin-bottom:5px">
						<a href="javascript:;" onclick = "combitEmpWin()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
						<a href="javascript:;" onclick = "closeEmpWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
				</div>
		</div>
	</div>
</body>
</html>