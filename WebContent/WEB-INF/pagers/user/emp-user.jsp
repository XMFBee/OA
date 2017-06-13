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
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

<script >

	function showUpdateWin() {
		$("#pwdWin").form("clear"); // 清除表单里的所有数据
		$("#pwdWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	function clearForm(){ // 清除表单数据
		$('#pwdForm').form('clear'); // 清除表单的内容
	}
	
	function determine() { // 修改密码
		var ordPwd = $('#ordPwd').textbox('getValue');
		var newPwd = $('#newPwd').textbox('getValue');
		var detPwd = $('#detPwd').textbox('getValue');
		if ($("#pwdForm").form("validate")) {
			if (newPwd != detPwd) {
				$.messager.alert("提示", "您输入的两次密码不匹配", "error");
			} else {//更新密码提交的url
				$.post("<%=path %>/admin/updatePwd",
						$("#pwdForm").serialize(), // Form表单序列化
						function(data) {
							if (data.result.result == "success") { 
								$.messager.alert("提示", data.result.message, "info");
							} else if (data.result.result == "fail") {
								$.messager.alert("提示", data.result.message, "error");
							}
						}, "json");
			}
		} else {
			$.messager.alert("提示", "请正确输入表单数据", "error");
		}
	}
	
	
</script>

<style type="text/css">

	#emp-table input{
		border-radius:4px;
	}
</style>
<title>个人信息管理</title>
</head>
<body id = "body">	

		<div style="text-align: center; margin-left: 180px; margin-top: 40px;">
			<table id="emp-table">
			<tr><td>名字:</td><td><input name="employee.name"  class="easyui-textbox easyui-validatebox" /></td>
				<td>年龄 :</td><td> <input name="employee.idCard" class="easyui-textbox easyui-validatebox"  data-options="required:true,validType:'length[1,3]'"/></td>
			</tr>
			<tr>
					<td>性别:</td>
					<td>
					<input type = "radio"  name="employee.gender" value= "男" />男
					<input type = "radio"  name="employee.gender" value= "女"/>女
					</td>
					<td>婚姻状态:</td>
					<td>
					<input type = "radio"  name="employee.married" value= "已婚" />已婚
					<input type = "radio"  name="employee.married" value= "未婚"/>未婚
					</td>
			</tr>
			<tr>	<td>身份证号 :</td><td> <input name="employee.idCard"  class="easyui-textbox easyui-validatebox"  data-options="required:true,validType:'length[18,18]'"/></td>			
					<td>籍贯:</td><td><input name="province" readonly="true"/></td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>邮箱 :</td><td><input name="employee.email"  class="easyui-textbox easyui-validatebox" /></td>
			<td>手机: </td><td><input name="employee.phone"  class="easyui-textbox easyui-validatebox"  data-options="required:true,validType:'length[11,11]'"/></td>
			</tr>
			<tr>
			<td>微信: </td><td><input name="employee.wechar"  /></td>
			<td>QQ: </td><td><input name="employee.qq"  /></td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>联系人姓名: </td><td><input name="employee.contactname" /></td>
			<td>联系人手机号: </td><td><input name="employee.contactphone"  class="easyui-textbox easyui-validatebox"  data-options="required:true,validType:'length[11,11]'"/></td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>毕业学校: </td><td><input name="employee.college"  readonly="true"/></td>
			<td>所学专业: </td><td><input name="employee.major"  readonly="true"/></td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>学历: </td><td><input name="employee.eduback"  readonly="true"/></td>
 			<td>部门 :</td><td><input name="employee.department.depId" readonly="true"/></td>
			</tr>
 			<tr>
 			</tr>
			<tr>
			<td>角色:</td><td><input class= "easyui-textbobox" id = "roles1" name = "employee.role.roleId" readonly="true"/></td>
			<td>指纹编号 :</td><td><input name="employee.fingerNo"/></td>
			</tr>
			<tr>
			</tr>
    		<tr>
    		<td>住址:</td><td><input  name = "employee.address" /></td>
 			<td>出生日期:</td><td><input  class="easyui-datetimebox" name = "birthday" ></td>
    		</tr>
 			<tr>
 			</tr>
			<tr>
			<td>开户行名称:</td><td><input class="easyui-textbobox"  /></td>
			<td>银行卡帐号:</td><td><input class="easyui-textbox easyui-validatebox"  data-options="required:true,validType:'length[19,19]'"/></td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>银行卡姓名:</td><td><input  name = "employee.accountName"  class="easyui-textbox easyui-validatebox" /></td>
			<td>支付宝账号:</td><td><input  name = "employee.alipay"  class="easyui-textbox easyui-validatebox"  data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
			</tr>
			<tr>
			<td>入职时间:</td><td><input class="easyui-textbobox"  name = "employee.hireday"  readonly="true"/></td>
			<td>状态:</td><td><input class="easyui-textbobox"  name = "employee.status"  readonly="true"/></td>
			</tr>
			<tr>
			</tr>
			</table>
			<div style="margin-left: -310px; margin-top: 20px">
				<a href="javascript:;" onclick="" class="easyui-linkbutton" style="width: 50px;" >保存</a>
				<a href="javascript:;" onclick="showUpdateWin();" class="easyui-linkbutton" style="width: 80px;" >修改密码</a>
				<a href="javascript:;" onclick="" class="easyui-linkbutton" style="width: 50px;" >刷新</a>
			</div>
		</div>
		
		
			<!-- 修改密码窗口-->
	<div id="pwdWin" class="easyui-window" title="修改密码" data-options="closed:true" style="width:350px;height:200px;">
		<div style="padding:0px 60px 20px 0px">
		    <form id="pwdForm">
		    	<input type="hidden" id="empId" name="empId" value="${session.emp.empId }" />
		    	<table style="margin-top: 15px; margin-left: 40px;">
		    		<tr>
		    			<td>旧密码:</td>
		    			<td>
		    				<input class="easyui-textbox easyui-validatebox" type="password" id="ordPwd" name="ordPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="请输入旧密码"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>新密码:</td>
		    			<td>
		    				<input class="easyui-textbox easyui-validatebox" type="password" id="newPwd" name="newPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="请输入新密码"></input>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>确认密码:</td>
		    			<td>
		    				<input class="easyui-textbox easyui-validatebox" type="password" id="detPwd" name="detPwd" data-options="required:true, validType:'length[6, 20]'" placeholder="确认密码"></input>
		    			</td>
		    		</tr>
		    	</table>
		    </form>
		    <div style="margin-left: 60px; padding:5px; text-align: center;">
		    	<a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="determine();">确定</a>
		    	<a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		    </div>
		</div>
	</div>

		
</body>
</html>