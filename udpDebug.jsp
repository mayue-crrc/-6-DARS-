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
		<script src="<%=basePath %>js/jQuery/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css"/>
		<style type="text/css">
			td
			{
				border: solid 1px silver;
				text-align: center;
			}
			th
			{
				border: solid 1px silver;
				text-align: center;
			}
			#realtime-udptest
			{
				width: 1400px;
				margin-left: 80px;
				margin-top: 50px;
				
			}
			#fault-udptest
			{
				width: 1400px;
				margin-left: 80px;
				margin-top: 50px;
				margin-bottom: 50px;
			}
			table >tbody >tr:nth-child(odd)
			{
				background-color: #D7D8DA;
			}
			table
			{
				table-layout: fixed;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				for (var i=0;i<14;i++) {
					for (var j=0;j<50;j++) {
						var z=j+i*50;
						$("#realtimedata-"+i).append('<td id="realtime-'+z+'">0</td>');
					}
				}
				
				for (var i=0;i<14;i++) {
					for (var j=0;j<50;j++) {
						var z=j+i*50;
						$("#faultdata-"+i).append('<td id="fault-'+z+'">0</td>');
					}
				}
				
				var metroCode=$("#changemetronumber1").val();
				$("#changemetronumber1").change(function(){
					metroCode=$("#changemetronumber1").val();
					for(var i=0;i<650;i++)
						{
							var real=document.getElementById("realtime-"+i);
							real.innerHTML=0;
						}
					$("#realtimeRefreshTime").text('0');
					refreshRunningData(metroCode);
				});
				
				var MetroCode=$("#changemetronumber2").val();
				$("#changemetronumber2").change(function(){
					MetroCode=$("#changemetronumber2").val();
					for(var i=0;i<650;i++)
					{
						var faul=document.getElementById("fault-"+i);
						faul.innerHTML=0;
					}
					$("#faultRefreshTime").text("0");
					refreshFaultDate(MetroCode);
				});
				
				var realflag='';
				var faultflag='';
				var realrefreshflag='';
				var faultrefreshflag='';
				
				$("#confirm1").click(function(){
					$(this).attr("disabled",true);
					$.ajax({
						type:"POST",
						url:"<%=basePath %>udp/realTimeFrame.do",
						data:metroCode,
						dataType:"JSON",
						success:function(data){
							$.each(data, function(index) {
								var currentdata=data[index].toString(16).toLocaleUpperCase();
								var realvalue=document.getElementById("realtime-"+index);
								realvalue.innerHTML=currentdata;
							});
						},
					});
					$.ajax({
						type:"POST",
						url:"<%=basePath %>udp/realTimeFrameRefresh.do",
						data:metroCode,
						dataType:"JSON",
						success:function(data){
							$("#realtimeRefreshTime").text(data);
						},
					});
					realflag= setInterval(refreshRunningData,2000,metroCode);
					realrefreshflag=setInterval(realTimeRefresh,500,metroCode)
				});
				
				$("#cancel1").click(function(){
					$("#confirm1").attr("disabled",false);
					clearInterval(realflag);
					clearInterval(realrefreshflag);
					for(var i=0;i<650;i++)
						{
							var real=document.getElementById("realtime-"+i);
							real.innerHTML=0;
						}
					$("#realtimeRefreshTime").text('0');
				});
				
				$("#confirm2").click(function(){
					$("#confirm2").attr("disabled",true);
					$.ajax({
						type:"POST",
						url:"<%=basePath %>udp/faultFrame.do",
						data:MetroCode,
						dataType:'JSON',
						success:function(data)
						{
							$.each(data, function(index) {
								var currentdata=data[index].toString(16).toLocaleUpperCase();
								var faultvalue=document.getElementById("fault-"+index);
								faultvalue.innerHTML=currentdata;
							});
						}
					});
					$.ajax({
						type:"POST",
						url:"<%=basePath %>udp/faultFrameRefresh.do",
						data:MetroCode,
						dataType:"JSON",
						success:function(data){
							$("#faultRefreshTime").text(data);
						},
					});
					faultflag=setInterval(refreshFaultDate,2000,MetroCode);
					faultrefreshflag=setInterval(faultRefresh,500,MetroCode)
				});
				
				$("#cancel2").click(function(){
					$("#confirm2").attr("disabled",false);
					clearInterval(faultflag);
					clearInterval(faultrefreshflag);
					for(var i=0;i<650;i++)
					{
						var faul=document.getElementById("fault-"+i);
						faul.innerHTML=0;
					}
					$("#faultRefreshTime").text("0");
				});

		});
			function refreshRunningData(metroNum1)
			{
				$.ajax({
					type:"POST",
					url:"<%=basePath %>udp/realTimeFrame.do",
					data:metroCode,
					dataType:"JSON",
					success:function(data){
						$.each(data, function(index) {
							var currentdata=data[index].toString(16).toLocaleUpperCase();
							var realvalue=document.getElementById("realtime-"+index);
							realvalue.innerHTML=currentdata;
						});
					},
					error:function(){
						console.log("运行数据通信故障");
					},
				});
			}
			
			function refreshFaultDate( metroNum2)
			{
				$.ajax({
					type:"POST",
					url:"<%=basePath %>udp/faultFrame.do",
					data:MetroCode,
					dataType:'JSON',
					success:function(data)
					{
						$.each(data, function(index) {
							var currentdata=data[index].toString(16).toLocaleUpperCase();
							var faultvalue=document.getElementById("fault-"+index);
							faultvalue.innerHTML=currentdata;
						});
					},
					error:function(){
						console.log("故障数据通信故障");
					},
				});
			}	
			
			function realTimeRefresh(metroNum1)
			{
				$.ajax({
						type:"POST",
						url:"<%=basePath %>udp/realTimeFrameRefresh.do",
						data:metroCode,
						dataType:"JSON",
						success:function(data){
							$("#realtimeRefreshTime").text(data);
						},
					});
			}
			
			function faultRefresh(metroNum2)
			{
				$.ajax({
						type:"POST",
						url:"<%=basePath %>udp/faultFrameRefresh.do",
						data:MetroCode,
						dataType:"JSON",
						success:function(data){
							$("#faultRefreshTime").text(data);
						},
					});
			}
		</script>
	</head>
	<body>	
		<div id="realtime-udptest">
			<fieldset id="">
				<legend style="font-size: 18px;">运行数据udp测试</legend>
			<div id="checkMetro-1">
				<select id="changemetronumber1">
					<option value="001">001</option>
					<option value="002">002</option>
					<option value="003">003</option>
					<option value="004">004</option>
					<option value="005">005</option>
					<option value="006">006</option>
					<option value="007">007</option>
					<option value="008">008</option>
					<option value="009">009</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="012">012</option>
				</select>
				<button id="confirm1" class="btn btn-default">开始测试</button>
				<button id="cancel1" class="btn btn-default">取消测试</button>
				<label style="margin-left: 5px;">刷新时间：</label>
				<label id="realtimeRefreshTime">0</label>
			</div>
			<table id="getrealtimedata" class="table table-bordered" style="border: silver 1px solid; width: 100%; margin-top: 8px;">
					<tr>
						<th colspan="2">NO.</th>
						<th>0</th>
						<th>1</th>
						<th>2</th>
						<th>3</th>
						<th>4</th>
						<th>5</th>
						<th>6</th>
						<th>7</th>
						<th>8</th>
						<th>9</th>
						<th>10</th>
						<th>11</th>
						<th>12</th>
						<th>13</th>
						<th>14</th>
						<th>15</th>
						<th>16</th>
						<th>17</th>
						<th>18</th>
						<th>19</th>
						<th>20</th>
						<th>21</th>
						<th>22</th>
						<th>23</th>
						<th>24</th>
						<th>25</th>
						<th>26</th>
						<th>27</th>
						<th>28</th>
						<th>29</th>
						<th>30</th>
						<th>31</th>
						<th>32</th>
						<th>33</th>
						<th>34</th>
						<th>35</th>
						<th>36</th>
						<th>37</th>
						<th>38</th>
						<th>39</th>
						<th>40</th>
						<th>41</th>
						<th>42</th>
						<th>43</th>
						<th>44</th>
						<th>45</th>
						<th>46</th>
						<th>47</td>
						<th>48</th>
						<th>49</th>
					</tr>
                    <tr id="realtimedata-0">
						<td colspan="2">0</td>
					</tr>
					<tr id="realtimedata-1">
						<td colspan="2">50</td>
					</tr>
					<tr id="realtimedata-2">
						<td colspan="2">100</td>
					</tr>
					<tr id="realtimedata-3">
						<td colspan="2">150</td>
					</tr>
					<tr id="realtimedata-4">
						<td colspan="2">200</td>
					</tr>
					<tr id="realtimedata-5">
						<td colspan="2">250</td>
					</tr>
					<tr id="realtimedata-6">
						<td colspan="2">300</td>
					</tr>
					<tr id="realtimedata-7">
						<td colspan="2">350</td>
					</tr>
					<tr id="realtimedata-8">
						<td colspan="2">400</td>
					</tr>
					<tr id="realtimedata-9">
						<td colspan="2">450</td>
					</tr>
					<tr id="realtimedata-10">
						<td colspan="2">500</td>
					</tr>
					<tr id="realtimedata-11">
						<td colspan="2">550</td>
					</tr>
					<tr id="realtimedata-12">
						<td colspan="2">600</td>
					</tr>
			</table>
			</fieldset>
		</div>
		<div id="fault-udptest">
			<fieldset id="">
				<legend style="font-size:18px;">故障数据udp测试</legend>
			<div id="checkMetro-2">
				<select id="changemetronumber2">
					<option value="001">001</option>
					<option value="002">002</option>
					<option value="003">003</option>
					<option value="004">004</option>
					<option value="005">005</option>
					<option value="006">006</option>
					<option value="007">007</option>
					<option value="008">008</option>
					<option value="009">009</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="012">012</option>
				</select>
				<button id="confirm2" class="btn btn-default">开始测试</button>
				<button id="cancel2" class="btn btn-default">取消测试</button>
				<label style="margin-left: 5px;">刷新时间：</label>
				<label id="faultRefreshTime">0</label>
			</div>
			<table id="fault" class="table table-bordered" style="width: 100%; margin-top: 8px;">
					<tr>
						<th colspan="2">NO.</th>
						<th>0</th>
						<th>1</th>
						<th>2</th>
						<th>3</th>
						<th>4</th>
						<th>5</th>
						<th>6</th>
						<th>7</th>
						<th>8</th>
						<th>9</th>
						<th>10</th>
						<th>11</th>
						<th>12</th>
						<th>13</th>
						<th>14</th>
						<th>15</th>
						<th>16</th>
						<th>17</th>
						<th>18</th>
						<th>19</th>
						<th>20</th>
						<th>21</th>
						<th>22</th>
						<th>23</th>
						<th>24</th>
						<th>25</th>
						<th>26</th>
						<th>27</th>
						<th>28</th>
						<th>29</th>
						<th>30</th>
						<th>31</th>
						<th>32</th>
						<th>33</th>
						<th>34</th>
						<th>35</th>
						<th>36</th>
						<th>37</th>
						<th>38</th>
						<th>39</th>
						<th>40</th>
						<th>41</th>
						<th>42</th>
						<th>43</th>
						<th>44</th>
						<th>45</th>
						<th>46</th>
						<th>47</td>
						<th>48</th>
						<th>49</th>
					</tr>
                    <tr id="faultdata-0">
						<td colspan="2">0</td>
					</tr>
					<tr id="faultdata-1">
						<td colspan="2">50</td>
					</tr>
					<tr id="faultdata-2">
						<td colspan="2">100</td>
					</tr>
					<tr id="faultdata-3">
						<td colspan="2">150</td>
					</tr>
					<tr id="faultdata-4">
						<td colspan="2">200</td>
					</tr>
					<tr id="faultdata-5">
						<td colspan="2">250</td>
					</tr>
					<tr id="faultdata-6">
						<td colspan="2">300</td>
					</tr>
					<tr id="faultdata-7">
						<td colspan="2">350</td>
					</tr>
					<tr id="faultdata-8">
						<td colspan="2">400</td>
					</tr>
					<tr id="faultdata-9">
						<td colspan="2">450</td>
					</tr>
					<tr id="faultdata-10">
						<td colspan="2">500</td>
					</tr>
					<tr id="faultdata-11">
						<td colspan="2">550</td>
					</tr>
					<tr id="faultdata-12">
						<td colspan="2">600</td>
					</tr>
			</table>
			</fieldset>
		</div>
	</body>
</html>
