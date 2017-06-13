var jsonStr = '{"goods.goodsId":"_id","goods.name":"_name","goods.quantity":"_quantity"'
		+ ',"goods.des":"_des","goods.unitprice":"_unitprice","goods.buyDay":"_buyDay"'
		+ ',"goods.goodsTypeId":"_goodsTypeId","goods.status":"_status"}';

$(function() {
	setPagination("list");
});

function showAddGoodsWin() {
	$("#addForm").form("clear"); // 清除表单里的所有数据
	$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
}

function addGoods() {
	if ($("#addForm").form("validate")) {
		$.post("goods/save", $("#addForm").serialize(), 
			function(data) {
				if (data.regoods.request == "success") {
					$("#addWin").window("close"); // 关闭指定的窗口
					$("#list").datagrid("reload"); // 重新加载指定数据网格数据
					$.messager.alert("提示", data.regoods.message, "info");
				} else if (data.regoods.request == "fail") {
					$.messager.alert("提示", data.regoods.message, "info");
				}
			}, "json");
	} else {
		$.messager.alert("提示", "请输入正确的数据", "info");
	}
}

function showEditGoodsWin() {
	// var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
	var rows = $("#list").datagrid("getSelections");
	if (rows.length > 1) {
		$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
	} else if (rows.length == 1) {
		var row = rows[0];
		if (row) { // 有选中的行
			var jsonStr1 = jsonStr.replace("_id", row.goodsId).replace("_name",row.name).
				replace("_quantity", row.quantity).replace("_des", row.des).
				replace("_unitprice", row.unitPrice).replace("_buyDay", row.buyDay).
				replace("_goodsTypeId",row.goodsTypeId).replace("_status", row.status);
			$("#editForm").form("load", JSON.parse(jsonStr1));
			$("#editWin").window("open");
		}
	} else if (rows.length == 0) {
		$.messager.alert("提示", "请先选择一个需要修改的物品", "info");
	}
}

function showEditGoodsWin1(index) {
	var row = $('#list').datagrid('getData').rows[index];
	if (row) { // 有选中的行
		var jsonStr1 = jsonStr.replace("_id", row.goodsId).replace("_name",row.name).
			replace("_quantity", row.quantity).replace("_des",row.des).
			replace("_unitprice", row.unitPrice).replace("_buyDay", row.buyDay).
			replace("_goodsTypeId", row.goodsTypeId).replace("_status", row.status);
		$("#editForm").form("load", JSON.parse(jsonStr1));
		$("#editWin").window("open");
	}
}

function editGoods() {
	if ($("#editForm").form("validate")) {
		$.post("goods/update", $("#editForm").serialize(), function(
				data) {
			if (data.regoods.request == "success") {
				$("#editWin").window("close"); // 关闭指定的窗口
				$("#list").datagrid("reload"); // 重新加载指定数据网格数据
				$.messager.alert("提示", data.regoods.message, "info");
			} else if (data.regoods.request == "fail") {
				$.messager.alert("提示", data.regoods.message, "info");
			}
		}, "json");
	} else {
		$.messager.alert("提示", "请输入正确的表单数据", "info");
	}
}

function disable(index){   //冻结
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("goods/gtDisable?gId=" + row.goodsId,
			$("#editForm").serialize(),
			function(data){
				$('#list').datagrid('reload');
		},"json");
	}
}
	
function activate(index){  // 激活
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("goods/gtActivate?gId=" + row.goodsId,
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