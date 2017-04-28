<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>商品修改</title>
<style>
<!--
.thumb-md {display: inline-block;width: 90px;}
.m-r {margin-right: 55px;}
-->
</style>

<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">商品修改</h1>
</div>
<div class="wrapper-md">
	<div class="panel panel-default">
		<div class="panel-heading">修改商品列表</div>

		<div class="table-responsive">
			<div>
 			
				<div class="panel panel-default" id="divBody">
					<div class="panel-heading">
						<div class="clearfix">
						<%-- 
							<a href="" class="pull-left thumb-md avatar b-3x m-r"> 
								<img src="${basePath }${pageContext.request.contextPath}/images/tou.png" alt="...">
							</a>
							 --%>
							<div class="clear">
								<div class="text-muted">
								<form id="form_productAdd" enctype="multipart/form-data" action="" method="post">
									<div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
										<div class="form-group">
											<label class="col-sm-2 control-label">名称</label>
											<div class="col-sm-4">
												<input type="hidden" name="picture.id" id="picid" ><!-- 隐藏图片的id -->
												<input type="text" id="proName" name="product.proName" value="${product.proName }" class="form-control" placeholder="6-16位，由字母、数字、字符组成"> 
												<i id="proName_check" class=""></i>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">编号</label>
											<div class="col-sm-4">
												<input type="text" id="proNo" name="product.proNo" value="${product.proNo }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="proNo_check" class=""></i>
											</div>
										</div>
										
										
										<div class="line line-dashed b-b line-lg pull-in"></div>
										<div class="form-group">
											<label class="col-sm-2 control-label">大类别</label>
											<div class="col-sm-4">
												<select id="bigcategory" name="product.smallcategory.bigcategory.id" class="form-control m-b">
													<option value="-1">---请选择---</option>
												<%-- 
													<option value="${product.smallcategory.bigcategory.id }">${product.smallcategory.bigcategory.bgcName }</option>
												 --%>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">小类别</label>
											<div class="col-sm-4">
												<select id="smallcategory" name="product.smallcategory.id" class="form-control m-b">
													<option value="-1">---请先选择大类---</option>
												<%-- 
													<option value="${product.smallcategory.id }">${product.smallcategory.slcName }</option>
												--%>
												</select>
											</div>
										</div>
							<!-- 			
										<div class="form-group">
											<label class="col-sm-2 control-label">品牌</label>
											<div class="col-sm-4">
												<select id="brand" name="product.brand" class="form-control m-b">
													<option value="联想(Lenovo)">联想(Lenovo)</option>
													<option value="苹果(Apple)">苹果(Apple)</option>
													<option value="戴尔(DELL)">戴尔(DELL)</option>
													<option value="三星(SAMSUNG)">三星(SAMSUNG)</option>
													<option value="外星人(Alienware)">外星人(Alienware)</option>
													<option value="惠普(HP)">惠普(HP)</option>
												</select>
											</div>
										</div>
 -->
										<div class="line line-dashed b-b line-lg pull-in"></div>

										<div class="form-group">
											<label class="col-sm-2 control-label">标题</label>
											<div class="col-sm-4">
												<input type="text" id="title" name="product.title" value="${product.title }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="title_check" class=""></i>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">进货价￥</label>
											<div class="col-sm-3">
												<input type="text" id="price" name="product.purchasePrice" value="${product.purchasePrice }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="purchasePrice_check" class=""></i>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">售价￥</label>
											<div class="col-sm-3">
												<input type="text" id="price" name="product.price" value="${product.price }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="price_check" class=""></i>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">是否打折</label>
											<div class="col-sm-4">
												<div class="radio">
												<c:if test="${product.discountFlag=='是'}">
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse"
														id="yes" name="product.discountFlag" value="是" checked="checked"><i></i>是
													</label> 
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched" 
														id="no" name="product.discountFlag" value="否"><i></i>否
													</label>
												</c:if>
												<c:if test="${product.discountFlag=='否'}">
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse"
														id="yes" name="product.discountFlag" value="是"><i></i>是
													</label> 
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched" 
														id="no" name="product.discountFlag" value="否" checked="checked"><i></i>否
													</label>
												</c:if>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">折后价格￥</label>
											<div class="col-sm-3">
												<input type="text" id="discountPrice" name="product.discountPrice" value="${product.discountPrice }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="discountPrice_check" class=""></i>
											</div>
										</div>
										
										<div class="line line-dashed b-b line-lg pull-in"></div>
										
										<div class="form-group">
											<label class="col-sm-2 control-label">库存量(件)</label>
											<div class="col-sm-3">
												<input type="text" id="store" name="product.store" value="${product.store }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="store_check" class=""></i>
											</div>
										</div>
