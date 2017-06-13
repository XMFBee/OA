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
<script type="text/javascript" src="http://www.jeasyui.com/easyui/datagrid-detailview.js"></script>
<script>
	
	
	var jsonStr = '{"student.stuId":"_stuId","student.stuNo":"_stuNo",' +
	'"student.name":"_name","student.pwd":"_pwd","student.idCard":"_idCard",'+
	'"student.phone":"_phone","student.qq":"_qq","student.weChat":"_weChat",' +
	'"student.school":"_school","student.age":"_age","student.birthday":"_birthday",'+
	'"student.gender":"_gender", "student.address":"_address","student.nation":"_nation",' +
	'"student.resIdence":"_resIdence","student.gradeId":"_gradeId","student.roomId":"_roomId",' +
	'"student.parentName":"_parentName", "student.parentPhone":"_parentPhone","student.startDay":"_startDay", ' +
	'"student.stuStatus":"_stuStatus", "student.des":"_des", "student.status":"_status","student.role":"_role","student.room.name":"_roomName","student.grade.name":"_gradeName"}';
	
	
	$(function() {
		setPagination("list");
	});
	
	function showAddStudentWin(){
		$("#addWin").window("open");// 打开指定的window， open表示打开，close表示关闭
		$("#addForm").form("clear"); // 清除表单数据
	}
	function showEditStudentWin(){
		var rows = $("#list").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				var json1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
				replace("_name", row.name).replace("_pwd", row.pwd).replace("_idCard", row.idCard).
				replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
				replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
				replace("_gender", row.gender).replace("_address", row.address).replace("_nation", row.nation).
				replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
				replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
				replace("_stuStatus",row.stuStatus).replace("_des",row.des).replace("_status",row.status).replace("_role",row.role);
				if (row.grade != null) {
					json1 = json1.replace("_gradeName",row.grade.name);
				} else {
					json1 = json1.replace("_gradeName","暂未分配");
				}
				if (row.room != null) {
					json1 = json1.replace("_roomName",row.room.name);
				} else {
					json1 = json1.replace("_roomName","暂未分配");
				}
			
				$("#editForm").form("load", JSON.parse(json1)); // 直接获取表单的数据
				$("#editWin").window("open");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个要修改的学生","info");
		}
		
	}
	
	
	function addStudent() {
		if($("#addForm").form("validate")){
			$.post("<%=path %>/stu/stuOfficialSave",
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
	
	function editStudent(){
		if($("#editForm").form("validate")){
			$.post("<%=path %>/stu/stuOfficialUpdate",
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
	
	function selectRoom(){ // 选择宿舍
		$.get("<%=path %>/room/roomPager", function(data) {
			$("#list2").datagrid("loadData", data.rows);
		}, "json");
		$("#selectRoomWin").window("open");
	}
	
	function submitGrade(){ // 选择完班级
		var rows = $("#list1").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个班级","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#gradeName").val(row.name);
				$("#gradeId").val(row.gradeId);
				$("#selectWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个班级","info");
		}
	}
	
	function submitRoom(){ // 选择完宿舍
		var rows = $("#list2").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个宿舍","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#roomName").val(row.name);
				$("#roomId").val(row.roomId);
				$("#selectRoomWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个宿舍","info");
		}
	}
	
	function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/stu/stuPurposeDisable?id=" + row.stuId,
				function(data){
					$('#list').datagrid('reload');
			},"json");
		}
		
	}
		
	function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/stu/stuPurposeActivate?id=" + row.stuId,
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
	
	function queryByName(){
		var stuName = $('#stuName').textbox('getValue');
		var stuStatus = '正式';
	    if (stuName != "") {
	    	$.get("<%=path %>/stu/pagerByStuName?stuName=" + stuName + "&stuStatus="+stuStatus,
					function(data) {
			    		if(data.resu.request == "success"){
			    			$("#list").datagrid("loadData", data.rows);// 重新加载指定数据网格数据
							$.messager.alert("提示",data.resu.message,"info");
						}else{
							$.messager.alert("提示",data.resu.message,"info");
						}
						
				}, "json");
	    } else {
	    	$.get("<%=path %>/stu/stuOfficialPager", function(data) {
				$("#list").datagrid("loadData", data.rows);
			}, "json");
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
			return "暂无";
		}else{
			return value.name;
		}
		
	}
	
	$(function(){
        $('#list').datagrid({
            view: detailview,
            detailFormatter:function(index,row){
                return '<div class="ddv" style="padding:5px 0"></div>';
            },
            onExpandRow: function(index,row){
                var ddv = $(this).datagrid('getRowDetail',index).find('div.ddv');
                ddv.panel({
                    height:150,
                    border:false,
                    cache:false,
                    href:'<%=path %>/stu/stuByIdPager?stuId='+ row.stuId,
                    onLoad:function(){
                        $('#list').datagrid('fixDetailRowHeight',index);
                        
                    }
                });
                $('#list').datagrid('fixDetailRowHeight',index);
            }
        });
    });
	
</script>
</head>
<body id = "body">
	<table id = "list"class="easyui-datagrid" 
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/stu/stuOfficialPager',
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
				<th data-options="field:'stuNo',align:'center',width:50">学号</th>
				<th data-options="field:'name',align:'center'">名称</th>
				<th data-options="field:'idCard',align:'center',width:120">身份证</th>
				<th data-options="field:'phone',align:'center',width:80">手机号</th>
				<th data-options="field:'qq',align:'center',width:80">qq</th>
				<th data-options="field:'school',align:'center',width:90">毕业学校</th>
				<th data-options="field:'age',align:'center'">年龄</th>
				<th data-options="field:'gender',align:'center'">性别</th>
				<th data-options="field:'startDay',align:'center',width:120">入学时间</th>
				<th data-options="field:'emp',align:'center',width:80" formatter = "showName">招生老师</th>
				<th data-options="field:'grade',align:'center',width:80" formatter = "showName">班级</th>
				<th data-options="field:'room',align:'center',width:80" formatter = "showName">宿舍</th>
				<th data-options="field:'status',align:'center',width:60"  formatter="frozenActivate">状态</th>
				<th data-options="field:'caozuo',align:'center',width:60" formatter="formatterOpt">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "showAddStudentWin()"class="easyui-linkbutton" iconCls="icon-add" >添加</a>
				<a href="javascript:;" onclick = "showEditStudentWin()" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		</div>
		<div>
			学生姓名: <input class="easyui-textbox" id = "stuName"style="width:80px">
			<a href="javascript:;" class="easyui-linkbutton" onclick = "queryByName()" iconCls="icon-search">搜索</a>
		</div>
	</div>
	<div id="addWin" class="easyui-window" title="添加正式学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:380px;height:300px;padding:5px;">
		<form id = "addForm">
			<table>
				<tr>
					<td>学生姓名</td>
					<td><input class="easyui-validatebox textbox" name="student.name" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>学号</td>
					<td><input class="easyui-validatebox textbox" name="student.stuNo" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>学生身份证</td>
					<td><input class="easyui-validatebox textbox" name="student.idCard" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td><input class="easyui-validatebox textbox"  name="student.phone" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<input type = "radio"  name="student.gender" value= "男"/>男
						<input type = "radio"  name="student.gender" value= "女"/>女
					</td>
				</tr>
				
				<tr>
					<td>毕业学校</td>
					<td><input class="easyui-validatebox textbox" name="student.school" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input class="easyui-validatebox textbox" name="student.address" data-options = "required:true" /></td>
				</tr>
			
				<tr>
					<td>qq</td>
					<td><input class="easyui-validatebox textbox"  name="student.qq" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input class="easyui-validatebox textbox" name="student.age" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>正式学费</td>
					<td><input class="easyui-validatebox textbox" name="officialMoney" style = "height:30px;"  data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addStudent();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
	
	<div id="editWin" class="easyui-window" title="修改正式学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:440px;padding:5px;">
		<form id = "editForm">
			<table>
			<tr><td><input type="hidden" name = "student.stuId"/></td></tr>
				<tr>
					<td>学号</td>
					<td><input class="easyui-validatebox textbox" name="student.stuNo" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><input class="easyui-validatebox textbox" name="student.name" data-options="required:true,validType:'length[2,10]'"/></td>
				</tr>
				<tr><td><input type="hidden" id = "roomId" name = "student.roomId"/></td></tr>
				<tr>
					<td>选择宿舍</td>
					<td><input class="easyui-validatebox textbox" id = "roomName" name="student.room.name" data-options="required:true,'disabled':true"/></td>
					<td><a  href="javascript:;" onclick = "selectRoom()">选择</a></td>
				</tr>
				<tr><td><input type="hidden" id = "gradeId" name = "student.gradeId"/></td></tr>
				<tr>
					<td>选择班级</td>
					<td><input class="easyui-validatebox textbox" id = "gradeName" name="student.grade.name"  data-options="required:true,'disabled':true"/></td>
					<td><a  href="javascript:;" onclick = "selectGrade()">选择</a></td>
				</tr>
				<tr>
					<td>身份证</td>
					<td><input class="easyui-validatebox textbox" name="student.idCard" data-options="required:true,validType:'length[18,18]'"/></td>
				</tr>
				<tr>
					<td>手机号</td>
					<td><input class="easyui-validatebox textbox"  name="student.phone" data-options = "required:true,validType:'length[11,11]'" /></td>
				</tr>
				<tr>
					<td>毕业学校</td>
					<td><input class="easyui-validatebox textbox" name="student.school" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
						<input type = "radio"  name="student.gender" value= "男"/>男
						<input type = "radio"  name="student.gender" value= "女"/>女
					</td>
				</tr>
				
				
				<tr>
					<td>qq</td>
					<td><input class="easyui-validatebox textbox"  name="student.qq" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input class="easyui-validatebox textbox" name="student.address" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>微信</td>
					<td><input class="easyui-validatebox textbox" name="student.weChat" /></td>
				</tr>
				<tr>
					<td>家长联系方式</td>
					<td><input class="easyui-validatebox textbox" name="student.parentPhone" data-options = "required:true" /></td>
				</tr>
				<tr>
					<td>家长姓名</td>
					<td><input class="easyui-validatebox textbox" name="student.parentName" data-options="required:true,validType:'length[2,10]'"/></td>
				</tr>
				<tr>
					<td>入学时间</td>
					<td><input class="easyui-datetimebox" name="student.startDay" /></td>
				</tr>
				<tr>
					<td>状态</td>
					<td>
						<input type = "radio"  name="student.status" value= "0"/>禁用
						<input type = "radio"  name="student.status" value= "1"/>启用
					</td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editStudent();"class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
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
					<th data-options="field:'empId1',align:'center'" formatter = "showName">班主任</th>
					<th data-options="field:'empId2',align:'center'" formatter = "showName">专业老师</th>
					<th data-options="field:'empId3',align:'center'" formatter = "showName">辅导老师</th>
					<th data-options="field:'des',align:'center'">班级描述</th>
					<th data-options="field:'quantity',align:'center'">班级最大人数</th>
					<th data-options="field:'status',align:'center'" formatter="frozenActivate">班级状态</th>
				</tr>
			</thead>
		</table>
		<div id="tb" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "submitGrade()"class="easyui-linkbutton" iconCls="icon-add" >确认</a>
			</div>
		</div>
	</div>
	
	<div id="selectRoomWin" class="easyui-window" title="选择宿舍" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
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
				<th data-options="field:'name',align:'center'">宿舍名称</th>
				<th data-options="field:'quantity',align:'center'">宿舍最大人数</th>
				<th data-options="field:'fact',align:'center'">宿舍实际人数</th>
			 	<th data-options="field:'stu',align:'center'" formatter = "showName">宿舍长</th>
				<th data-options="field:'status',align:'center'" formatter="frozenActivate">宿舍状态</th>
				<th data-options="field:'caozuo',width:100,align:'center'" formatter="formatterOpt">操作</th>
			</tr>
			</thead>
		</table>
		<div id="tb" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "submitRoom()"class="easyui-linkbutton" iconCls="icon-add" >确认</a>
			</div>
		</div>
	</div>
</body>
</html>