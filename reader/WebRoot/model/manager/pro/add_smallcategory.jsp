<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<title>添加小类别信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">小类别管理</h1>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">添加小类别</div>
	<div class="panel-body">
		<div class="col-sm-12">
		
				<div class="panel panel-default">

					<div class="panel-body">
						<p class="text-muted">请填写小类信息</p>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">小类编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="" id="slcid">
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">小类名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="" id="slcName">
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">大类名称</label>
							<div class="col-sm-10">
								<s:select name="id" id="id"  list="#session.bgclist"
								listKey="id" listValue="bgcName"  headerKey="" headerValue="---请选择---">
							</s:select>
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label>小类说明</label>
							<textarea class="form-control" rows="6" placeholder="" id="slcContent"></textarea>
						</div>
					</div>
					<footer class="panel-footer text-center bg-light lter">
						<button type="submit" class="btn btn-success" onclick="add_slc()">确定</button>
						&nbsp;&nbsp;
						<button id="re" class="btn btn-info">清空</button>
						&nbsp;&nbsp;
						<button class="btn btn-default" onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/smallcategoryManage.jsp')">
							返回</button>
					</footer>
				</div>
			
		</div>
	</div>

</div>

<script type="text/javascript">
	function add_slc() {
		var slcid = $("#slcid").val();
		var slcName = $("#slcName").val();
		var slcContent = $("#slcContent").val();
		if (slcid == null || slcid.length == 0) {
			alert("小类编号不能为空！");
		} else {
			if (slcName == null || slcName.length == 0) {
				alert("小类名称不能为空！");
			} else {
				if(id.options[id.selectedIndex].text=="---请选择---"){
					alert("请选择大类！");
				}
				else{
				if (slcContent == null || slcContent.length == 0) {
					alert("类别说明不能为空！");
				} else {
					$.ajax({
								type : 'post',
								url : "${basePath}${pageContext.request.contextPath}/CategoryAction!slcAdd.action",
								data : {
									"smallcategory.slcId" : slcid,
									"smallcategory.slcName" : slcName,
									"smallcategory.slccontent" : slcContent,
									"smallcategory.bigcategory.id":$("#id").val(),
								},
								success : function(status) {
								if (status == "slcId_exist") {
										alert("添加失败,该小类编号已存在!");
									}else if (status == "slcName_exist") {
										alert("添加失败,该小类名称已存在!");
										}
										else if (status == "slcadd_success") {
									toSkit("${basePath }${pageContext.request.contextPath}/model/manager/pro/smallcategoryManage.jsp")
										layer.msg("恭喜，添加小类成功！", {icon: 1});

									} else {
										alert("添加失败,ajax请求返回失败!");
										addNullMessage();
									}
								},
								cache : false
							//不缓存
							});
							}
				
				}
			}
		}

	}
	
	$("#re").click(function(){
		document.getElementById("slcid").value="";
		document.getElementById("slcName").value="";
		document.getElementById("slcContent").value="";
	});
</script>