<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div id = "metroManagementPage">
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
				background-image: url(images/createMetro.jpg);
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
			<div id = "pageContent">
				<div id = "metro-dialog-form" title="车辆管理">
					<form>
						<p class = "validateTips">所有的表单字段都是必填的</p>
						<fieldset>
							<legend>修改/删除车辆</legend>
							<label name="metroCode" >车号</label>
							<input type="text" id="metroCodeinput" class="shortinput">
							<label name="metroType" >车辆类型</label>
							<input type="text" id="metroTypeinput" class="shortinput"><br />
							<label name="manufacture" >制造商</label>
							<input type="text" id="manufactureinput" class="longinput"><br />
							<label name="manufacturedate">生产日期</label>
							<input type="text" id="datepickerinput" class="longinput"></input><br />
							<label name="line">线路</label>
							<input type="text" id="lineinput" class="longinput"></input><br />							
							<label name="description">备注</label>
							<input type="text" id="descriptioninput" class="longinput"></input><br />
						</fieldset>
					</form>
				</div>
				
				<div id = "metro-dialog-form-create" title="车辆管理">
					<form>
						<p class = "validateTips">所有的表单字段都是必填的</p>
						<fieldset>
							<legend>创建车辆</legend>
							<label>车号</label><input type="text" id="metroCodeCreate" class="shortinput">
							<label>车辆类型</label><input type="text" id="metroTypeCreate" class="shortinput"><br />
							<label>制造商</label><input type="text" id="manufactureCreate" class="longinput"><br />
							<label>生产日期</label><input type="text" id="datepickerCreate" class="longinput"></input><br />
							<label>线路</label><input type="text" id="lineCreate" class="longinput"></input><br />							
							<label>备注</label><input type="text" id="descriptionCreate" class="longinput"></input><br />
						</fieldset>
					</form>
				</div>	
				
				<div id="title">
					<label id = titlename>车辆管理</label>
					<button id = "createNew" class="button"></button>
				</div>
				<div id = "metroContent">
					<table id = "metroTable" class = "display">
						<thead>
							<tr>
							<th>ID</th>
							<th>车号</th>
							<th>车辆类型</th>
							<th>制造商</th>
							<th>生产日期</th>
							<th>线路</th>
							<th>备注</th>
							</tr>
						</thead>
					</table>
				</div>

			</div>
			<script type="text/javascript">
			    function checkLength( obj, name ) {			    	
			      if ( obj.val().length < 1 ) {
			        obj.addClass( "ui-state-error" );
			        updateTips( "" + name + " 未填写。" );
			        return false;
			      } else {
			        return true;
			      }
			    }
			    function checkValue( obj, name, min, max ) {			    	
			      if ( obj.val() > max || obj.val() < min ) {
			        obj.addClass( "ui-state-error" );
			        updateTips( "" + name + " 必须在 " +min + " 和 " + max + " 之间。" );
			        return false;
			      } else {
			        return true;
			      }
			    }
			    function updateTips( t ) {
			      $( ".validateTips" )
			        .text( t )
			        .addClass( "ui-state-highlight" );
			      setTimeout(function() {
			      $( ".validateTips" ).removeClass( "ui-state-highlight", 1500 );
			      }, 500 );
			    }
				function initMetroView(){
					//初始化datatables
					$("#createNew").unbind();
					var metroTable = $("#metroTable").DataTable({
						"bPaginate":false,
						"searching":false,
						"info":false,
						"bSort":false,
						"bAutoWidth":true,
						"destroy":true,
					});
					//用于记录总条目数
					var cnt = 0;
					//用于向后台发送
					var metroBean={
							ajax_metroCode:null,
							ajax_metroType:null,
							ajax_metroManufacture:null,
							ajax_metroManufacturedate:null,
							ajax_metroLine:null,
							ajax_metroDescription:null,
						};
					//用于保存选中行的值
					var metroBeanSelect={
							metroCodeSelect:null,
							metroTypeSelect:null,
							metroManufactureSelect:null,
							metroManufacturedateSelect:null,
							metroLineSelect:null,
							metroDescriptionSelect:null,
						};
						
						
				    var metroCode = $( "#metroCodeinput"),
				    metroType = $( "#metroTypeinput"),
				    metroManufacture = $( "#manufactureinput"),
				    metroManufacturedate = $( "#datepickerinput").datetimepicker({}),
				    metroLine = $( "#lineinput"),
				    metroDescription = $( "#descriptioninput"),
      				allFields = $( [] ).add( metroCode ).add( metroType ).add( metroManufacture )
      									.add( metroManufacturedate ).add( metroLine ).add( metroDescription );

      				//创建metro
      				var metroCodeCreate = $( "#metroCodeCreate"),
				    metroTypeCreate = $( "#metroTypeCreate"),
				    metroManufactureCreate = $( "#manufactureCreate"),
				    metroManufacturedateCreate = $( "#datepickerCreate").datetimepicker({}),
				    metroLineCreate = $( "#lineCreate"),
				    metroDescriptionCreate = $( "#descriptionCreate"),
      				allFieldsCreate = $( [] ).add( metroCodeCreate ).add( metroTypeCreate ).add( metroManufactureCreate )
      									.add( metroManufacturedateCreate ).add( metroLineCreate ).add( metroDescriptionCreate ),
      				tips = $( ".validateTips" );
					tips.text("所有的表单字段都是必填的");
					metroTable.row.add([1,"06001","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([2,"06002","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([3,"06003","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([4,"06004","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([5,"06005","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([6,"06006","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([7,"06007","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([8,"06008","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([9,"06009","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					metroTable.row.add([10,"06010","HXD3D","长客","2017/12/12","北6西延线","无"]).draw();
					//显示表格数据
					$.ajax({
	      				url:"<%=basePath%>metro/allMetroInfo.do",
	      				type:"post",
	      				dataType:"JSON",
	      				success:function(data){
							var metroBean;
							var metroBeanList = data;
							$.each(metroBeanList, function(index) {
								metroBean = metroBeanList[index];
								//添加数据
								metroTable.row.add([
									index,
									metroBean.metroCode,
									metroBean.metroType,
									metroBean.manufacturer,
									metroBean.dateManufacture,
									metroBean.line,
									metroBean.description
								])
								cnt = index;
							});
	      				}
	      			})					

					
					//create 对话框处理
					$("#metro-dialog-form-create").dialog({
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
							      	allFieldsCreate.removeClass("ui-state-error");
						      		var bValid = true;
						      		bValid = bValid&&checkValue(metroCodeCreate,"车号",00,99);
						      		bValid = bValid&&checkLength(metroTypeCreate,"车辆类型");
						      		bValid = bValid&&checkLength(metroManufactureCreate,"制造商");
						      		bValid = bValid&&checkLength(metroManufacturedateCreate,"生产日期");
						      		bValid = bValid&&checkLength(metroLineCreate,"线路");
						      		bValid = bValid&&checkLength(metroDescriptionCreate,"备注");
						      		if(bValid)
						      		{
						      			//ajax create 
						      			metroBean.ajax_metroCode = metroCodeCreate.val();
						      			metroBean.ajax_metroType = metroTypeCreate.val();
						      			metroBean.ajax_metroManufacture = metroManufactureCreate.val();
						      			metroBean.ajax_metroManufacturedate = metroManufacturedateCreate.val();
						      			metroBean.ajax_metroLine = metroLineCreate.val();
						      			metroBean.ajax_metroDescription = metroDescriptionCreate.val();
						      			//test add
						      			metroTable.row.add([
											cnt,
											metroBean.ajax_metroCode,
											metroBean.ajax_metroType,
											metroBean.ajax_metroManufacture,
											metroBean.ajax_metroManufacturedate,
											metroBean.ajax_metroLine,
											metroBean.ajax_metroDescription
										]).draw();
						      			$.ajax({
						      				url:"<%=basePath%>metro/add.do",
						      				type:"post",
						      				data:metroBean,
						      				dataType:"JSON",
						      				success:function(data){
		
						      				}
						      			})
				      					allFieldsCreate.val( "" ).removeClass( "ui-state-error" );
										tips.text("所有的表单字段都是必填的");					      			
						      			$(this).dialog("close");
						      		}
						      	},
						      	"取消":function(){
				      				allFieldsCreate.val( "" ).removeClass( "ui-state-error" );
						      		$(this).dialog("close");
						      	}
					        }
						})
					//update\delete 对话框处理
				    $( "#metro-dialog-form" ).dialog({
				    	heigth:350,
				        width: 400,

				    	modal:true,
				        autoOpen: false,
				        show: {
				        //effect: "blind",
				        	duration: 200
				        },
				        hide: {
				        //effect: "explode",
				        	duration: 200
				        },
				        buttons: {
				      	"修改":function(){
				      		allFields.removeClass("ui-state-error");
				      		var bValid = true;
				      		bValid = bValid&&checkValue(metroCode,"车号",00,99);
				      		bValid = bValid&&checkLength(metroType,"车辆类型");
				      		bValid = bValid&&checkLength(metroManufacture,"制造商");
				      		bValid = bValid&&checkLength(metroManufacturedate,"生产日期");
				      		bValid = bValid&&checkLength(metroLine,"线路");
				      		bValid = bValid&&checkLength(metroDescription,"备注");
				      		
				      		if(bValid)
				      		{
								//ajax update 
				      			metroBean.ajax_metroCode = metroCode.val();
				      			metroBean.ajax_metroType = metroType.val();
				      			metroBean.ajax_metroManufacture = metroManufacture.val();
				      			metroBean.ajax_metroManufacturedate = metroManufacturedate.val();
				      			metroBean.ajax_metroLine = metroLine.val();
				      			metroBean.ajax_metroDescription = metroDescription.val();
				      		
				      			$.ajax({
				      				url:"<%=basePath%>metro/update.do",
				      				type:"post",
				      				data:metroBean,
				      				dataType:"JSON",
				      				success:function(data){

				      				}
				      			})
								tips.text("所有的表单字段都是必填的");
				      			allFields.val( "" ).removeClass( "ui-state-error" );
				      			$(this).dialog("close");
				      		}else
				      		{
				      			
				      		}
				      	},
				      	"删除":function(){
				      		  	var r=confirm("确认删除本车信息？");
				      		  	if(r == true){
					      		  	var metroCodeAjax = metroCode.val();

					      			$.ajax({
					      				url:"<%=basePath%>metro/delete.do",
					      				type:"post",
					      				data:metroCodeAjax,
					      				dataType:"JSON",
					      				success:function(data){
	
					      				}
					      			})
									tips.text("所有的表单字段都是必填的");
			      			
					      			$(this).dialog("close");
				      			
				      		  	}else{
				      		  		
				      		  	}

				      	},
				      	"取消":function(){
				      		$(this).dialog("close");
				      		allFields.val( "" ).removeClass( "ui-state-error" );
				      	}
				      }
				    });
					
					//点击进入车辆管理页面，绘制datatables

					//选中行进入dialog编辑
					$('#metroTable tbody').on('click','tr',function(){
						if($(this).hasClass('selected'))
						{
							$(this).removeClass('selected');
				            $("#metro-dialog-form").dialog("open");
							
						}else {
				            metroTable.$('tr.selected').removeClass('selected');
				            $(this).addClass('selected');
				            metroCode.val(metroTable.rows('.selected').data()[0][1]);
				            metroType.val(metroTable.rows('.selected').data()[0][2]);
				            metroManufacture.val(metroTable.rows('.selected').data()[0][3]);
				            metroManufacturedate.val(metroTable.rows('.selected').data()[0][4]);
				            metroLine.val(metroTable.rows('.selected').data()[0][5]);
				            metroDescription.val(metroTable.rows('.selected').data()[0][6]);

        				}
					})
					$("#maincontent").on('updateMetroManagementPage',updateDate);
				}
				function updateDate(event,params){
					$("#createNew").click(function(){
				        $("#metro-dialog-form-create").dialog("open");
					})
				}
			</script> 
		</div>
	</body>
</html>
