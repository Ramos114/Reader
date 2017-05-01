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
<div class="wrapper-md">
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
            <th style="width:7%">编号</th>
            <th style="width:8%">名称</th>
            <th style="width:8%">大类别</th>
            <th style="width:8%">小类别</th>
    <!--    <th style="width:8%">品牌</th>     -->
            <th style="width:7%">进货价￥</th>
            <th style="width:7%">售价￥</th>
            <th style="width:7%">折后价￥</th>
            <th style="width:5%">是否打折</th>
            <th style="width:7%">库存量(件)</th>
            <th style="width:7%">月销量(件)</th>
            <th style="width:7%">累计评论</th>
            <th style="width:7%">状态</th>
            <th style="width:5%">推荐商品</th>
            <th style="width:10%">操作</th>
          </tr>
        </thead>
        
        <tbody id="tableTbody">
<%--         	
          <tr>
            <td style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </td>
            <td title="20160101">20160101</td>
            <td title="Lenovo/联想 YOGA710 -14ISK">Lenovo/联想 YOGA710 -14ISK</td>
            <td title="笔记本">笔记本</td>
            <td title="Lenovo/联想">Lenovo/联想</td>
            <td>6549</td>
            <td>5549</td>
            <td>是</td>
            <td>100</td>
            <td>671</td>
            <td>1489</td>
            <td>上架</td>
            <td>是</td>
            <td>
            <div style="white-space:normal; overflow:visible;">
              <button class="btn btn-sm btn-icon btn-primary" title="商品详情" onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/productDetails.jsp')"><i class="fa fa-list"></i></button>
              <button class="btn btn-sm btn-icon btn-info"><i class="glyphicon glyphicon-pencil"></i></button>
              <button class="btn btn-sm btn-icon btn-danger"><i class="glyphicon glyphicon-trash"></i></button>
            </div>
            </td>
          </tr> --%>
          
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
    	url:"${basePath}${pageContext.request.contextPath}/ProductAction!findPageProduct.action",
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
		//先移除表格中的数据
		$("#tableTbody>tr").remove();
		//移除页码
		$(".pagination>li").not(":first").not(":last").remove();
		
		
		//组装数据
		for(var i=0; i<data.result.length; i++){
			if(data.result[i].id == null ){
				data.result[i].id="";
			}
			if(data.result[i].proNo == null ){
				data.result[i].proNo="";
			}
			if(data.result[i].proName == null ){
				data.result[i].proName="";
			}
	//		if(data.result[i].brand == null ){
	//			data.result[i].brand="";
	//		}
			if(data.result[i].title == null ){
				data.result[i].title="";
			}
			if(data.result[i].purchasePrice == null ){
				data.result[i].purchasePrice="";
			}
			if(data.result[i].price == null ){
				data.result[i].price="";
			}
			if(data.result[i].discountPrice == null ){
				data.result[i].discountPrice="";
			}
			if(data.result[i].discountFlag == null ){
				data.result[i].discountFlag="";
			}
			if(data.result[i].introduce == null ){
				data.result[i].introduce="";
			}
			if(data.result[i].store == null ){
				data.result[i].store="";
			}
			if(data.result[i].monthSale == null ){
				data.result[i].monthSale="";
			}
			if(data.result[i].commentNum == null ){
				data.result[i].commentNum="";
			}
			if(data.result[i].listingTime == null ){
				data.result[i].listingTime="";
			}
			if(data.result[i].delistingTime == null ){
				data.result[i].delistingTime="";
			}
			if(data.result[i].status == null ){
				data.result[i].status="";
			}
			if(data.result[i].recommendFlag == null ){
				data.result[i].recommendFlag="";
			}
			if(data.result[i].keywords == null ){
				data.result[i].keywords="";
			}
			if(data.result[i].origin == null ){
				data.result[i].origin="";
			}
			if(data.result[i].smallcategory == null ){
				data.result[i].keywords="";
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
	
	//添加商品按钮
	function AddProduct(){
		 toSkit('${basePath }${pageContext.request.contextPath}/ProductAction!productAddUI.action');
	}
	
	//数据写入table
	function addDataToTable(data){
		$("#tableTbody").append("<tr>"
						//		+"<td><label class=\"i-checks m-b-none\">"
						//		+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
						//		+"</td>"
								+"<td>"+data.proNo+"</td>"
								+"<td>"+data.proName+"</td>"
								+"<td>"+data.smallcategory.bigcategory.bgcName+"</td>"
								+"<td>"+data.smallcategory.slcName+"</td>"
						//		+"<td>"+data.brand+"</td>"
								+"<td>"+data.purchasePrice+"</td>"
								+"<td>"+data.price+"</td>"
								+"<td>"+data.discountPrice+"</td>"
								+"<td>"+data.discountFlag+"</td>"
								+"<td>"+data.store+"</td>"
								+"<td>"+data.monthSale+"</td>"
								+"<td>"+data.commentNum+"</td>"
								+"<td>"+data.status+"</td>"
								+"<td>"+data.recommendFlag+"</td>"
								+"<td>"
								+"<div style=\"white-space:normal; overflow:visible;\">"
									+"<button class=\"btn btn-sm btn-icon btn-primary\" title=\"商品详情\" "
										+"onclick=\"toSkit('${basePath }${pageContext.request.contextPath}/ProductAction!productDetailsUI.action?product.id="+data.id
										+"')\">"
										+"<i class=\"fa fa-list\"></i></button>&nbsp;&nbsp;"
								//	+"<button class=\"btn btn-sm btn-icon btn-info\"><i class=\"glyphicon glyphicon-pencil\"></i></button>"
              						+"<button onclick= 'deleteProduct(\""+data.id+"\")' class=\"btn btn-sm btn-icon btn-danger\" title=\"删除\"><i class=\"glyphicon glyphicon-trash\"></i></button>"
              					//		+"onclick=\"toSkit('${basePath }${pageContext.request.contextPath}/ProductAction!deleteProduct.action?product.id="+data.id
								//		+"')\">"
              					//		+"<i class=\"glyphicon glyphicon-trash\"></i></button>"
              					+"</div>"
								+"</td>"
								+"</tr>");
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
	
	 

</script>
