<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link id="easyuiTheme" rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/material/easyui.css"/>
<link rel = "stylesheet" href = "<%=path %>/jquery-easyui/themes/icon.css"/>
<link rel = "stylesheet" href = "<%=path %>/css/main.css"/>
<script type = "text/javascript" src = "<%=path %>/js/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/main.js"></script>
<script type = "text/javascript" src = "<%=path %>/js/changTheme.js"></script>
<script>
	$(document).ready(function() {
		tabCloseEven();
	});
	window.onload=function(){
	//定时器每秒调用一次fnDate()
	setInterval(function(){
	fnDate();
	},1000);
	}
	//js 获取当前时间
	function fnDate(){
	var oDiv=document.getElementById("div1");
	var date=new Date();
	var year=date.getFullYear();//当前年份
	var month=date.getMonth();//当前月份
	var data=date.getDate();//天
	var hours=date.getHours();//小时
	var minute=date.getMinutes();//分
	var second=date.getSeconds();//秒
	var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
	oDiv.innerHTML=time;
	}
	//补位 当某个字段不是两位数时补0
	function fnW(str){
	var num;
	str>10?num=str:num=str;
	return num;
	} 
</script>
<style type="text/css">
		*{margin:0px;padding:0px}
	.out{width:500px; height:300px;position: relative; margin: 100px }
	.out .img{list-style: none; }
	.out .img li{position:absolute;}

	.out .num{list-style: none; position:absolute;bottom: 10px;text-align:center;width:100%}
	.out .num li{list-style: none; width:20px; height:20px; border-radius:50%;background-color:#999;text-align: center;display: inline-block;cursor:pointer;}
	.out .num li.active{background-color:#DD0000}
	
	
	.out .btn{top:110px;width:50px; height:80px; font-size: 72px;  position:absolute;background-color:rgba(255,255,255,0.3);cursor:pointer;}
	.out .left{left:0px;}
	.out .right{right:0px;}
	.hide{display:none}
	.show{display:inline-block;}

	#currDuty tr{
		line-height:25px;
	}
	#currDuty tr td{
		text-align:center;
		width:150px;
	}
	#currDuty tr th{
	 	width:150px;
	 }
	 #wel div{
	 	float:left;
	 }
