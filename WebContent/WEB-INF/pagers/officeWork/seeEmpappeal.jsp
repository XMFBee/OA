<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自己的申诉</title>

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
datagrid ='datagrid1';
empsDatagrid ='empsDatagrid';

	function queryByWhe1(){//正在测试id
		$("#datagrid1").datagrid({
			queryParams: {
				hasPass: $('#hasPass').val(),
				pass:$('#pass').val(),
				beginDate:$('#beginDate').datebox('getValue'),
				endDate:$('#endDate').datebox('getValue'),
				empId:$('#empId').val()
			}
		})
	}
	
    function setDivCenter(add_win){   
    	$("#"+add_win).window("open");
        var top = ($(window).height() - $("#"+add_win).height())/2;   
        var left = ($(window).width() - $("#"+add_win).width())/2;   
        var scrollTop = $(document).scrollTop();   
        var scrollLeft = $(document).scrollLeft();   
        $("#"+add_win).css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } ).show();  
    }  
	
</script>

</head>
<body>
<table id="datagrid1" class="easyui-datagrid" style="width:100%;height:100%"
			data-options="
			queryParams: {
				empId:1
			},
			url:'<%=path %>/empAppeal/pager',
			autoRowHeight:true,
			method:'get',
			toolbar:'#toolbar1'
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
<!-- 					<th data-options="field:'firstLeave',width:80,align:'right'" formatter="statuFormat">一级审核</th>
					<th data-options="field:'secondLeave',width:250" formatter="statuFormat">二级审核</th> -->
						<th data-options="field:'secondLeave',width:250" formatter="leaveFormat">审核进度</th>
					<th data-options="field:'pass',width:60,align:'center'"	formatter="statuFormat" >审核状态</th>
				</tr>
			</thead>
		</table>
		<div id = "toolbar1" style="width:100%"><!-- 这是自己的,也就是以id查 -->
			<div align="left">
				<a class= "easyui-linkbutton" href="javascript:;" onclick = "showAdd()">我要申诉</a>
			</div>
			<div align="right">
				<form id="wheQuery">
					empId:
	    			<input id="empId" type="text" name="empleave.employee.empId" data-options="required:true"></input>
					<select id="hasPass" name = "pass"> 
						<option value="" selected="selected"></option>
						<option value="1">已经审核</option><!-- pass为1 -->
						<option value="0">未审核</option><!-- pass为0 -->
					</select>
					<select id="pass" name = "pass"> 
						<option value="" selected="selected"></option>
						<option value="2">通过</option><!-- pass为2 -->
						<option value="1">未通过</option><!-- pass为1 -->
					</select>
					开始日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
					结束日期:<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
					<a class= "easyui-linkbutton" href="javascript:;" onclick = "queryByWhe1()">提交</a> 
				</form>
			</div>
		</div>	
		
		<!-- addWin -->
		<div id="add_win" class= "easyui-window" title="add" data-options="iconCls:'icon-add',closed:true">
			<form id="add_form" >
				<h2>考勤申诉:</h2>
				<textarea name="empappeal.des" data-options="required:true,validType:'length[3,500]',missingMessage:'请填写申诉请求',invalidMessage:'申诉请求字数就限制在3-500字符以内'"></textarea>
				<a href="javascript:;" onclick="add('<%=path %>/empAppeal/save')" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" >提交申诉</a>
			</form>
		</div>	
</body>
</html>