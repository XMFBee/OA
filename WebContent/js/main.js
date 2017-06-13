/**
 *
 * @param title 表示tab页的标题
 * @param url 表示此tab页的内容来源于服务端的哪个地址（跟原先的get与post请求的url是一致的）
 */
function addTab(title, url) {
    if ($('#tabs').tabs('exists', title)) { // 判断指定标题的选项卡是否存在
        $('#tabs').tabs('select', title); // 如果存在，则把此tab页改成选中状态（显示出这个tab页的内容）
        var currTab = $('#tabs').tabs('getSelected'); // 获取当前被选中的选项卡
        var url1 = $(currTab.panel('options').content).attr('src'); // 获取当前选中的选项卡的src属性
        if(url1 != undefined && currTab.panel('options').title != "主页") {// 判断当前选中的选项卡的url是否不为空，并且当前选中的选项卡不是主页选项卡，则更新此选项卡显示的资源 
            $('#tabs').tabs('update',{ //　开始更新此选项卡的内容
                tab:currTab, // 当前选项卡
                options:{
                    content:createFrame(url1) // 重新显示出一个框架，此框架的内容来源于原先此tab的url，只做更新（相当于重新发送一个请求到服务端）
                }
            })
        }
    } else { // 如果此选项卡不存在，则新建一个选项卡
        $('#tabs').tabs('add', { // 添加选项卡
            title: title, // 添加的选项卡的标题是传递过来的title参数
            content: createFrame(url), // 选项卡需要的内容来源于我们指定的url
            border: false,
            closable: true
        });
    }
    tabClose();
}

/**
 * 创建iframe框架的
 * @param url 整个框架想要显示的资源的url
 * @returns {String}
 */
function createFrame(url) {
    return '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
}

function tabClose() {
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function() {
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close', subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#mm').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
}
//绑定右键菜单事件
function tabCloseEven() {
	//刷新
	$('#mm-tabupdate').click(function() {
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if (url != undefined && currTab.panel('options').title != '主页') {
			$('#tabs').tabs('update', {
				tab : currTab,
				options : {
					content : createFrame(url)
				}
			})
		}
	})
	//关闭当前
	$('#mm-tabclose').click(function() {
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close', currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function() {
		$('.tabs-inner span').each(function(i, n) {
			var t = $(n).text();
			if (t != '主页') {
				$('#tabs').tabs('close', t);
			}
		});
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		var nextall = $('.tabs-selected').nextAll();
		if (prevall.length > 0) {
			prevall.each(function(i, n) {
				var t = $('a:eq(0) span', $(n)).text();
				if (t != '主页') {
					$('#tabs').tabs('close', t);
				}
			});
		}
		if (nextall.length > 0) {
			nextall.each(function(i, n) {
				var t = $('a:eq(0) span', $(n)).text();
				if (t != '主页') {
					$('#tabs').tabs('close', t);
				}
			});
		}
		return false;
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function() {
		var nextall = $('.tabs-selected').nextAll();
		if (nextall.length == 0) {
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			if (t != '主页') {
				$('#tabs').tabs('close', t);
			}
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		if (prevall.length == 0) {
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			if (t != '主页') {
				$('#tabs').tabs('close', t);
			}
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function() {
		$('#mm').menu('hide');
	})
}

function refreshHome() {
	window.location.href = "layout_full_screen.jsp";
}

/**
 * 给easyui的datagrid设置分布组件的属性
 * @param tableId
 */
function setPagination(tableId) {
    var p = $("#" + tableId).datagrid('getPager'); // 表示获取指定table的分布组件
    $(p).pagination({ // 给分页组件设置相关属性
        pageSize: 20, // 每页显示20个记录
        pageList: [10, 15, 20, 25], // 设置每一页中可选择的记录数
        beforePageText: '第',
        afterPageText: '页    共 {pages} 页', // pages属性是easyui自动获取
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', // from是开始页码, to是结束页码, total是总记录数
        onBeforeRefresh: function () { // 在整个表格的数据刷新之前做什么事
            $(this).pagination('loading');
            $(this).pagination('loaded');
        }
    });
}

var code; //在全局 定义验证码  
function createCode() {
  code = "";
  var codeLength = 4;//验证码的长度  
  var checkCode = document.getElementById("checkCode");
  var selectChar = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的  
  for (var i = 0; i < codeLength; i++) {
    var charIndex = Math.floor(Math.random() * 32);
    code += selectChar[charIndex];
  }
  //alert(code);
  if (checkCode) {
    checkCode.className = "code";
    checkCode.value = code;
  }
}

function refresh(obj){
	window.location.assign(obj)
}