<!-- 										
										<div class="form-group">
											<label class="col-sm-2 control-label">月销量(件)</label>
											<div class="col-sm-4">
												<input type="text" id="monthSale" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="monthSale_check" class=""></i>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">累计评论数</label>
											<div class="col-sm-4">
												<input type="text" id="commentNum" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="commentNum_check" class=""></i>
											</div>
										</div>
										 -->
										
										<div class="form-group">
											<label class="col-sm-2 control-label">上架时间</label>
											<div class="col-sm-4">							
    											<input type="text" id="listingTime" name="product.listingTime" value="${product.listingTime }" readonly="readonly" value="" class="form-control datetimepicker" placeholder="选择日期">
												<i id="listingTime_check" class=""></i>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">推荐商品</label>
											<div class="col-sm-4">
												<div class="radio">
												<c:if test="${product.recommendFlag=='是'}">
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse"
														id="yes" name="product.recommendFlag" value="是" checked="checked"><i></i>推荐商品
													</label> 
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched" 
														id="no" name="product.recommendFlag" value="否"><i></i>非推荐商品
													</label>
												</c:if>
												<c:if test="${product.recommendFlag=='否'}">
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse"
														id="yes" name="product.recommendFlag" value="是"><i></i>推荐商品
													</label> 
													<label class="i-checks"> 
													<input type="radio" class="ng-valid ng-dirty ng-touched" 
														id="no" name="product.recommendFlag" value="否" checked="checked"><i></i>非推荐商品
													</label>
												</c:if>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">状态</label>
											<div class="col-sm-4">
												<select id="status" name="product.status" class="form-control m-b">
												<c:if test="${product.status=='上架'}">
													<option value="上架" selected="selected">上架</option>
													<option value="下架">下架</option>
												</c:if>
												<c:if test="${product.status=='下架'}">
													<option value="上架">上架</option>
													<option value="下架" selected="selected">下架</option>
												</c:if>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">下架时间</label>
											<div class="col-sm-4">
    											<input type="text" id="delistingTime" name="product.delistingTime" value="${product.delistingTime }" readonly="readonly" value="" class="form-control datetimepicker" placeholder="选择日期">
												<i id="delistingTime_check" class=""></i>
											</div>
										</div>
										
										<div class="line line-dashed b-b line-lg pull-in"></div>
										
										<div class="form-group">
											<label class="col-sm-2 control-label">关键字</label>
											<div class="col-sm-4">
												<input type="text" id="keywords" name="product.keywords" value="${product.keywords }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="keywords_check" class=""></i>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">产地</label>
											<div class="col-sm-4">
												<input type="text" id="origin" name="product.origin" value="${product.origin }" class="form-control" placeholder="6-16位，由字母、数字、字符组成">
												<i id="origin_check" class=""></i>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">简介</label>
											<div class="col-sm-4">
												<textarea rows="4" id="introduce" name="product.introduce" class="form-control" placeholder="6-16位，由字母、数字、字符组成">${product.introduce }</textarea>
												<i id="introduce_check" class=""></i>
											</div>
										</div>
										
										<div class="line line-dashed b-b line-lg pull-in"></div>
										
										<div class="form-group">
            								<label class="col-sm-2 control-label">主图：</label>
            								<c:forEach items="${list }" var="pic">
											<c:if test="${pic.mainFlag=='1' }">
												<a class='thumbnail pull-left thumb-lg b-3x m-r'>
													<img src='${basePath }${pageContext.request.contextPath}${pic.picImgUrl }' onclick='showBigImg("${pic.picImgUrl }")'>
												</a>
											</c:if>
											</c:forEach>
          								</div> 
										<div class="form-group">
            								<label class="col-sm-2 control-label">修改主图上传(一张)：</label>
            								<div class="col-sm-8">
                								<input id="file-MainPic" name="file" type="file" multiple>       
            								</div>
          								</div>  
          								
          								<div class="line line-dashed b-b line-lg pull-in"></div>
          								
										<div class="form-group">
            								<label class="col-sm-2 control-label">非主图：</label>
            								<c:forEach items="${list }" var="pic">
											<c:if test="${pic.mainFlag=='0' }">
												<a class='thumbnail center-block thumb-lg b-3x m-r'>
													<img src='${basePath }${pageContext.request.contextPath}${pic.picImgUrl }' onclick='showBigImg("${pic.picImgUrl }")'>
												</a>
											</c:if>
											</c:forEach>
          								</div>
          								<div class="form-group">
            								<label class="col-sm-2 control-label">修改非主图上传(可批量)：</label>
            								<div class="col-sm-8">
                								<input id="file-pic" name="file" type="file" multiple>       
            								</div>
          								</div>  
									</div>
								</form>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="panel panel-info">
					<div class="panel-body">		
						<button class="btn btn-sm btn-info btn-addon" id="productSave">
							<i class="glyphicon glyphicon-save"></i>保存
						</button>
						
						<button class="btn btn-sm btn-success btn-addon" onclick="backManage();">
							<i class="fa fa-mail-reply"></i>返回
						</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

	<!--显示大图的imgModal-->
    <div class="modal fade bs-example-modal-lg text-center" id="imgModal"tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
        <div class="modal-dialog modal-lg" style="display: inline-block; width: auto;">
           <div class="modal-content">
             <img  id="imgInModalID" src="" >
           </div>
        </div>
    </div>

