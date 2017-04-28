<%@ page language="java" pageEncoding="UTF-8"%>

<title>添加角色</title>

<style type="text/css">

</style>

<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">添加角色</h1>
</div>

<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">基础信息</div>
    
    <div class="row wrapper">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
        
          <div class="form-group">
            <label class="col-sm-2 control-label">角色编号</label>
            <div class="col-sm-3">
              <input type="text" id="roleNo" class="form-control " placeholder="数字或字母组合" > 
              <i id="roleNo_check" class=""></i>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label">角色名称</label>
            <div class="col-sm-3">
              <input type="text" id="roleName" class="form-control" placeholder="由中文字符组成">    
              <i id="roleName_check" class=""></i>                       
            </div>
          </div>
          
          
          <div class="form-group">
            <label class="col-sm-2 control-label">角色类型</label>
            <div class="col-sm-2">
              <select id="roleType" class="form-control">
                <option value="普通管理员">普通管理员</option>
              </select>                       
            </div>
          </div>
          
          
          <div class="form-group">
             <label class="col-sm-2 control-label">角色描述</label>
               <div class="col-sm-4">
              	 <textarea id="roleDescription" class="form-control" rows="3" placeholder="描述"></textarea>                       
              </div>
         </div>
          

          <div class="line line-dashed b-b line-lg pull-in"></div>
          
            <div class="form-group">
            <div class="col-sm-4 col-sm-offset-2">
              <button type="button" class="btn btn-default" onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/sys/roleManage.jsp')">返回</button>
              <button id="save" type="button" class="btn btn-primary" >保存</button>
          </div>
        </div>
        </div>
      </div>
    </div>
    
  </div>
</div>

<script type="text/javascript">
	//ajax添加角色
   	$("#save").click(function(){
   		var roleNo = $("#roleNo").val();
   		var roleName = $("#roleName").val();
   		var roleType = $('#roleType option:checked').val();
   		var description = $("#roleDescription").val();
   		$.ajax({
   			type:'post',
   			url:"${basePath }${pageContext.request.contextPath}/RoleAction!saveRole.action",
   			data:{
   				"role.roleNo":roleNo,
   				"role.roleName":roleName,
   				"role.roleType":roleType,
   				"role.description":description,
   			},
   			dataType:'text',
   			success:function(data){
   				if(data == "success"){
   					layer.msg("添加角色成功！",{icon:1});
   					//跳转成功！
   					$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/sys/roleManage.jsp");
   				}else{
   					layer.msg("添加角色失败！",{icon:2});
   				}
   			},
   			cache:false,
   		});
   	});
</script>