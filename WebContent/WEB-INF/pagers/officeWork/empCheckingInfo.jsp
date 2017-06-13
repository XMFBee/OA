<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
    <% String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/default/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/officework.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/datagrid-groupview.js"></script>

<script type="text/javascript">
edit_win = 'upd_win';
edit_form = 'upd_form';
add_win = 'add_win';
add_form = 'add_form';
datagrid ='datagrid';
empsDatagrid ='empsDatagrid';

function timeFormate1(value,row,index){
	var row = $("#"+datagrid).datagrid("getData").rows[index];
	var re = /\d{1,2}:\d{1,2}:\d{1,2}/;
	var result = "";
	if(row.time1!=''&&row.time1!=null){
		result += row.time1.match(re);
	}else{		result +="未打卡"}
	result+=" \n\r ";
	if(row.time2!=''&&row.time2!=null){
		result += row.time2.match(re);
	}else{		result +="未打卡"	} 
	return result;
	
}
function timeFormate2(value,row,index){
	var row = $("#"+datagrid).datagrid("getData").rows[index];
	var re = /\d{1,2}:\d{1,2}:\d{1,2}/;
	var result = "";
	if(row.time3!=''&&row.time3!=null){
		result += row.time3.match(re);
	}else{		result +="未打卡"}
	result+=" \n\r ";
	if(row.time4!=''&&row.time4!=null){
		result += row.time4.match(re);
	}else{		result +="未打卡"	}
	return result;
}
function timeFormate3(value,row,index){
	var row = $("#"+datagrid).datagrid("getData").rows[index];
	var re = /\d{1,2}:\d{1,2}:\d{1,2}/;
	var result = "";
	if(row.time5!=''&&row.time5!=null){
		result += row.time5.match(re);
	}else{		result +="未打卡"}
	result+=" \n\r ";
	if(row.time6!=''&&row.time6!=null){
		result += row.time6.match(re);
	}else{		result +="未打卡"	}
	return result;
}
function timeFormate4(value,row,index){
	var row = $("#"+datagrid).datagrid("getData").rows[index];
	var re = /\d{1,2}:\d{1,2}:\d{1,2}/;
	var result = "";
	if(row.time7!=''&&row.time7!=null){
		result += row.time7.match(re);
	}else{		result +="未打卡"}
	result+=" \n\r ";
	if(row.time8!=''&&row.time8!=null){
		result += row.time8.match(re);
	}else{		result +="未打卡"	}
	return result;
}

function queryByCheck(){
	$("#datagrid").datagrid({
		queryParams: {
			beginDate:$('#beginDate').datebox('getValue'),
			endDate:$('#endDate').datebox('getValue'),
			name:$('#"empName"').val()
		}
	})
}

function outExcel(){
	var rows = $("#datagrid").datagrid("getRows");
	var len = rows.length;
	var checkingIds = "";
	  /* var elemIFrame = document.createElement("iframe"); */     
	  for(var i = 0;i<len;i++) {
			if(i==0){
				checkingIds  += rows[i].empCheckingId;
			}else {
				checkingIds += "," + rows[i].empCheckingId;
			}
	  }
	  console.log(checkingIds)
	  var url = "<%=path%>/excel/excelOut?fileName=abc.xls&checkingIds=" + checkingIds;
	  document.getElementById("download").src=url;
	  
	}

</script>

<title>员工考勤详情</title>
</head>
<body>
	 <table id="datagrid" class="easyui-datagrid" style="height:100%" data-options="
			url:'empChecking/pagerInfo',
			method:'get',
			pagination:true,
			autoRowHeight:true,
			toolbar:'#toolbar',
			nowrap:false,
			groupField:'checkingDay',
			view:groupview,
			groupFormatter:function(value, rows){
				return dateFor(value) ;
			}"
			>  
	    <thead>  
	        <tr>  
	            <th data-options="field:'empCheckingId',hidden:true,width:80" ></th> 
	            <th data-options="field:'empId',hidden:true,width:80" ></th> 
	            <th data-options ="field:'depId',width:80,hidden:true" ></th>
	            <th data-options="field:'checkingDay',width:150" formatter="dateFormat" sortable="true" >打卡日期</th>
	            <th data-options="field:'empName',width:80" >员工姓名</th> 
	            <th data-options="field:'depName',width:80">所在部门</th>
	            <s:iterator value="checks" status="s">
	            	<s:if test="#s.getCount()/2==1">
		            	<th field="time<s:property value='#s.getCount()*2-1'/>" width="60" formatter="timeFormate<s:property value='#s.getCount()'/>"><s:property value='#s.getCount()'/></th>
	            	</s:if>
				</s:iterator>
	        </tr>  
	    </thead>  
	</table>
	<script type="text/javascript">
		selectEmps("empIds","<%=path%>");
	</script>
	
	<div id= "toolbar" >
		<div align="left" style= "position:absolute;left:10px">
			<a class= "easyui-linkbutton" onclick="outExcel()" >导出至Excel</a>
			<a class= "easyui-linkbutton" onclick = "showUpload()">导入数据</a>
		</div>
		<div align="right">
			员工姓名:<input id="empName" name="name" />
			打卡日期:<input id="beginDate" class="easyui-datebox" name="beginDate"  data-options="validType:'date' ,formatter:myformatter,parser:myparser"></input>
			-<input id="endDate"class="easyui-datebox" name="endDate"  data-options="validType:'date' , formatter:myformatter,parser:myparser"></input>
			<a class= "easyui-linkbutton" onclick = "queryByCheck()" >查询</a>
		</div>
	</div>	
	
	<div id="upload_win" class= "easyui-window" title="文件上传" style="width:400px;height:160px;padding:2px;" closed="true">
		<form id="importFileForm" method="post" enctype="multipart/form-data">
			<table style="margin:5px;height:70px">
				<tr>
					<td style="margin-right:5px">请选择文件</td>
					<td><input type="file" id = "fileImport" name = "file" style="width:260px"></td>
				</tr>
				<tr>
					<td colspan = "2"><label id = "fileName" /></td>
				</tr>
				<tr>
					<td colspan="2"><label id="uploadInfo" /></td>
				</tr>
			</table>
			<div style="text-align:center;clear:both;margin:5px;">
				<a id="uploadFile" class= "easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick = "importFileClick('<%=path %>/excel/excelIn')" href="javascript:;">上传 </a>
				<a id="uploadFile" class= "easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick = "closeUpload()" href="javascript:;">关闭</a>
			</div>
		</form>
	</div>
	<iframe id="download" name="download" height="0px" width="0px"></iframe>
</body>
</html>