<script type="text/javascript">

	//doRequest();
	findAllBigcategory();
	getSmallcategoryByBigcategoryId();
	
	
	//日期控件
	$(".datetimepicker").datetimepicker({
    	format: 'yyyy-mm-dd hh:ii',
    	autoclose: 1,
    	todayBtn:  1,
    	todayHighlight: 1,
    	showMeridian: true,
    });
    
    //点击图片时,显示大图
	function showBigImg(imgUrl){
		//alert(imgUrl);
		//var imgUrl = $(this)[0].src;
		//alert(imgUrl);
		$('#imgInModalID').attr("src", '${basePath}${pageContext.request.contextPath}'+imgUrl);
		$('#imgModal').modal('show');
	}
    
    
    //动态获取所有大类
    function findAllBigcategory() {
    	$.ajax({
				type: 'post',
				url: "${basePath}${pageContext.request.contextPath}/ProductAction!findAllBigcategory.action",
				data:{}, 
			    dataType:'json',  
    			success:function(data,status){
    				if (status == "success") {
    					if(data.status == "success"){	
    						for(var i=0; i<data.list_Bigcategory.length; i++){
    							var id = data.list_Bigcategory[i].id;
    							var bgcName = data.list_Bigcategory[i].bgcName;
    							var opt = "<option value='"+id+"'>"+bgcName+"</option>";
    							$("#bigcategory").append(opt);
    						}
    						//$("#bigcategory").val("${product.smallcategory.bigcategory.id}");
							//layer.msg("恭喜，大类成功！", {icon: 1});
						} else {
							layer.msg("抱歉，大类失败！", {icon: 2});
						} 
					}else {
						alert("查询失败,ajax请求返回失败!");
					}
			    },
			    cache:false
			});
    }
    
    
    //根据大类id查询对应小类
    function getSmallcategoryByBigcategoryId() {
    	
      $("#bigcategory").change(function(){
    	var bigcategory = $('#bigcategory option:checked').val();
		$.ajax({
				type: 'post',
				url: "${basePath}${pageContext.request.contextPath}/ProductAction!getSmallcategoryByBigcategoryId.action",
				data:{
						"bigcategory.id" : bigcategory,
					},
			    dataType:'json', 
    			success:function(data,status){
    				if (status == "success") {
    					if(data.status == "success"){
    						$("#smallcategory").empty();// 先清空小类下拉框中内容
    						for(var i=0; i<data.list_Smallcategory.length; i++){
    							var id = data.list_Smallcategory[i].id;
    							var slcName = data.list_Smallcategory[i].slcName;
    							var opt = "<option value='"+id+"'>"+slcName+"</option>";
    							$("#smallcategory").append(opt);
    						}
							//layer.msg("恭喜，小类成功！", {icon: 1});
						} else {
							layer.msg("抱歉，小类失败！", {icon: 2});
						} 
					}else {
						alert("查询失败,ajax请求返回失败!");
					}
			    },
			    cache:false
			});
    	});
    }
	
	

