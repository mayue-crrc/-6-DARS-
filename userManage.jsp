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
		<title>	</title>	
	</head>
	<body>
		<div id = "userManagementPage">
			<style type = "text/css">
			td
			{
				text-align: center;
				font-size: 10px;
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
			#pageContent{
				width: 98%;
				height:650px;
			    margin-right: 15px;
				padding: 15px;
			}

			#title
			{
				font-family: "楷体";
				display: block;
				font-size: 18px;
				width: 100%;
				height: 38px;
				line-height:38px;
				background-color: #B6B6B6;
				color: white;
				text-align: center;
			}
			.button {
			    background-color: #008CBA; /* Green */
			    border-radius: 8px;
				width: 40px;
				height: 38px;
				background-image: url(images/createNew.png);
				background-size: 40px 38px;
			    float: right;
			}
			form{padding: 0;margin: 0;}
			label{display:inline-block;width:80px;text-align:right;}
			.shortinput{margin-bottom:12px; width:15%; border-radius:8px; display:inline;}
			.longinput{margin-bottom:12px; width:60%; border-radius:8px; display:inline;}
		    fieldset { padding:0; border:2; margin-top:15px; }
		    legend{padding:0; border:2; margin-bottom:15px;}
		    h1 { font-size: 1.2em; margin: .6em 0; }

		    .validateTips { border: 1px solid transparent; padding: 0.3em; }			
			</style>
			
			<script type = "text/javascript">
			

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
			    
				function userCheck(){
					var userName = $("#userNameCreate").val();
					
					$.ajax({
						type:"post",
						url:"<%=basePath%>user/exist.do",
						async:true,
						data:{"userName":userName},
						dataType:"JSON",
						success:function(data){
							if(data == "true")
							{
								$("#userNameCreate").val("");
								updateTips("用户名已存在！");
							}
						}
					});
				}
			
				function initUserView(){
					$("#createNew").unbind();
					var userTable = $("#userTable").DataTable({
						"bPaginate":false,
						"searching":false,
						"info":false,
						"bSort":false,
						"bAutoWidth":true,
						"destroy":true,
					});
        			var tmp_Date = new Date();
				    var m_currentDatetime = tmp_Date.toLocaleDateString()+" "+tmp_Date.toLocaleTimeString();					
					var tips = $(".validateTips");

					var userNameinput = $("#userNameinput");
					var userPasswordinput = $("#userPasswordinput");
					var userCreateDateinput = $("#userCreateDateinput");
					var userEnableinput = $("#userEnableinput");
					var userDescriptioninput = $("#userDescriptioninput");
					var allinput = $([]).add(userNameinput).add(userPasswordinput)
										.add(userCreateDateinput).add(userEnableinput).add(userDescriptioninput)
					
					
					var userNameCreate = $("#userNameCreate");
					var userPasswordCreate = $("#userPasswordCreate");
					var userTypeCreate = $("#userTypeCreate");
					var userEnableCreate = $("#userEnableCreate");
					var userDescriptionCreate = $("#userDescriptionCreate");
					var allCreate = $([]).add(userNameCreate).add(userPasswordCreate)
										.add(userTypeCreate).add(userEnableCreate).add(userDescriptionCreate)
										
					$.ajax({
						type:"get",
						url:"<%=basePath%>user/allNormal.do",
						async:true,
						dataType:"JSON",
						success:function(data){
							userTable.fnClearTable();
							userTable.fnDestroy();
							var userListBean;
							$.each(data, function(index) {
								userListBean=data[index];
								userTable.row.add([userListBean.id,userListBean.userName,userListBean.createTime,userListBean.enable,userListBean.description]).draw();
							});
						},
					});
					//用于记录总条目数
					var cnt = 0;
					//用于向后台发送
					var userBean={
							userName:null,
							password:null,
							userType:null,
							createTime:null,
							enable:null,
							description:null,
						};
					//用于保存选中行的值
					var userBeanSelect={
							userNameSelect:null,
							userTypeSelect:null,
							usercreateTimeSelect:null,
							userenable:null,
							userDescriptionSelect:null,
						};
					
					$("#user-dialog-form").dialog({
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
					        	"更新":function(){
					        		var bValid = true;
					        		bValid = bValid&&checkLength(userPasswordinput,"密码",6,12);
					        		
					        		if(bValid)
					        		{
					        			userBean.userName = userNameinput.val();
					        			userBean.password = userPasswordinput.val();
					        			userBean.userType = "用户";
					        			userBean.createTime = m_currentDatetime;
					        			userBean.enable = userEnableinput.val();
					        			userBean.description = userDescriptioninput.val();
					        			
					        			$.ajax({
					        				type:"post",
					        				url:"<%=basePath%>user/update.do",
					        				data:{"userBean":userBean},
					        				dataType:"JSON",
					        				async:true,
					        				success:function(data){
					        					if(data == "true")
					        					{
					        						alert("用户更新成功！！");
					        						$.ajax({
														type:"get",
														url:"<%=basePath%>user/allNormal.do",
														async:true,
														dataType:"JSON",
														success:function(data){
															userTable.fnClearTable();
															userTable.fnDestroy();
															var userListBean;
															$.each(data, function(index) {
																userListBean=data[index];
																userTable.row.add([userListBean.id,userListBean.userName,userListBean.createTime,userListBean.enable,userListBean.description]).draw();
															});
														},
													});
					        					}else{
					        						alert("用户更新失败！！");					        											        						
					        						
					        					}
					        				}
					        			});
										tips.text("所有的表单字段都是必填的");
					        			allinput.val("").removeClass("ui-state-error");
					        			$(this).dialog("close");
					        		}
					        	},
					        	"删除":function(){
						        	var r=confirm("确认删除用戶信息？");
					      		  	if(r == true){
										var userName = userNameinput.val();
					        			$.ajax({
					        				type:"post",
					        				url:"<%=basePath%>user/delete.do",
					        				data:{"userName":userBean},
					        				dataType:"JSON",
					        				async:true,
					        				success:function(data){
					        					if(data == "true")
					        					{
					        						alert("用户删除成功！！");
					        						$.ajax({
														type:"get",
														url:"<%=basePath%>user/allNormal.do",
														async:true,
														dataType:"JSON",
														success:function(data){
															userTable.fnClearTable();
															userTable.fnDestroy();
															var userListBean;
															$.each(data, function(index) {
																userListBean=data[index];
																userTable.row.add([userListBean.id,userListBean.userName,userListBean.createTime,userListBean.enable,userListBean.description]).draw();
															});
														},
													});
					        					}else{
					        						alert("用户删除失败！！");					        											        						
					        						
					        					}
					        				}
					        			});
										tips.text("所有的表单字段都是必填的");
					        			
					        			allinput.val("").removeClass("ui-state-error");
					        			$(this).dialog("close");	
					      		  	}else{
					      		  		
					      		  	}
					        		
					        		
				        		
					        	},
					        	"取消":function(){
									tips.text("所有的表单字段都是必填的");
				        			
				        			allinput.val("").removeClass("ui-state-error");
				        			$(this).dialog("close");					        		
					        	}
					        }
					})
					
					$("#user-dialog-form-create").dialog({
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
					        	"创建":function(){
					        		allCreate.removeClass("ui-state-error");
					        		var bValid = true;
					        		bValid = bValid&&checkLength(userNameCreate,"用户名",2,12);
					        		bValid = bValid&&checkLength(userPasswordCreate,"密码",6,12);
					        		
					        		bValid = bValid&&checkRegexp(userNameCreate,/^[a-z]([0-9a-z_])+$/i,"用户名必须由 a-z、0-9、下划线组成，且必须以字母开头。");
					        		bValid = bValid&&checkRegexp(userPasswordCreate,/^([0-9a-zA-Z])+$/,"密码字段只允许： a-z 0-9");

					        		if(bValid)
					        		{

					        			userBean.userName = userNameCreate.val();
					        			userBean.password = userPasswordCreate.val();
					        			userBean.userType = userTypeCreate.val();
					        			userBean.createTime = m_currentDatetime;
					        			userBean.enable = "true";
					        			userBean.description = userDescriptionCreate.val();
					        			userTable.row.add([
					        				1,
					        				userBean.userName,
					        				userBean.createTime,
					        				userBean.enable,
					        				userBean.description
					        			]).draw();
					        			$.ajax({
					        				type:"post",
					        				url:"<%=basePath%>user/add.do",
					        				async:true,
					        				data:{"userBean":userBean},
					        				datatType:"JSON",
					        				success:function(data){
					        					if(data == "true")
					        					{
					        						alert("用户创建成功！！");
					        						$.ajax({
														type:"get",
														url:"<%=basePath%>user/allNormal.do",
														async:true,
														dataType:"JSON",
														success:function(data){
															userTable.fnClearTable();
															userTable.fnDestroy();
															var userListBean;
															$.each(data, function(index) {
																userListBean=data[index];
																userTable.row.add([userListBean.id,userListBean.userName,userListBean.createTime,userListBean.enable,userListBean.description]).draw();
															});
														},
													});
					        					}else{
					        						alert("用户创建失败！！");					        											        						
					        						
					        					}
					        				}
					        			});					        			
										tips.text("所有的表单字段都是必填的");
					        			allCreate.val("").removeClass("ui-state-error");					        			
					        			$(this).dialog("close");
					        		}
					        		
					        	},
					        	"取消":function(){
					        		allCreate.val("").removeClass("ui-state-error");					        			
					        		$(this).dialog("close");
					        	}
					        }
					})
					$("#userTable").on("click","tr",function(){
						if($(this).hasClass('selected'))
						{
							$(this).removeClass('selected');
							

						}else{
							userTable.$('tr.selected').removeClass('selected');
							$(this).addClass('selected');
							$("#user-dialog-form").dialog("open");
							userNameinput.val(userTable.rows('.selected').data()[0][1]);
				            userPasswordinput.val();
				            userDescriptioninput.val(userTable.rows('.selected').data()[0][4]);
						}
					})
				}
				function enableUser(){
					var userEnableinput = $("#userEnableinput");
					if(userEnableinput.val() == "true")
					{
						userEnableinput.val("false");
					}else{
						userEnableinput.val("true");
					}		
				}
				
				function createNewUser(){
					$("#user-dialog-form-create").dialog("open");
				}
				
				$(function(){
					initView();
				})
			</script>
			
			<div id = "pageContent">
				<div id="title">
					<label id = titlename>用户管理</label>
					<button id = "createNew" class="button" onclick="createNewUser()"></button>
				</div>
				<div id = "userContent">
					<table id = "userTable" class = "display">
						<thead>
							<tr>
							<th>ID</th>
							<th>用户名</th>
							<th>用户创建时间</th>
							<th>是否有效</th>
							<th>用户备注</th>
							</tr>
						</thead>
					</table>
				</div>
				<div id = "user-dialog-form" title="用户管理">
					<form>
						<p class = "validateTips">所有的表单字段都是必填的</p>
						<fieldset>
							<legend>修改/删除用户</legend>
							<label>用户名</label><input type="text" id="userNameinput" class="longinput" readonly="true">
							<label>密码</label><input type="password" id="userPasswordinput" class="longinput" ><br />
							<label>是否有效</label>
							 <label class="demo--label">
							    <input id="userEnableinput" class="demo--radio" type="checkbox" name="demo-checkbox2" onclick="enableUser()">
							    <span class="demo--checkbox demo--radioInput"></span> 
							</label>
							<br />
							<label>用户备注</label><input type="text" id="userDescriptioninput" class="longinput"></input><br />
						</fieldset>
					</form>
				</div>
				
				<div id = "user-dialog-form-create" title="用户管理">
					<form>
						<p class = "validateTips">所有的表单字段都是必填的</p>
						<fieldset>
							<legend>创建用户</legend>
							<label>用户名</label><input type="text" id="userNameCreate" class="longinput" onblur="userCheck()" placeholder="请输入用户名">
							<label>密码</label><input type="password" id="userPasswordCreate" class="longinput"  placeholder="请输入密码"><br />
							<label>类型</label>						
							<select id="userTypeCreate">
								<option value="用户">用户</option>
								<option value="管理员">管理员</option>
							</select><br />
							<label>用户备注</label><input type="text" id="userDescriptionCreate" class="longinput"  placeholder="请输入备注"></input><br />
						</fieldset>
					</form>
				</div>				
			</div>
			
		</div>
	</body>
</html>
