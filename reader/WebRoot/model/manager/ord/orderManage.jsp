<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<style type="text/css">
  .wrapper2{
    padding:1px;
  }
  .formCheck{
    float: right;
    margin-right: -18px;
    margin-top: -25px;
  }
    .btn-jy{
  background-color: white;
  border-color:#dee5e7;
  }
  .btn-jy:focus {
	background-color:#edf1f2;
}
</style>
<title>订单管理</title>
<body>
<div ui-view="" class="fade-in-down ng-scope">
<div class="bg-light lter b-b wrapper-md ng-scope">
  <h1 class="m-n font-thin h3">查询订单信息</h1>
</div>
<div class="wrapper-md ng-scope">
  <div class="panel b-a">
    <div class="panel-heading b-b b-light">
      <div class="h4 m-t-xs m-b-xs">
	    <div class="col-sm-5">
          </div>
	    <strong>根据日期范围查询订单</strong>									
	  </div>
    </div>
    <div class="row wrapper2">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
          <div class="col-sm-1">
          </div>
          <label class="col-sm-2 control-label">起始日期:</label>
	      <div class="col-sm-2">
		    <input type="text" class="form-control datetimepicker" id="beginDay"/>
		    <i id="delistingTime_check" class=""></i>
	      </div>									
	      <label class="col-sm-2 control-label">结束日期:</label>
	      <div class="col-sm-2">
	        <input type="text" class="form-control datetimepicker" id="endDay"/>
		    <i id="delistingTime_check" class=""></i>
	      </div>										
          <button class="btn btn-sm btn-info btn-addon" style="margin-top: 2px;" id="query" onclick="query(1);"><i class="fa fa-search"></i>查询</button>
        </div>
      </div>
   </div>
  </div>
	  
   <div class="panel panel-default">
    <div class="panel-heading">订单列表</div>
     <div class="tab-content">
      <div class="tab-pane ng-scope active" ng-repeat="tab in tabs" ng-class="{active: tab.active}" tab-content-transclude="tab">    
        <li class="list-group-item">
         <div class="btn-group" >
         <button type="button" class="btn btn-jy" id="all" onclick="doAll(1);">全部</button>   
          <button type="button" class="btn btn-jy" id="notPay" onclick="notPay(1);">待付款</button>   
          <button type="button" class="btn btn-jy" id="notSend" onclick="notSend(1);">待发货 </button>
          <button type="button" class="btn btn-jy" id="notGet" onclick="notGet(1);">待收货</button>
          <button type="button" class="btn btn-jy" id="notEvaluate" onclick="notEvaluate(1);">待评价  </button>
          <button type="button" class="btn btn-jy" id="finished" onclick="doFinished(1);">已完成  </button>
           <button type="button" class="btn btn-jy" id="return" onclick="doReturn(1);">退款中</button>
         </div>    
          <div class="panel panel-default">
           <div class="tab-container ng-isolate-scope">
           
      <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
          	<th style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </th>
            <th style="width:15%">订单号</th>
            <th style="width:10%">订单状态</th>
            <th style="width:10%">会员号</th>
            <th style="width:10%">会员等级</th>
            <th style="width:10%">总价格</th>
            <th style="width:20%">订单时间</th>
            <th style="width:25%" class="text-info">操作</th>
          </tr>
        </thead>     
        <tbody id="tableTbody">
        	<tr class="odd"><td valign="top" colspan="5" class="dataTables_empty">Loading...</td></tr>
        </tbody>
      </table>
    </div>
    
     <footer class="panel-footer">
      <div class="row">
        <div class="col-sm-4 hidden-xs">
          <small class="text-muted inline m-t-sm m-b-sm">每页显示：</small>
          <select id="page_everySize" class="input-sm form-control w-xxss inline v-middle">
            <option value="10">10</option>
            <option value="25">25</option>
            <option value="50">50</option>
            <option value="100">100</option>
          </select>                
           </div>
           <div class="col-sm-4 text-center">
            <small id="page_showPageSize" class="text-muted inline m-t-sm m-b-sm"></small>&nbsp;&nbsp;
            <small id="page_showPageNum"  class="text-muted inline m-t-sm m-b-sm"></small>
           </div>
            <div class="col-sm-4 text-right text-center-xs">        
             <ul class="pagination-sm m-t-none m-b pagination ng-isolate-scope ng-valid ng-dirty ng-valid-parse">
            <!-- ngIf: boundaryLinks <li ng-if="boundaryLinks" ng-class="{disabled: noPrevious()}" class="ng-scope"><a ng-click="selectPage(1)" class="ng-binding">首页</a></li> end ngIf: boundaryLinks -->
              <li id="sample-table-previous" class="ng-scope ">
              <a onclick="selectPrevious()" class="ng-binding">上一页</a>
              </li>
              <li id="sample-table-next" class="ng-scope" >
              <a onclick="selectNext()" class="ng-binding">下一页</a>
              </li>
            <!-- ngIf: boundaryLinks <li ng-if="boundaryLinks" ng-class="{disabled: noNext()}" class="ng-scope"><a ng-click="selectPage(totalPages)" class="ng-binding">尾页</a></li> end ngIf: boundaryLinks -->
             </ul>      
            </div>
           </div>
      </footer>
         </div>
         </div>
        </li>         
    </div>
 
    <div class="tab-pane ng-scope" ng-repeat="tab in tabs" ng-class="{active: tab.active}" tab-content-transclude="tab">
             </div>
           </div>
          </div>
         </div>
        </div>
        
        <!-- 发货信息模态框 -->
