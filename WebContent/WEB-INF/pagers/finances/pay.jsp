<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
		<!-- 郭玉清 -->
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/json2.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script>

	var jsonStr = '{"pi.payId":"_payid","pi.empName":"_empname","pi.payTypeName":"_paytypename","pi.payDay":"_payday","pi.des":"_des","pi.pay":"_pay","pi.toName":"_toname","pi.toPhone":"_tophone","pi.payTypeStatus":"_paytypestatus"}';
	
	var jsonStr2 = '{"pay.payId":"_payid","pay.empId":"_empid","pay.payTypeId":"_paytypeid","pay.payDay":"_payday","pay.des":"_des","pay.pay":"_pay","pay.toName":"_toname","pay.toPhone":"_tophone"}';

	$(function() {
		setPagination("list");
	});
	
	function addCloseWin() {
		$("#addwin").window("close");
	}
	function editCloseWin() {
		$("#editwin").window("close");
	}
	
	function addPayInfoWin() {//添加
		$("#addForm").form("clear");//刷新数据
		$("#addwin").window("open");
		
		//类型下拉菜单的级联查询
		$.get("<%=path%>/payType/type",
			function(data){
			$("#type").combobox("loadData", data.request);
		}, "json");
		
	}
	
	function addPayInfo() {//添加是否成功
		if($("#addForm").form("validate")) {
			$.post("<%=path %>/pay/save",
				$("#addForm").serialize(),
				function(data) {
					if(data.result.request == "success") {
						$("#addwin").window("close");//关闭指定的窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示", data.result.message, "info");
					} else if(data.result.request == "fail") {
						$.messager.alert("提示", data.result.message, "info");
					}
			}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}
	
	function editPayInfoWin() {//修改
 		$(this).textbox('readonly');//只读
		  $(this).textbox('disable');//不可编辑 		
		//类型下拉菜单的级联查询
		$.get("<%=path%>/payType/type",
			function(data){
			$("#types").combobox("loadData", data.request);
		}, "json");
		
		  
		// var row = $("#list").datagrid("getSelected");// 获取数据表格中被选中的行数据
		var rows = $("#list").datagrid("getSelections");
		if(rows.length > 1) {
			$.messager.alert("提示","请选择一个需要修改的支出类别", "info");
		} else if(rows.length == 1) {
			var row = rows[0];
			if(row) {// 有选中的行
				// var jsonStr3 = jsonStr.replace("_payid",row.payId).replace("_empname",row.empName).replace("_paytypename",row.payTypeName).replace("_payday",row.payDay).replace("_des",row.des).replace("_pay",row.pay).replace("_toname",row.toName).replace("_tophone",row.toPhone).replace("_paytypestatus",row.payTypeStatus);
				var jsonStr4 = jsonStr2.replace("_payid",row.payId).replace("_empid",row.empId).replace("_paytypeid",row.payTypeId).replace("_payday",row.payDay).replace("_des",row.des).replace("_pay",row.pay).replace("_toname",row.toName).replace("_tophone",row.toPhone);
				$("#editForm").form("load", JSON.parse(jsonStr4));
				$("#editwin").window("open");
			}
		} else if(rows.length == 0) {
			$.messager.alert("提示","请先选择需要修改的支出类别", "info");
		}
	}
	
	function editPayInfo() {//修改是否成功
		if($("#editForm").form("validate")) {
			$.post("<%=path %>/pay/update",
					$("#editForm").serialize(),
					function(data) {
						if(data.result.result == "success") {
							$("#editwin").window("close");//关闭指定的窗口
							$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							$.messager.alert("提示", data.result.message, "info");
						} else if(data.result.result == "fail") {
							$.messager.alert("提示", data.result.message, "info");
						}
				}, "json");
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}
	
	function doSearch(value,name){
		$("#list").datagrid({
			toolbar:'#tb',
			url:'<%=path %>/pay/query_name?'+name+'=' + value,
			collapsible:true,
			method:'get',
			singleSelect:false,
			fit:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:10,
			columns : [ [ {  
                field : 'payId',checkbox:true,  
                width : 80,  
                title : '支出编号'  
            }, {  
                field : 'empName',  
                width : 80,  
                title : '员工姓名'  
            }, {  
                field : 'payTypeName',  
                width : 80,  
                title : '支出类型'
            }, {  
                field : 'payDay', 
                width : 80,
                title : '支出时间',
            }, {  
                field : 'des', 
                width : 80,
                title : '描述',
            }, {  
                field : 'pay', 
                width : 80,
                title : '支出金额',
            }, {  
                field : 'toName', 
                width : 80,
                title : '收款人姓名',
            }, {  
                field : 'toPhone', 
                width : 80,
                title : '收款人号码',
            } ] ]
		});
	}
	
<%-- 	$(function(){
		$.get("<%=path%>/payType/pager",function(data){
			$("#combobox").combobox("loadData", data.combox);
		}, "json");
	}); --%>
	
<%-- 	$(function(){
		$.get("<%=path%>/emp/query_type",function(data){
			$("#empcombobox").combobox("loadData", data.cobox);
		}, "json");
	}); --%>
	
	function allRoles(idd) {
		$.get("<%=path%>/payType/pager",function(data){
			console.log(JSON.stringify(data.cobox))
			$(idd).combobox({
				data:data.cobox,
				textField:'id',
				valueField:'text',
				panelHeight:'auto'
			})
		},"json")
	}
	
	function selectEmployee(){  // 选择员工打开table表
		$.get("<%=path %>/employee/pager", function(data) {
			$("#list1").datagrid("loadData", data.rows);
		}, "json");
		$("#selectWin").window("open");
	}
	
	function submitEmployee(){ // 选择完员工
		var rows = $("#list1").datagrid("getSelections");
		if(rows.length  > 1 ){
			$.messager.alert("提示","请选择一个学生","info");
		}else if(rows.length == 1){
			var row = rows[0];
			if(row){
				$("#empId").val(row.empId);
				$("#empName").val(row.name);
				$("#selectWin").window("close");
				$("#selectGradeWin").window("close");
			}
		}else if(rows.length == 0){
			$.messager.alert("提示","请选择一个学生","info");
		}
	}
	
</script>
</head>
<body>
	<table id="list" class="easyui-datagrid" 
			data-options="toolbar:'#tb',
			url:'<%=path%>/pay/query_page',
			collapsible:true,
			method:'get',
			singleSelect:false,
			fit:true,<!-- 分页按钮是否显示固定在底部 -->
		 	fitColumns:true,<!-- 表格面积是否全部占满 -->
			rownumbers:true,<!-- 是否显示序列号 -->
			autoRowHeight:true,
			pagination:true,
			pageSize:10">
		<thead>
			<tr>
				<th data-options="field:'payId',checkbox:true,align:'center'">管理编号</th>
				<th data-options="field:'empName',align:'center'" width="80">员工姓名</th>
				<th data-options="field:'payTypeName',align:'center'" width="80">支出类型</th>
				<th data-options="field:'payDay',align:'center'" width="80">支出时间</th>
				<th data-options="field:'des',align:'center'" width="80">描述</th>
				<th data-options="field:'pay',align:'center'" width="80">支出金额</th>
				<th data-options="field:'toName',align:'center'" width="80">收款人姓名</th>
				<th data-options="field:'toPhone',align:'center'" width="80">收款人号码</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto;">
		<div style="margin-buttom:5px;">
			<a href="javascript:;" onclick="addPayInfoWin()" class="easyui-linkbutton" iconCls="icon-add">添加</a>
	<!-- <a href="javascript:;" onclick="editPayInfoWin()" class="easyui-linkbutton" iconCls="icon-edit">修改</a> -->
			<input id="search" class="easyui-searchbox" data-options="prompt:'搜索',menu:'#mm',searcher:doSearch" style="width:300px"></input>
			<div id="mm">
				<div data-options="name:'empName'">员工姓名</div>
				<div data-options="name:'payTypeName'">支出类型</div>
				<div data-options="name:'toName'">收款人姓名</div>
				<div data-options="name:'pay'">支出金额</div>
			</div>
		</div>
	</div>
	
	<div id="addwin" class="easyui-window" title="添加" data-options="closed:true" style="width:300px;height:380px;">
		<form id="addForm">
			<table>
				<tr><td><input type="hidden" id = "studentId" name = "roomInfo.stuId"/></td></tr>
				
				<tr><td><input type="hidden" id = "empId" name = "pi.empId"/></td></tr>
				<tr>
					<td>员工姓名: </td> 
					<td><input id="empName" class="easyui-validatebox textbox" name="pi.empName" data-options="required:true,
						method:'get',
						valueField:'id',
						textField:'text',
						panelHeight:'auto'"/> <a name="pi.empName" id="Employee" onclick = "selectEmployee()">选择</a> </td>
				</tr>	
				<tr>
					<td>支出类型</td>
					<td><input id="type" class="easyui-combobox" name="pay.payTypeId" data-options="required:true,
						valueField:'id',
						textField:'text',
						panelHeight:'auto',
						selected:'true' "/>
					</td>
				</tr>	
				<tr>
					<td>支出时间: </td>
					<td><input class="easyui-datetimebox" name="pay.payDay" data-options="multiline:true"></input></td>
				</tr>
				<tr>
					<td>描述: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.des" /></td>
				</tr>
				<tr>
					<td>支出金额: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.pay" /></td>
				</tr>
				<tr>
					<td>收款人姓名: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.toName" /></td>
				</tr>
				<tr>
					<td>收款人号码: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.toPhone" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="addPayInfo()" class="easyui-linkbutton" icon="icon-ok">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editwin" class="easyui-window" title="修改" data-options="closed:true" style="width:300px;height:380px;">
		<form id="editForm">
			<input type="hidden" name="pay.payId" />
			<input type="hidden" name="pay.payDay" />
			<table>
				<tr><!-- 部门下拉框 -->
					<td>部门:</td>
					<td><input id="depType" class="easyui-combobox" name="department.depId" data-options="required:true,
						valueField:'id',
						textField:'text',
						panelHeight:'auto',
						selected:'true' "/>
					</td>
				</tr>
				<tr><td><input type="hidden" id = "emp-Id" name = "pi.empId"/></td></tr>
				<tr>
					<td>员工姓名: </td>
					<td><input id="emp-Name" class="easyui-combobox" name="pi.empName" data-options="required:true,
						method:'get',
						valueField:'id',
						textField:'text',
						panelHeight:'auto'
					"/></td>
				</tr>				
				<tr>
					<td>支出类型</td>
					<td><input id="types" class="easyui-combobox" name="pay.payTypeId" data-options="required:true,
						valueField:'id',
						textField:'text',
						panelHeight:'auto',
						selected:'true' "/>
					</td>
				</tr>	
				<tr>
					<td>描述: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.des" /></td>
				</tr>
				<tr>
					<td>支出金额: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.pay" /></td>
				</tr>
				<tr>
					<td>收款人姓名: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.toName" /></td>
				</tr>
				<tr>
					<td>收款人号码: </td>
					<td><input class="easyui-validatebox easyui-textbox" name="pay.toPhone" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="editPayInfo()" class="easyui-linkbutton" icon="icon-ok">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="selectWin" class="easyui-window" title="选择员工" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:600px;height:350px;padding:5px;">
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
	            <th data-options="field:'empId',checkbox:true,width:80" ></th>  
	            <th data-options="field:'name',width:80" >姓名</th>  
	            <!-- <th data-options="field:'depId',width:80,hidden:true"></th>
	            <th data-options="field:'roleId',width:80,hidden:true"></th> -->
	            <th data-options="field:'depName',width:80">所在部门</th>
	            <th data-options="field:'roleName',width:80">角色</th>
	           <!--  <th data-options="field:'nation',width:80">籍贯</th>  --> 
	            <th data-options="field:'gender',width:80">性别</th>  
	            <!-- <th data-options="field:'birthday',width:80">出生日期</th>  
	            <th data-options="field:'email',width:80">邮箱</th>  
	            <th data-options="field:'hireDay',width:80">入职时间</th>  
	            <th data-options="field:'resignDay',width:80">离职时间</th>   -->
	        </tr>  
	    </thead>  
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
				<a href="javascript:;" onclick = "submitEmployee()"class="easyui-linkbutton" iconCls="icon-add" >选择</a>
				<a href="javascript:;" onclick = "closeGradeWin()" class="easyui-linkbutton" iconCls="icon-edit">取消</a>
		</div>
	</div>
	</div>
	
	<script type="text/javascript">allRoles("#combobox1");</script>
</body>
</html>




