<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<title>添加一级分类信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">一级分类管理</h1>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">添加一级分类</div>
	<div class="panel-body">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<p class="text-muted">请填写一级分类信息</p>
					<form id="form_bgcAdd" action="" method="post">
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">一级分类编号</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" placeholder="请输入一级分类编号" id="bgcId" name="bigCategory.bgcId">
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">一级分类名称</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" placeholder="请输入一级分类名称，如'网文男频'" id="bgcName" name="bigCategory.bgcName">
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>

						<div class="form-group">
							<label class="col-sm-2 control-label">一级分类说明</label>
							<div class="col-sm-4">
								<textarea rows="4" id="bgcContent" name="bigCategory.bgcContent" class="form-control" placeholder="请输入一级分类说明"></textarea>
								<i id="bgcContent_check" class=""></i>
							</div>
						</div>

						<div class="line line-dashed b-b line-lg pull-in"></div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">一级分类副说明</label>
							<div class="col-sm-4">
								<textarea rows="4" id="bgcRcontent" name="bigCategory.bgcRcontent" class="form-control" placeholder="请输入一级分类副说明"></textarea>
								<i id="bgcRcontent_check" class=""></i>
							</div>
						</div>
						
					</form>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
            			<label class="col-sm-2 control-label">一级分类图片</label>
            			<div class="col-sm-9">           	
                			<input id="file-pic" name="file" type="file" multiple>            
            			</div>
          			</div>    
				</div>

				<footer class="panel-footer text-center bg-light lter">
					<button class="btn btn-success" onclick="add_bgc()">确定</button>
					&nbsp;&nbsp;
					<button class="btn btn-info" id="reInput">清空</button>
					&nbsp;&nbsp;
					<button class="btn btn-default"
						onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/book/bigCategoryManage.jsp')">
						返回</button>
				</footer>
			</div>

		</div>
	</div>

</div>

<script type="text/javascript">
	//【2】上传图片
	// 图片-文件初始化上传文件框
	$('#file-pic').fileinput('refresh', {
	
		showUpload : false,
        showRemove : false,
        uploadAsync: true,
        uploadLabel: "上传",//设置上传按钮的汉字
        uploadClass: "btn btn-primary",//设置上传按钮样式
        showCaption: false,//是否显示标题
        language: "zh",
        uploadUrl: "CategoryAction!addPicture.action",//上传大类封面图
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

	//【1】先添加一级分类信息，返回该大类id给【2】图片上传用，把图片路径保存到该大类id，更新实体
	function add_bgc() {
	
		var bgcId = $("#bgcId").val();
		var bgcName = $("#bgcName").val();
		var bgcContent = $("#bgcContent").val();
		var bgcRcontent = $("#bgcRcontent").val();
		var bgcImgUrl =$("#file-pic").val();
		if (bgcId == null || bgcId.length == 0) {
			alert("一级分类编号不能为空！");
		} else {
			if (bgcName == null || bgcName.length == 0) {
				alert("一级分类名称不能为空！");
			} else {
				if (bgcContent == null || bgcContent.length == 0) {
					alert("类别说明不能为空！");
				} else {
					if (bgcRcontent == null || bgcRcontent.length == 0) {
						alert("类别副说明不能为空！");
					} else {
					
						$.ajax({
									type : 'post',
									url : "${basePath}${pageContext.request.contextPath}/CategoryAction!bgcAdd.action",
									data : {
											"bigCategory.bgcId" : bgcId,
											"bigCategory.bgcName" : bgcName,
											"bigCategory.bgcContent" : bgcContent,
											"bigCategory.bgcRcontent":bgcRcontent,
											"bigCategory.bgcImgUrl":bgcImgUrl,
										},
									dataType:'json', 
									success : function(data,status) {
									    if (status == "success") {
											if (data.status == "bgcId_exist") {
												alert("添加失败,该一级分类编号已存在!");
											} else if (data.status == "bgcName_exist") {
												alert("添加失败,该一级分类名称已存在!");
											} else if (data.status == "bgcadd_success") {
											
											//加入上传参数--》加入一级分类ID绑定到图片上
											$('#file-pic').fileinput('refresh' ,{
    											uploadExtraData: {"bigCategory.id": data.id},
    										});
    				
    										$('#file-pic').fileinput('upload');//上传文件

    				  						layer.alert('添加成功!', {//图片信息和上传文件，提交成功，弹提示
    											icon: 1,
    				    						skin: 'layui-layer-lan',
    				    						closeBtn: 0,
    				    						//anim: 4 //动画类型
    										});
    										
												toSkit("${basePath }${pageContext.request.contextPath}/model/manager/book/bigCategoryManage.jsp");
												layer.msg("恭喜，添加一级分类成功！", {
													icon : 1
												});

											} else {
												layer.msg("抱歉，添加一级分类失败！", {
													icon : 2
												});
												addNullMessage();
											}
										}else {
											alert("查询失败,ajax请求返回失败!");
										}
									},
									cache : false,
								//不缓存
								});
					}
				}
			}
		}

	}

	//清空，重新输入
	$("#reInput").click(function() {
		document.getElementById("bgcId").value = "";
		document.getElementById("bgcName").value = "";
		document.getElementById("bgcContent").value = "";
		document.getElementById("bgcRcontent").value = "";
	});
</script>