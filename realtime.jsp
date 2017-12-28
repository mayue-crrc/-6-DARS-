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
		<div id="runningstatepage">
				<div class="runningstateTable">
					<div align="center">
						<table  >
							<tr>
								<th>网压</th>
								<th>网流</th>
								<th>级位</th>
								<th>车速</th>
								<th>当前站</th>
								<th>下一站</th>
								<th>终点站</th>
							</tr>
							<tr>
								<th>1500V</th>
								<th>30A</th>
								<th>100%</th>
								<th>55kM/h</th>
								<th>苹果园站</th>
								<th>苹果园南站</th>
								<th>五路居站</th>
							</tr>
						</table>
					</div>
					
					<div class="trainpanto" style="margin-left: 22.2%;" ></div>
					<div class="trainpanto" style="margin-left: 18.4%;"></div>
					<div class="trainpanto" style="margin-left: 28%;margin-right: 120px; "></div>
					<div class="trainbody" style="margin-left: 100px;">0601</div>
					<div class="trainbody">0602</div>
					<div class="trainbody">0603</div>
					<div class="trainbody">0604</div>
					<div class="trainbody">0605</div>
					<div class="trainbody">0606</div>
					<div class="trainbody">0607</div>
					<div class="trainbody">0608</div>
					

					<div >
						<table  class="trainspecificstate">
							<tr id="RSPAuxiliaryState">
								<th>辅助状态</th>
								<td colspan="2" id="RSPAuxiliaryState1"></td>
								<td colspan="2" id="RSPAuxiliaryState2"></td>
								<td colspan="2" id="RSPAuxiliaryState3"></td>
								<td colspan="2" id="RSPAuxiliaryState4"></td>
								<td colspan="2" id="RSPAuxiliaryState5"></td>
								<td colspan="2" id="RSPAuxiliaryState6"></td>
								<td colspan="2" id="RSPAuxiliaryState7"></td>
								<td colspan="2" id="RSPAuxiliaryState8"></td>
							</tr>
							<tr id="RSPTractState">
								<th>牵引状态</th>
								<td colspan="2" id="RSPTractState1"></td>
								<td colspan="2" id="RSPTractState2"></td>
								<td colspan="2" id="RSPTractState3"></td>
								<td colspan="2" id="RSPTractState4"></td>
								<td colspan="2" id="RSPTractState5"></td>
								<td colspan="2" id="RSPTractState6"></td>
								<td colspan="2" id="RSPTractState7"></td>
								<td colspan="2" id="RSPTractState8"></td>
							</tr>
							<tr id="RSPBrakepressure">
								<th>制动缸压力</th>
								<td id="RSPBrakePressure1"></td>
								<td id="RSPBrakePressure2"></td>
								<td id="RSPBrakePressure3"></td>
								<td id="RSPBrakePressure4"></td>
								<td id="RSPBrakePressure5"></td>
								<td id="RSPBrakePressure6"></td>
								<td id="RSPBrakePressure7"></td>
								<td id="RSPBrakepressure8"></td>
								<td id="RSPBrakepressure9"></td>
								<td id="RSPBrakepressure10"></td>
								<td id="RSPBrakePressure11"></td>
								<td id="RSPBrakePressure12"></td>
								<td id="RSPBrakePressure13"></td>
								<td id="RSPBrakePressure14"></td>
								<td id="RSPBrakePressure15"></td>
								<td id="RSPBrakePressure16"></td>
							</tr>
							<tr id="RSPBrakeIso">
								<th>制动隔离</th>
								<td id="RSPBrakeIso1"></td>
								<td id="RSPBrakeIso2"></td>
								<td id="RSPBrakeIso3"></td>
								<td id="RSPBrakeIso4"></td>
								<td id="RSPBrakeIso5"></td>
								<td id="RSPBrakeIso6"></td>
								<td id="RSPBrakeIso7"></td>
								<td id="RSPBrakeIso8"></td>
								<td id="RSPBrakeIso9"></td>
								<td id="RSPBrakeIso10"></td>
								<td id="RSPBrakeIso11"></td>
								<td id="RSPBrakeIso12"></td>
								<td id="RSPBrakeIso13"></td>
								<td id="RSPBrakeIso14"></td>
								<td id="RSPBrakeIso15"></td>
								<td id="RSPBrakeIso16"></td>
							</tr>
							<tr id="RSPInnerTemperature">
								<th>车内温度℃</th>
								<td colspan="2" id="RSPInnerTemperature1"></td>
								<td colspan="2" id="RSPInnerTemperature2"></td>
								<td colspan="2" id="RSPInnerTemperature3"></td>
								<td colspan="2" id="RSPInnerTemperature4"></td>
								<td colspan="2" id="RSPInnerTemperature5"></td>
								<td colspan="2" id="RSPInnerTemperature6"></td>
								<td colspan="2" id="RSPInnerTemperature7"></td>
								<td colspan="2" id="RSPInnerTemperature8"></td>
							</tr>
							<tr id="RSPAirCompressorState">
								<th>空压机状态</th>
								<td colspan="2" id="RSPAirCompressorState1"></td>
								<td colspan="2" id="RSPAirCompressorState2"></td>
								<td colspan="2" id="RSPAirCompressorState3"></td>
								<td colspan="2" id="RSPAirCompressorState4"></td>
								<td colspan="2" id="RSPAirCompressorState5"></td>
								<td colspan="2" id="RSPAirCompressorState6"></td>
								<td colspan="2" id="RSPAirCompressorState7"></td>
								<td colspan="2" id="RSPAirCompressorState8"></td>
							</tr>
							<tr id="RSPParkBrake">
								<th>停放制动</th>
								<td colspan="2" id="RSPParkBrake1"></td>
								<td colspan="2" id="RSPParkBrake2"></td>
								<td colspan="2" id="RSPParkBrake3"></td>
								<td colspan="2" id="RSPParkBrake4"></td>
								<td colspan="2" id="RSPParkBrake5"></td>
								<td colspan="2" id="RSPParkBrake6"></td>
								<td colspan="2" id="RSPParkBrake7"></td>
								<td colspan="2" id="RSPParkBrake8"></td>
							</tr>
							<tr id="RSPRidingRate">
								<th>乘车率</th>
								<td colspan="2" id="RSPRidingRate1"></td>
								<td colspan="2" id="RSPRidingRate2"></td>
								<td colspan="2" id="RSPRidingRate3"></td>
								<td colspan="2" id="RSPRidingRate4"></td>
								<td colspan="2" id="RSPRidingRate5"></td>
								<td colspan="2" id="RSPRidingRate6"></td>
								<td colspan="2" id="RSPRidingRate7"></td>
								<td colspan="2" id="RSPRidingRate8"></td>
							</tr>
						</table>
					</div>
				</div>
				<style type="text/css">

					.trainbody
					{
				    	float: left;
				    	margin-left: 3px;
				    	margin-bottom: 15px;
				    	border-radius: 10px;
				    	width:11%;
				    	height: 45px;
				    	line-height: 45px;
				    	background-color: lightgray;
				    	text-align:center;
					}
					.trainpanto
					{
				    	float: left;
				    	width:60px;
				    	height: 35px;
				    	margin-top: 10px;
				    	background-image:url(images/pantoup.png);
				    	background-size:contain;
				    	background-repeat: no-repeat;
					}
					.trainspecificstate
					{
						background-color:white
					}
					.titlecontent
					{
					
					}

					td
					{
						background-color:#d8f2fc;
						background:-webkit-gradient(linear,  top,  bottom, from(#d8f2fc), to(#fff)); -webkit-background-origin:padding; -webkit-background-clip:content;
						background: -moz-linear-gradient(top, #d8f2fc 0%, #fff 100%); 
						background: -webkit-gradient(linear,  top, bottom, color-stop(0%,#d8f2fc), color-stop(100%,#fff)); 
						background: -webkit-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
						background: -o-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
						background: -ms-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
						background: linear-gradient(to bottom, #d8f2fc 0%,#fff 100%); 
						font:"微软雅黑";
						color: darkgray;
						font-size: 13px;
						width: 100px;
						height: 25px;
						text-align: center;
						margin-bottom: 2px;
					}
					th
					{
						background-color:#d8f2fc;
						background:-webkit-gradient(linear,  top,  bottom, from(#d8f2fc), to(#fff)); -webkit-background-origin:padding; -webkit-background-clip:content;
						background: -moz-linear-gradient(top, #d8f2fc 0%, #fff 100%); 
						background: -webkit-gradient(linear,  top, bottom, color-stop(0%,#d8f2fc), color-stop(100%,#fff)); 
						background: -webkit-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
						background: -o-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
						background: -ms-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
						background: linear-gradient(to bottom, #d8f2fc 0%,#fff 100%);
						font:"微软雅黑";
						color: darkslateblue;
						font-size: 13px;
						width: 110px;
						height: 25;
						text-align: center;
						border: solid 2px white;
					}

					
				</style>
				<script type="text/javascript">
					$(function(){
						var trainNum=$("#trainnum").val();
//						$("#trainnum").change(function(){changeValue();});
//						function changeValue(){
//							 trainNum=$("#trainnum").val();
//						};
//						$("#tes").click(function(){ 
//							alert(trainNum);
//						});
						var trainInfo={
							"netVoltage":100,
							"webFlow":90,
							"trainSpeed":100,
							"trainLevel":80,
							"currentPosition":"小平岛",
							"nextPosition":"七贤岭",
							"lastStop":"海事大学",
							"warningState":true,
							
						}
						setTrainState("0001",trainInfo);
					});
					function setTrainState(trainNum,trainInfo)
					{

						for (var i=0;i<8;i++) {
							$("#RSPAuxiliaryState").children("td").eq(i).append('--');
						}
						for (var i=0;i<8;i++) {
							$("#RSPTractState").children("td").eq(i).append('--');
						}
						for (var i=0;i<16;i++) {
							$("#RSPBrakepressure").children('td').eq(i).append('--');
						}
						for (var i=0;i<16;i++) {
							$("#RSPBrakeIso").children("td").eq(i).append('--');
						}
						for (var i=0;i<8;i++) {
							$("#RSPInnerTemperature").children("td").eq(i).append('--');
						}
						for (var i=0;i<8;i++) {
							$("#RSPAirCompressorState").children("td").eq(i).append('--');
						}
						for (var i=0;i<8;i++) {
							$("#RSPParkBrake").children("td").eq(i).append('--');
						}
						for (var i=0;i<8;i++) {
							$("#RSPRidingRate").children('td').eq(i).append('--');
						}
					}
			</script>
		</div>
	</body>
</html>