<div class="modal fade" id="send" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>				
				<h4 class="modal-title" id="myModalLabel"><i class="icon-pencil"></i>请填写发货信息</h4>  
			</div>
			<div class="modal-body">
			  <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
		        <div class="form-group">
                  <label class="col-sm-3 control-label">物流单号</label>
                  <div class="col-sm-6">
                    <input type="text" id="logisticsId" class="form-control" placeholder="由字母或数字组成的10~14个字符">  
                    <i id="logisticsId_check" class=""></i>                        
                  </div>
                </div> 
                
                <div class="form-group">
                  <label class="col-sm-3 control-label">物流公司</label>
                  <div class="col-sm-6">
                    <input type="text" id="logisticsName" class="form-control" placeholder="请填写负责派送的物流公司">
                    <i id="logisticsName_check" class=""></i>                       
                  </div>
                </div> 
                      
              </div>
			</div>
	        <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" id="doSend">提交</button>
	        </div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
 <!-- 确认退单信息模态框 -->
<div class="modal fade" id="return1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>				
				<h4 class="modal-title" id="myModalLabel"><i class="icon-pencil"></i>请确认退单信息</h4>  
			</div>
			<div class="modal-body">
			  <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
		        <div class="form-group">
                  <label class="col-sm-3 control-label">需退款金额</label>
                  <div class="col-sm-6">
                    <input type="text" id="totalPrice" class="form-control"  readonly="readonly" value="" >                                      
                  </div>
                </div> 
                
                <div class="form-group">
                  <label class="col-sm-3 control-label">商家实际退款金额</label>
                  <div class="col-sm-6">
                    <input type="text" id="nowsPrice" class="form-control" readonly="readonly">                   
                  </div>
                </div> 
                      
              </div>
			</div>
	        <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" id="doReturn">提交</button>
	        </div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>

<script type="text/javascript"> 
//日期控件
	$(".datetimepicker").datetimepicker({
    	format: 'yyyy-mm-dd hh:ii',
    });
    

