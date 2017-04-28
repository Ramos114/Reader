<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<title>修改小类别信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">小类别管理</h1>
	<label id="slc_id" hidden="hidden">${session.slc_info.id }</label> <label
		id="createDate" hidden="hidden">${session.slc_info.createDate }</label>
	<label id="createName" hidden="hidden">${session.dlc_info.createName }</label>
	<label id="optLock" hidden="hidden">${session.slc_info.optLock }</label>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">修改小类别</div>
	<div class="panel-body">
		<div class="col-sm-12">

			<div class="panel panel-default">

				<div class="panel-body">
					<p class="text-muted">小类别信息</p>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">小类编号</label>
						<div class="col-sm-10">
							<input type="text" id="slcId" class="form-control" placeholder="" id="slcId"
								value="${session.slc_info.slcId }">
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">小类名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="" id="slcName"
								value="${session.slc_info.slcName }">
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">大类名称</label>
						<div class="col-sm-10">
							
							<s:select list="#session.bgclist" name="bigcategory.id" value="#session.slc_info.bigcategory.id" 
							listKey="id" listValue="bgcName" headerKey="" id="id"/>
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label>小类说明</label>
						<textarea class="form-control" rows="6" placeholder=""  id="slcContent">${session.slc_info.slccontent }</textarea>
					</div>
				</div>
				<footer class="panel-footer text-center bg-light lter">
					<button type="submit" class="btn btn-success" onclick="update_slc('${session.slc_info.id }')">保存</button>
					&nbsp;&nbsp;
					
					<button class="btn btn-default"
						onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/smallcategoryManage.jsp')">
						返回</button>
				</footer>
			</div>

		</div>
	</div>

</div>

<script type="text/javascript">
	
	function update_slc(id) {
		
	 $.ajax({
				type: 'post',
				url: "${basePath}${pageContext.request.contextPath}/CategoryAction!slcUpdate.action",
				data:{
				    "smallcategory.id":id,
				    "smallcategory.slcId":$("#slcId").val(),		
					"smallcategory.slcName":$("#slcName").val(),
					"smallcategory.bigcategory.id":$("#id").val(),
					"smallcategory.slccontent":$("#slcContent").val(),
					"smallcategory.createDate":$("#createDate").html(),
					"smallcategory.createName":$("#createName").html(),
					"smallcategory.optLock":$("#optLock").html(),
				},
			    dataType:"text",
			    success: function(data){
					if (data == "update_success") {						
						//跳转刷新
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/pro/smallcategoryManage.jsp");
						layer.msg("恭喜，修改小类成功！", {icon: 1});
					} else {
						layer.msg("抱歉，修改小类失败！", {icon: 2});
					}
			    },
			    cache:false
			});
			}
	
</script>