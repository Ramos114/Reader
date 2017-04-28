<%@ page language="java" pageEncoding="UTF-8"%>

<title>权限分配菜单树</title>
<style type="text/css">
  .line {height: 100%;}
</style>

<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>

<script type="text/javascript" >
	
	var setting = {
			check: {
				enable: true,
				chkDisabledInherit: true
			},
	        callback:{
                onCheck:onCheck
            },
			data: {
				simpleData: {
					enable: true
				}
			},
			view: { 
	        	showIcon: false, 
	        	selectedMulti: false, 
	        	nameIsHTML: true, 
	        },
		};

		var zNodes =[
			{ id:1, pId:0, name:"随意勾选 1", open:true},
			{ id:11, pId:1, name:"随意勾选 1-1", open:true},
			{ id:111, pId:11, name:"disabled 1-1-1", chkDisabled:true},
			{ id:112, pId:11, name:"随意勾选 1-1-2"},
			{ id:12, pId:0, name:"disabled 1-2", chkDisabled:true, checked:true, open:true},
			{ id:121, pId:12, name:"disabled 1-2-1", checked:true},
			{ id:122, pId:12, name:"disabled 1-2-2"},
			{ id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
			{ id:21, pId:2, name:"随意勾选 2-1"},
			{ id:23, pId:2, name:"随意勾选 2-3"}
		];
		
		
		//开始加载树
	function starDownTree(){
        $.ajax({
			type:'post',
			url:"${basePath}${pageContext.request.contextPath}/RoleAction!getMenuRoleTree.action?time="+new Date(),
			data:{
				"roleId":$("#roleId").val(),//跨页面加载
			},
 			dataType:'json',  
			success:function(data,status){
				if (status == "success") {
					if(data.status == "success"){
						createTree(data.list);
					}
					else{
						$("#powerModel").modal("hide");
						alert("菜单树生成错误,请重新生成!");
					}
					
				} else {
					$("#powerModel").modal("hide");
					alert("ajax请求返回失败!");
				}
			},
			cache:false,				//不缓存
			});
          
      	}
		
	

		//开始生成树
		function createTree(data){
			$.fn.zTree.init($("#treeDemo"), setting, data);
		}
		
		
		//选中事件
		function onCheck(event,treeId,treeNode){
			var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
            nodes=treeObj.getCheckedNodes(true);
            
            var menuIds="";
            for(var i=0;i<nodes.length;i++){             
                menuIds+=nodes[i].id+",";
            }
            $("#menuIds").val(menuIds); //跨页面赋值给menuIds
		}

</script>