//自动加载全部订单
 
  doRequest(1);
  
   function doRequest(currentPage){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrder.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    		
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  
	
    //ajax--根据时期范围查找订单

 function query(currentPage){
		 if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
        $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
       }else{
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrder.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});}
	};   

      //ajax--点击全部按钮查找订单
       function doAll(currentPage){
         if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
        $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
       }else{
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrder.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});}
	};   
              
                 //ajax--点击待付款按钮查找订单
                 function notPay(currentPage){
         if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
            $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotPayInDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
         }else{        
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotPay.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  
   }
              
                 //ajax--点击待发货按钮查找订单
     function notSend(currentPage){
     if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
            $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotSendInDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
         }else{ 
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotSend.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  
           }   
                 //ajax--点击待收货按钮查找订单
      function notGet(currentPage){
      if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
            $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotGetInDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
         }else{ 
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotGet.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  }
              
                 //ajax--点击待评价按钮查找订单
    function notEvaluate(currentPage){
    if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
            $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotEvaluateInDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
         }else{ 
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfNotEvaluate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  }
              
                            //ajax--点击已完成按钮查找订单
     function doFinished(currentPage){
     if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
            $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfFinishedInDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
         }else{ 
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfFinished.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  }


  //ajax--点击退款中按钮查找订单
     function doReturn(currentPage){
     if($("#beginDay").val()!=""&&$("#endDay").val()!=""){
            $.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfReturnInDate.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		"beginDay" :$("#beginDay").val(),
    		"endDay": $("#endDay").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){		
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	}); 
         }else{ 
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findPageOrderOfReturn.action",
    	data:{
    		"page" : currentPage,
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	};  
           }   

	//全选功能
	$(document).on('click','th input:checkbox',function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});
					});

	/*分页方法*/
	$("#page_everySize").change(function() {		//点击改变设置页码记录数
		doRequest(1);
	});
	
	//点击页码
	function clickPage(currentPage) {
		doRequest(currentPage);
	}
	
	//点击上一页
	function selectPrevious() {
		if ($("#sample-table-previous").hasClass("disabled")) {
			return false;
		}
		//查询当前页
		$(".pagination").find("li").each(
				function() {
					if ($(this).hasClass("active")) {
						doRequest(window.parseInt($(this).children("a").html()) - 1);
					}
				});
	}

	//点击下一页	
	function selectNext() {
		if ($("#sample-table-next").hasClass("disabled")) {
			return false;
		}
		//查询当前页
		$(".pagination").find("li").each(function() {
					if ($(this).hasClass("active")) {
						doRequest(window.parseInt($(this).children("a").html()) + 1);
					}
				});
	}
	
	
	//加入无数据div
	function addNullMessage(){
		$("#tableTbody").append("<tr class=\"odd\"><td valign=\"top\" colspan=\"8\" class=\"dataTables_empty\">暂无数据</td></td>");
	}
	
	//动态生成查询table
	function setDataTable(data){
		//页码开始
		var begin = 0;
		//页码结束
		var end = 0;
		//先移除表格中的数据
		$("#tableTbody>tr").remove();
		//移除页码
		$(".pagination>li").not(":first").not(":last").remove();

		//组装数据
		for(var i=0; i<data.result.length; i++){
			if(data.result[i].orderStatus == 1 ){
				data.result[i].orderStatus="待付款";
			}
			if(data.result[i].orderStatus == 2 ){
				data.result[i].orderStatus="待发货";
			}
			if(data.result[i].orderStatus == 3 ){
				data.result[i].orderStatus="待收货";
			}
			if(data.result[i].orderStatus == 4 ){
				data.result[i].orderStatus="待评价";
			}
			if(data.result[i].orderStatus == 5 ){
				data.result[i].orderStatus="已完成";
			}
			if(data.result[i].orderStatus == 6 ){
				data.result[i].orderStatus="已删除";
			}
			if(data.result[i].orderStatus == 7 ){
				data.result[i].orderStatus="已取消";
			}
			if(data.result[i].orderStatus == 8 ){
				data.result[i].orderStatus="退款中";
			}
			if(data.result[i].orderStatus == null ){
				data.result[i].orderStatus="";
			}
			if(data.result[i].id == null ){
				data.result[i].id="";
			}
			if(data.result[i].customer.userName == null ){
				data.result[i].customer.userName="";
			}
			if(data.result[i].customer.rankId.level == null ){
				data.result[i].customer.rankId.level="";
			}	
			if(data.result[i].totalPrice == null ){
				data.result[i].totalPrice="";
			}
			if(data.result[i].createDate == null ){
				data.result[i].createDate="";
			}  
			//添加数据进表格
			addDataToTable(data.result[i]);
		}
		
		
		//设置好页码信息
		$("#page_showPageSize").html("显示"+data.page+"-"+data.total+"页");
		$("#page_showPageNum").html("共"+data.rows+"条记录");

		//判断是否有数据
		if (data.result.length == 0) {
			addNullMessage();
		}
		
		//计算分页
		//总页数小于7，全部显示。
		if (data.total < 7) {
			begin = 1;
			end = data.total;
		} else {
			begin = data.page - 3;
			end = data.page + 3;
			//头溢出
			if (begin < 1) {
				begin = 1;
				end = 7;
			}
			//尾溢出
			if (end > data.total) {
				begin = data.total - 6;
				end = data.total;
			}
		} //else
		
		//添加页码
		for (var i = end; begin <= i; i--) {
			if (data.page == i) {
				$("#sample-table-previous").after("<li class=\"ng-scope active\"><a onclick=\"clickPage("
														+ i
														+ ")\" class=\"ng-binding\">"
														+ i
														+"</a></li>");
			} else {
				$("#sample-table-previous").after("<li class=\"ng-scope\"><a onclick=\"clickPage("
														+ i
														+ ")\" class=\"ng-binding\">"
														+ i
														+"</a></li>");
			}
		}

		begin = 0;
		end = 0;
		
		//当前页为第一页时，上一页不可用
		if (data.page == 1) {
			$("#sample-table-previous").addClass("disabled");
		} else {
			$("#sample-table-previous").removeClass("disabled");
		}
		//当前页为最后一页时，下一页不可用
		if (data.page == data.total) {
			$("#sample-table-next").addClass("disabled");
		} else {
			$("#sample-table-next").removeClass("disabled");
		}
	}
	
	//数据写入table
	function addDataToTable(data){
	if(data.orderStatus=="待付款"){
	$("#tableTbody").append("<tr>"
								+"<td><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+"</td>"
								+"<td>"+data.id+"</td>"
								+"<td>"+data.orderStatus+"</td>"
								+"<td>"+data.customer.userName+"</td>"
								+"<td>"+data.customer.rankId.level+"</td>"
								+"<td>"+data.totalPrice+"</td>"
								+"<td>"+data.createDate+"</td>"
							+"<td><button class=\"btn btn-sm btn-icon btn-info\" title=\"订单详情\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!findOrderDetailById.action?id="+data.id+"\");'>"
							+"<i class=\"fa fa-file-text\" ></i></button>&nbsp;"
							+"<button class=\"btn btn-sm btn-icon btn-success\" title=\"物流详情\" style=\"background-color:grey;border:0\" onclick='layer.msg(\"该订单处于待付款状态，没有物流信息\", {icon: 7});'>"						
							+"<i class=\"icon-plane\" ></i></button>&nbsp;"
              				+"<button class='btn btn-sm btn-icon btn-danger' title=\"删除\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!deleteOrderById.action?id="+data.id+"\");'>"
              				+"<i class='glyphicon glyphicon-trash' ></i></button></td>"
								+"</tr>");
	}else if(data.orderStatus=="待发货"){
	$("#tableTbody").append("<tr>"
								+"<td><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+"</td>"
								+"<td>"+data.id+"</td>"
								+"<td>"+data.orderStatus+"</td>"
								+"<td>"+data.customer.userName+"</td>"
								+"<td>"+data.customer.rankId.level+"</td>"
								+"<td>"+data.totalPrice+"</td>"
								+"<td>"+data.createDate+"</td>"
							+"<td><button class=\"btn btn-sm btn-icon btn-info\" title=\"订单详情\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!findOrderDetailById.action?id="+data.id+"\");'>"
							+"<i class=\"fa fa-file-text\" ></i></button>&nbsp;"
							+"<button class=\"btn btn-sm btn-icon btn-success\" title=\"物流详情\" style=\"background-color:grey;border:0\" onclick='layer.msg(\"该订单还未发货，没有物流信息\", {icon: 7});'>"
							+"<i class=\"icon-plane\" ></i></button>&nbsp;"
              				+"<button class='btn btn-sm btn-icon btn-danger' title=\"删除\">"
              				+"<i class='glyphicon glyphicon-trash' onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!deleteOrderById.action?id="+data.id+"\");'></i></button>&nbsp;"
              				+"<button class=\"btn btn-sm btn-icon btn-primary\" title=\"发货\" data-toggle=\"modal\" data-target=\"#send\"><input type=\"hidden\" id=\"hidden_id\" value="+data.id+"><i class=\"glyphicon glyphicon-circle-arrow-right\"></i></button></td>"                   
							+"</tr>");
	}else if(data.orderStatus=="已删除"){
	$("#tableTbody").append("<tr>"
								+"<td><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+"</td>"
								+"<td>"+data.id+"</td>"
								+"<td>"+data.orderStatus+"</td>"
								+"<td>"+data.customer.userName+"</td>"
								+"<td>"+data.customer.rankId.level+"</td>"
								+"<td>"+data.totalPrice+"</td>"
								+"<td>"+data.createDate+"</td>"
							+"<td><button class=\"btn btn-sm btn-icon btn-info\" title=\"订单详情\" style=\"background-color:grey;border:0\" onclick='layer.msg(\"该订单处已被删除，没有详细信息\", {icon: 7});'>"
							+"<i class=\"fa fa-file-text\" ></i></button>&nbsp;"
							+"<button class=\"btn btn-sm btn-icon btn-success\" title=\"物流详情\" style=\"background-color:grey;border:0\" onclick='layer.msg(\"该订单已被删除，没有物流信息\", {icon: 7});'>"				
							+"<i class=\"icon-plane\" ></i></button>&nbsp;"
              				+"<button class='btn btn-sm btn-icon btn-danger' title=\"删除\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!deleteOrderById.action?id="+data.id+"\");'>"
              				+"<i class='glyphicon glyphicon-trash' ></i></button></td>"
								+"</tr>");
	}else if(data.orderStatus=="退款中"){
	$("#tableTbody").append("<tr>"
								+"<td><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+"</td>"
								+"<td>"+data.id+"</td>"
								+"<td>"+data.orderStatus+"</td>"
								+"<td>"+data.customer.userName+"</td>"
								+"<td>"+data.customer.rankId.level+"</td>"
								+"<td>"+data.totalPrice+"</td>"
								+"<td>"+data.createDate+"</td>"
							+"<td><button class=\"btn btn-sm btn-icon btn-info\" title=\"允许退单请求\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!return_ui.action?id="+data.id+"\");'><input type=\"hidden\" id=\"hidden_id\" value="+data.id+">"
							+"<i class='glyphicon glyphicon-ok'></i></button>&nbsp;"
							+"<button class=\"btn btn-sm btn-icon btn-success\" title=\"拒绝退单请求\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!updateOrderReturnError.action?id="+data.id+"\");'>"
							+"<i class=\"glyphicon glyphicon-remove\"></i></button>&nbsp;"
              				+"<button class='btn btn-sm btn-icon btn-danger' title=\"删除\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!deleteOrderById.action?id="+data.id+"\");'>"
              				+"<i class='glyphicon glyphicon-trash'></i></button>"
              				+"</td>"
								+"</tr>");
	}
	else{
		$("#tableTbody").append("<tr>"
								+"<td><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+"</td>"
								+"<td>"+data.id+"</td>"
								+"<td>"+data.orderStatus+"</td>"
								+"<td>"+data.customer.userName+"</td>"
								+"<td>"+data.customer.rankId.level+"</td>"
								+"<td>"+data.totalPrice+"</td>"
								+"<td>"+data.createDate+"</td>"
			
							+"<td><button class=\"btn btn-sm btn-icon btn-info\" title=\"订单详情\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!findOrderDetailById.action?id="+data.id+"\");'>"
							+"<i class=\"fa fa-file-text\" ></i></button>&nbsp;"
							+"<button class=\"btn btn-sm btn-icon btn-success\" title=\"物流详情\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!findLogisticsById.action?id="+data.id+"\");'>"
							+"<i class=\"icon-plane\" ></i></button>&nbsp;"
              				+"<button class='btn btn-sm btn-icon btn-danger' title=\"删除\" onclick='toSkit(\"${basePath }${pageContext.request.contextPath}/OrderAction!deleteOrderById.action?id="+data.id+"\");'>"
              				+"<i class='glyphicon glyphicon-trash' ></i></button>"
              				+"</td>"
								+"</tr>");
	}}
			

