<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<title>修改小类别信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">小类别管理</h1>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">修改小类别</div>
	<div class="panel-body">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-body">
				<!-- 表单，用于表单序列号 -->
				<form id="form_Category" enctype="multipart/form-data" action="" method="post">
					<!-- 隐藏域 -->
					<!-- 修改时id和optLock是必须的 -->
  					<input type="hidden" id="sCid" name="smallCategory.id" value="${smallCategory.id }">
  					<input type="hidden" id="optLock" name="smallCategory.optLock" value="${smallCategory.optLock }">
  					<input type="hidden" id="createDate" name="smallCategory.createDate" value="${smallCategory.createDate }">
  					<input type="hidden" id="createName" name="smallCategory.createName" value="${smallCategory.createName }">
  					<input type="hidden" id="createId" name="smallCategory.createId" value="${smallCategory.createId }">
  					<!-- (可选)保存原图片地址，可不修改图片，与上传图片无关 -->
  					<input type="hidden" id="slcImgUrl" name="smallCategory.slcImgUrl" value="${smallCategory.slcImgUrl }">
				
					<p class="text-muted">小类别信息</p>
					
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">小类别编号</label>
						<div class="col-sm-4">
							<%-- <input type="hidden" id="id" value="${smallCategory.id }"> --%><!-- 隐藏域id -->
							<input type="text" class="form-control" placeholder="请输入小类别编号" id="slcId" name="smallCategory.slcId" value="${smallCategory.slcId }">
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">小类别名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" placeholder="请输入小类别名称，如'军事'" id="slcName" name="smallCategory.slcName" value="${smallCategory.slcName }">
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">小类别说明</label>
						<div class="col-sm-4">
							<textarea rows="4" id="slcContent" name="smallCategory.slcContent" class="form-control" placeholder="请输入小类别说明">${smallCategory.slcContent }</textarea>
							<i id="slcContent_check" class=""></i>
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属大类别</label>
						<div class="col-sm-4">
						<!-- 【下拉框】
							list用于绑定后端用request传来的bgclist大类别集合,listValue用于显示bgcName大类别名称,
							id是为了用$("#id").val()获取值, name用于data: $("#form_Category").serialize()表单序列化
							value与listKey="id"结合，是用于当前显示的是哪个id
						-->
						<s:select list="#request.bgclist" listValue="bgcName" 
								  id="id" name="smallCategory.bigCategory.id" 
								  value="#request.smallCategory.bigCategory.id" listKey="id"  
								  headerKey="" headerValue="---请选择---" />
						</div>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>

					<div class="form-group">
						<label class="col-sm-4 control-label">小类别图片</label> 
						<img src="${basePath }${pageContext.request.contextPath}/${smallCategory.slcImgUrl}" width="15%;" height="8%;" />
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
							onclick="update_slc()">保存</button>
					&nbsp;&nbsp;
					<button class="btn btn-default" 
							onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/book/smallCategoryManage.jsp')">返回</button>
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
        uploadUrl: "CategoryAction!addSmallPicture.action",//小类别封面图片上传
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


	//修改小类别信息
	function update_slc() {
		
		if ($("#slcId").val() == null || $("#slcId").val().length == 0) {
			alert("小类编号不能为空！");
		} else {
			if ($("#slcName").val() == null || $("#slcName").val().length == 0) {
				alert("小类名称不能为空！");
			} else {
				if ($("#slcContent").val() == null || $("#slcContent").val().length == 0) {
					alert("类别说明不能为空！");
				} else {
					if(id.options[id.selectedIndex].text=="---请选择---"){
						alert("请选择大类！");
					} else {
						$.ajax({
									type : 'post',
									url : "${basePath}${pageContext.request.contextPath}/CategoryAction!slcUpdate.action",
									data: $("#form_Category").serialize(),	//表单序列化,简化(相当于下面的步骤)
									/* 另法如下 */
			/* 						data : {  
										"smallCategory.id" : $("#sCid").val()* <!--必须,注意下面的大类id不能相同，会冲突--> 
										"smallCategory.optLock": $("#optLock").val(), <!--必须--> 
										"smallCategory.slcId" : $("#slcId").val(),
										"smallCategory.slcName" : $("#slcName").val(),
										"smallCategory.slcContent" : $("#slcContent").val(),
										"smallCategory.bigCategory.id" : $("#id").val(),
										"smallCategory.slcImgUrl" : $("#slcImgUrl").val(), <!--(可选)保存原图片地址，可不修改图片，与上传图片无关-->
										"smallCategory.createDate": $("#createDate").val(),					
										"smallCategory.createName": $("#createName").val(),
										"smallCategory.createId": $("#createId").val(), 
									}, */
									dataType : 'json',
									success : function(data, status) {
									
										if (status == "success") {
											if (data.status == "update_success") {
												//加入上传参数--》图片上传返回ID
												$('#file-pic').fileinput('refresh',{
													uploadExtraData: {"smallCategory.id": data.id},//商品id存到图片中的外键商品id,以此图片与商品对应
												});

												$('#file-pic').fileinput('upload');//上传文件

												layer.alert('添加成功!', {//图片信息和上传文件，提交成功，弹提示
													icon : 1,
													skin : 'layui-layer-lan',
													closeBtn : 0,
													//anim: 4 //动画类型
												});
												toSkit("${basePath }${pageContext.request.contextPath}/model/manager/book/smallCategoryManage.jsp");
												layer.msg("恭喜，修改小类成功！", {
													icon : 1
												});

											} else {
												layer.msg("抱歉，修改小类失败！", {
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