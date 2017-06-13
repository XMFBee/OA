<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理申诉</title>

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<style>
	.show{
		display:inline-block;
	}
	.none{
		display:none;
	}
</style>
<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';



	function queryByWhe(){//正在测试部门查询
		$("#datagrid").datagrid({
			queryParams: {
				hasPass: $('#hasPass').val(),
				pass:$('#pass').val(),
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empId:$('#empIds').combobox('getValue')
			}
		})
	}
	
	
	function updatePass(index,pass,level){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		var appealId = row.appealId;
		console.log(pass)
		$.post("<%=path%>/empAppeal/update",{
			appealId:appealId,
			pass:pass,
			level:level
		},function(data){
			$("#datagrid").datagrid("reload");
		})
	}
	
	
	/* 
	* ceshi*/
	function doLeave(value,row,index) {
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		if(row.pass==0) {
			var but1 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick='updatePass("+index+",2,1)'>第一级通过</a>";
			var but2 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick = 'updatePass("+index+",2,2)' >第二级通过</a>";
			var but3 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick = 'updatePass("+index+",1,1)' >第一级不通过</a>";
			var but4 = "<a href='javascript:;' class= 'easyui-linkbutton' onclick = 'updatePass("+index+",1,2)' >第二级不通过</a>";
			return but1+but2+but3+but4;
		}else {
			if(row.pass==1){
				return "未通过" 
			}else {
				return "已通过"
			}
		}
	}

	function updatePass1(index,pass,level){
		var row = $("#"+datagrid).datagrid("getData").rows[index];
		console.log(pass);
		if(level==1){
			$.post("<%=path%>/empAppeal/update",{
				firstlevel:1,
				appealId:row.appealId,
				pass:pass
			},function(){
				$("#"+datagrid).datagrid("reload");
			})
		}else {
			$.post("<%=path%>/empAppeal/update",{
				secondlevel:1,
				appealId:row.appealId,
				pass:pass
			},function(){
				$("#"+datagrid).datagrid("reload");
			})
		}
	}
	
	selectEmps("empIds","<%=path%>");
</script>


</head>
<body>
	<table id="datagrid" class="easyui-datagrid" style="width:100%;height:100%"
			data-options="
			url:'<%=path %>/empAppeal/pager',
			autoRowHeight:true,
			method:'get',
			toolbar:'#toolbar',
			nowrap:false 
			">
			<thead>
				<tr>
					<th data-options="field:'empId',hidden:true"/>
					<th data-options="field:'depId',hidden:true"/>
					<th data-options="field:'appealId',hidden:true"/>
					<th data-options="field:'empName',width:80">员工姓名</th>
					<th data-options="field:'depName',width:80">部门名称</th>
					<th data-options="field:'appealDay',width:100">提交时间</th>
					<th data-options="field:'des',width:80,align:'right'">申诉描述</th>
					<th data-options="field:'secondLeave',width:250" formatter="leaveFormat">审核进度</th>
					<th data-options="field:'pass',width:60,align:'center'"	formatter="statuFormat" >审核状态</th>
					<th data-options="field:'aaa',width:60,align:'center'" formatter='doLeave'>操作</th>
				</tr>
			</thead>
		</table>
		<div id = "toolbar" align="right">
			<form id="wheQuery">
				<!-- <div style="display:inline-block">部门id:<input name="depId" id="depId" value=""/></div>
			 -->
				<div style="display:inline-block" id="hasPassDiv">审核状态:<select id="hasPass" name = "hasPass"> 
					<option value="0">未审核</option>
					<option value="1">已经审核</option>
				</select></div>
				<div class= "none" id="passdiv"><select id="pass" name = "pass"> 
					<option value="2">同意</option>
					<option value="1">不同意</option>
				</select></div>
				<div style="display:inline-block"><input id="empIds" name="empId" class= "easyui-combobox"  data-options="
					valueField: 'key',
					textField: 'value'" />
				</div>
				<div style="display:inline-block">开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
				结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
				</div>
				<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe()">提交</a> 
			</form>
		</div>
		<script type="text/javascript">
			$("#hasPassDiv").change(function () {
				 if($("#hasPassDiv option:selected").val()==1){
					 $("#passdiv").addClass("show").removeClass("none");
				 }else {
					 $("#passdiv").addClass("none").removeClass("show");
				 }
	 		});
		</script>
</body>
</html>