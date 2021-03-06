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
	<div id="runningPage">
		<div id="metrocurrentstate">
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06001</span>
				</div>
				<div class="overviewitemicon">	
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：五路居站</span></div>
					<div id=""><span>下一站：田村站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>
			
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06002</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：苹果园站</span></div>
					<div id=""><span>下一站：苹果园南路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06003</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：廖公庄站</span></div>
					<div id=""><span>下一站：田村站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06004</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：玉泉路站</span></div>
					<div id=""><span>下一站：永定路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06005</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：巨山路站</span></div>
					<div id=""><span>下一站：砂石厂站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06006</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：苹果园东街站</span></div>
					<div id=""><span>下一站：苹果园南路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06007</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：五环路站</span></div>
					<div id=""><span>下一站：京门铁路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06008</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：京门铁路站</span></div>
					<div id=""><span>下一站：101铁路线</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06009</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：苹果园南路站</span></div>
					<div id=""><span>下一站：五环路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06010</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：永定路站</span></div>
					<div id=""><span>下一站：玉泉路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06011</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：田村东路站</span></div>
					<div id=""><span>下一站：砂石厂路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06012</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：砂石厂路站</span></div>
					<div id=""><span>下一站：巨山路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06013</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：五环路站</span></div>
					<div id=""><span>下一站：京门铁路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
			<div class="overviewitem">
				<div id="" class="overviewitemheader">
					<span>06014</span>
				</div>
				<div class="overviewitemicon">
					
				</div>
				<div class="overviewvalue">
					<div id=""><span>当前站：苹果园站</span></div>
					<div id=""><span>下一站：苹果园南路站</span></div>
					<div id=""><span>网压：1500V</span></div>
					<div id=""><span>网流：10A</span></div>
					<div id=""><span>模式：ATO</span></div>
				</div>
			</div>	
		</div>
		<!--
        	描述： 以后可能添加
        <div id="metrofaultlist">
			
		</div>
		<div id="metrolist">
			
		</div>-->
		<style type="text/css">
			#runningPage
			{
				width: 1100px;
				height: 800px;
			}
			#metrocurrentstate
			{
				width:100%;
				height:600px;
			}
			.overviewitem
			{
				border: 3px solid #0078AE;
				text-align: center; 
				width: 200px;
				height: 250px;
				-webkit-border-radius: 12px;
                -moz-border-radius: 12px;
				border-radius: 12px;
				-webkit-box-shadow:#666 0px 0px 10px;
				-moz-box-shadow: #666 0px 0px 10px;
				box-shadow: #666 0px 0px 10px;
				background-color: white;
				margin-left: 13px;
				margin-top: 10px;
				margin-bottom: 10px;
				float: left;
				background:-webkit-gradient(linear, left top, left bottom, from(#E9E9E9), to(#fff)); -webkit-background-origin:padding; -webkit-background-clip:content;
				background: -moz-linear-gradient(left, #E9E9E9 0%, #fff 100%); 
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#E9E9E9), color-stop(100%,#fff)); 
				background: -webkit-linear-gradient(top, #E9E9E9 0%,#fff 100%); 
				background: -o-linear-gradient(top, #E9E9E9 0%,#fff 100%); 
				background: -ms-linear-gradient(top, #E9E9E9 0%,#fff 100%); 
				background: linear-gradient(to bottom, #E9E9E9 0%,#fff 100%); 
			}
			.overviewitemheader
			{
				-webkit-border-radius: 11px 11px 0px 0px;
                -moz-border-radius: 11px 11px 0px 0px;
				border-radius: 11px 11px 0px 0px;
				width: 100%;
				height: 30px;
				border-bottom: 2px solid #003EFF;
			}
			.overviewitemheader span
			{
				display: inline-block;
				line-height: 30px;
				font-family: "微软雅黑";
				font-size: 18px;
			}
			.overviewitemicon 
			{
				width: 40%;
				height: 80px;
				margin-left: 30%;
				background-image: url(images/nomal.png);
				background-size:contain;
				background-repeat: no-repeat;
			}
			.overviewvalue
			{
				width: 100%;
				height: auto;
				border-top: 2px solid #003EFF;
				padding-top: 6px;
			}
			.overviewvalue div
			{
				font-family: "微软雅黑";
				font-size: 15px;
				margin-top: 4px;
				background:-webkit-gradient(linear,  top,  bottom, from(#d8f2fc), to(#fff)); -webkit-background-origin:padding; -webkit-background-clip:content;
				background: -moz-linear-gradient(top, #d8f2fc 0%, #fff 100%); 
				background: -webkit-gradient(linear,  top, bottom, color-stop(0%,#d8f2fc), color-stop(100%,#fff)); 
				background: -webkit-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
				background: -o-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
				background: -ms-linear-gradient(top, #d8f2fc 0%,#fff 100%); 
				background: linear-gradient(to bottom, #d8f2fc 0%,#fff 100%); 
			}
		</style>
		<script type="text/javascript">	
			function initRuningPage(){
				$.ajax({
					type:"get",
					url:"",
					async:true,
					dataType:"JSON",
					success:function(data){
						var  dataList=data;
						$.each(dataList, function(index) {
							//添加块状区域
							var itemnode=document.createElement('div');
							itemnode.id="overviewitem"+index;
							itemnode.class="overviewitem";
							$("#metrocurrentstate").appendChild(itemnode);
							//添加头
							var itemheadr=document.createElement('div');
							itemheadr.class='overviewitemheader';
							itemheadr.append('<span>'+dataList[index].metroNumber+'</span>');
							$("#metrocurrentstate").appendChild(itemheadr);
							//添加图标区
							var itemImg=document.createElement('div');
							itemImg.class='overviewitemicon';
							if(dataList[index].state=='nomal')
							{
								itemImg.style.backgroundImage='url(images/nomal.png)';
								itemImg.style.backgroundSize='contain';
								itemImg.style.backgroundRepeat='no-repeat';
							}
							else if(dataList[index].state='fault')
							{
								itemImg.style.backgroundImage='url(images/fault.png)';
								itemImg.style.backgroundSize='contain';
								itemImg.style.backgroundRepeat='no-repeat';
							}
							else//剩下的状态判定为离线
							{
								itemImg.style.backgroundImage='url(images/outline.png)';
								itemImg.style.backgroundSize='contain';
								itemImg.style.backgroundRepeat='no-repeat';
							}
							//添加数据区
							var itemdata=document.createElement('div');
							itemdata.class='overviewvalue';
							itemdata.append('<div><span>当前站：'+dataList[index].currentsituation+'</span></div>');
							itemdata.append('<div><span>下一站：'+dataList[index].nextsituation+'</span></div>');
							itemdata.append('<div><span>网压：'+dataList[index].linecurrent+'</span></div>');
							itemdata.append('<div><span>网流：'+dataList[index].lineFlow+'</span></div>');
							itemdata.append('<div><span>模式：'+dataList[index].mode+'</span></div>');
						});
					}
				});
				
				
			}
		</script>
	</div>		
	</body>
</html>
