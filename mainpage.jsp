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
		<script src="<%=basePath %>js/jquery-ui.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="j<%=basePath %>s/jquery.datetimepicker.full.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="<%=basePath %>js/jquery.dataTables.js" ></script>
		<script src="<%=basePath %>js/jquery.tree-multiselect.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="<%=basePath %>css/dataTables.jqueryui.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery-ui.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery-ui.theme.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery-ui.structure.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery.datetimepicker.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery.tree-multiselect.min.css"/>
		<style type="text/css" >

			html {
			
				height: 100%;
			}
			.header
			{
				width:97%;
				height: 80px;
				background-image: url(images/sky.jpg);
				background-size: 100% 80px;
				align-content: center;
				font-size: 25px;
				font-family:Arial, Helvetica, sans-serif; 
			    color:#FF0000;
			    line-height:35px;
			    text-transform:uppercase

			}
			#head-title
			{
				width: 25%;
				height: 100%;
				float: left;
				background-image: url(images/crrc-logo1.png);
				background-size:contain;
				background-repeat: no-repeat;
			}
			#menu
			{
				width: 15%;
				float: left;
				height: 900px;
				font-family: "微软雅黑";
				font-size: 17px;
				background-color:#E9E9E9;
				background-image: url(images/menubackground.jpg);
				background-size: 100% 900px;
				background-repeat: no-repeat;
			}
			body
			{
				font-size: 16px;
				font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
				height:auto;
			}
			.menu-item
			{
				border-bottom-color:white;
				border-width: 1px;
				width: 90%;
				height: 50px;
				color: white;
				margin-top: 1px;
				margin-left:5%;
				line-height: 50px;
				box-shadow: 0px 0px 10px 5px silver ;
				background:-webkit-gradient(linear, left top, right top, from(#317ef3), to(#acdef7)); -webkit-background-origin:padding; -webkit-background-clip:content;
				background: -moz-linear-gradient(left, #317ef3 0%, #acdef7 100%); 
				background: -webkit-gradient(linear, left top, right top, color-stop(0%,#317ef3), color-stop(100%,#acdef7)); 
				background: -webkit-linear-gradient(left, #317ef3 0%,#acdef7 100%); 
				background: -o-linear-gradient(left, #317ef3 0%,#acdef7 100%); 
				background: -ms-linear-gradient(left, #317ef3 0%,#acdef7 100%); 
				/*background: linear-gradient(to right, #333333 0%,#8F8F94 100%); */
				background: linear-gradient(to right, #317ef3 0%,#acdef7 100%);
				border-radius:10px;
			}
			.menu-item:first-child
			{
				margin-top: 30px;
			}
			#login_drop
			{
  				float: right;
				margin-top: 5px;
				margin-right: 5px;
				border-radius: 10px;
				color:black;
				 
			}
			
			.itemhover{
				box-shadow: 0px 0px 10px 5px silver;
				background:-webkit-gradient(linear, left top, right top, from(#008cd7), to(#00aaea)); -webkit-background-origin:padding; -webkit-background-clip:content;
				background: -moz-linear-gradient(left, #008cd7 0%, #00aaea 100%); 
				background: -webkit-gradient(linear, left top, right top, color-stop(0%,#008cd7), color-stop(100%,#00aaea)); 
				background: -webkit-linear-gradient(left, #008cd7 0%,#00aaea 100%); 
				background: -o-linear-gradient(left, #008cd7 0%,#00aaea 100%); 
				background: -ms-linear-gradient(left, #008cd7 0%,#00aaea 100%); 
				/*background: linear-gradient(to right, #AAAAAA 0%,silver 100%); */
				background: linear-gradient(to right, #008cd7 0%,#00aaea 100%);
			}
			.itemclick
			{
				color:black;
				border-radius:10px 0px 0px 10px;
				width: 92%;
				margin-left: 8%;
				height: 60px;
				line-height: 60px;
				font-size: larger;
				background:-webkit-gradient(linear, left top, right top, from(#E9E9E9), to(#fff)); -webkit-background-origin:padding; -webkit-background-clip:content;
				background: -moz-linear-gradient(left, #E9E9E9 0%, #fff 100%); 
				background: -webkit-gradient(linear, left top, right top, color-stop(0%,#E9E9E9), color-stop(100%,#fff)); 
				background: -webkit-linear-gradient(left, #E9E9E9 0%,#fff 100%); 
				background: -o-linear-gradient(left, #E9E9E9 0%,#fff 100%); 
				background: -ms-linear-gradient(left, #E9E9E9 0%,#fff 100%); 
				background: linear-gradient(to right, #E9E9E9 0%,#fff 100%); 
				border-left: none;
				box-shadow:none;
			}
			.menu-icon
			{
				width: 20px;
				height: 20px;
				margin-left: 5px;
				margin-top: 15px;
				float: left;
			}
			.menu-click-icon
			{
				width:30px;
				height:30px ;
				margin-top:15px;
				margin-left: 5px;
				float: left;
			}
			#maincontent
			{
				width: 81%;
				height: auto; 
				float: left;
				margin-left: 20px;
				margin-top: 20px;
				border: 2px #4682B4 solid;
				border-radius: 8px;
				background-image: url(images/mainpagebackground.png);
				background-size: cover;
				background-repeat: no-repeat;
			}
			#checkoutmsg
			{
				width: 81%;
				margin-top: 10px;
				margin-left: 20px;
				margin-bottom: 2px;
				display: none;
				float: left;
			}
			label
			{
				font: "微软雅黑";
				font-size: 15px; 
				border-radius:5px;
				height:25px;
				line-height:25px;
			}
			form{padding: 0;margin: 0;}
			.shortinput{margin-bottom:12px; width:15%; border-radius:8px; display:inline;}
			.longinput{margin-bottom:12px; width:60%; border-radius:8px; display:inline;}
			fieldset { padding:0; border:2; margin-top:15px; }
			legend{padding:0; border:2; margin-bottom:15px;}
			.validateTips { border: 1px solid transparent; padding: 0.3em; }
			
			#dialog-userModify label{display:inline-block;width:80px;text-align:right;}
				
			
		</style>
	</head>
	<body>
		<div class="header">
				<div id="head-title">
				</div>
				<div style="float: left;margin-left: 180px; margin-top: 20px; font-size: 30px;"><b></b></div>
				<div style="float: right; margin-top: 40px; font-size: 15px;">
					<label style="color:white;margin-right: 10px;">账户管理</label>
					<select id="login_drop">
						<option>用户信息</option>
						<option>管理员系统维护</option>
						<option>退出登录</option>
					</select>
				</div>
		</div>
		<div id="menu">
			<div id="menu-item1" class="menu-item"><div class="menu-icon" style=" background-image: url(images/runningpage.png);background-size: contain;"></div><span style="margin-left: 5px;">车辆线路总览</span></div>
			<div id="menu-item2" class="menu-item"><div class="menu-icon" style=" background-image:url(images/runningstatepage.png);background-size: contain;"></div><span style="margin-left: 5px;">实时运行状态</span></div>
			<div id="menu-item3" class="menu-item"><div class="menu-icon" style=" background-image:url(images/faultquerypage.png);background-size: contain;"></div><span style="margin-left: 5px;">故障查询</span></div>
			<div id="menu-item4" class="menu-item"><div class="menu-icon" style=" background-image:url(images/cumulantquerypage.png);background-size: contain;"></div><span style="margin-left: 5px;">累计量查询分析</span></div>
			<div id="menu-item5" class="menu-item"><div class="menu-icon" style=" background-image:url(images/signalpage.png);background-size: contain;"></div><span style="margin-left: 5px;">车辆状态分析</span></div>
			<div id="menu-item6" class="menu-item"><div class="menu-icon" style=" background-image:url(images/metromenagementpage.png);background-size: contain;"></div><span style="margin-left: 5px;">车辆管理</span></div>
			<div id="menu-item7" class="menu-item"><div class="menu-icon" style=" background-image:url(images/usermenagementpage.png);background-size: contain;"></div><span style="margin-left: 5px;">用户管理</span></div>
		</div>
		<div>
			<div id="checkoutmsg">
				<fieldset id="" style="border:2px #4682B4 solid; padding-left: 15px; padding-bottom: 12px;">
					<legend>条件选择</legend>
						<select id="changemetronumber">
							<option value="0601">0601</option>
							<option value="0602">0602</option>
							<option value="0603">0603</option>
							<option value="0604">0604</option>
							<option value="0605">0605</option>
							<option value="0606">0606</option>
							<option value="0607">0607</option>
							<option value="0608">0608</option>
							<option value="0609">0609</option>
							<option value="0610">0610</option>
							<option value="0611">0611</option>
							<option value="0612">0612</option>
						</select>
						<label style="font: '微软雅黑';font-size: 17px; border-radius:5px;height:25px;line-height:25px;">查询起始时间：</label><input type="text" id="datepickerstart"></input>
						<label style="font: '微软雅黑';font-size: 17px; border-radius:5px;height:25px;line-height:25px;">查询结束时间：</label><input type="text" id="datepickerend"></input>
						<input type="button" name="makesure" id="makesure" value="确定" />
				</fieldset>	
			</div>
			<div id = "dialog-userModify" title = "修改密码">
				<form>
					<p class = "validateTips">所有的表单字段都是必填的</p >
					<fieldset>
						<legend>修改密码</legend>
						<label>用户名</label><input type="text" id="userNameinput" class="longinput" readonly="true">
						<label>原密码</label><input type="password" id="oldPasswordinput" class="longinput" ><br />
						<label>新密码</label><input type="password" id="newPasswordinput" class="longinput" ><br />
						<label>新密码确认</label><input type="password" id="newPasswordConfirminput" class="longinput" ><br />
					</fieldset>
				</form>				
			</div>
			<div id="maincontent">
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				//websocket测试
//				var socket=new WebSocket('ws://121.40.165.18:8088');
//				socket.onopen=function(event){
//					socket.send("Iam a boy!");
//					socket.onmessage=function(data){
//						console.log("hahha",data);
//					};
//					socket.onclose=function(event){
//						console.log("wuwuwu",event);
//					};
//				}
//				socket.close();
				$(".menu-item").hover(function(){
					$(this).toggleClass('itemhover');
				});
				var userNameinput = $("#userNameinput");
				var oldPasswordinput = $("#oldPasswordinput");
				var newPasswordinput = $("#newPasswordinput");
				var newPasswordConfirminput = $("#newPasswordConfirminput");
			    var tips = $(".validateTips");
			    var allinput_passwordmodify = $([]).add(oldPasswordinput).add(newPasswordinput).add(newPasswordConfirminput);
			    $.ajax({
					type:"post",
					url:"<%=basePath%>user/getCurrentUser.do",
					async:true,
					dataType:"JSON",
					success:function(data){
						userNameinput.val(data.userName);
					}
				});	
		
				$("#dialog-userModify").dialog({
					heigth:350,
			        width: 400,	
			    	modal:true,
			        autoOpen: false,
			        show: {
			        	duration: 200
			        },
			        hide: {
			        	duration: 200
			        },	
			        buttons:{
			        	"修改":function(){
			        		var bValid  =true;
			        		allinput_passwordmodify.removeClass("ui-state-error");
			        		
			        		bValid = bValid&&checkLength(oldPasswordinput,"原密码",6,12);
			        		bValid = bValid&&checkLength(newPasswordinput,"新密码",6,12);
			        		bValid = bValid&&checkLength(newPasswordConfirminput,"确认密码密码",6,12);
			        		
			        		bValid = bValid&&checkRegexp(oldPasswordinput,/^([0-9a-zA-Z])+$/,"字段只允许： a-z 0-9");
			        		bValid = bValid&&checkRegexp(newPasswordinput,/^([0-9a-zA-Z])+$/,"字段只允许： a-z 0-9");
			        		bValid = bValid&&checkRegexp(newPasswordConfirminput,/^([0-9a-zA-Z])+$/,"字段只允许： a-z 0-9");

			        		if(newPasswordinput.val()!=newPasswordConfirminput.val())
			        		{
			        			bValid = false;
			        			updateTips("新密码与确认密码不一致！")
			        		}
			        		
							if(bValid)
							{
								var params_password = {
									oldPassword:oldPasswordinput.val(),
									newPassword:newPasswordinput.val()
								};
								$.ajax({
									type:"post",
									url:"<%=basePath%>user/password.do",
									data:params_password,
									dataType:"JSON",
									async:true,
									success:function(data){
										if(data == "true")
										{
											alert("密码修改成功");
										}else{
											alert("密码修改失败");
										}
									}
								});
								tips.text("所有的表单字段都是必填的");
								allinput_passwordmodify.val("").removeClass("ui-state-error");
			        			$(this).dialog("close");
							}
			        	},
			        	"取消":function(){
							tips.text("所有的表单字段都是必填的");
							allinput_passwordmodify.val("").removeClass("ui-state-error");
			        		$(this).dialog("close");
			        	},			        	
			        }
				})
				$("#login_drop").change(function(){
					if($("option:selected",this).index() == 0)
					{
						$("#dialog-userModify").dialog("open");
					}
					if($("option:selected",this).index() == 2)
					{
						$.ajax({
							type:"get",
							url:"/logout.do",
							success:function(data){
								//添加select的options
							},							
						})
					}
		        }).focus(function(){
		            $(this)[0].selectedIndex = -1;
		        });
		        
				$.ajax({
					type:"get",
					url:"",
					dataType:'JSON',
					success:function(data){
						//添加select的options
						var	metroNumber=data;	
					},
				});
				//获取目前用户的类型
				$.ajax({
					type:"get",
					url:"",
					dataType:'JSON',
					success:function(data){
						//判断用户类型，当用户为普通用户是不显示用户管理菜单，当为管理员用户时显示用户管理菜单
						var  userType=data;
					}
				});
				var params={}
				$("#changemetronumber").selectmenu({width:100,});
				$("#makesure").button();
				var getMetroNumber=$("#changemetronumber").val();
				$("#changemetronumber").change(function(){
					getMetroNumber=$("#changemetronumber").val();
					params.metroNumber=getMetroNumber;
				});
				var getStartTime=$("#datepickerstart").val();
				$("#datepickerstart").change(function(){
					getStartTime=$("#datepickerstart").val();
					params.startTime=getStartTime;
				});
				var getEndTime=$("#datepickerend").val();
				$("#datepickerend").change(function(){
					getEndTime=$("#datepickerend").val();
					params.endTime=getEndTime;
				});			
				changePageSize();
				$(".menu-item").click(function(){
					if(!$(this).hasClass("itemclick"))
					{
						$(".menu-item").removeClass("itemclick");
						$(this).addClass("itemclick");
					} 
					if(!$(this).find("div.menu-icon").hasClass("menu-click-icon"))
					{
						$(".menu-item").find("div.menu-icon").removeClass("menu-click-icon");
						$(this).find("div.menu-icon").addClass("menu-click-icon");
					}
			
				});
				$.ajax({
					type:"get",
					url:'overview.html',
					dataType:"html",
					success:function(data){
						$("#maincontent").unbind();
						$("#checkoutmsg").css("display","none");
						var inputcontent=$('<code></code>').append(data);
						$("#maincontent").html(inputcontent.find('#runningPage')); 
					},
				});
				$("#menu-item1").addClass("itemclick");
				$("#menu-item1").click(function(){
					$("#maincontent").empty();
					var item1URL='overview.html';
					$.ajax({
						type:"get",
						url:item1URL,
						dataType:"html",
						success:function(data){
							$("#maincontent").unbind();
							$("#checkoutmsg").css("display","none");
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find('#runningPage'));
							
						},
					});
				});
				
				$("#menu-item2").click(function(){
					$("#maincontent").empty();
					var item2URL='realtime.html';
					$.ajax({
						type:"get",
						url:item2URL,
						dataType:'html',
						success:function(data){
							$("#maincontent").unbind();
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find('#runningstatepage'));
							$("#checkoutmsg label").css("display","none");
							$("#datepickerstart").css("display","none");
							$("#datepickerend").css("display","none");
							$("#checkoutmsg").css("display","block");
							$("#makesure").unbind('click');
						},
					});
				});
				
				$("#menu-item3").click(function(){
					$("#maincontent").empty();
					var item3URL='faultCheck.html';
					$.ajax({
						type:"get",
						url:item3URL,
						dataType:"html",
						success:function(data){
							$("#maincontent").unbind();
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find("#faultcheckPage"));
							$("#checkoutmsg label").css("display","none");
							$("#datepickerstart").css("display","none");
							$("#datepickerend").css("display","none");
							$("#checkoutmsg").css("display","block");
							$("#makesure").unbind('click');
							initView();
							$("#maincontent").trigger("updateDataToFaultqueryPage",params); 
						},
					});
				});
				$("#menu-item4").click(function(){
					$("#maincontent").empty();
					var item4URL='cumulantCheck.html';
					$.ajax({
						type:"get",
						url:item4URL,
						dataType:'html',
						success:function(data){
							$("#maincontent").unbind();
							$("#makesure").unbind('click');
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find("#cumulantcontent"));
							$("#checkoutmsg label").css("display","none");
							$("#datepickerstart").css("display","none");
							$("#datepickerend").css("display","none");
							$("#checkoutmsg").css("display","block");
							cumulantQueryPageInit();
							$("#maincontent").trigger("updateDataToCumulantPage",params);
						},
					});
				});
				$("#menu-item5").click(function(){
					var item5URL='signalCheck.html';
					$.ajax({
						type:"get",
						url:item5URL,
						dataType:'html',
						success:function(data){
							$("#maincontent").unbind();
							$("#makesure").unbind();
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find("#signalCheckPage"));
							$("#checkoutmsg label").css("display","inline-block");
							$("#datepickerstart").css("display","inline-block");
							$("#datepickerend").css("display","inline-block");
							$("#checkoutmsg").css("display","block");
							signalCheckPageInit(); 
							$("#maincontent").trigger("updateDataToSignalPage",params); 
						},
					});
				});
				$("#menu-item6").click(function(){
					var  item6URL='metroManage.html';
					$.ajax({
						type:"get",
						url:item6URL,
						dataType:'html',
						success:function(data){
							$("#maincontent").unbind();
							$("#checkoutmsg").css("display","none");
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find("#metroManagementPage"));
							initMetroView();
							$("#maincontent").trigger('updateMetroManagementPage',params);
						},
					});
				});
				$("#menu-item7").click(function(){
					var  item7URL='userManage.html';
					$.ajax({
						type:"get",
						url:item7URL,
						dataType:'html',
						success:function(data){
							$("#maincontent").unbind();
							$("#checkoutmsg").css("display","none");
							var inputcontent=$('<code></code>').append(data);
							$("#maincontent").html(inputcontent.find("#userManagementPage"));
							initUserView();
							//$("#maincontent").trigger('updateUserManagementPage',params);
						},
					});
				});
				
				$( "#datepickerstart" ).datetimepicker({
						lang:'ch',
						todayButton:true, 
				});
				$( "#datepickerend" ).datetimepicker({
					lang:'ch',
					todayButton:true,
				});
				$.datetimepicker.setLocale('ch');
				
		})
			function changePageSize(){
				var changeWidth=window.screen.availWidth;
				$("body").css("width",changeWidth+"px");
			}
			function updateTips( t ) {
			   	$( ".validateTips" )
			      	.text( t )
			        .addClass( "ui-state-highlight" );
			      setTimeout(function() {
			        $( ".validateTips" ).removeClass( "ui-state-highlight", 1500 );
			      }, 500 );
			    }
			function checkRegexp( o, regexp, n ) {
			    if ( !( regexp.test( o.val() ) ) ) {
			        o.addClass( "ui-state-error" );
			        updateTips( n );
			        return false;
			    } else {
			        return true;
			      }
			}			 
			function checkLength( o, n, min, max ) {
			      if ( o.val().length > max || o.val().length < min ) {
			        o.addClass( "ui-state-error" );
			        updateTips( "" + n + " 的长度必须在 " +
			          min + " 和 " + max + " 之间。" );
			        return false;
			      } else {
			        return true;
			      }
			}
	</script>
	</body>
</html>
