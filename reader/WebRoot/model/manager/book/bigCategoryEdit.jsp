<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<title>修改一级分类信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">一级分类管理</h1>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">修改一级分类</div>
	<div class="panel-body">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-body">
				<!-- 表单，用于表单序列号 -->
				<form id="form_Category" enctype="multipart/form-data" action="" method="post">
					<!-- 隐藏域 -->
					<!-- 修改时id和optLock是必须的 -->
  					<input type="hidden" id="id" name="bigCategory.id" value="${bigCategory.id }">
  					<input type="hidden" id="optLock" name="bigCategory.optLock" value="${bigCategory.optLock }">
  					<input type="hidden" id="createDate" name="bigCategory.createDate" value="${bigCategory.createDate }">
  					<input type="hidden" id="createName" name="bigCategory.createName" value="${bigCategory.createName }">
  					<input type="hidden" id="createId" name="bigCategory.createId" value="${bigCategory.createId }">
  					<!-- (可选)保存原图片地址，可不修改图片，与上传图片无关 -->
  					<input type="hidden" id="bgcImgUrl" name="bigCategory.bgcImgUrl" value="${bigCategory.bgcImgUrl }">
				
					<p class="text-muted">一级分类信息</p>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">一级分类编号</label>
						<div class="col-sm-4">
							<%-- <input type="hidden" id="id" value="${bigCategory.id }"> --%><!-- 隐藏域id -->
							<input type="text" class="form-control" placeholder="请输入一级分类编号" id="bgcId" name="bigCategory.bgcId" value="${bigCategory.bgcId }">
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">一级分类名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" placeholder="请输入一级分类名称，如'网文男频'" id="bgcName" name="bigCategory.bgcName" value="${bigCategory.bgcName }">
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">一级分类说明</label>
						<div class="col-sm-4">
							<textarea rows="4" id="bgcContent" name="bigCategory.bgcContent" class="form-control" placeholder="请输入一级分类说明">${bigCategory.bgcContent }</textarea>
							<i id="bgcContent_check" class=""></i>
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">一级分类副说明</label>
						<div class="col-sm-4">
							<textarea rows="4" id="bgcRcontent" name="bigCategory.bgcRcontent" class="form-control" placeholder="请输入一级分类副说明">${bigCategory.bgcRcontent }</textarea>
							<i id="bgcRcontent_check" class=""></i>
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>

					<div class="form-group">
						<label class="col-sm-4 control-label">一级分类图片</label> 
						<img src="${basePath }${pageContext.request.contextPath}/${bigCategory.bgcImgUrl}" width="15%;" height="8%;" />
					</div>

					<div class="form-group">
           				<label class="col-sm-2 control-label">图片修改</label>
            			<div class="col-sm-9">           	
               		 		<input id="file-pic" name="file" type="file" multiple>            
            			</div>
					</div>
				</form>	
				</div>
				<footer class="panel-footer text-center bg-light lter">
					<button class="btn btn-primary" 
							onclick="update_bgc()">保存</button>
					&nbsp;&nbsp;
					<button class="btn btn-default" 
							onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/book/bigCategoryManage.jsp')">返回</button>
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


	//修改一级分类信息
	function update_bgc() {
		
		if ($("#bgcId").val() == null || $("#bgcId").val().length == 0) {
			alert("大类编号不能为空！");
		} else {
			if ($("#bgcName").val() == null || $("#bgcName").val().length == 0) {
				alert("大类名称不能为空！");
			} else {
				if ($("#bgcContent").val() == null || $("#bgcContent").val().length == 0) {
					alert("类别说明不能为空！");
				} else {
					if ($("#bgcRcontent").val() == null || $("#bgcRcontent").val().length == 0) {
						alert("类别副说明不能为空！");
					} else {
						$.ajax({
									type : 'post',
									url : "${basePath}${pageContext.request.contextPath}/CategoryAction!bgcUpdate.action",
									data: $("#form_Category").serialize(),	//表单序列化,简化(相当于下面的步骤)
									/* 另法如下 */
					/* 				data : {  
										"bigCategory.id" : $("#id").val(),<!--必须-->
										"bigCategory.optLock": $("#optLock").val(),<!--必须-->
										"bigCategory.bgcId" : $("#bgcId").val(),
										"bigCategory.bgcName" : $("#bgcName").val(),
										"bigCategory.bgcContent" : $("#bgcContent").val(),
										"bigCategory.bgcRcontent" : $("#bgcRcontent").val(),
										"bigCategory.bgcImgUrl" : $("#bgcImgUrl").val(),<!--(可选)保存原图片地址，可不修改图片，与上传图片无关-->
										"bigCategory.createDate": $("#createDate").val(),					
										"bigCategory.createName": $("#createName").val(),
										"bigCategory.createId": $("#createId").val(), 
									}, */
									dataType : 'json',
									success : function(data, status) {
									
										if (status == "success") {
											if (data.status == "update_success") {
												//加入上传参数--》图片上传返回ID
												$('#file-pic').fileinput('refresh',{
													uploadExtraData: {"bigCategory.id": data.id},//商品id存到图片中的外键商品id,以此图片与商品对应
												});

												$('#file-pic').fileinput('upload');//上传文件

												layer.alert('添加成功!', {//图片信息和上传文件，提交成功，弹提示
													icon : 1,
													skin : 'layui-layer-lan',
													closeBtn : 0,
													//anim: 4 //动画类型
												});
												toSkit("${basePath }${pageContext.request.contextPath}/model/manager/book/bigCategoryManage.jsp");
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