<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>销售统计</title>

<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">销售统计</h1>
</div>

<div style="margin:10px;border:0;padding:2;" id="content_load">
<div class="panel panel-default" >
<!-- <div class="panel-heading">
<strong>根据日期范围查询销售情况</strong>
</div>  --> 
<div class="panel-heading b-b b-light">
      <div class="h4 m-t-xs m-b-xs">
	    <div class="col-sm-5">
          </div>
	    <strong>根据日期范围查询销售情况</strong>									
	  </div>
    </div>
        <table class="table table-striped m-b-none">
          <tbody>
          <tr>
          <td style="width:9%;"></td>
          <td style="width:15%;"></td>         
          
          <td style="width:25%;align='right';">
          <input type="text" id="beginDay" name="beginDay" value="" class="form-control datetimepicker" placeholder="起始日期">
          <i id="delistingTime_check" class=""></i>
          </td>
          
          <td style="width:1%;align='center';">
          <button style="margin-top: 4px;background-color: transparent; border: 0;">
          <i class="fa fa-arrows-h"></i>
          </button>
          </td>
         
          <td style="width:25%;align='left';">
          <input type="text" id="endDay" name="endDay" value="" class="form-control datetimepicker" placeholder="结束日期">
          <i id="delistingTime_check" class=""></i>    
          </td> 
          
          <td style="width:15%;align='left';">
          <button class="btn btn-sm btn-info btn-addon" style="margin-top: 2px;" id="query" onclick="doPost();">
          <i class="fa fa-search"></i>查询
          </button>
          </td>
          
          <td style="width:9%;"></td>
          </tr>            
          </tbody>
        </table>
        </div>
</div>

<div style="margin:10px;border:0;padding:2px;">
	<div class="panel panel-default" >	
	
	<div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr class="panel-heading">
          
          	<th style="width:5%;text-align:center;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </th>
            
            <th style="width:10%;text-align:center;">
            <button  style = "background-color: transparent; border: 0;" onclick="rankbynum()">类别</button>
            </th>
            
            <th style="width:25%;text-align:center;">名称
            </th>
            
            <th style="width:10%;text-align:center;">买价
            </th>
            
            <th style="width:10%;text-align:center;">卖价
            </th>
            
            <th style="width:15%;text-align:center;">销量
            <button class="btn btn-default btn-xs" onclick="doRequest(1)">
            <i class="icon-arrow-up"></i>
            </button>
            <button class="btn btn-default btn-xs" onclick="rankasc()">
            <i class="icon-arrow-down"></i>
            </button>
            </th>
            
            <th style="width:10%;text-align:center;">盈利
            </th>
            
          </tr>
        </thead>
       <tbody id="tableTbody"></tbody>    
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
	
	<script>
	doRequest(1);
	function doRequest(currentPage){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/CountAction!findAllCountAA.action",
    	data:{
    	    "page"    : currentPage,
    		"beginDay": $("#beginDay").val(),
    		"endDay"  : $("#endDay").val(),
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {		
    		//console.log(data);
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
	}
	
	function rankbynum(){
	var currentPage=1;
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/CountAction!rankAllCountByBynum.action",
    	data:{
    	    "page"    : currentPage,
    		"beginDay": $("#beginDay").val(),
    		"endDay"  : $("#endDay").val(),
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {		
    		//console.log(data);
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
	}
	
	function rankasc(){
	var currentPage=1;
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/CountAction!findCountAsc.action",
    	data:{
    	    "page"    : currentPage,
    		"beginDay": $("#beginDay").val(),
    		"endDay"  : $("#endDay").val(),
    		"rows" : $("#page_everySize").val(),
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {		
    		//console.log(data);
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
	}
	
	//点击按钮事件
	function doPost(){
	var cha = (Date.parse($("#beginDay").val()) - Date.parse($("#endDay").val())) / 86400000 * 24;	            
	
	  if($("#beginDay").val()==""||$("#endDay").val()==""){
	    alert("请添加时间");
	    
	  }else 
	  if (cha > 0){
	  alert("结束时间不能大于起始时间!请重新输入!");
	  }
	  else{
	  doRequest(1);
	  }
	}
	
	
	
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
		for(var j=0; j<data.result.length; j++){
			 
			 $("#tableTbody").append("<tr>"
								+"<td style=\"width:5%;text-align:center;\"><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.result[j][0]+"><i></i></label>"
								+"</td>"
								+"<td style=\"width:10%;text-align:center;\">"+data.result[j][1]+"</td>"
								+"<td style=\"width:25%;text-align:center;\">"+data.result[j][2]+"</td>"
								+"<td style=\"width:10%;text-align:center;\">"+data.result[j][3]+"</td>"
								+"<td style=\"width:10%;text-align:center;\">"+data.result[j][4]+"</td>"
								+"<td style=\"width:15%;text-align:center;\">"+data.result[j][5]+"</td>"
								+"<td style=\"width:10%;text-align:center;\">"+(data.result[j][4]-data.result[j][3])*data.result[j][5]+"</td>"
								+"</tr>");
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
	
	//加入无数据div
	function addNullMessage(){
		$("#tableTbody").append("<tr class=\"odd\"><td valign=\"top\" colspan=\"8\" class=\"dataTables_empty\">暂无数据</td></td>");
	}
	
	$(".datetimepicker").datetimepicker({
    	format: 'yyyy-mm-dd hh:ii',
    	autoclose: 1,
    	todayBtn:  1,
    	todayHighlight: 1,
    	showMeridian: true,
    });
    
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
  </script>
 </div>