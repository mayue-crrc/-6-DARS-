<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
				<title></title>
	</head>
	<body>
	<div id="faultcheckPage">
	<style type="text/css">
			td
			{
				text-align: center;
				font-size: 10px;
				white-space: nowrap !important;  
			}
			
			th
			{
				border-bottom: 1px solid #B6B6B6;
				font-size: 10px;
				border-bottom: 2px silver solid;
				border-top: 2px silver solid;
				background-color: steelblue;
				color: white;
				text-align: center;
				white-space: nowrap !important;  
			}
			#nowfault
			{
				height:320px;
				border-bottom: 1px #ACACB4 solid;
			}
			#historyfault
			{
				height:320px;
				padding-top: 5px;
				border-bottom: 1px #ACACB4 solid;
				border-top: 1px #ACACB4 solid;
			}
			.faultcheck
			{
				height: 400px;
				padding-top: 5px;
				border-bottom: 1px #ACACB4 solid;
				overflow: auto;
			}
			.Page a
			{
				margin-top: 10px;
				background-color:#DDDDDD;
				display:line-block;
				margin-left: 10px;
				margin-bottom:10px;
			}
			.Page
			{
				display: none;
			}
		</style>
	
	<div id="tabs">
		<ul>
			<li class="chance-1"><a href="#tabs-1">故障总览</a></li>
			<li class="chance-2"><a href="#tabs-2">故障查询</a></li>
		</ul>
		<div id="tabs-1">
			<label class="faultclass">当前故障</label>
			<div id="nowfault">
				<table id="nowfautlt1" class="display">
					<thead>
						<tr>
							<th>车辆编号</th>
							<th>故障名称</th>
							<th>故障代码</th>
							<th>故障位置</th>
							<th>故障设备</th>
							<th>故障提示</th>
							<th>开始时间</th>
							<th>结束时间</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="Page">
				<a href='#'id="currentPrePage">上一页</a><a id="currentFaultCurrentPage"></a><a href='#' id="currentNextPage">下一页</a><a id="currentFaultTotalPage"></a>
			</div>				
			<div id="historyfault">
				<label class="faultclass">历史故障</label>
				<table id="historyfault1" class="display">
					<thead>
						<tr>
							<th>车辆编号</th>
							<th>故障名称</th>
							<th>故障代码</th>
							<th>故障位置</th>
							<th>故障设备</th>
							<th>故障提示</th>
							<th>开始时间</th>
							<th>结束时间</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="Page">
					<a href='#' id="historyPrePage">上一页</a><a id="historyFaultCurrentPage"></a><a href='#' id="historyNextPage">下一页</a><a id="historyFaultTotalPage"></a>
			</div>
		</div>
		<div id="tabs-2">
			<div class="faultcheck">

					<table id="faultlist" class="display">
						<thead>
							<tr>
								<th>车辆编号</th>
								<th>故障名称</th>
								<th>故障代码</th>
								<th>故障位置</th>
								<th>故障设备</th>
								<th>故障提示</th>
								<th>开始时间</th>
								<th>结束时间</th>
							</tr>
						</thead>
					</table>
			</div>
			<div class="Page">
				<a href='#' id="checkHistoryPrePage">上一页</a><a id="checkHistoryFaultCurrentPage"></a><a href='#' id="checkHistoryNextPage">下一页</a><a id="checkHistoryFaultTotalPage"></a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	function js_date_time(unixtime){  
	    var myDate = new Date(parseInt(unixtime)); 
	    var year = myDate.getFullYear();  
	    var month = myDate.getMonth() + 1;  
	    var day = myDate.getDate();
	    var hour = myDate.getHours();  
	    var minute = myDate.getMinutes(); 
	    var second  = myDate.getSeconds(); 

	    return year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;  
	}        
	function packagingdatatabledata(msgObj){  
        var editHtml="<a class='btn' data-toggle='modal' href='#modalbackdroptrue' >编辑</a>";  
        var a=[];  
        var tableName=['day','data','indata','edit'];  
        var banddata=storjson(msgObj['data']);  
        var bandindata=storjson(msgObj['indata']);  
        for(var key in banddata){  
            var tempObj=new Object();  
            tempObj.day=key;  
            tempObj.data=banddata[key];  
            tempObj.indata=bandindata[key];  
            tempObj.edit=editHtml;  
            a.push(JSON.parse(JSON.stringify(tempObj,tableName)));  
            }  
        return a;  
    }
	function initView(){
		var data1=[
		{'车辆编号':"06001",'故障名称':"紧急制动指令旁路开关被操作",'故障代码':"3014",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查紧急制动指令旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06002",'故障名称':"总风压力低2旁路开关被操作",'故障代码':"3015",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低2旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		{'车辆编号':"06003",'故障名称':"总风压力低1旁路开关被操作",'故障代码':"3016",'故障位置':"A2",'故障设备':"TCMS",'故障提示':"请检查总风压力低1旁路开关",'开始时间':"2017/12/21 12:21:12",'结束时间':"2017/12/24 11:22:22"},
		];
		$("#nowfautlt1").DataTable({
			bSort:false,
			bLengthChange:false,
			searching: false,
			ordering:  false,
			scrollY: 200,
			scrollX:true,
			bInfo:false,
			bAutoWidth:false,
			destroy:true,
			data:data1,
			columns:[
				{data:'车辆编号'},
				{data:'故障名称'},
				{data:'故障代码'},
				{data:'故障位置'},
				{data:'故障设备'},
				{data:'故障提示'},
				{data:'开始时间'},
				{data:'结束时间'},
				],
		});
		$("#historyfault1").DataTable({
			bSort:false,
			bLengthChange:false,
			searching: false,
			ordering:  false,
			scrollY: 200,
			scrollX:true,
			bInfo:false,
			bAutoWidth:false,
			destroy:true,
			data:data1,
			columns:[
				{data:'车辆编号'},
				{data:'故障名称'},
				{data:'故障代码'},
				{data:'故障位置'},
				{data:'故障设备'},
				{data:'故障提示'},
				{data:'开始时间'},
				{data:'结束时间'},
				],
		});
		var  adddatahistory=$("#historyfault1");
		
		$("#faultlist").DataTable({
			bSort:false,
			bLengthChange:false,
			searching: false,
			ordering:  false,
			scrollY: 200,
			scrollX:true,
			bInfo:false,
			bAutoWidth:false,
			destroy:true,
			data:data1,
			columns:[
				{data:'车辆编号'},
				{data:'故障名称'},
				{data:'故障代码'},
				{data:'故障位置'},
				{data:'故障设备'},
				{data:'故障提示'},
				{data:'开始时间'},
				{data:'结束时间'},
				],
		});
		$( "#tabs" ).tabs();
		$("#maincontent").on("updateDataToFaultqueryPage",updateData);
		$(".chance-2").click(function(){
				$("#checkoutmsg label").css("display","inline-block");
				$("#datepickerstart").css("display","inline-block");
				$("#datepickerend").css("display","inline-block");
		});
		$(".chance-1").click(function(){
			$("#checkoutmsg label").css("display","none");
			$("#datepickerstart").css("display","none");
			$("#datepickerend").css("display","none");
		});
		
	}
	function updateData(){
		//获取当前故障和历史故障数据，每一页显示20条数据
			var current_table=$("#nowfautlt1").DataTable();
			var history_table=$("#historyfault1").DataTable();
			var query_table=$("#faultlist").DataTable();
			
//测试使用tooltip控件
		  	//var sssss=current_table.cells['selected'].attr("title","this is  description").tooltip();
			//sssss.attr("title","this is  description").tooltip();
			$("#nowfautlt1 tbody tr :nth-child(6)").attr('data-placement','right').attr('title','this is test').tooltip();
			var currentFaultTotalPageObj;//当前故障的总共页数
			var historyFaultTotalPageObj;
			var currentFaultPageObj={
					currentFaultPage:1,	
			};//当前故障的当前页数
			var historyFaultPageObj={
					historyFaultPage:1,
			};
			
			//获取当前故障列表
			$.ajax({
				url:"<%=basePath %>currentFault.do",
				type:"POST",
				data:currentFaultPageObj,
				dataType:"JSON",
				success:function(data){
					var currentbean;
					var currentFault=data;
					$.each(currentFault, function(index) {
						currentbean=currentFault[index];
						//...按照currentbean里面的名字将数据插入到列表

						current_table.row.add([
							currentbean.metroCode,
							currentbean.faultName,
							currentbean.faultCode,
							currentbean.faultPosition,
							currentbean.faultDevice,
							currentbean.faultHint,
							js_date_time(currentbean.startTime),
							""
							]);
					});
					current_table.draw();
				},
			});
			
			//获取历史故障列表
			$.ajax({
				url:"<%=basePath %>historyFault.do",
				type:"POST",
				data:historyFaultPageObj,
				//data:historyFaultPageObj,
				dataType:"JSON",
				success:function(data){
					var historybean;
					var historyFault=data;
					$.each(historyFault, function(index) {
						historybean=historyFault[index];
						//...按照currentbean里面的名字将数据插入到列表
						history_table.row.add([
							historybean.metroCode,
							historybean.faultName,
							historybean.faultCode,
							historybean.faultPosition,
							historybean.faultDevice,
							historybean.faultHint,
							js_date_time(historybean.startTime),
							js_date_time(historybean.startTime),
							]);
						});
					history_table.draw();

				},
			});

			// get currentfault totalpage num
			$.ajax({
				url:"<%=basePath %>currentSum.do",
				type:"POST",
				dataType:"JSON",
				success:function(data){
					currentFaultTotalPage = Number(data);
					$("#currentFaultCurrentPage").text(currentFaultPageObj.currentFaultPage +" / "+currentFaultTotalPage);

				},
			});
			// get historyfault totalpage num
			$.ajax({
				url:"<%=basePath %>historySum.do",
				type:"POST",
				dataType:"JSON",
				success:function(data){
					historyFaultTotalPage = Number(data);
					$("#historyFaultCurrentPage").text(historyFaultPageObj.historyFaultPage +" / "+historyFaultTotalPage);
				},
			});
			

			

			//点击当前故障的上一页按钮刷新当前故障列表
			$("#currentPrePage").click(function(){
				if(currentFaultPageObj.currentFaultPage >1)
				{
					currentFaultPageObj.currentFaultPage -=1;
				}
				$.ajax({
					url:"<%=basePath %>currentFault.do",
					type:"POST",
					data:currentFaultPageObj,
					dataType:"JSON",
					success:function(data){
						var currentbean;
						var currentFault=data;
						current_table.clear();

						$.each(currentFault, function(index) {
							currentbean=currentFault[index];
							//...按照currentbean里面的名字将数据插入到列表

							current_table.row.add([
								currentbean.metroCode,
								currentbean.faultName,
								currentbean.faultCode,
								currentbean.faultPosition,
								currentbean.faultDevice,
								currentbean.faultHint,
								js_date_time(currentbean.startTime),
								""
								]);
						});
						current_table.draw();
						$("#currentFaultCurrentPage").text(currentFaultPageObj.currentFaultPage +" / "+currentFaultTotalPage);

					},
				});
			});

			// 点击当前故障下一页按钮刷新当前故障列表
			$("#currentNextPage").click(function(){

				if(currentFaultPageObj.currentFaultPage < currentFaultTotalPage)
				{
					currentFaultPageObj.currentFaultPage +=1;
				}

				$.ajax({
					url:"<%=basePath %>currentFault.do",
					type:"GET",
					data:currentFaultPageObj,
					dataType:"JSON",
					success:function(data){
						var currentbean;
						var currentFault=data;
						current_table.clear();
						$.each(currentFault, function(index) {
							currentbean=currentFault[index];
							//...按照currentbean里面的名字将数据插入到列表
							current_table.row.add([
								currentbean.metroCode,
								currentbean.faultName,
								currentbean.faultCode,
								currentbean.faultPosition,
								currentbean.faultDevice,
								currentbean.faultHint,
								js_date_time(currentbean.startTime),
								""
								]);
						});
						current_table.draw();
						$("#currentFaultCurrentPage").text(currentFaultPageObj.currentFaultPage +" / "+currentFaultTotalPage);
					},
				});
			});
			//点击历史故障的上一页按键刷新历史故障列表
			$("#historyPrePage").click(function(){
				if(historyFaultPageObj.historyFaultPage >1)
				{
					historyFaultPageObj.historyFaultPage -=1;
				}
				$.ajax({
					type:"POST",
					url:"/HistoryFault.do",
					data:historyFaultPageObj,
					dataType:"JSON",
					success:function(data){
						var historybean;
						var historyFault=data;
						history_table.clear();
						$.each(historyFault, function(index) {
							historybean=historyFault;
							//...按照historybean里的字段将数据插入到历史故障列表中
							history_table.row.add([
								historybean.metroCode,
								historybean.faultName,
								historybean.faultCode,
								historybean.faultPosition,
								historybean.faultDevice,
								historybean.faultHint,
								js_date_time(historybean.startTime),
								js_date_time(historybean.startTime),
								]);
							});
						history_table.draw();
						$("#historyFaultCurrentPage").text(historyFaultPageObj.historyFaultPage +" / "+historyFaultTotalPage);
					},
				});
			});
			//点击历史故障的下一页按钮，刷新历史故障列表
			$("#historyNextPage").click(function(){
				if(historyFaultPageObj.historyFaultPage < historyFaultTotalPage)
				{
					historyFaultPageObj.historyFaultPage +=1;
				}
				$.ajax({
					type:"POST",
					url:"/HistoryFault.do",
					data:historyFaultPageObj,
					dataType:"JSON",
					success:function(data){
						var historybean;
						var historyFault=data;
						history_table.clear();
						$.each(historyFault, function(index) {
							historybean=historyFault;
							//...按照historybean里的字段将数据插入到历史故障列表中
							history_table.row.add([
								historybean.metroCode,
								historybean.faultName,
								historybean.faultCode,
								historybean.faultPosition,
								historybean.faultDevice,
								historybean.faultHint,
								js_date_time(historybean.startTime),
								js_date_time(historybean.startTime),
								]);
							});
						history_table.draw();
						$("#historyFaultCurrentPage").text(historyFaultPageObj.historyFaultPage +" / "+historyFaultTotalPage);
					},
				});
			});
			
			var checkHistoryFaultCurrentPageObj={
					checkHistoryFaultCurrentPage:1,
			};
			var checkHistoryFaultTotalPage;
			$("#makesure").click(function(){
				$.ajax({
					type:"post",
					data:params,
					url:"<%=basePath%>querySum.do",
					dataType:"text",
					success:function(data){
						checkHistoryFaultTotalPage=Number(data);
						$("#checkHistoryFaultCurrentPage").text(params.page+" / "+checkHistoryFaultTotalPage);

					},
				});
				$.ajax({
					type:"post",
					url:"<%=basePath%>queryFault.do",
					data:params,
					dataType:"JSON",
					success:function(data){
						var faultBean;
						var faultList=data;
						$.each(faultList, function(index) {
							faultBean=faultList[index];
							query_table.row.add([
								faultBean.metroCode,
								faultBean.faultName,
								faultBean.faultCode,
								faultBean.faultPosition,
								faultBean.faultDevice,
								faultBean.faultHint,
								js_date_time(faultBean.startTime),
								js_date_time(faultBean.endTime),
								]);
						});
						query_table.draw();
					}
				});
				
			});
			$("#checkHistoryNextPage").click(function(){
				if(checkHistoryFaultCurrentPageObj.checkHistoryFaultCurrentPage<checkHistoryFaultTotalPage)
				{
					checkHistoryFaultCurrentPageObj.checkHistoryFaultCurrentPage+=1;
				}
				var params={
					page:checkHistoryFaultCurrentPageObj.checkHistoryFaultCurrentPage,
					metroNumber:metroNumber,
					startTime:startTime,
					endTime:endTime
				}
				$.ajax({
					type:"post",
					url:"<%=basePath%>queryFault.do",
					data:params,
					dataType:"JSON",
					success:function(data){
						var faultBean;
						var faultList=data;
						query_table.clear();
						$.each(faultList, function(index) {
							faultBean=faultList[index];
							query_table.row.add([
								faultBean.metroCode,
								faultBean.faultName,
								faultBean.faultCode,
								faultBean.faultPosition,
								faultBean.faultDevice,
								faultBean.faultHint,
								js_date_time(faultBean.startTime),
								js_date_time(faultBean.endTime),
								]);
						});
						query_table.draw();
						$("#checkHistoryFaultCurrentPage").text(params.page+" / "+checkHistoryFaultTotalPage);
					},
				});
				
			});
			$("#checkHistoryPrePage").click(function(){
				if(checkHistoryFaultCurrentPageObj.checkHistoryFaultCurrentPage >1)
				{
					checkHistoryFaultCurrentPageObj.checkHistoryFaultCurrentPage -=1;
				}
				params={
					page:checkHistoryFaultCurrentPageObj.checkHistoryFaultCurrentPage,
					metroNumber:metroNumber,
					startTime:startTime,
					endTime:endTime
				}
				$.ajax({
					type:"post",
					url:"<%=basePath%>queryFault.do",
					data:params,
					dataType:"JSON",
					success:function(data){
						var faultBean;
						var faultList=data;
						query_table.clear();
						$.each(faultList, function(index) {
							faultBean=faultList[index];
							query_table.row.add([
								faultBean.metroCode,
								faultBean.faultName,
								faultBean.faultCode,
								faultBean.faultPosition,
								faultBean.faultDevice,
								faultBean.faultHint,
								js_date_time(faultBean.startTime),
								js_date_time(faultBean.endTime),
								]);
						});
						query_table.draw();
						$("#checkHistoryFaultCurrentPage").text(params.page+" / "+checkHistoryFaultTotalPage);

					}
				});
			});
	}
	
	</script>
</div>
	</body>
	
</html>
