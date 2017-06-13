<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
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

<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';
jsonStr = '{"dutyInfo.empId1":"_empId1","dutyInfo.empId2":"_empId2","dutyInfo.empId3":"_empId3","dutyInfo.empId4":"_empId4","dutyInfo.empId5":"_empId5","dutyInfo.empId6":"_empId6","dutyInfo.empId7":"_empId7","dutyInfo.empId8":"_empId8","dutyInfo.dutyId":"_dutyId","dutyInfo.weekday":"_weekday"}';

	function edit(value,row,index) {
		var edit= "<a href='javascript:;' onclick= 'showEdit(" +index + ")'>修改 </a>";
		return edit;
	}
	
	function showEdit(index){
		var row = $("#"+datagrid).datagrid("getSelected");
		if((index+1)) {
			row = null;
			$("#"+datagrid).datagrid("selectRow",index);
			row = $("#"+datagrid).datagrid("getData").rows[index];
		}
		var jsonStr1 = jsonStr.
		replace("_empId1", row.empId1).
		replace("_empId2", row.empId2).
		replace("_empId3", row.empId3).
		replace("_empId4", row.empId4).
		replace("_empId5", row.empId5).
		replace("_empId6", row.empId6).
		replace("_empId7", row.empId7).
		replace("_empId8", row.empId8).
		replace("_weekday",row.weekday).
		replace("_dutyId", row.dutyId);
		if(row){
			$("#"+edit_form).form("load",JSON.parse(jsonStr1));
			console.log($("#"+edit_form))
			$("#"+edit_win).window("open");
		}else {
			if(!(index+1)) {
				$.messager.alert("提示","请选择要修改的商品","info");
			}
		}
		
	}
			

	function dat(value,row,index) {
		if(value == "1") {
			return "星期一"
		}if(value == "2") {
			return "星期二"
		}if(value == "3") {
			return "星期三"
		}if(value == "4") {
			return "星期四"
		}if(value == "5") {
			return "星期五"
		}if(value == "6") {
			return "星期六"
		}if(value == "7") {
			return "星期天"
		}
			
	}
	/* 添加地址相关开始 */
	function addAddress() {
		$("#dd").dialog("open");
	}

	function showdel() {
		$("#del").dialog("open");
	}
	
	function delAdd(){
		$.post('duty/updAdd',$('#updAdd').serialize(),function(data){	
			window.location.reload();  
		})
	}
	
	function updC() {
		$.post('duty/saveAdd',$('#addadd').serialize(),function(data){	
			window.location.reload();  
		})
	}
	
	function exitC() {
		$("#dd").dialog("close");
	}
	/* 添加地址相关结束 */
</script>

<title>值班</title>
</head>
<body>

<s:debug></s:debug>
<table id="datagrid" class="easyui-datagrid" data-options="
		url:'duty/allDuty',
		method:'get',
		autoRowHeight:true,
		toolbar:'#toolbar'
	"
	> 
    <thead>  
        <tr>  
            <th data-options="field:'dutyId',hidden:true" ></th> 
            <th data-options="field:'weekday',width:80"  format="dat">日期</th> 
            <s:iterator value = "address" status="c">
		  		 <th data-options="width:80,formatter:function(value,row,index){
		  		 	return row.emp<s:property value='#c.getCount()'/>.name;
		  		 }"  field='empName<s:property value="#c.getCount()"/>'><s:property /></th> 
		 	</s:iterator> 
            <th data-options="field:'edit',width:80" formatter="edit" >修改</th>
        </tr>  
    </thead>  
	</table> 
	
	<!-- 修改页面 -->
	  
	 <div id="upd_win" class= "easyui-window" title="修改巡查人员" data-options="iconCls:'icon-edit',closed:true" style="width:300px;height:400px;padding:5px">
		<form id="upd_form" >
				<input id="dutyId" name="dutyInfo.dutyId" type="hidden">
			<table>
				<tr><td>日期:</td><td><input name="dutyInfo.weekday" disabled="disabled"></td></tr>
				<s:iterator value = "address" var ="v" status="d">
					<tr><td><s:property /></td><td>
					<input id="emps<s:property value='#d.getCount()'/>"  class= "easyui-combobox" name = "dutyInfo.empId<s:property value='#d.getCount()'/>"/>
					</td></tr>
				</s:iterator>
				<tr>
					<td rowspan="2" ><a href="javascript:;" onclick="upd('<%=path %>/duty/update')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	  	function empCombo() {
	  		$.get("duty/hemps",function(data) {
	  			var o = JSON.stringify(data.employees);
	  			$("#emps1").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps2").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps3").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps4").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps5").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps6").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps7").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  			$("#emps8").combobox({	data:data.employees,textField:"value",	valueField:"key"})
	  		},"json")
	  	}
	  	empCombo();
	  </script>
	  
	<!-- 工具 -->
	
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<input id="seach" >
				<a href="javascript:;" onclick = "doquery('seach')">查询</a>
				<s:if test="address.size<8">
					<a href="javascript:;" onclick = "showAdd()" class = "easyui-linkbutton">添加值班地址</a>
				</s:if>
				<a href="javascript:;" onclick = "showdel()" class = "easyui-linkbutton">删除值班地址</a>
		</div>
	</div>
	
	<!-- 弹出地址添加 -->
	<s:if test="address.size<8">
		<div id="add_win" class="easyui-window" title="添加地址" style="width:250px;height:auto;"
	   		data-options="iconCls:'icon-save',resizable:true,modal:true ,closed: true">
				<table>
					<tr><td>地址 :</td><td><input id="addadd" name="addadd"/></td></tr>
					<tr><td  align="center"><a href="javascript:;" class= "easyui-linkbutton" onclick = "updC()" >添加</a></td><td><a href="javascript:;" class= "easyui-linkbutton" onclick = "exitC()" >取消</a></td></tr>
				</table>
		</div>
	</s:if>
	
	
	<!-- 弹出地址删除 -->
	<div id = "del" class= 'easyui-window '  style="width:250px;height:auto;" title="删除地址"  data-options="iconCls:'icon-save',resizable:true,modal:true ,closed: true">
		<form id="updAdd">
			<s:select list="address" label="旧地址"  name="oldadd"></s:select>
			<tr>新地址:<td></td><td><input name = "newadd"  /></td></tr>
			<a href="javascript:;" onclick = "delAdd()"  class= "easyui-linkbutton">删除</a>
		</form>
	</div>
	
</body>
</html>