<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
   <%String path = request.getContextPath(); %>
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
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/datagrid-groupview.js"></script>
<style type="text/css">
	#msg  input {
		border:0px;
		background-color:#fff
	}
.message{
 width:300px;
 height:100px;
 z-index:100;
 position:absolute;
 color:#fff;
 left:30%;
 background:rgba(0,0,0,0.3);
 float:left"
 }
</style>
<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
jsonStr =	'{"employee.department.depId":"_depId","employee.department.name":"_depName","employee.pwd":"_pwd","employee.role.roleId":"_roleId","employee.empId":"_empId","employee.name":"_name","employee.idCard":"_idCard","employee.nation":"_nation","employee.gender":"_gender","employee.fingerNo":"_fingerNo","birthday":"_birthday","employee.email":"_email","employee.phone":"_phone","employee.qq":"_qq","employee.weChat":"_weChat","employee.married":"_married","employee.contactName":"_contactName","employee.contactPhone":"_contactPhone","employee.college":"_college","employee.major":"_major","employee.eduBack":"_eduBack","employee.bankName":"_bankName","employee.accountName":"_accountName","employee.accountNo":"_accountNo","employee.alipay":"_alipay","hireDay":"_hireDay","resignDay":"_resignDay","employee.status":"_status","employee.address":"_address","employee.role.name":"_roleName","employee.hireDay":"_empHireDay","employee.birthday":"_birthday"}';
	
	
$(function(){
	setPagination(datagrid)
})

function updStatus(index){
		var row = $("#datagrid").datagrid("getData").rows[index];
		if(row) {
			$.messager.confirm("提示","确定要修改该用户的活动状态吗?" ,function(r){
				if(r) {
					$.post("<%=path%>/employee/delete",{
						"employee.empId":row.empId,
						"employee.status":row.status,
						"employee.department.depId":row.depId
					},
						function(data){
						$("#"+datagrid).datagrid("reload");
					},"json" )
				}
			})
		}
	}
function add(url){
	$.post(url,$("#"+add_form).serialize(),
			function(data) {
				$("#"+add_win).window("close");
				$("#"+datagrid).datagrid("reload");
				$("#"+add_form).form("clear");
				$("#successMsg").html("<p align='center' >默认密码为'123456'</p>");
				$("#successMsg").slideDown(500);
				setTimeout("$('#successMsg').slideUp(500)",1500)
				
			},"json"		
			)
}

		
function showEdit(index){

	var row = $("#"+datagrid).datagrid("getSelected");
	if((index+1)) {
		row = null;
		$("#"+datagrid).datagrid("selectRow",index);
		row = $("#"+datagrid).datagrid("getData").rows[index];
	}
	if(row){
		$.getJSON("<%=path%>/employee/queryEmp?empId="+row.empId,function(data) {
			var employee = data.employee;
			 var jsonStr1 = jsonStr.
			 replace("_empId",employee.empId).
			 replace("_depId", employee.department.depId). 
			 replace("_roleId",employee.role.roleId).
			 replace("_name", employee.name).
			 replace("_contactName",employee.contactName).
			 replace("_contactPhone",employee.contactPhone).
			 replace("_bankName",employee.bankName).
			 replace("_accountName",employee.accountName).
			 replace("_accountNo",employee.accountNo).
			 replace("_alipay",employee.alipay).
			 replace("_status",employee.status)
			 ; 
		$("#"+edit_form).form("load",JSON.parse(jsonStr1));
		})
		$("#"+edit_win).window("open");
	}else {
		if(!(index+1)) {
			$.messager.alert("提示","请选择要修改的商品","info");
		}
	} 
}
	

	function selectBox(url,idd) {
		$.get(url,function(data){
			$("#"+idd).combobox({
				data:data.roles,
				textField:"value",
				valueField:"key"
			})
		},"json")
	}
	
	function queryMsg(value,row,index){
		var query = "<a href='javascript:;' onclick='showAll("+index+ ")'>查看详情</a>";
		return query;
	}
	function qAEdit(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var edit= "";
		if(row.status == 0){
			var del = "<p style='color:#666'>已离职</p>";
		}else {
			var del = "<a href='havascript:;' onclick ='updStatus(" + index + ")' style='color:red'>辞退</a>";
			edit = "<a href='javascript:;' onclick= 'showEdit(" +index + ")' style='color:green'>修改 </a>";
		}
		return   del +edit  ;
	}
	
	function queryEmps() {
			$("#datagrid").datagrid({
				queryParams: {
					empName: $('#names').val(),
					beginDate:$('#beginDate').datebox('getValue'),
					endDate:$('#endDate').datebox('getValue'),
					status:$('#hasPass').val(),
					depId:$("#depId").val()
				}
			})
	}
	
	function showAll(index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		$.get("<%=path%>/employee/queryEmp",{
			empId:row.empId
		},function(data){
			var status = '';
			var married='';
			var employee = data.employee;
			if(employee.status=='1') {				status = "在职"			}else {				status = "离职"			}
			if(employee.married=='1'){married='已婚'}else {married="未婚"}
			 var jsonStr1 = jsonStr.
			 replace("_birthday", employee.birthday).
			 replace("_depName", employee.department.name). 
			 replace("_email", employee.email).
			 replace("_gender", employee.gender).
			 replace("_hireDay", employee.hireDay).
			 replace("_name", employee.name).
			 replace("_nation", employee.nation).
			 replace("_resignDay", employee.resignDay).
			 replace("_status", status).
			 replace("_empId",employee.empId).
			 replace("_pwd",employee.pwd).
			 replace("_idCard",employee.idCard).
			 replace("_fingerNo",employee.fingerNo).
			 replace("_phone",employee.phone).
			 replace("_qq",employee.qq).
			 replace("_weChat",employee.weChat).
			 replace("_married",married).
			 replace("_contactName",employee.contactName).
			 replace("_contactPhone",employee.contactPhone).
			 replace("_college",employee.college).
			 replace("_major",employee.major).
			 replace("_eduBack",employee.eduBack).
			 replace("_bankName",employee.bankName).
			 replace("_accountName",employee.accountName).
			 replace("_accountNo",employee.accountNo).
			 replace("_alipay",employee.alipay).
			 replace("_accountNo",employee.accountNo).
			 replace("_hireDay",employee.hireDay).
			 replace("_resignDay",employee.resignDay).
			 replace("_status",employee.status).
			 replace("_roleName",employee.role.name).
			 replace("_address",employee.address).
			 replace("_birthday",employee.birthday).
			 replace("_empHireDay",employee.hireDay)
			$("#msg").form("load",JSON.parse(jsonStr1));
		},"json")
		$("#show_win").window("open");
	}
	
	console.log($("#depId"))

