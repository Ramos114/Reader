<%@ page language="java" pageEncoding="UTF-8"%>

<style>
table td{white-space:nowrap;overflow:hidden; text-overflow:ellipsis;}
table th{white-space:normal;}
table {table-layout:fixed;}
</style> 

<title>轮播图管理</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">轮播图管理</h1>
</div>
<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">轮播图列表</div>
    <div class="row wrapper">
      <div class="col-sm-4 m-b-xs">   
        <button class="btn btn-sm btn-primary btn-addon" onclick="AddPic();"><i class="fa fa-plus"></i>添加</button>         
      </div>
      <div class="col-sm-5">
      <label>显示:</label>
      <select id="display" onchange="tableChange();" class="input-sm form-control w-sm inline v-middle">
          <option value="0">全部</option>
          <option value="1">使用</option>
          <option value="2">未使用</option>
       </select>
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
          	<!-- <th style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </th> -->
            <th style="width:20%">编号</th>
            <th style="width:15%">名称</th>
            <th style="width:15%">图片标题</th>
            <th style="width:15%">图片副标题</th>
            <th style="width:10%">是否使用</th>
            <th style="width:15%">图片存放地址</th>
            <th style="width:10%">操作</th>
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
		//查询当前页并减一
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
		//查询当前页并加一
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
    	url:"${basePath}${pageContext.request.contextPath}/BannerPicAction!findAllPictute.action",
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
			if(data.result[i].picName == null ){
				data.result[i].picName="";
			}
			if(data.result[i].picTilte == null ){
				data.result[i].picTilte="";
			}
			if(data.result[i].picSubTitle == null ){
				data.result[i].picSubTitle="";
			}
			if(data.result[i].picFlag == null ){
				data.result[i].picFlag=0;
			}
			if(data.result[i].picImgUrl == null ){
				data.result[i].picImgUrl="";
			}
			console.log(data.result[i].picImgUrl);
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
		var  Flag = "<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox' onclick = sel(this,'"+data.id+"');><i></i> </label>";
		if(data.picFlag == 1 ){//如果标记使用，加上checked
			Flag = "<label class='i-switch bg-primary m-t-xs m-r'> <input type='checkbox' checked onclick = sel(this,'"+data.id+"');><i></i> </label>";
		}
		$("#tableTbody").append("<tr>"
								/* +"<td><label class=\"i-checks m-b-none\">"
								+"<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+"</td>" */
								+"<td>"+data.id+"</td>"
								+"<td>"+data.picName+"</td>"
								+"<td>"+data.picTilte+"</td>"
								+"<td>"+data.picSubTitle+"</td>"
								+"<td>"+Flag+"</td>"
								+"<td>"+"<a class='thumbnail'>"
								+"<img  src='${basePath }${pageContext.request.contextPath}"+data.picImgUrl+"' onclick='showBigImg(\""+data.picImgUrl+"\")'>"
								+"</a>"
								+"</td>"
								+"<td>"
								+"<div style=\"white-space:normal; overflow:visible;\">"
									+"<button onclick= 'updatePic(\""+data.id+"\")' class=\"btn btn-sm btn-icon btn-info\"><i class=\"glyphicon glyphicon-pencil\"></i></button>"
              						+"<button onclick= 'deletePic(\""+data.id+"\")' class=\"btn btn-sm btn-icon btn-danger\"><i class=\"glyphicon glyphicon-trash\"></i></button>"
              					+"</div>"
								+"</td>"
								+"</tr>");
	}
	
	
	
	//ajax请求使用的table数据
	function doFlagRequest(currentPage){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BannerPicAction!findFlagPicture.action",
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
	
	//ajax请求未使用table数据
	function doNoFlagRequest(currentPage){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BannerPicAction!findNoFlagPicture.action",
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
	
	//ajax请求设置图片不使用
	function updateNoFlagPictute(id){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BannerPicAction!updateNoFlagPictute.action",
    	data:{
    		"bannerPic.id" : id,
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				layer.alert('设置成功!', {//设置成功，弹提示
    					icon: 1,
    				    skin: 'layui-layer-lan',
    				    closeBtn: 0,
    				    //anim: 4 //动画类型
    				  });
    			}else{
    				
    				layer.alert('查询失败,编码的错误!', {//设置成功，弹提示
    					icon: 1,
    				    skin: 'layui-layer-lan',
    				    closeBtn: 0,
    				    //anim: 4 //动画类型
    				  });
    			}

			} else {
				layer.alert('查询失败,ajax请求返回失败!', {//设置成功，弹提示
					icon: 1,
				    skin: 'layui-layer-lan',
				    closeBtn: 0,
				    //anim: 4 //动画类型
				  });
				//alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	}
	
	//ajax请求设置图片不使用
	function updateFlagPictute(id){
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BannerPicAction!updateFlagPictute.action",
    	data:{
    		"bannerPic.id" : id,
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				layer.alert('设置成功!', {//设置成功，弹提示
    					icon: 1,
    				    skin: 'layui-layer-lan',
    				    closeBtn: 0,
    				    //anim: 4 //动画类型
    				  });
    			}else{
    				
    				layer.alert('查询失败,编码的错误!', {//设置成功，弹提示
    					icon: 1,
    				    skin: 'layui-layer-lan',
    				    closeBtn: 0,
    				    //anim: 4 //动画类型
    				  });
    			}

			} else {
				layer.alert('查询失败,ajax请求返回失败!', {//设置成功，弹提示
					icon: 1,
				    skin: 'layui-layer-lan',
				    closeBtn: 0,
				    //anim: 4 //动画类型
				  });
				//alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false					//不缓存
    	});
	}
	
	function deletePic(id){
		//查询当前页
		var page = 0;
		$(".pagination").find("li").each(function() {
					if ($(this).hasClass("active")) {
						page = window.parseInt($(this).children("a").html());
					}
				});
		 $.ajax({
	    	type:'post',
	    	url:"${basePath}${pageContext.request.contextPath}/BannerPicAction!deletePicture.action",
	    	data:{
	    		"bannerPic.id" : id,
	    		},  
	     	dataType:'json',  
	    	success:function(data,status){
	    		if (status == "success") {
	    			
	    			if(data.status == "success"){
	    				layer.alert('删除成功!', {//设置成功，弹提示
	    					icon: 1,
	    				    skin: 'layui-layer-lan',
	    				    closeBtn: 0,
	    				    //anim: 4 //动画类型
	    				  });
	    				doRequest(page);//重新加载当前页表格
	    			}else{
	    				
	    				layer.alert('查询失败,编码的错误!', {//设置成功，弹提示
	    					icon: 1,
	    				    skin: 'layui-layer-lan',
	    				    closeBtn: 0,
	    				    //anim: 4 //动画类型
	    				  });
	    			}

				} else {
					layer.alert('查询失败,ajax请求返回失败!', {//设置成功，弹提示
						icon: 1,
					    skin: 'layui-layer-lan',
					    closeBtn: 0,
					    //anim: 4 //动画类型
					  });
					//alert("查询失败,ajax请求返回失败!");
					
				}
	    	},
	    	cache:false					//不缓存
	    	}); 
	}
	
	function updatePic(id){
		toSkit("${basePath }${pageContext.request.contextPath}/BannerPicAction!bannerPicDetailsUI.action?bannerPic.id="+id) ;
	}
	
	function AddPic(){
		toSkit("${basePath }${pageContext.request.contextPath}/model/manager/bannerPic/bannerPicAdd.jsp") ;
	}
	
	function tableChange(){//选择显示信息0 所有.1使用.2未使用
		var val = $('#display').val();
		//alert(val);
		if( val == 1 ){
			doFlagRequest(1);
		}else if( val == 2 ){
			doNoFlagRequest(1);
		}else{
			doRequest(1);
		}
	}
	
	function sel ( obj, id ){//设置图片是否使用
		//alert(obj.checked);
		if(obj.checked){
			updateFlagPictute(id);//设置使用
		}else{
			updateNoFlagPictute(id);//设置不使用
		}
		}
	
	function showBigImg(imgUrl){
		//alert(imgUrl);
		//var imgUrl = $(this)[0].src;
		//alert(imgUrl);
		$('#imgInModalID').attr("src", '${basePath}${pageContext.request.contextPath}'+imgUrl);
		$('#imgModal').modal('show');
	}
</script>
