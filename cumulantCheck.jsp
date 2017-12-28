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
		<div id="cumulantcontent">
			<style type="text/css">
			#cumulantcontent label
			{
				font-family: "微软雅黑";
				font-size: 15px;
			}
			#cumulant-check-metornumber
			{
				width: 100%;
				height: 60px;
				padding-top: 15px;
				border-bottom: 2px #ACACB4 solid;
			}
			#cumulant-check-metornumber th
			{
				font-size: 10px;
				border-bottom: 2px silver solid;
				border-top: 2px silver solid;
				background-color: steelblue;
				color: white;
				text-align: center;
				white-space: nowrap !important;  
			}
			td
			{
				text-align: center;
				font-size: 10px;
				white-space: nowrap !important;  
			}
			#cumulant-query-table th
			{
				font-size: 10px;
				border-bottom: 2px silver solid;
				border-top: 2px silver solid;
				background-color: steelblue;
				color: white;
				text-align: center;
				white-space: nowrap !important;  
			}
		</style>
			<div id="cumulant-check-metornumber">
				<div id="cumulant-tabs">
					<ul>
						<li class="chance-1"><a href="#cumulant-tabs-1" style="font-size: 15px;">累积量总览</a></li>
						<li class="chance-2"><a href="#cumulant-tabs-2" style="font-size: 15px;">累计量查询</a></li>
					</ul>
						<div id="cumulant-tabs-1">		
							<div id="cumulantdata">
								<label for="" id="todaycomulant">当天累计量</label>
								<table  id="cumulant-item-table" class="display">
									<thead>
										<tr>
											<th>车辆编号</th>
											<th>数据时间</th>
											<th>运行时长</th>
											<th>检修里程</th>
											<th>总里程</th>
											<th>牵引能耗</th>
											<th>再生电量</th>
											<th>辅助能耗</th>
											<th>TC1车压缩机工作时长</th>
											<th>TC2车压缩机工作时长</th>
											<th>TC1车压缩机工作率</th>
											<th>TC2车压缩机工作率</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>06001</td>
											<td>2017/12/26 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/25 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/24 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/23 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/22 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/21 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/20 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/19 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/18 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/17 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/16 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="historycomulant">
								<label >总累计量</label>
								<table  id="cumulant-history-table" class="display">
									<thead>
										<tr>
											<th>车辆编号</th>
											<th>数据时间</th>
											<th>运行时长</th>
											<th>检修里程</th>
											<th>总里程</th>
											<th>牵引能耗</th>
											<th>再生电量</th>
											<th>辅助能耗</th>
											<th>TC1车压缩机工作时长</th>
											<th>TC2车压缩机工作时长</th>
											<th>TC1车压缩机工作率</th>
											<th>TC2车压缩机工作率</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>06001</td>
											<td>2017/12/26 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/25 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/24 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/23 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/22 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/21 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/20 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/19 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/18 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/17 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/16 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
									</tbody>
								</table>
							</div>		
					</div>
					<div id="cumulant-tabs-2">
						<div id="cumulant-query">
							<label >总累查询</label>
							<table  id="cumulant-query-table" class="display">
								<thead>
										<tr>
											<th>车辆编号</th>
											<th>数据时间</th>
											<th>运行时长</th>
											<th>检修里程</th>
											<th>总里程</th>
											<th>牵引能耗</th>
											<th>再生电量</th>
											<th>辅助能耗</th>
											<th>TC1车压缩机工作时长</th>
											<th>TC2车压缩机工作时长</th>
											<th>TC1车压缩机工作率</th>
											<th>TC2车压缩机工作率</th>
										</tr>
								</thead>
								<tbody>
										<tr>
											<td>06001</td>
											<td>2017/12/26 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/26 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/25 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/24 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/23 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/22 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/21 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/20 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/19 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/18 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/17 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
										<tr>
											<td>06001</td>
											<td>2017/12/16 15:00:00</td>
											<td>12:12:02</td>
											<td>1672km</td>
											<td>12311km</td>
											<td>562112kw/h</td>
											<td>321323kw</td>
											<td>12311kw/h</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
											<td>12:00:00</td>
										</tr>
								</tbody>
							</table>	
						</div>		
					</div>
				</div>		
			<script type="text/javascript">
				var  cumulantFlag;
			function cumulantQueryPageInit(){
				cumulantFlag=true;
				$("#cumulant-item-table").DataTable(
					{
						bSort:false,
						bLengthChange:false,
						searching: false,
						ordering:  false,
						scrollY: 200,
						scrollX: true,
						bInfo:false,
					}
				);
				$("#cumulant-history-table").DataTable({
						bSort:false,
						bLengthChange:false,
						searching: false,
						ordering:  false,
						scrollY: 200,
						scrollX: true,
						bInfo:false,
				});
				$("#cumulant-query-table").DataTable({
						bSort:false,
						bLengthChange:false,
						searching: false,
						ordering:  false,
						scrollY: 200,
						scrollX:true,
						bInfo:false,
						bAutoWidth:true,
				});
				$("#cumulant-tabs").tabs();//tabs()一定要在DataTable()之后使用
				$(".chance-2").click(function(){
					$("#checkoutmsg label").css("display","inline-block");
					$("#datepickerstart").css("display","inline-block");
					$("#datepickerend").css("display","inline-block");
					cumulantFlag=false;
				});
				$(".chance-1").click(function(){
					$("#checkoutmsg label").css("display","none");
					$("#datepickerstart").css("display","none");
					$("#datepickerend").css("display","none");
					cumulantFlag=true;
				});
				$("#maincontent").on("updateDataToCumulantPage",updateData);
			}
			function updateData(event,params){
				//刷新数据
				var  todayData=document.getElementById("cumulant-item-table");
				var  historyData=document.getElementById("cumulant-history-table");
				var  queryHistoryData=document.getElementById("cumulant-query-table");
				$("#makesure").on('click',function(){
					if(cumulantFlag)
					{
						$.ajax({
						type:"post",
						url:'<%=basePath %>cumulant/today.do',
						data:params.metroNumber,
						dataType:'JSON',
						success:function(data){ 
							var  dataBean=data;
							$.each(dataBean, function(index) {
								todayData.row.add([
									dataBean[index].metro_code,
									dataBean[index].time_data,
									dataBean[index].run_time,
									dataBean[index].maintenance_mileage,
									dataBean[index].total_mileage,
									dataBean[index].tcu_consuption,
									dataBean[index].regenerate_power,
									dataBean[index].siv_consuption,
									dataBean[index].compressor_run_time_tc1,
									dataBean[index].compressor_run_time_tc2,
									dataBean[index].compressor_work_rate_tc1,
									dataBean[index].compressor_work_rate_tc2,
									]);
								});
							},
						});
						$.ajax({
							type:"post",
							url:"<%=basePath %>cumulant/total.do",
							data:params.metroNumber,
							dataType:'JSON',
							success:function(data){
								var  dataBean=data;
								$.each(dataBean, function(index) {
									historyData.row.add([
										dataBean[index].metro_code,
										dataBean[index].time_data,
										dataBean[index].run_time,
										dataBean[index].maintenance_mileage,
										dataBean[index].total_mileage,
										dataBean[index].tcu_consuption,
										dataBean[index].regenerate_power,
										dataBean[index].siv_consuption,
										dataBean[index].compressor_run_time_tc1,
										dataBean[index].compressor_run_time_tc2,
										dataBean[index].compressor_work_rate_tc1,
										dataBean[index].compressor_work_rate_tc2,
									]);
								});
							},
						});
					}
					else
					{
						$.ajax({
							type:"post",
							url:"<%=basePath %>cumulant/period.do",
							data:params,
							dataType:'JSON',
							success:function(data){
								var  dataBean=data;
								$.each(dataBean, function(index) {
									queryHistoryData.row.add([
										dataBean[index].metro_code,
										dataBean[index].time_data,
										dataBean[index].run_time,
										dataBean[index].maintenance_mileage,
										dataBean[index].total_mileage,
										dataBean[index].tcu_consuption,
										dataBean[index].regenerate_power,
										dataBean[index].siv_consuption,
										dataBean[index].compressor_run_time_tc1,
										dataBean[index].compressor_run_time_tc2,
										dataBean[index].compressor_work_rate_tc1,
										dataBean[index].compressor_work_rate_tc2,
									]);
								});
							},
						});
					}
				});
			}
		</script>
		</div>
	</body>
</html>
