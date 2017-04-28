<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<title>修改大类别信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">大类别管理</h1>
	<label id="bgc_id" hidden="hidden">${session.bgc_info.id }</label> <label
		id="createDate" hidden="hidden">${session.bgc_info.createDate }</label>
	<label id="createName" hidden="hidden">${session.bgc_info.createName }</label>
	<label id="optLock" hidden="hidden">${session.bgc_info.optLock }</label>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">修改大类别</div>
	<div class="panel-body">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<p class="text-muted">大类别信息</p>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">大类编号</label>
						<div class="col-sm-10">
							<input type="text" id="bgcid" class="form-control" placeholder=""
								value="${session.bgc_info.bgcId }">
						</div>
					</div>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">大类名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder=""
								id="bgcName" value="${session.bgc_info.bgcName }">
						</div>
					</div>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					
					<div class="form-group">
						<label>大类说明</label>
						<textarea class="form-control" rows="5" placeholder=""
							id="bgcContent">${session.bgc_info.bgccontent }</textarea>
					</div>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					
					<div class="form-group">
						<label>大类副说明</label>
						<textarea class="form-control" rows="5" placeholder=""
							id="bgcRContent">${session.bgc_info.bgcRcontent }</textarea>
					</div>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>

					<div class="form-group">
						<label class="col-sm-2 control-label">大类别图片</label> <img
							src="${basePath }${pageContext.request.contextPath}/${session.bgc_info.bgcImgUrl}"
							width="60px;" height="60px;" />

					</div>

					<div class="form-group">
           				 <label class="col-sm-2 control-label">图片修改</label>
            			<div class="col-sm-9">           	
               		 	<input id="file-pic" name="file" type="file" multiple>            
            			</div>
					</div>
					</div>
				<footer class="panel-footer text-center bg-light lter">
					<button class="btn btn-primary"
						onclick="update_bgc('${session.bgc_info.id }')">保存</button>
					&nbsp;&nbsp;
					<button class="btn btn-default"
						onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/bigcategoryManage.jsp')">
						返回</button>
				</footer>
				
			</div>

		</div>
	</div>

</div>

<script type="text/javascript">
	$('#file-pic').fileinput('refresh', {//初始化上传文件框
	
	showUpload : false,
        showRemove : false,
        uploadAsync: true,
        uploadLabel: "上传",//设置上传按钮的汉字
        uploadClass: "btn btn-primary",//设置上传按钮样式
        showCaption: false,//是否显示标题
        language: "zh",
        uploadUrl: "CategoryAction!addPicture.action",
        maxFileSize : 0,
        maxFileCount: 1,/*允许最大上传数，可以多个，当前设置单个*/
        enctype: 'multipart/form-data',
        //allowedPreviewTypes : [ 'image' ], //allowedFileTypes: ['image', 'video', 'flash'],
        allowedFileExtensions : ["jpg", "png","gif"],/*上传文件格式*/
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        dropZoneTitle: "请通过拖拽图片文件放到这里", 
        dropZoneClickTitle: "或者点击此区域添加图片",
        uploadExtraData: {"bannerPic.picImgUrl": "url"},//强行添加bannerPic对象，为了给spring管理
        showBrowse: false,
    	browseOnZoneClick: true,
        slugCallback : function(filename) {
            return filename.replace('(', '_').replace(']', '_');
		}
	});


	function update_bgc(id) {
		
		if ($("#bgcid").val() == null || $("#bgcid").val().length == 0) {
			alert("大类编号不能为空！");
		} else {
			if ($("#bgcName").val() == null || $("#bgcName").val().length == 0) {
				alert("大类名称不能为空！");
			} else {
				if ($("#bgcContent").val() == null
						|| $("#bgcContent").val().length == 0) {
					alert("类别说明不能为空！");
				} else {
					if ($("#bgcRContent").val() == null
							|| $("#bgcRContent").val().length == 0) {
						alert("类别副说明不能为空！");
					} else {
						$
								.ajax({
									type : 'post',
									url : "${basePath}${pageContext.request.contextPath}/CategoryAction!bgcUpdate.action",
									data : {
										"bigcategory.id" : id,
										"bigcategory.bgcId" : $("#bgcid").val(),
										"bigcategory.bgcName" : $("#bgcName")
												.val(),
										"bigcategory.bgccontent" : $(
												"#bgcContent").val(),
										"bigcategory.bgcRcontent" : $(
												"#bgcRContent").val(),
										"bigcategory.createDate" : $(
												"#createDate").html(),
										"bigcategory.createName" : $(
												"#createName").html(),
										"bigcategory.optLock" : $("#optLock")
												.html(),
									},
									dataType : 'json',
									success : function(data, status) {
									
										if (status == "success") {
											if (data.status == "update_success") {
												
												$('#file-pic')
														.fileinput(
																'refresh',
																{//加入上传参数--》图片上传返回ID
																	uploadExtraData : {
																		"bigcategory.id" : data.id
																	},//商品id存到图片中的外键商品id,以此图片与商品对应
																});

												$('#file-pic').fileinput(
														'upload');//上传文件

												layer.alert('添加成功!', {//图片信息和上传文件，提交成功，弹提示
													icon : 1,
													skin : 'layui-layer-lan',
													closeBtn : 0,
												//anim: 4 //动画类型
												});
												toSkit("${basePath }${pageContext.request.contextPath}/model/manager/pro/bigcategoryManage.jsp")
												layer.msg("恭喜，修改大类成功！", {
													icon : 1
												});

											} else {
												layer.msg("抱歉，修改大类失败！", {
													icon : 2
												});
												addNullMessage();
											}
										} else {
											alert("查询失败,ajax请求返回失败!");
										}
									},
									cache : false
								});
					}
				}
			}

		}
	}
</script>