/* 		var bigcategory = $('#bigcategory option:checked').val();
		var smallcategory = $('#smallcategory option:checked').val();
		var proName = $("#proName").val();
		var proNo = $("#proNo").val();
		var discountFlag = $('input:radio:checked').val();
		var status = $('#status option:checked').val();
		var brand = $('#brand option:checked').val();
		var title = $("#title").val();
		var price = $("#price").val();
		var discountPrice = $("#discountPrice").val();
		var introduce = $("#introduce").val();
		var store = $("#store").val();
		//var monthSale = $("#monthSale").val();
		var commentNum = $("#commentNum").val();
		var recommendFlag = $('input:radio:checked').val();
		var listingTime = $("#listingTime").val();
		var delistingTime = $("#delistingTime").val();
		var keywords = $("#keywords").val();
		var origin = $("#origin").val();
		alert("#1#"+proName+"#2#"+proNo+"#3#"+discountFlag+"#4#"+status+"#5#"+smallcategory+"#6#"+bigcategory+"#7#"+brand+"#8#"+title+"\n"
				+"#9#"+price+"#10#"+discountPrice+"#11#"+introduce+"#12#"+store+"#13#"+monthSale+"#14#"+commentNum+"#15#"+recommendFlag+"\n"
				+"#16#"+listingTime+"#17#"+delistingTime+"#18#"+keywords+"#19#"+origin); */