</script>

<title>员工管理</title>
</head>
<body id = "body">
	<div id="successMsg" style="display:none" class= "message"></div>
	<table id="datagrid" class="easyui-datagrid" style="height:100%;width:100%" data-options="
			url:'employee/pager',
			method:'get',
			autoRowHeight:true,
			pagination:true,
			toolbar:'#toolbar',
			groupField:'depName',
			view:groupview,
			groupFormatter:function(value, rows){
				return value ;
		    }
		"
		>  
	    <thead>  
	        <tr>  
	            <th data-options="field:'empId',checkbox:true,width:80" ></th>  
	            <th data-options="field:'depId',width:80,hidden:true"></th>
	            <th data-options="field:'roleId',width:80,hidden:true"></th>
	            <th data-options="field:'name',align:'center',width:80" >姓名</th>  
	            <th data-options="field:'depName',align:'center',width:80">所在部门</th>
	            <th data-options="field:'roleName',align:'center',width:80">角色</th>
	            <th data-options="field:'nation',align:'center',width:80">籍贯</th>  
	            <th data-options="field:'gender',align:'center',width:80">性别</th>  
	            <th data-options="field:'birthday',align:'center',width:80">出生日期</th>  
	            <th data-options="field:'email',align:'center',width:80">邮箱</th>  
	            <th data-options="field:'hireDay',align:'center',width:80">入职时间</th>  
	            <th data-options="field:'resignDay',align:'center',width:80">离职时间</th>  
	            <th data-options="field:'status',align:'center',width:80" formatter="frostEdit">状态</th>
	            <th data-options="field:'msg',align:'center',width:80" formatter="queryMsg">详情</th>
	            <th data-options="field:'editde',align:'center',width:80" formatter="qAEdit">操作</tr>
	        </tr>  
	    </thead>  
	</table>  
	
	
	<!-- 其它工具 -->
	<div id="toolbar" style="padding:5px;height:auto;width:100%" >
		<div  style= "position:absolute;left:10px">
			<a href="javascript:;" class= "easyui-linkbutton" iconCls="icon-add" onclick="showAdd()" >添加</a>
			<a href="javascript:;" class= "easyui-linkbutton" iconCls="icon-edit" onclick="showEdit()">编辑</a>
		</div>
		<div align="right" >
				<div style="display:inline-block"> <s:select label = "所在部门" list = "departments" id="depId" /></div>
				<div style="display:inline-block">					员工名称:<input id="names" />				</div>
				<div style="display:inline-block">状态:<select id="hasPass">
					<option value="1" selected="selected">在职</option>
					<option value="0">离职</option></select></div>
			<br/>
			入职时间:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser">-
			<input id="endDate" class="easyui-datebox" name="endDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser">
			<a href="javascript:;" class= "easyui-linkbutton" onclick = "queryEmps()">查询</a>
			<br />
		</div>
	</div>
	
	<!-- 添改表 -->
		<!-- 加 -->
	<div id="add_win" class= "easyui-window" title="添加员工" data-options="iconCls:'icon-add',closed:true" style="width:300px;height:400px;padding:5px">
		<h2 style="font:'italic arial,sans-serif'">添加员工</h2>
		<form id="add_form" >
		<input name="employee.status" value="1" type="hidden" />
		
		<table>
			<tr><td>名字:</td><td><input name="employee.name" class="easyui-validatebox" data-options="required:true,validType:'length[2,4]',missingMessage:'请输入员工姓名'" /></td></tr>
			<tr><td>性别 :</td><td>	<select name="employee.gender"><option value="男">男</option><option value="女">女</option></select>
			</td></tr>
			<tr><td>身份证号 :</td><td> <input name="employee.idCard" class="easyui-validatebox" data-options="required:true,validType:'length[18,18]',missingMessage:'请输入身份证号',invalidMessage:'身份证号格式错误,请检查'"/></td></tr>
			<tr><td>邮箱 :</td><td><input name="employee.email" class="easyui-validatebox" data-options="required:true,validType:'email',missingMessage:'请输入邮箱',invalidMessage:'请输入正确格式的邮箱'" /></td></tr>
			<tr><td>手机: </td><td><input name="employee.phone"  class="easyui-validatebox" data-options="required:true,validType:'length[11,11]',missingMessage:'请输入手机号',invalidMessage:'请输入正确格式的手机号'" /></td></tr>
			<tr><td>指纹编号 :</td><td><input name="employee.fingerNo" /></td></tr>
 			<s:select label = "分配部门" list = "departments" name="employee.department.depId" />
			<tr><td>分配角色:</td><td><input class= "easyui-combobox" id = "roles1" name = "employee.role.roleId" /></td></tr>
			<tr><td>籍贯:</td><td><select id="province" name="province"></select>  
    			<select id="city" name="city"></select>  
    			<select id="area" name="area"></select>  </td></tr>	
    		<tr><td>住址:</td><td><input  name = "employee.address"  class="easyui-validatebox"  data-options="required:true,validType:'length[0,50]',missingMessage:'请输入居住地址'" /></td></tr>
 			<tr><td>出生日期:</td><td><input  class="easyui-datebox" name = "birthday" data-options="required:true,missingMessage:'请选择出生日期',formatter:myformatter,parser:myparser"></td></tr>
			<tr><td>开户行名称:</td><td><input class="easyui-validatebox"  name = "employee.bankName" data-options="required:true,validType:'length[0,25]',missingMessage:'请输入银行卡所在银行'" /></td></tr>
			<tr><td>银行卡帐号:</td><td><input class="easyui-validatebox"  name = "employee.accountNo" data-options="required:true,validType:'length[19,19]',missingMessage:'请输入银行卡号',invalidMessage:'请输入正确的银行卡'" /></td></tr>
			<tr><td>银行卡姓名:</td><td><input class="easyui-validatebox"  name = "employee.accountName" data-options="required:true,validType:'length[2,4]',missingMessage:'请输入持卡人姓名',invalidMessage:'请输入合法的用户姓名'" /></td></tr>
			<tr><td><a href="javascript:;" onclick="add('<%=path %>/employee/save')" class="easyui-linkbutton" >确认</a></td>
				<td><a href="javascript:;" onclick="closeSave()" class="easyui-linkbutton" >取消</a></td>
			</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">  
        addressInit('<%=path%>/json/address','province', 'city', 'area');  
    </script>
	<!-- 加表结束 -->
	
		<!-- 改 -->
	<div id="upd_win" class= "easyui-window" title="add" data-options="iconCls:'icon-add',closed:true" style="width:500px;height:400px;padding:5px">
		<form id="upd_form" >
			<input name="employee.empId" type="hidden"/> 
			<input name="employee.status" type="hidden"/> 
			<table>
				<tr><td>名字</td><td><input name="employee.name" disabled="disabled" style="background-color:#fff;border:0px" /></td></tr>
	 			<s:select label = "部门" list = "departments" name="employee.department.depId" />
				<tr><td>角色</td><td><input class= "easyui-combobox" id = "roles2"  name="employee.role.roleId" /></td></tr>
				<tr><td>联系人姓名</td><td><input   name="employee.contactName" /></td></tr>				 
				<tr><td>联系人手机号</td><td><input  name="employee.contactPhone" /></td></tr>				 
				<tr><td>开户行</td><td><input  name="employee.bankName" /></td></tr>				 
				<tr><td>银行卡帐号</td><td><input   name="employee.accountNo" /></td></tr>				 
				<tr><td>银行卡姓名</td><td><input   name="employee.accountName" /></td></tr>				 
				<tr><td>支付宝帐号</td><td><input  name="employee.alipay" /></td></tr>				 
				<tr>
					<td><a href="javascript:;" onclick="upd('<%=path %>/employee/update')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a></td>
					<td><a href="javascript:;" onclick="exitWin('upd_win')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 查看 -->
	<div id="show_win" class= "easyui-window"  data-options="iconCls:'icon-add',closed:true" >
		<form id="msg">
			<table>
				<tr><td>名字:</td><td><input name="employee.name" disabled="disabled" /></td><td>指纹编号: </td><td><input name="employee.fingerNo" disabled="disabled" style="bakcground-color:#fff,border:0px"/></td></tr>
				<tr><td>部门:</td><td><input name="employee.department.name" disabled="disabled" /></td><td>角色:</td><td><input name="employee.role.name" disabled="disabled"/></td></tr>
				<tr><td>性别: </td><td><input name="employee.gender" disabled="disabled"/></td><td>出生日期:</td><td><input  name = "employee.birthday" disabled="disabled"/></td></tr>
	 			<tr><td>QQ:</td><td><input name="employee.qq" disabled="disabled" /></td><td>微信:</td><td><input name="employee.weChat"  disabled="disabled"/><td></tr>
				<tr><td>手机号:</td><td><input name = "employee.phone" disabled="disabled"/></td><td>邮箱: </td><td><input name="employee.email" disabled="disabled"/></td></tr>
	 			<tr><td>籍贯</td><td><input name="employee.nation"   disabled="disabled"/></td><td>住址:</td><td><input name="employee.address"  disabled="disabled"/></td></tr>
	 			<tr><td>支付宝:</td><td><input name="employee.alipay" disabled="disabled"/></td></tr>
	 			<tr><td>开户行:</td><td><input name="employee.bankName"  disabled="disabled"/></td><td>银行卡帐号:</td><td><input name="employee.accountNo" disabled="disabled"/></td></tr>
	 			<tr><td>银行卡姓名:</td><td><input name="employee.accountName" disabled="disabled"/></td></tr>
	 			<tr><td>专业:</td><td><input name="employee.major" disabled="disabled"/></td></tr>
	 			<tr><td>学历:</td><td><input name="employee.eduBack" disabled="disabled"/></td><td>毕业学校:</td><td><input name="employee.college" disabled="disabled"/><td></tr>
	 			<tr><td>联系人姓名:</td><td><input name="employee.contactName" disabled="disabled"/></td><td>联系人手机:</td><td><input name="employee.contactPhone" disabled="disabled"/></td></tr>
	 			<tr><td>婚配:</td><td><input name="employee.married" disabled="disabled"/></td></tr>
	 			<tr><td>入职时间:</td><td><input name="employee.hireDay" disabled="disabled"/></td></tr>
				<tr><td>身份证号 </td><td> <input name="employee.idCard" disabled="disabled"/></td></tr>
	 			<tr><td>状态:</td><td><input name="employee.status" disabled="disabled"/></td></tr>
		  </table>
		</form>
	</div>
	<script type="text/javascript">
		selectBox("<%=path%>/employee/allRoles","roles1")
		selectBox("<%=path%>/employee/allRoles","roles2")
	</script>
	
	<!-- 改表结束 -->
</body>
</html>