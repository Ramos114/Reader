<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<title>添加大类别信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">大类别管理</h1>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">添加大类别</div>
	<div class="panel-body">
		<div class="col-sm-12">
			<div class="panel panel-default">
					<div class="panel-body">
						<p class="text-muted">请填写大类信息</p>
						<form id="form_bgcAdd" action="" method="post">
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">大类编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder=""
									id="bgcid">
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">大类名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder=""
									id="bgcName">
							</div>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						
						<div class="form-group">
							<label>大类说明</label>
							<textarea class="form-control" rows="5" placeholder=""
								id="bgccontent"></textarea>
						</div>
						<div class="line line-dashed b-b line-lg pull-in"></div>
						
						<div class="form-group">
							<label>大类副说明</label>
							<textarea class="form-control" rows="5" placeholder=""
								id="bgcRcontent"></textarea>
						</div>
						</form>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
            			<label class="col-sm-2 control-label">大类别图片</label>
            			<div class="col-sm-9">           	
                		<input id="file-pic" name="file" type="file" multiple>            
            			</div>
          			</div>    
				</div>

				<footer class="panel-footer text-center bg-light lter">
					<button class="btn btn-success" onclick="add_bgc()">确定</button>
					&nbsp;&nbsp;
					<button class="btn btn-info" id="re">清空</button>
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

	function add_bgc() {
	
		var bgcid = $("#bgcid").val();
		var bgcName = $("#bgcName").val();
		var bgccontent = $("#bgccontent").val();
		var bgcRcontent = $("#bgcRcontent").val();
		var bgcImgUrl =$("#file-pic").val();
		if (bgcid == null || bgcid.length == 0) {
			alert("大类编号不能为空！");
		} else {
			if (bgcName == null || bgcName.length == 0) {
				alert("大类名称不能为空！");
			} else {
				if (bgccontent == null || bgccontent.length == 0) {
					alert("类别说明不能为空！");
				} else {
					if (bgcRcontent == null || bgcRcontent.length == 0) {
						alert("类别副说明不能为空！");
					} else {
					
						$.ajax({
									type : 'post',
									url : "${basePath}${pageContext.request.contextPath}/CategoryAction!bgcAdd.action",
									data : {
											"bigcategory.bgcId" : bgcid,
											"bigcategory.bgcName" : bgcName,
											"bigcategory.bgccontent" : bgccontent,
											"bigcategory.bgcRcontent":bgcRcontent,
											"bigcategory.bgcImgUrl":bgcImgUrl,
										},
									dataType:'json', 
									success : function(data,status) {
									    if (status == "success") {
											if (data.status == "bgcId_exist") {
												alert("添加失败,该大类编号已存在!");
											} else if (data.status == "bgcName_exist") {
												alert("添加失败,该大类名称已存在!");
											} else if (data.status == "bgcadd_success") {
											
											$('#file-pic').fileinput('refresh' ,{//加入上传参数--》图片上传返回ID
    							uploadExtraData: {"bigcategory.id": data.id},
    						});
    				
    						$('#file-pic').fileinput('upload');//上传文件

    				  		layer.alert('添加成功!', {//图片信息和上传文件，提交成功，弹提示
    							icon: 1,
    				    		skin: 'layui-layer-lan',
    				    		closeBtn: 0,
    				    		//anim: 4 //动画类型
    						});
												toSkit("${basePath }${pageContext.request.contextPath}/model/manager/pro/bigcategoryManage.jsp")
												layer.msg("恭喜，添加大类成功！", {
													icon : 1
												});

											} else {
												layer.msg("抱歉，添加大类失败！", {
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


	$("#re").click(function() {
		document.getElementById("bgcid").value = "";
		document.getElementById("bgcName").value = "";
		document.getElementById("bgcContent").value = "";
	});
</script>