/* 		if($("#proName_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#proNo_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#proNo_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#realName_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#idCard_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#telNumber_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#email_check").hasClass("text-success glyphicon glyphicon-ok formCheck")){ //判断所有信息格式都正确 */
		   //alert(proName+"##"+proNo+"##"+realName+"##"+gender+"##"+idCard+"##"+telNumber+"##"+email+status+"##");
			 

	//0.点击保存按钮触发
	$('#productSave').on('click',function (){// 提交图片信息 //
		layer.confirm("是否确认保存？",{icon: 3},function(){
			$('#file-MainPic').fileinput('upload');	//1先初始化上传
			$('#file-pic').fileinput('upload');		//1先初始化上传
		});
	});

	//*****************1.主图上传*********************
	// (主图)文件初始化上传文件框
    $('#file-MainPic').fileinput({//初始化上传文件框
    	showUpload : false,
        showRemove : false,
        uploadAsync: true,
        uploadLabel: "上传",//设置上传按钮的汉字
        uploadClass: "btn btn-primary",//设置上传按钮样式
        showCaption: false,//是否显示标题
        language: "zh",
        uploadUrl: "ProductAction!addPicture.action?picture.mainFlag=1",//主图标记为1
        maxFileSize : 0,
        maxFileCount: 1,/*允许最大上传数，可以多个，当前设置单个*/
        enctype: 'multipart/form-data',
        //allowedPreviewTypes : [ 'image' ], //allowedFileTypes: ['image', 'video', 'flash'],
        allowedFileExtensions : ["jpg", "png","gif"],/*上传文件格式*/
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        dropZoneTitle: "请通过拖拽图片文件放到这里", 
        dropZoneClickTitle: "或者点击此区域添加图片",
        uploadExtraData: {"picture.picImgUrl": "url"},//强行添加bannerPic对象，为了给spring管理
        showBrowse: false,
    	browseOnZoneClick: true,
        slugCallback : function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    //*****************主图上传*********************
    
    //*****************1.非主图上传*********************
	// (非主图)文件初始化上传文件框
    $('#file-pic').fileinput({//初始化上传文件框
    	showUpload : false,
        showRemove : false,
        uploadAsync: true,
        uploadLabel: "上传",//设置上传按钮的汉字
        uploadClass: "btn btn-primary",//设置上传按钮样式
        showCaption: false,//是否显示标题
        language: "zh",
        uploadUrl: "ProductAction!addPicture.action?picture.mainFlag=0",//非主图标记为0
        maxFileSize : 0,
        maxFileCount: 5,//允许最大上传数，可以多个，当前设置单个
        enctype: 'multipart/form-data',
        //allowedPreviewTypes : [ 'image' ], //allowedFileTypes: ['image', 'video', 'flash'],
        allowedFileExtensions : ["jpg", "png","gif"],//上传文件格式
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        dropZoneTitle: "请通过拖拽图片文件放到这里", 
        dropZoneClickTitle: "或者点击此区域添加图片",
        uploadExtraData: {"picture.picImgUrl": "url"},//强行添加bannerPic对象，为了给spring管理
        showBrowse: false,
    	browseOnZoneClick: true,
        slugCallback : function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    //*****************非主图上传*********************
    
    //*****************2.主图和非主图 回调函数*********************
    var ids = "";//全局变量,将主图和非主图的id拼接起来再传
    $('#file-MainPic').on("fileuploaded", function(event, data, previewId, index) {//上传文件成功，回调函数 
		var result = data.response; //后台返回的json
		//$('#picid').val(result.picId_ForPro);//拿到后台传回来的图片id，给图片的id赋值序列化表单用
		//图片批量上传,拼接图片id（包括主图和非主图）以逗号分隔
		if(ids==""){
			ids = result.picId_ForPro;
		}else{
			ids =  ids + "," + result.picId_ForPro;
		}
	});


    $('#file-pic').on("fileuploaded", function(event, data, previewId, index) {//上传文件成功，回调函数    	
		var result = data.response; //后台返回的json
	
		//图片批量上传,拼接图片id（包括主图和非主图）以逗号分隔
		if(ids==""){
			ids = result.picId_ForPro;
		}else{
			ids =  ids + "," + result.picId_ForPro;
		}
		
		$('#picid').val(ids);//拿到后台传回来的(批量)图片id，给图片的id（隐域）赋值序列化表单用
		
	//***********3.全部图片都上传成功了，才一次过保存************
	var fileCount = $('#file-pic').fileinput('getFilesCount');//计数标记，用于确保全部图片都上传成功了，才一次过保存
		//直到全部图片都上传成功了，才一次过保存
	if(fileCount==1){
		
	 		$.ajax({//上传文件成功后再保存图片信息
				url:"ProductAction!saveProduct.action",
				type:'post',
				dataType:'json',
				data: $('#form_productAdd').serialize(),	//表单序列化
				success:function(data,status){
					if (status == "success") {
			
						if(data.status == "success"){//提交成功
				
				  			layer.alert('商品以及图片添加成功!', {//图片信息提交成功，弹提示
								icon: 1,
				    			skin: 'layui-layer-lan',
				    			closeBtn: 0,
				    			//anim: 4 //动画类型
				 		 	});
							//跳转刷新
							$("#content_load").load("${basePath }${pageContext.request.contextPath}/model/manager/pro/productManage.jsp");
						}else{
							alert("商品以及图片添加失败,编码的错误!");
						}

					} else {
						alert("商品以及图片添加失败,ajax请求返回失败!");
					}
				},
				cache:false,					//不缓存
		   });	 
	    }
	});
	//*****************主图和非主图 回调函数*********************
	
	 
    //返回按钮
    function backManage(){
		toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/productManage.jsp');
	};

</script>