</style>	
</head>
<body class="easyui-layout">
		<div data-options="region:'north'" style="height:65px;">
			<img style = "width:200px;height:50px;margin-top:7px;" src = "<%=path %>/image/logo.png" class = "logo"/>
		<%-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style = "font-size:20px;">当前时间：<span id = "div1" style = "font-size:20px;"></span></span> --%>
		<div style = "position:absolute;left:500px;top:20px;"><span style = "font-size:20px;">当前时间：<span id = "div1" style = "font-size:20px;"></span></span></div>
			<div id="wel">
				<div style="float:right;">  
		           <div style="padding:5px;font-size:20px;font-weight:900;margin-top:10px;">  
		            	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu'">更换主题</a>  
		           </div>  
	       		</div>  
				<div id="layout_north_pfMenu" style="margin-top:30px;">  
				       <div onclick="changeTheme('default');">默认主题</div>  
				       <div onclick="changeTheme('black');">暗黑</div>  
				       <div onclick="changeTheme('bootstrap');">太空灰</div>  
				       <div onclick="changeTheme('metro');">银色</div>  
				       <div onclick="changeTheme('sunny');">卡其</div>  
				       <div onclick="changeTheme('pepper-grinder');">棕红</div>  
				       <div onclick="changeTheme('cupertino');">蓝色海洋</div>  
				</div>  
				<a href = "javascript:;" onclick = "refresh('<%=path %>')">刷新</a>	
				身份：<span style = "color:red;">${sessionScope.employee.role.name}</span >&nbsp;欢迎:<span style = "color:red;">${sessionScope.employee.name}</span>
				<a href = "javascript:;">安全退出</a>
			</div>
		</div>

		
		<div data-options="region:'west',split:true" title="菜单" style="width:235px; ">
			<div class="easyui-accordion menu" style="width:235px;">
				<div title="市场管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('意向学生管理','<%=path %>/stu/showPurpose');">意向学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('预定学生管理','<%=path %>/stu/showReserve');">预定学生管理</a></li>
					</ul>
				</div>
				<div title="办公管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('部门管理','<%=path %>/dep/showDepartment');">部门管理</a></li>
						<li><a href="javascript:;" onclick="addTab('员工管理','<%=path %>/employee/showEmployee');">员工管理</a></li>
						<li><a href="javascript:;" onclick="addTab('用品类型管理','<%=path %>/goodsType/gtype');">用品类型管理</a></li>
						<li><a href="javascript:;" onclick="addTab('用品管理','<%=path %>/goods/goodsPager');">用品管理</a></li>
						<li><a href="javascript:;" onclick="addTab('用品归还','<%=path %>/goodsUse/showGoodsUse');">用品归还</a></li>
						<li><a href="javascript:;" onclick="addTab('用品申购','<%=path %>/goodsApp/goodsAppPager');">用品申购</a></li>
						<li><a href="javascript:;" onclick="addTab('值班管理','<%=path %>/check/showCheck');">值班管理</a></li>
						<li><a href="javascript:;" onclick="addTab('巡查管理','<%=path %>/duty/showDuty');">巡查管理</a></li>
						<li><a href="javascript:;" onclick="addTab('员工请假管理','<%=path %>/empleave/showEmpleave');">员工请假管理</a></li>
						<li><a href="javascript:;" onclick="addTab('考勤管理','<%=path %>/empChecking/showEmpChecking');">考勤管理</a></li>
						<li><a href="javascript:;" onclick="addTab('考勤详情','<%=path %>/empChecking/showEmpCheckingInfo');">考勤详情</a></li>
						<li><a href="javascript:;" onclick="addTab('考勤申诉管理','<%=path %>/empAppeal/showEmpAppeal');">考勤申诉管理</a></li>
						<li><a href="javascript:;" onclick="addTab('员工日志管理','<%=path %>/report/showReport');">员工日志管理</a></li>
					</ul>
				</div>
				
				<div title="学生管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('正式学生管理','<%=path %>/stu/showOfficial');">正式学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('宿舍管理','<%=path %>/room/showRoom');">宿舍管理</a></li>
						<li><a href="javascript:;" onclick="addTab('班级管理','<%=path %>/grade/showGrade');">班级管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生成绩管理','<%=path %>/score/showScore');">学生成绩管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生请假管理','<%=path %>/stuLeave/showStuLeave');">学生请假管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生反馈管理','<%=path %>/stuFeedback/showStuFeedback');">学生反馈管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生就业管理','<%=path %>/job/showJob');">学生就业管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生谈心管理','<%=path %>/talk/showTalk');">学生谈心管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生考勤管理','<%=path %>/stuChecking/showStuChecking');">学生考勤管理</a></li>
					</ul>
				</div>
				<div title="教务管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('课程管理','<%=path %>/course/showCourse');">课程管理</a></li>
						<li><a href="javascript:;" onclick="addTab('研讨会管理','<%=path %>/meettinginfo/showMeettingInfo');">研讨会管理</a></li>
						<li><a href="javascript:;" onclick="addTab('课程进度管理','<%=path %>/progress/showProgressPager');">课程进度管理</a></li>
						<li><a href="javascript:;" onclick="addTab('教务反馈','<%=path %>/empfeedback/showEmpfeedbackPager');">反馈管理</a></li>
						<li><a href="javascript:;" onclick="addTab('我的反馈','<%=path %>/empfeedback/showMyEmpfeedbackPager');">我的反馈</a></li>
					</ul>
				</div>
				<div title="财务管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('工资基本信息管理','<%=path %>/sa/showSalaryInfoHome');">工资基本信息管理</a></li>
						<li><a href="javascript:;" onclick="addTab('支出类别','<%=path %>/payType/showPayType');">支出类别</a></li>
						<li><a href="javascript:;" onclick="addTab('收入类别','<%=path %>/it/showIncomTypeHome');">收入类别</a></li>
						<li><a href="javascript:;" onclick="addTab('工资管理','<%=path %>/ss/showSalaryHome');">工资管理</a></li>
						<li><a href="javascript:;" onclick="addTab('支出管理','<%=path %>/payinfo/showPayInfo');">支出管理</a></li>
						<li><a href="javascript:;" onclick="addTab('收入管理','<%=path %>/ie/showIncomeHome');">收入管理</a></li>
					</ul>
				</div>
				<!-- 郭玉清 -->
				<div title="系统管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('系统公告类型管理','<%=path %>/noticeType/showNoticeType');">公告类型管理</a></li>
						<li><a href="javascript:;" onclick="addTab('系统公告管理','<%=path %>/notice/showNotice');">系统公告管理</a></li>
						<li><a href="javascript:;" onclick="addTab('系统角色管理','<%=path %>/role/showRole');">系统角色管理</a></li>
						<li><a href="javascript:;" onclick="addTab('打卡时间管理','<%=path %>/checking/showChecking');">打卡时间管理</a></li>
					</ul>
				</div>
				<div title="个人管理" class="menu1">
					<ul>
						<li><a href="javascript:;" onclick="addTab('员工个人信息','<%=path %>/employee/showUser');">员工个人信息</a></li>
						<li><a href="javascript:;" onclick="addTab('学生个人信息','<%=path %>/stu/showStu');">学生个人信息</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">
				<div title="主页" style="padding:10px">
					  <div style="margin-top: 30px;">
				   	 	<!-- 今日值班 -->
				   	 	<div style="float: left; margin-right: 50px;">
							<div id="p1" class="easyui-panel" title="今日值班" style="width:350px;height:285px;padding:10px;"
									data-options="
										tools:[{
											iconCls:'icon-reload',
											handler:function(){
												$('#p1').panel('refresh', '<%=path %>/duty/currDuty');
											}
										}]
									">
									<script type="text/javascript">
										$.get("<%=path%>/duty/currDuty",function(data){
											var currDuty = $("#currDuty");
											if(data.duty!=null && data.duty!=""){
												if(data.duty.add1!=null&& data.duty.add1!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add1+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp1.name);tr.append(td1);tr.append(td);}
												if(data.duty.add2!=null&& data.duty.add2!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add2+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp2.name);tr.append(td1);tr.append(td);}
												if(data.duty.add3!=null&& data.duty.add3!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add3+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp3.name);tr.append(td1);tr.append(td);}
												if(data.duty.add4!=null&& data.duty.add4!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add4+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp4.name);tr.append(td1);tr.append(td);}
												if(data.duty.add5!=null&& data.duty.add5!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add5+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp5.name);tr.append(td1);tr.append(td);}
												if(data.duty.add6!=null&& data.duty.add6!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add6+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp6.name);tr.append(td1);tr.append(td);}
												if(data.duty.add7!=null&& data.duty.add7!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add7+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp7.name);tr.append(td1);tr.append(td);}
												if(data.duty.add8!=null&& data.duty.add8!=""){var tr = $("<tr>");var td1 =$("<td>");td1.text(data.duty.add8+":");currDuty.append(tr);var td = $("<td>");td.text(data.duty.emp8.name);tr.append(td1);tr.append(td);}
											}
										},"json")
									</script>
									<table id="currDuty">
										<thead>
											<tr >
										      <th>值班地址</th>
										      <th>值班员工</th>
										    </tr>
										</thead>
									</table>
							</div>
				   	 	</div>
				   	 
				   	 	<div class= "out" style="float: left;">
				   	 		<ul class= "img">
					   	 		<li><img alt="公告1" src="<%=path%>/noticeInfo/outImg?rows=1"/></li>
					   	 		<li><img alt="公告2" src="<%=path%>/noticeInfo/outImg?rows=2"/></li>
					   	 		<li><img alt="公告3" src="<%=path%>/noticeInfo/outImg?rows=3"/></li>
				   	 		</ul>
				   	 		<ul class= "num">
								<li >1</li>
								<li>2</li>
								<li>3</li>
							</ul>
							<div class= "left btn hide"  onclick = "moveL()"><</div>
							<div class= "right btn hide" onclick = "moveR()">></div>
				   	 	</div>
				   	 </div>
				</div>
			</div>
		</div>
		<div data-options="region:'south',split:false" class = "down">15秋预科班——宏图OA系统——项目组 二 版权所有</div>
		
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseleft">关闭左边选项卡</div>
		<div id="mm-tabcloseright">关闭右边选项卡</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
	
	<script type="text/javascript">
	 	$(".out").mouseover(function(){		$(".btn").addClass("show").removeClass("hide");	})
	 	$(".out").mouseout(function(){		$(".btn").addClass("hide").removeClass("show");	})
	 	
	 	var i =0;
	 	var size = $(".img li").size();
	 	$(".img li").first().show();
	 	$(".num li").first().addClass("active");

	 	$(".out .num li").mouseover(function(){
	 		$(this).addClass("active").siblings().removeClass("active");
	 		var index = $(this).index();
	 		i = index;
	 		$(".img li").eq(i).fadeIn().siblings().fadeOut();
	 	})
	 	function moveR(){
	 		i++;
	 		if(i>size){			i = 0;		}
	 		$(".num li").eq(i).addClass("active").siblings().removeClass("active");
	 		$(".img li").eq(i).fadeIn().siblings().fadeOut();
	 	}
	 	function moveL(){
	 		i--;
	 		if(i<0){			i = size-1;		}
	 		$(".num li").eq(i).addClass("active").siblings().removeClass("active");
	 		$(".img li").eq(i).fadeIn().siblings().fadeOut();
	 	}
	</script>
</body>
</html>