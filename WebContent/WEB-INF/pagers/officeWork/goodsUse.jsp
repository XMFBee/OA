<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户领取与归还</title>
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
jsonStr = '{"department.depId":"_id","department.name":"_name","department.des":"_des","department.status":"_status","department.employee.empId":"_empId","department.employee.name":"_empName"}';

function returnStatus(value,row,index) {
	var row = $("#datagrid").datagrid("getData").rows[index];
	if(row.returnDay!=null) {
		return dateFor(row.returnDay);
	}
	var row = $("#datagrid").datagrid("getData").rows[index];
	var a ="<a onclick = 'returnGoods("+index+")' style='padding:3px;border:1px solid #666; background-color:#ddd' >归还</a>";
	return a;
}

function select(value,row,index){
	var a = '<a style="margin:3px;border:1px solid #666; background-color:#ccc" onclick = "doSelect('+index+')" >选择</a>';
	return a;
}
function showSelectGoods(){
	$("#goods_win").window("open");
}
function doSelect(index) {
	var row = $("#datagrid").datagrid("getData").rows[index];
	var num = row.goods.quantity;
	var goodsId = row.goods.goodsId;
	var goodsName = row.goods.name;
	$("#goodsId").val(goodsId);
	$("#goodsName").val(goodsName);
	$("#num").val(num);
	$("#goods_win").window("close");
}


function returnGoods(index){
	var row = $("#datagrid").datagrid("getData").rows[index];
	$.post("<%=path%>/goodsUse/update",{
		"goodsUse.useId":row.useId,
		"goodsUse.goods.goodsId":row.goods.goodsId,
		"goodsUse.quantity":row.quantity
	},function(data) {
		$("#datagrid").datagrid("reload");
	})
}

</script>

</head>
<body id="body">
	<table id="datagrid" class="easyui-datagrid" style="height:100%"  data-options="
		url:'goodsUse/pager',
		method:'get',
		autoRowHeight:true,
		pagination:true,
		toolbar:'#toolbar'
	"
	>  
    <thead>  
        <tr>  
        	<th data-options="field:'useId',hidden:true,width:80" ></th> 
            <th data-options="field:'employee.department',width:80,
            	formatter:function(value,row,index){return row.employee.department.name  }">部门名称</th>
            <th data-options = "field:'empname',width:80,formatter:function(value,row,index){return row.employee.name  }" >员工名称</th>
            <th data-options="field:'goodsname',width:80,formatter:function(value,row,index){return row.goods.name }" >物品名称</th>
            <th data-options="field:'quantity',width:80" >物品数据</th>
            <th data-options="field:'useDay',width:80" formatter="dateFormat">信用时间</th>
            <th data-options="field:'eReturnDay',width:80" formatter="dateFormat">预计归还时间</th>
            <th data-options="field:'returnStatus',width:80" formatter="returnStatus">操作</th>
        </tr>  
    </thead>  
	</table>  
	
	<!-- 其它工具 -->
	<div id="toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:;" class= "easyui-linkbutton" iconCls="icon-add" onclick="showAdd()" >添加</a>
		</div>
	</div>
	
	<!-- 添改表 -->
		<!-- 加 -->
	<div id="add_win" class= "easyui-window" title="添加部门" data-options="iconCls:'icon-add',closed:true" style="width:300px;height:400px;padding:5px">
		<form id="add_form" >
				<input id="num" type="hidden" />
				<input name="goodsUse.goods.goodsId" value="1" type="hidden" id = "goodsId"/>
				<input name="goodsUse.employee.empId" value="1" type="hidden" />
			<table>
				<tr><td><a class= "easyui-linkbutton" onclick = "showSelectGoods()">选择物品</a></td><td><input id="goodsName" name = "goodsUse.goods.name" /></td></tr>
				<tr><td>数量:</td><td><input name = "goodsUse.quantity"  /></td>
				<tr><td>预计归还时间:</td><td><input id="endDate"class="easyui-datebox" name="ereturnday"  data-options="validType:'date', required:true,missingMessage:'请选择预计归还时间',invalidMessage:'日期格式出错,请选择正确的格式',  formatter:myformatter,parser:myparser" /></td></tr>
				<tr><td>归还时间:</td><td><input id="beginDate" class="easyui-datebox" name="useday"  data-options="validType:'date', required:true,missingMessage:'请选择归还时间',invalidMessage:'日期格式出错,请选择正确的格式', formatter:myformatter,parser:myparser" /></td></tr>
				<tr><td><a href="javascript:;" onclick="add('<%=path %>/goodsUse/save')" class="easyui-linkbutton" data-options="iconCls:'icon-add'" >确认</a></td><td><a class= "easyui-linkbutton" >取消</a></td></tr>
			</table>
		</form>
	</div>
	<div id = "goods_win" class= "easyui-window" title="物品选择" data-options="closed:true" style="width:500px;height:400px;padding:5px">
		<table  class="easyui-datagrid" style="height:100%"  data-options="
			url:'<%=path %>/goods/queryAll',
			method:'get',
			autoRowHeight:true,
			pagination:true
		">  
			<thead>  
	        	<tr>  
				  <th data-options = "field:'goodsId',width:80,hidden:true" ></th>
		          <th data-options="field:'name',width:80" >物品名称</th>
		          <th data-options="field:'quantity',width:80" >剩余数量</th>
		          <th data-options="field:'des',width:80" >物品描述</th>
		          <th data-options="field:'manage',width:80" formatter="select">操作</th>
			  	</tr>
			</thead>
		</table>
	</div>
</body>
</html>