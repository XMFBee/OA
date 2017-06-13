<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href ="http://static.hdslb.com/images/favicon.ico" />

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';
jsonStr = '{"department.depId":"_id","department.name":"_name","department.des":"_des","department.status":"_status","department.employee.empId":"_empId","department.employee.name":"_empName"}';

$(function(){
	setPagination(datagrid)
	setPagination(empsDatagrid);
})

function updStatus(index){
		var row = $("#datagrid").datagrid("getData").rows[index];
		if(row) {
			$.messager.confirm("提示","确定要修改该部门的活动状态吗?" ,function(r){
				if(r) {
					$.get("department/updStatus?department.depId="+row.depId + "&department.status=" + row.status,function(data){
						$("#"+datagrid).datagrid("reload");
					},"json" )
				}
			})
		}
}

function curEdit(value,row,index) {
	var row = $("#"+datagrid).datagrid("getData").rows[index];
	var edit= "<a href='javascript:;' onclick= 'showEdit(" +index + ")' style='color:blue'>修改 </a>";
	if(row.status == 0){
		var del = "<a href='havascript:;' onclick ='updStatus(" + index + ")' style='color:green'>激活</a>";
	}else {
		var del = "<a href='havascript:;' onclick ='dong(" + index + ")' style='color:red'>冻结</a>";
	}
	return edit + del;
}
function dong(index){
	var row = $("#"+datagrid).datagrid("getData").rows[index];
	$.get("<%=path%>/dep/depEmps?depId="+row.depId,function (data) {
		console.log(data.rows.length)
		if(data.rows.length>0){
			alert("该部门还存在员工,不可冻结");
		}else{
			updStatus(index);
		}
	});
}


</script>
<title>部门管理</title>
</head>
<body id = "body">
	<table id="datagrid" class="easyui-datagrid" style="height:100%"  data-options="
		url:'dep/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'
	"
	>  
    <thead>  
        <tr>  
            <th data-options="field:'depId',checkbox:true,width:80" ></th> 
            <th data-options="field:'depName',width:80" >部门名称</th> 
            <th data-options = "field:'empId',width:80,hidden:true" >经理id</th>
            <th data-options="field:'empName',width:80">部门经理</th>
            <th data-options="field:'des',width:80">描述</th>  
            <th data-options="field:'status',width:80" formatter="frostEdit">状态</th>
            <th data-options="field:'editde',width:80" formatter="curEdit">操作</tr>
        </tr>  
    </thead>  
	</table>  
	
	<!-- 其它工具 -->
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" class= "easyui-linkbutton" iconCls="icon-add" onclick="showAdd()" >添加</a>
			<a href="javascript:;" class= "easyui-linkbutton" iconCls="icon-edit" onclick="showEdit()">编辑</a>
		</div>
	</div>
	
	<!-- 添改表 -->
		<!-- 加 -->
	<div id="add_win" class= "easyui-window" title="添加部门" data-options="iconCls:'icon-add',closed:true" style="width:300px;height:400px;padding:5px">
		<form id="add_form" >
			部门名称: <input class="easyui-validatebox" name="department.name" data-options="required:true,validType:'length[3,10]',missingMessage:'请输入部门名称',invalidMessage:'请输入合法的部门名称(部门名称应在3至10个字符以内)'"/><br/>
			部门描述: <input name="department.des" data-options="validType:'length[0,250]'"/><br/>
			<input name="department.status" value="1" type="hidden" />
			<a href="javascript:;" onclick="add('<%=path %>/dep/save')" class="easyui-linkbutton" data-options="iconCls:'icon-add'" >确认</a>
		</form>
	</div>
		<!-- 改 -->
	<div id="upd_win" class= "easyui-window" title="修改部门信息" data-options="iconCls:'icon-add',closed:true" style="width:300px;height:400px;padding:5px">
		<form id="upd_form" >
			<input id="depId" name="department.depId" type="hidden">
			<table>
				<tr><td>姓名:</td><td><input name="department.name"></td></tr>
				<tr><td>部门简介:</td>	<td><textarea rows="3" cols="22" name="department.des" ></textarea></td></tr>
				<tr><td>部门负责人:</td>
					<td><input id="depEmpId" type = "hidden" name = "department.employee.empId" />
					<input id="depEmpName" name = "department.employee.name" size="15"/><a class= "easyui-linkbutton" href="javascript:;" onclick = "updEmp('depId')">更换</a>
					</td></tr>
				<tr><td>状态:</td><td><select name="department.status"><option value="0">冻结</option><option value="1">良好</option></select>	</td>
				</tr>
				<tr>
					<td rowspan="2" ><a href="javascript:;" onclick="upd('<%=path %>/dep/update')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<div id="emps" class="easyui-window" title="经理候选人" data-options="iconCls:'icon-save',closed:true,minimizable:false,tools:'#tt'" style="width:500px;height:200px;padding:10px;">
		<table id="empsDatagrid" class="easyui-datagrid" data-options="
		url:'dep/depEmps',
		method:'get',
		fit:true,
		fitColumns:true,
		rownumbers:true,
		autoRowHeight:true,
		pagination:true,
	">  
		    <thead>  
		        <tr>  
		            <th data-options="field:'empId',width:80,hidden:true" ></th>  
		            <th data-options="field:'empName',width:80" >姓名</th>  
		            <th data-options="field:'empEduBack',width:80" >学历</th>  
		            <th data-options="field:'empCollege',width:80" >毕业学校</th>  
		            <th data-options="field:'empHireDay'" >入职时间</th> 
		            <th data-options="field:'cc',width:80" formatter="selEmpBtn">选择</th> 
		        </tr>  
		    </thead>  
		</table>  
	</div>
	
	<script type="text/javascript">
		function updEmp(depId){
			console.log("depId")
			var depIdval = $("#"+depId).val();
			$("#"+empsDatagrid).datagrid({
				url:'dep/depEmps?depId='+depIdval
			})
			$("#"+empsDatagrid).datagrid('reload');
			$("#emps").window("open");
		}
	</script>
</body>
</html>