<%@ page language="java" pageEncoding="UTF-8"%>

<style type="text/css">
  .line {height: 100%;}
</style>
<title>菜单管理</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">菜单管理</h1> 
</div>
<div class="hbox hbox-auto-xs hbox-auto-sm" ng-controller="AbnTestController">
  <div class="col w-lg bg-light b-r bg-auto">
    <div class="wrapper-md">
      <span class="h4">菜单树</span>
      <div class="line b-b line-lg"></div>
      <div class="zTreeDemoBackground">
        <ul id="treeDemo" class="ztree"></ul>
      </div>
    </div>

  </div>
  <div class="col-width">
    <div class="wrapper-md">
      <span class="h4">菜单信息</span>
      <div class="line b-b line-lg"></div>
      <div class="wrapper-menu">
      	<input id="menuId"  type="hidden" >
        <label class="col-sm-2 control-label text-right">父菜单名称</label>
        <input id="parentName" class="input-sm form-control m-b w-xxl" type="text" readonly="readonly">
        <label class="col-sm-2 control-label text-right">菜单名称</label>
        <input id="menuName" class="input-sm form-control m-b w-xxl" type="text">
        <label class="col-sm-2 control-label text-right">菜单链接</label>
        <input id="menuUrl" class="input-sm form-control m-b w-xxl" type="text">
        <label class="col-sm-2 control-label text-right">序号</label>
        <input id="serialNo" class="input-sm form-control m-b w-xs" type="text">
      </div>
      <div class="line b-b line-lg"></div>
      <div class="padder-right" >
        <button id="btnAdd" class="btn btn-default disabled">新增同级节点</button>
        <button id="btnAddSub" class="btn btn-default disabled">新增子节点</button>
        <button id="btnSave" class="btn btn-success disabled">保存</button>
        <button id="btnDel" class="btn btn-danger disabled">删除</button>
      </div>
      </div>
  </div>

</div>



<script type="text/javascript" >
	//开始加载树
	starDownTree();

	var setting = {  
        check: {  
            enable: false,
        },
        callback:{
            onClick:onClickNode,
        },
        data: {  
            simpleData: {  
                enable: true,
            }  
        },
        view: { 
        	showIcon: showIconForTree, 
        	selectedMulti: false, 
        	nameIsHTML: true, 
        },
    }; 
	
	
	function showIconForTree(treeId, treeNode) {
		return !treeNode.isParent;
	};

	
	//开始加载树
	function starDownTree(){
        $.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/MenuAction!getMenuTree.action?time="+new Date(),
			data:{},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						createTree(data.list);
					}
					else{
						alert("菜单树生成错误,请重新生成!");
					}
					
				} else {
					alert("ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
			});
          
      	} 
	
	
	//创建树
	function createTree(data){
		$.fn.zTree.init($("#treeDemo"), setting, data);
	}
	
	//树节点点击事件
	function onClickNode(event, treeId, treeNode){
		//如果为子节点
		if(treeNode.level == 1){
			$("#btnAddSub").addClass("disabled");
		}else{
			$("#btnAddSub").removeClass("disabled");
		}
		$("#btnAdd").removeClass("disabled");
		$("#btnSave").removeClass("disabled");
		$("#btnDel").removeClass("disabled");
		
		//加载单个节点数据
		getNodeDate(treeNode.id);
		
	}
	
	//加载点击单个节点数据
	function getNodeDate(menuId){
		$.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/MenuAction!getMenuTreeNode.action",
			data:{
				"menuId":menuId,
			},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						setData(data.menu);
					}
					else{
						alert("菜单树生成错误,请重新生成!");
					}
					
				} else {
					alert("ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
			});
	}
	
	
	//设置数据
	function setData(menu){
		if(menu.id == null){
			menu.id="";
		}
		
		if(menu.parentMenu == null){
			$("#parentName").val("");
		}else{
			$("#parentName").val(menu.parentMenu.menuName);
		}
		
		if(menu.menuName == null){
			menu.menuName="";
		}
		if(menu.serialNo == null){
			menu.serialNo="";
		}
		
		$("#menuId").val(menu.id);
		$("#menuName").val(menu.menuName);
		$("#menuUrl").val(menu.menuUrl);
		$("#serialNo").val(menu.serialNo);
	}
	
	
	
	
	//绑定事件//
	//增加同级菜单
	$("#btnAdd").click(function(){
		$.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/MenuAction!addMenu.action",
			data:{
				"menuId":$("#menuId").val(),
				"menuName":$("#menuName").val(),
				"menuUrl":$("#menuUrl").val(),
				"serialNo":$("#serialNo").val(),
			},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						layer.alert("新增子菜单成功", {icon: 6});
						//跳转刷新
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/sys/menuManage.jsp");
					}
					else{
						alert("新增同级菜单发生错误!");
					}
					
				} else {
					alert("ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
			});
	});
	
	
	
	//增加子菜单
	$("#btnAddSub").click(function(){
		$.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/MenuAction!addMenuSub.action",
			data:{
				"menuId":$("#menuId").val(),
				"menuName":$("#menuName").val(),
				"menuUrl":$("#menuUrl").val(),
				"serialNo":$("#serialNo").val(),
			},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						alert("新增子菜单成功!");
						//跳转刷新
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/sys/menuManage.jsp");
					}
					else{
						alert("新增同级菜单发生错误!");
					}
					
				} else {
					alert("ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
			});
	});
	
	
	
	//保存菜单
	$("#btnSave").click(function(){
		$.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/MenuAction!saveMenu.action",
			data:{
				"menuId":$("#menuId").val(),
				"menuName":$("#menuName").val(),
				"menuUrl":$("#menuUrl").val(),
				"serialNo":$("#serialNo").val(),
			},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						alert("保存成功!");
						//跳转刷新
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/sys/menuManage.jsp");
					}
					else{
						alert("保存菜单发生错误!");
					}
					
				} else {
					alert("ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
			});
	});
	
	
	//删除菜单
	$("#btnDel").click(function(){
		$.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/MenuAction!deleteMenu.action",
			data:{
				"menuId":$("#menuId").val(),
			},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						alert("删除成功!");
						//跳转刷新
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/sys/menuManage.jsp");
					}
					else{
						alert("删除菜单发生错误!");
					}
					
				} else {
					alert("ajax请求返回失败!");
				}
			},
			cache:false					//不缓存
			});
	});
	
	//绑定事件//
</script>