//发货
$(document).ready(function() {

   //验证物流单号
	$("#logisticsId").keyup(function() {
		var logisticsId = $("#logisticsId").val();
		var reg = /^[a-zA-Z0-9]{10,14}$/g;
		if(!reg.test(logisticsId)){
			$("#logisticsId_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#logisticsId_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});		

	//验证物流公司名称
	$("#logisticsName").keyup(function() {
		var logisticsName = $("#logisticsName").val();
		var reg = /^([\u4e00-\u9fa5]{2,15})$/g;
		if(!reg.test(logisticsName)){
			$("#logisticsName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#logisticsName_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});		
});	


	//发货提交
	$("#doSend").click(function() {
		var id = $("#logisticsId").val();
		var name = $("#logisticsName").val();
		var ordId = $("#hidden_id").val();
		if((!$("#logisticsId_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#logisticsName_check").hasClass("text-danger glyphicon glyphicon-remove formCheck"))){ //判断所有信息格式都正确
			$.ajax({
				type: 'post',
				url: "LogisticsAction!saveLogistics.action",
				data:{
					"logisticsId":id,
					"logisticsName":name,
				   "ordId":ordId,
				},
			    dataType: 'text',
			    success: function(data){
					if (data == "success") {						
						//跳转刷新
					$("#send").show("hide");
				 $("#content_load").load("${basePath}${pageContext.request.contextPath}/OrderAction!sendOrderById.action?id="+ordId);
						layer.msg("恭喜，发货成功！！", {icon: 1});
					} else {
						layer.msg("抱歉，发货失败！", {icon: 2});
					}
			    },
			    cache:false
			});
		}else{
			layer.msg("请先填写正确的物流信息再进行确认操作！", {icon: 7});
		}
	});	
	
	//退款提交
	$("#doReturn").click(function() {
		var id = $("#logisticsId").val();
		var name = $("#logisticsName").val();
		var ordId = $("#hidden_id").val();
			$.ajax({
				type: 'post',
				url: "LogisticsAction!saveLogistics.action",
				data:{
					"logisticsId":id,
					"logisticsName":name,
				   "ordId":ordId,
				},
			    dataType: 'text',
			    success: function(data){
					if (data == "success") {						
						//跳转刷新
					$("#return1").show("hide");
				// $("#content_load").load("${basePath}${pageContext.request.contextPath}/OrderAction!sendOrderById.action?id="+ordId);
				
						layer.msg("恭喜，退单成功！！", {icon: 1});
					} else {
						layer.msg("抱歉，退单失败！", {icon: 2});
					}
			    },
			    cache:false
			});
		
	});	

  </script>
</html>