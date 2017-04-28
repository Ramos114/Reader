<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>

</style>
<title>图片信息</title>


<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">修改图片详细信息</h1>
</div>

<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">修改轮播图片详细信息</div>
    <div class="row wrapper">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
          <form id="pic" enctype="multipart/form-data" action="" method="post">
          <div class="form-group">
            <label class="col-sm-2 control-label">图片名称</label>
            <div class="col-sm-4">
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
              		<label class="i-checks"> <!-- 默认不使用  -->                      
                	<input type="radio" name="bannerPic.picFlag" checked="checked" id="picFlag" value=0>
                	<i></i>不使用
              	</label>
            	</div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">图片上传</label>
            <div class="col-sm-8">
            <a href="${basePath }${pageContext.request.contextPath}\uploadfile\2016-12-06\c8d3b868-073f-474b-947d-34a59b9df319.jpg" class="thumbnail">
             	<img src="${basePath }${pageContext.request.contextPath}\uploadfile\2016-12-06\c8d3b868-073f-474b-947d-34a59b9df319.jpg"
                 alt="通用的占位符缩略图"> 
                 </a>      
            </div>
          </div>         
          <%-- <div class="col-sm-6 col-md-3">
        	<a href="${basePath }${pageContext.request.contextPath}\uploadfile\2016-12-06\c8d3b868-073f-474b-947d-34a59b9df319.jpg" class="thumbnail">
            onclick="showBigImg('{$vo['img']}')"
        
    	</div> --%>
          </form>
          <div class="form-group">
            <label class="col-sm-2 control-label">图片上传</label>
            <div class="col-sm-9">
             	<form  enctype="multipart/form-data" action="" method="post" id="uploadForm">
                <input id="file-pic" name="file" type="file" multiple>
                </form>        
            </div>
          </div>         
          <div class="line line-dashed b-b line-lg pull-in"></div>
            <div class="form-group">
            <div class="col-sm-4 col-sm-offset-2">
              <button type="button" class="btn btn-default" onclick="backManage();">返回</button>
              <button type="submit" class="btn btn-primary" id="savePic">保存</button>
          </div>
          	
        </div>
        
        
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
findPictureById
</script>