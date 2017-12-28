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
		<div id="signalCheckPage">
			<div class="tree">
			<div id="signal-show-hide">
			</div>
			<div id="signal-tree">
				<div class="select-signal-items">
					<select id="test-select" multiple="multiple">
				        <option class = "mutiselect" value="ccu生命信号"  data-section="CCU">CCU生命信号</option>
				        <option value="ccuTime" data-section="CCU">CCU时间</option>
				        <option value="peach" data-section="ERM">ERM生命信号</option>
				        <option value="milk tea" data-section="ERM">ERM时间</option>
				        <option value="green apple" data-section="ERM">ERM记录</option>
				        <option value="passion fruit" data-section="ERM" data-description="The greatest flavor">ERM***</option>
		    		</select>
				</div>
			</div>
			</div>
			<div id="signal-showtotalchartpart">
					<div id="chart-items-1" class="chart-items">
						
						<!--
                        <li id="chart-item-li-1" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
                        -->
					</div>
					<div class="chart-items" id="chart-items-2">
						<!--<li id="chart-item-li-2" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-3">
						<!--<li id="chart-item-li-3" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-4">
						<!--<li id="chart-item-li-4" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-5">
						<!--<li id="chart-item-li-5" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-6">
						<!--<li id="chart-item-li-6" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-7">
						<!--<li id="chart-item-li-7" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-8">
						<!--<li id="chart-item-li-8" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-9">
						<!--<li id="chart-item-li-9" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
					<div class="chart-items" id="chart-items-10">
						<!--<li id="chart-item-li-10" class="items-li"><span class="ui-icon ui-icon-closethick"></span></li>
						-->
					</div>
			</div>
			<style type="text/css">
				.signal-tree
				{
					width: 80%;
				}
				.select-signal-items
				{
					float: left;
					width: 40%;


				}	
				
				.signal-button{
					float: left;
					margin-left: 10px;
					width: 10%;
				}
				#signal-showcharts
				{
					display: none;
					float: left;
					width: 800%;
				}
				.tree
				{
					float: left;
					width: 100%;
				}
				#signal-show-hide
				{
					display: block;
					width: 100%;
					height: 30px;
					border-radius: 10px;
					background-image: url(images/ui-bg_gloss-wave_55_5c9ccc_500x100.png);
					background-size: cover;
				}
				#signal-showcharts li
				{
					list-style: none;
				}
				#signal-showtotalchartpart
				{
					width: 100%;
					height:auto;
					display: flex;
					flex-direction: row;
					flex-wrap: wrap;
					float: left;
				}
				.chart-items
				{
					border: 1px solid #696;
					text-align: center; 
					width: 800px;
					height: 300px;
					-webkit-border-radius: 8px;
                    -moz-border-radius: 8px;
					border-radius: 8px;
					-webkit-box-shadow:#666 0px 0px 10px;
					-moz-box-shadow: #666 0px 0px 10px;
					box-shadow: #666 0px 0px 10px;
					background-color: white;
					margin-top: 20px;
					margin-left: 10px;
					margin-bottom: 10px;
					display: none;
				}
				.items-li{
					text-align: right;
					width: 100%;
					height: 30px;
					list-style: none;
					background-color: #00ABEB;
				}
				.items-li>span
				{
					margin-top: 8px;
					margin-right: 8px;
				}
				.chart-item
				{
					width: 750px;
					height: 280px;
				}
				
			</style>
			<script type="text/javascript">
					var  checkArry=[];//全局变量，选中的treeview的值
					var  getChartsItemList=[];//获取要创建的chart个数
						var zzz =0;
					function treeOnChange(allSelectedItems, addedItems, removedItems) {
						if (undefined!=addedItems[0]) {
							if(!checkArry.contains(addedItems[0].value))
							{
								checkArry.push(addedItems[0].value);
								zzz++;
							}
						} 
						if(undefined!=removedItems[0]){
							$.each(checkArry, function(index) {
								if(checkArry[index]==removedItems[0].value)
								{
									checkArry.splice(index,1);
									zzz--;
								}
							});
						}
						for (var j=0;j<zzz;j++) {
							getChartsItemList[j]="$('#chart-items-"+j+"')";
						}
					}
					Array.prototype.contains=function(needle){
						for (var i in this) {
							if(this[i]==needle) return true;
						}
						return false;
					}
	 				function signalCheckPageInit(){
				    	var $select = $('#test-select');
		      			for (var ii = 0; ii < 20; ++ii) {
				        var $option = $('<option value="PIS' + ii +'" data-section="PIS" data-description="The greatest PIS" >PIS信号'+ii+'</option>');
				       		 $select.append($option);
				    	  }
					    var c= $select.treeMultiselect({ 
					   		allowBatchSelection:false,
					    	collapsed:true,
					    	startCollapsed: true,
					    	unique:true,
					    	onChange: treeOnChange
					    });
					    $("#maincontent").on('updateDataToSignalPage',updateData);
	 				}
	 				function updateData(event,params){
	 					var  data1=[1,2,3,4,5,6,7,8,9,10,11,12
	 					,1,2,3,4,5,6,7,8,9,10,11,12
	 					,1,2,3,4,5,6,7,8,9,10,11,12
	 					,1,2,3,4,5,6,7,8,9,10,11,12
	 					,1,2,3,4,5,6,7,8,9,10,11,12
	 					,1,2,3,4,5,6,7,8,9,10,11,12];
					    var  data2=[11,14,22,11,23,17,23,17,23,17,23,17,23
					    ,11,14,22,11,23,17,23,17,23,17,23,17,23
					    ,11,14,22,11,23,17,23,17,23,17,23,17,23
					    ,11,14,22,11,23,17,23,17,23,17,23,17,23
					    ,11,14,22,11,23,17,23,17,23,17,23,17,23
					    ,11,14,22,11,23,17,23,17,23,17,23,17,23];
				    	$("#makesure").click(function(event){	
				    		for (var m=1;m<11;m++) {
				    			if($("#chart-item-"+m))
				    			{
				    				$("#chart-item-"+m).remove();
				    				$("#chart-items-"+m).css("display","none");
				    			}
				    		}
							$("#signal-tree").slideToggle(); 
							$("#signal-showcharts").css("display","block");
					    	$.each(checkArry, function(index) {
					    		var test =index+1;
					    		$("#chart-items-"+test).css("display","block");
					    		$("#chart-items-"+test).append('<div id="chart-item-'+test+'" class="chart-item"></div>');
					    		var stet=document.getElementById("chart-item-"+test);
					    		var signalTitle=checkArry[test-1];
					    		drawChart(stet,signalTitle,data1,data2);
					    	});
					    	event.stopPropagation();
				    	});
				    	$("#signal-show-hide").on('click',function(event){
				    		$("#signal-tree").slideToggle();
				    		event.stopPropagation();
				    	});  
	 				}
					function drawChart(ele,tit,dataX,dataY){
				    	var target=echarts.init(ele);
				    	target.setOption(
				    		option={
				    			title:{text:tit,textStyle:{fontSize:14}},
								tooltip:{trigger:'axis'},
								grid: { left: '3%', right: '4%', bottom: '3%', containLabel: true},
								xAxis:{type:'category', data:dataX},
								yAxis:{type:'value',splitLine:{show:false}}, 
								toolbox:{left:'right',feature:{dataZoom:{yAxisIndex:'none'},restore:{}, saveAsImage:{}}},
								dataZoom:[{starValue:'2017-10-01'},{type:'inside'}],
								series:{name:'列车信号',type:'line',data:dataY}
				    		}
				    	);
				    }
					$(function(){
						//do something
				    });
			</script>
		</div>
	</body>
</html>
