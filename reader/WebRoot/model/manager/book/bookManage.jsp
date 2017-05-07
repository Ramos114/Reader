<%@ page language="java" pageEncoding="UTF-8"%>

<style>
table td{white-space:nowrap;overflow:hidden; text-overflow:ellipsis;}
table th{white-space:normal;}
table {table-layout:fixed;}
</style> 

<title>图书管理</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">图书管理</h1>
</div>
<div class="wrapper-md" id="app">
  <div class="panel panel-default">
    <div class="panel-heading">图书列表</div>
    <div class="row wrapper">
      <div class="col-sm-5 m-b-xs">
 <!--      
        <select class="input-sm form-control w-sm inline v-middle">
          <option value="0">全部</option>
          <option value="1">男</option>
          <option value="2">女</option>
        </select>  
         -->
        <button class="btn btn-sm btn-primary btn-addon" onclick="AddProduct();">
        	<i class="fa fa-plus"></i>添加</button>         
      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">
        <div class="input-group">
          <input type="text" class="input-sm form-control" placeholder="请输入内容">
          <span class="input-group-btn">
            <button class="btn btn-sm btn-icon btn-success"><i class="glyphicon glyphicon-search"></i></button>
          </span>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
<!--           
          	<th style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </th>
-->  
            <th style="width:5%">编号</th>
            <th style="width:8%">标题</th>
            <th style="width:5%">作者</th>
            <th style="width:7%">大类别</th>
            <th style="width:5%">小类别</th>
            <th style="width:8%">版权</th>
            <th style="width:8%">最新章节内容</th>
            <th style="width:6%">更新时间</th>
            <th style="width:10%">简介</th>
    <!--    <th style="width:8%">评论数</th>     -->
            <th style="width:5%">完结？</th>
            <th style="width:5%">最火？</th>
            <th style="width:5%">推荐？</th>
            <th style="width:8%">封面</th>
            <th style="width:10%">操作</th>
          </tr>
        </thead>
        
        <tbody id="tableTbody">
         	
          <tr v-for="item in data.result">
<!--           
            <td style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </td>
--> 
            <td title="{{item.bookNo}}">{{item.bookNo}}</td>
            <td>{{item.title}}</td>
            <td>{{item.author.userName}}</td>
            <td>{{item.smallCategory.bigCategory.bgcName}}</td>
            <td>{{item.smallCategory.slcName}}</td>
            <td title="{{item.rights}}">{{item.rights}}</td>
            <td title="{{item.lastest}}">{{item.lastest}}</td>
            <td title="{{item.updateTime}}">{{item.updateTime}}</td>
            <td title="{{item.summary}}">{{item.summary}}</td>
            
            <td>
            	<div v-if="item.isFinish=='1'">
            		<!-- 如果使用，加上checked -->
         			<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox' checked disabled="disabled" onclick=sel()><i></i> </label>
         		</div>
         		<div v-else>
         			<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox'  disabled="disabled"><i></i> </label>
         		</div>
         	</td>
         	
            <td>
            	<div v-if="item.isHot=='1'">
            		<!-- 如果使用，加上checked -->
         			<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox' checked disabled="disabled"><i></i> </label>
         		</div>
         		<div v-else>
         			<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox'  disabled="disabled"><i></i> </label>
         		</div>
         	</td>
         	
            <td>
            	<div v-if="item.isRecommend=='1'">
            		<!-- 如果使用，加上checked -->
         			<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox' checked disabled="disabled"><i></i> </label>
         		</div>
         		<div v-else>
         			<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox'  disabled="disabled"><i></i> </label>
         		</div>
         	</td>
            
            <td>
            	<a class='thumbnail pull-left '><!-- thumb-lg -->
            		<img  src="${basePath }${pageContext.request.contextPath}{{item.cover}}" onclick="showBigImg('{{item.cover}}')" >
            	</a>
            </td>
            
            <td>
            <div style="white-space:normal; overflow:visible;">
              <button class="btn btn-sm btn-icon btn-primary" title="商品详情" onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/productDetails.jsp')"><i class="fa fa-list"></i></button>
              <button class="btn btn-sm btn-icon btn-info"><i class="glyphicon glyphicon-pencil"></i></button>
              <button class="btn btn-sm btn-icon btn-danger"><i class="glyphicon glyphicon-trash"></i></button>
            </div>
            </td>
          </tr> 
          
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

 		<!--放大图的imgModal-->
        <div class="modal fade bs-example-modal-lg text-center" id="imgModal"tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
          <div class="modal-dialog modal-lg" style="display: inline-block; width: auto;">
            <div class="modal-content">
             <img  id="imgInModalID" src="" >
            </div>
          </div>
        </div>

<script type="text/javascript">

	doRequest(1);

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
	
	//ajax请求table数据
	function doRequest(currentPage){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BookAction!findPageBook.action",
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
 		
/* 		//先移除表格中的数据
		$("#tableTbody>tr").remove();
		 */
		//移除页码
		$(".pagination>li").not(":first").not(":last").remove();
	 
		//添加数据进表格
		addDataToTable(data);
		
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
		} 
		
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
	
	//添加商品按钮
	function AddProduct(){
		 toSkit('${basePath }${pageContext.request.contextPath}/ProductAction!productAddUI.action');
	}
	
	//数据写入table--Vue渲染
	function addDataToTable(data){
	
			var app = new Vue({
    			el:'#app',
    			data:{
    				message:'Hahahahhah',
    				data:data,
    			}
    		});

	}
	
	//删除商品
	function deleteProduct(id) {
	layer.confirm("确定要删除该条记录吗？",{icon:3},function(){
		$.ajax({
			type:'post',
			url:"${basePath }${pageContext.request.contextPath}/ProductAction!deleteProduct.action",
			data:{
				"product.id" : id,
				},  
		 	dataType:'text',  
			success:function(data,status){
				if (status == "success") {
						layer.msg("恭喜，删除商品成功！",{icon:1});
						doRequest(1);
						$("#content_load").load("${basePath }${pageContext.request.contextPath}/model/manager/pro/productManage.jsp");
				} else {
					alert("查询失败,ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
		});
		
		});
	}
	
	//显示封面大图
	function showBigImg(imgUrl){
		
		$('#imgInModalID').attr("src", '${basePath}${pageContext.request.contextPath}'+imgUrl);
		$('#imgModal').modal('show');
	};
	
	
	
</script>
