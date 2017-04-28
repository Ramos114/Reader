<%@ page language="java" pageEncoding="UTF-8"%>

<title>角色管理</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">角色管理</h1>
</div>
<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">角色列表</div>
        <div class="row wrapper">
      <div class="col-sm-5 m-b-xs">
        <button id="btnAddRole" class="btn btn-sm btn-primary btn-addon"><i class="fa fa-plus"></i>添加</button>         
      </div>
      <div class="col-sm-4">
      </div>
      <!-- 
      <div class="col-sm-3">
        <div class="input-group">
          <input type="text" class="input-sm form-control" placeholder="请输入真实姓名" id="realName">
          <span class="input-group-btn">
            <button id="search" class="btn btn-sm btn-icon btn-success" onclick="return false"><i class="glyphicon glyphicon-search"></i></button>
          </span>
        </div>
      </div>
       -->
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th style="width:15%">角色编号</th>
            <th style="width:10%">角色名称</th>
            <th style="width:15%">角色类型</th>
            <th style="width:40%">描述</th>
            <th class="text-info" style="width:20%" >操作</th>
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
  <!-- 保存roleid -->
  <input type="hidden" id="roleId" name="roleId" />
  <!-- 保存菜单id -->
  <input type="hidden" id="menuIds" name="menuIds" />
</div>


<!-- 权限分配模态框 -->
<div class="modal fade" id="powerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">权限分配</h4>
			</div>
			
			<div class="modal-body">
			   <%@ include file="/model/manager/sys/menuTree.jsp" %>
			</div>
			
	        <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button id="btnSavePower" type="button" class="btn btn-primary" >提交</button>
	        </div>
		</div><!-- /.modal-content -->
	</div>
</div>
<!-- /权限分配模态框 -->



<script type="text/javascript">

	doRequest(1);



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
    	url:"${basePath}${pageContext.request.contextPath}/RoleAction!findPageRole.action",
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
			if(data.result[i].roleNo == null ){
				data.result[i].roleNo="";
			}
			if(data.result[i].roleName == null ){
				data.result[i].roleName="";
			}
			if(data.result[i].description == null ){
				data.result[i].description="";
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
		$("#tableTbody").append("<tr>"
								+"<td>"+data.roleNo+"</td>"
								+"<td>"+data.roleName+"</td>"
								+"<td>"+data.roleType+"</td>"
								+"<td>"+data.description+"</td>"
								+"<td><button class=\"btn btn-sm btn-icon btn-primary\" onClick=\"showModel('"+data.id+"')\" title=\"权限分配\">"
								+"<i class=\"glyphicon glyphicon-wrench\"></i></button>&nbsp;"
								+"<button class=\"btn btn-sm btn-icon btn-info\" onClick=\"loadRole('"+data.id+"')\" title=\"更改信息\">"
								+"<i class=\"glyphicon glyphicon-pencil\"></i></button>&nbsp;"
								+"<button class=\"btn btn-sm btn-icon btn-danger\" onClick=\"deleteRole('"+data.id+"')\" title=\"删除角色\">"
								+"<i class=\"glyphicon glyphicon-trash\"></i></button></td>"
								+"</tr>");
	}
	
	
	//show模态框，并赋值角色id
	function showModel(id){
		$("#roleId").val(id);
		$("#powerModel").modal("show");
		
		starDownTree();//跨页面加载树
	}

	
	//绑定方法
	//跳转角色添加页面
	$("#btnAddRole").click(function(){
		toSkit("${basePath}${pageContext.request.contextPath}/RoleAction!toAddRole.action");
	});
	
	//提交修改权限
	$("#btnSavePower").click(function(){
		layer.load(2);
		$.ajax({
    		type:'post',
    		url:"${basePath}${pageContext.request.contextPath}/RoleAction!addRoleMenuPower.action",
    		data:{
    			"roleId":$("#roleId").val(),
    			"menuIds":$("#menuIds").val(),
    			},  
     		dataType:'json',  
    		success:function(data,status){
    			if (status == "success") {
    				if(data.status == "success"){
    					layer.closeAll('loading');
    					layer.alert("权限添加成功", {icon: 6});
    					toSkit("${basePath}${pageContext.request.contextPath}/model/manager/sys/roleManage.jsp");
    				}else{
    					alert("添加失败,编码的错误!");
    				}

				} else {
					alert("添加失败,ajax请求返回失败!");
				}
    		},
    		cache:false					//不缓存
    	});
	});
	
	function loadRole(id){
		$("#content_load").load("${basePath}${pageContext.request.contextPath}/RoleAction!edit_ui.action?id="+id);
	}
	
	function deleteRole(id){
		layer.confirm("确定删除该角色吗？",{icon:7},function(){
			layer.msg("删除角色成功！",{icon:1});
			$("#content_load").load("${basePath}${pageContext.request.contextPath}/RoleAction!deleteRole.action?id="+id);
		});
	}
</script>
