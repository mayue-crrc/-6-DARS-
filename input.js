//定义一个简单的调试插件
$.extend(
	{
		log:function(message){
			var now=new Date();
			y=now.getFullYear();
			m=now.getMonth()+1;//month是从0开始的
			d=now.getDate();
			h=now.getHours();
			min=now.getMinutes();
			s=now.getSeconds();
			time=y+'/'+m+'/'+d+' '+h+':'+min+':'+s;
			console.log(time+" my program message:"+message);
		}
	}
)
//定义一个datatable插件
;(function($,window,document,undefined){
	var myTab=function($ele,opt){
		this.ele=$ele;
		this.optionDefault={
			"bPaginate":false,
			"searching":false,
			"info":false,
			"bSort":false 
		},
		this.default="display cell-border";
		this.option=$.extend({},this.optionDefault,opt);
	};
	myTab.prototype={
		creatTab:function(){
			this.ele.addClass(this.default);
			return this.ele.DataTable(this.option);
		} 
	};
	$.fn.myDataTable=function(myOptions){
		var mydataTable=new myTab(this,myOptions);
		return mydataTable.creatTab();
	};
})(jQuery,window,document);
//ajax刷新div插件
;(function($,window,document,undefined){
	var  getPage1=function(ele,urlo){
		this.$ele=ele;
		this.url=urlo;
	};
	getPage1.prototype={
		getPagef:function(){
			that=this;
			$.ajax({
				url:this.url, 
				type:'get',
				async:false, 
				dataType:'html',
				success:function(datas){
				 	that.$ele.html(datas);	 	
				},
				}); 
		}
	};
	$.fn.getPage=function(url,itm){
		var getPage2=new getPage1(this,url);
		return getPage2.getPagef();
	};
})(jQuery,window,document);