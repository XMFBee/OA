var jsonStr = '{"gts.goodsTypeId":"_id","gts.name":"_name","gts.des":"_des","gts.status":"_status"}';

$(function() {
	setPagination("list");
});

function showAddGoodsTypeWin() {
	$("#addForm").form("clear"); // 清除表单里的所有数据
	$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
}

function addGoodsType() {
	if ($("#addForm").form("validate")) {
		$.post("goodsType/save", $("#addForm").serialize(),
		function(data) {
			if (data.regt.request == "success") {
				$("#addWin").window("close"); // 关闭指定的窗口
				$("#list").datagrid("reload"); // 重新加载指定数据网格数据
				$.messager.alert("提示", data.regt.message, "info");
			} else if (data.regt.request == "fail") {
				$.messager.alert("提示", data.regt.message, "info");
			}
		}, "json");
	} else {
		$.messager.alert("提示", "请输入正确的数据", "info");
	}
}

function showEditGoodsTypeWin() {
	// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
	var rows = $("#list").datagrid("getSelections");
	if (rows.length > 1) {
		$.messager.alert("提示", "请先选择一个需要修改的物品类型", "info");
	} else if (rows.length == 1) {
		var row = rows[0];
		if (row) { // 有选中的行
			var jsonStr1 = jsonStr.replace("_id", row.goodsTypeId).replace(
					"_name", row.name).replace("_des", row.des).replace(
					"_status", row.status);
			$("#editForm").form("load", JSON.parse(jsonStr1));
			$("#editWin").window("open");
		}
	} else if (rows.length == 0) {
		$.messager.alert("提示", "请先选择一个需要修改的物品类型", "info");
	}
}

function showEditGoodsTypeWin1(index) {
	var row = $('#list').datagrid('getData').rows[index];
	if (row) { // 有选中的行
		var jsonStr1 = jsonStr.replace("_id", row.goodsTypeId).
			replace("_name",row.name).replace("_des", row.des).
			replace("_status",row.status);
		$("#editForm").form("load", JSON.parse(jsonStr1));
		$("#editWin").window("open");
	} else {
		$.messager.alert("提示", "请选择一个进行修改", "info");
	}
}

function editGoodsType(index) {
	if ($("#editForm").form("validate")) {
		$.post("goodsType/update", $("#editForm").serialize(),
				function(data) {
					if (data.regt.request == "success") {
						$("#editWin").window("close"); // 关闭指定的窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示", data.regt.message, "info");
					} else if (data.regt.request == "fail") {
						$.messager.alert("提示", data.regt.message, "info");
					}
				}, "json");
	} else {
		$.messager.alert("提示", "请输入正确的表单数据", "info");
	}
}

function disable(index){   //冻结
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("goodsType/gtDisable?gtId=" + row.goodsTypeId,
			$("#editForm").serialize(),
			function(data){
				$('#list').datagrid('reload');
		},"json");
	}
}
	
function activate(index){  // 激活
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("goodsType/gtActivate?gtId=" + row.goodsTypeId,
			$("#editForm").serialize(),
			function(data){
				$('#list').datagrid('reload'); // 重新加载数据表
		},"json");
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

var status = 0;
function formatterOpt(value,row,index){ // 操作栏
	if(status == 1){
		return "<a href = 'javascript:;'onclick = 'disable("+index+")'>冻结</a>";
	}else if(status == 0){
		return "<a href = 'javascript:;'onclick = 'activate("+index+")'>激活</a>";
	}
}