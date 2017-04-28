<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<style>

</style>
<title>添加图片信息</title>


<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">添加图片信息</h1>
</div>

<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">添加轮播图片信息</div>
    <div class="row wrapper">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
          <form id="pic" enctype="multipart/form-data" action="" method="post">
          <div class="form-group">
            <label class="col-sm-2 control-label">图片名称</label>
            <div class="col-sm-4">
            <input type="hidden" name="bannerPic.id" id="picid" ><!-- 隐藏图片的id -->
              <input type="text" name="bannerPic.picName" class="form-control" placeholder="图片名称" > 
              <i id="picName_check" class=""></i>                       
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">图标标题</label>
            <div class="col-sm-4">
              <input type="text" name="bannerPic.picTilte" class="form-control" placeholder="图标标题"> 
              <i id="picTilte_check" class=""></i>                        
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">图片副标题</label>
            <div class="col-sm-4">
              <input type="text" name="bannerPic.picSubTitle" class="form-control" placeholder="图片副标题">      
              <i id="picSubTitle_check" class=""></i>  
                              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">是否使用</label>
            <div class="col-sm-4">
            	<div class="radio">
              		<label class="i-checks">               
                	<input type="radio" name="bannerPic.picFlag" id="picFlag" value=1>              
                	<i></i>使用
              		</label>
              		<label class="i-checks">                       
                	<input type="radio" name="bannerPic.picFlag" checked="checked" id="picFlag" value=0>
                	<i></i>不使用
              	</label>
            	</div>
            </div>
          </div>
          
          </form>
          <div class="form-group">
            <label class="col-sm-2 control-label">图片上传</label>
            <div class="col-sm-9">
             	
                <input id="file-pic" name="file" type="file" multiple>
                
                   
            </div>
          </div>    
           
          <div class="line line-dashed b-b line-lg pull-in"></div>
            <div class="form-group">
            <div class="col-sm-4 col-sm-offset-2">
              <button type="button" class="btn btn-default" onclick="backManage();">返回</button>
              <button type="button" class="btn btn-primary" id="savePic">保存</button>
          </div>
          	
        </div>
        
        
        </div>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">

    $('#file-pic').fileinput({//初始化上传文件框
    	showUpload : false,
        showRemove : false,
        uploadAsync: true,
        uploadLabel: "上传",//设置上传按钮的汉字
        uploadClass: "btn btn-primary",//设置上传按钮样式
        showCaption: false,//是否显示标题
        language: "zh",
        uploadUrl: "BannerPicAction!addPicture.action",
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

	$('#file-pic').on("fileuploaded", function(event, data, previewId, index) {//上传文件成功，回调函数 
	var result = data.response; //后台返回的json
	//console.log(result.status);
	//console.log(result.id);
	$('#picid').val(result.id);//拿到后台传回来的id，给图片的id赋值序列化表单用
	$.ajax({//上传文件成功后再保存图片信息
		url:'BannerPicAction!insertPictureInfo.action',
		type:'post',
		dataType:'json',
		data:$('#pic').serialize(),
		success:function(data,status){
			if (status == "success") {
			
				if(data.status == "success"){//提交成功
				
				  	layer.alert('添加成功!', {//图片信息提交成功，弹提示
						icon: 1,
				    	skin: 'layui-layer-lan',
				    	closeBtn: 0,
				    	//anim: 4 //动画类型
				  	});
					//跳转回添加页面
					toSkit("${basePath }${pageContext.request.contextPath}/model/manager/bannerPic/bannerPicAdd.jsp");
				
				}else{
					alert("添加失败,编码的错误!");
				}

				} else {
					alert("添加失败,ajax请求返回失败!");
			}
		},
		cache:false,					//不缓存
	});
	});
	
	$('#savePic').on('click',function (){// 提交图片信息 //
		
		$('#file-pic').fileinput('upload');//先上传文件
	 	 
	}); 

	function backManage(){
		toSkit('${basePath }${pageContext.request.contextPath}/model/manager/bannerPic/bannerPicManage.jsp');
	}

</script>
