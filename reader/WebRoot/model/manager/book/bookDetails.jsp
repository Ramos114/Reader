<%@ page language="java" pageEncoding="UTF-8"%>

<title>图书详情</title>
<style>
<!--
.thumb-md {display: inline-block;width: 90px;}
.m-r {margin-right: 55px;}
-->

</style>

<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">图书详情</h1>
</div>
<div class="wrapper-md" id="bookD">
	<div class="panel panel-default">
		<div class="panel-heading">图书列表</div>

		<div class="table-responsive">
			<div>
			
				<div class="panel panel-default" id="divBody">
					<div class="panel-heading">
						<div class="clearfix">
							<a href="" class="pull-left thumb-md avatar b-3x m-r"> 
							<img
								src="${basePath }${pageContext.request.contextPath}{{dataObj.book.cover}}"
								alt="...">
							</a>
							<div class="clear">
								<div class="h3 m-t-xs m-b-xs">
									名称：{{dataObj.book.title}}
									<i class="fa fa-circle text-success pull-right text-xs m-t-sm"></i>
								</div>
								<div class="text-muted" >编号：<b class="h5 m-t-xs m-b-xs">{{dataObj.book.bookNo}}</b></div>
								<div class="text-muted" >作者：<b class="h5 m-t-xs m-b-xs text-danger">{{dataObj.book.author.userName}}</b></div>
								<div class="text-muted" >是否推荐：<b class="h5 m-t-xs m-b-xs text-danger" v-if="dataObj.book.isRecommend=='1'">是</b><b v-else>否</b></div>
							</div>
						</div>
					</div>
					
					<div class="list-group no-radius alt">
						<table class="table table-striped b-t b-light" id="tableTbody">
						  <tbody>
							<tr>
								<th style="width: 12%">一级分类：</th><td style="width: 30%">{{dataObj.book.smallCategory.bigCategory.bgcName}}</td>
								<th style="width: 12%">二级分类：</th><td style="width: 50%">{{dataObj.book.smallCategory.slcName}}</td>
							</tr>
							<tr>
								<th>版权：</th><td colspan="3">{{dataObj.book.rights}}</td>
							</tr>
							<tr>
								<th>是否完结？：</th><td class="text-danger" v-if="dataObj.book.isFinish=='1'">是</td><td v-else>否</td>
								<th>是否本周最火？：</th><td class="text-danger" v-if="dataObj.book.isHot=='1'">是</td><td v-else>否</td>
							</tr>
							<tr>
								<th>更新时间：</th><td>{{dataObj.book.updateTime}}</td>
								<th>总字数：</th><td>{{dataObj.book.word_count}}</td>
							</tr>
							<tr>
								<th>简介：</th><td colspan="2">{{dataObj.book.summary}}</td>
							</tr>
							
							<tr >
								<th>章节：</th>
								<td id="ChapterCon" colspan="2" v-for="item in dataObj2.list" style="float: left">
									<a href="javascript:findContent('{{item.id}}')">{{item.chapterTitle}}</a>
									<input type="hidden" id="sendContent" value="{{item.content}}">
								</td>
							</tr>
<!-- 							
							<tr>
								<th>累计评论数：</th><td>{{dataObj.book.title}}</td>
								<th>推荐图书：</th><td class="text-danger">是</td>
							</tr>
							<tr>
								<th>上架时间：</th><td>{{dataObj.book.title}}</td>
								<th>下架时间：</th><td>{{dataObj.book.title}}</td>
							</tr>
							<tr>
								<th>关键字：</th><td>超级本、PC平板二合一</td>
								<th>产地：</th><td>江苏昆山</td>
							</tr> -->
						  </tbody>
						</table>
					</div>
				</div>

				<div class="panel panel-info">
					<div class="panel-body">		
						<button class="btn btn-sm btn-info btn-addon">
							<i class="glyphicon glyphicon-pencil"></i>编辑
						</button>
						
						<button class="btn btn-sm btn-danger btn-addon">
							<i class="glyphicon glyphicon-trash"></i>删除
						</button>
						
						<button class="btn btn-sm btn-success btn-addon" onclick="backManage();">
							<i class="fa fa-mail-reply"></i>返回
						</button>
					</div>
				</div>
				
				<!--  -->
				<div id="show" style="display: none;">
					<textarea rows="18" cols="80%" style="padding: 10px;text-indent: 2em;">{{dataObj3.chapter.content}}</textarea>
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
	
	//Vue框架--用于客户端渲染数据
	var bookD;
	bookD = new Vue({
            el: '#bookD',
            data: {
                dataObj: {},
                dataObj2: {},
                dataObj3: {},
            }
    });

	doRequest();//ajax请求table数据,根据图书ID查询图书信息
	findChapter();//根据图书ID查询章节信息

	
	//ajax请求table数据,根据图书ID查询图书信息
	function doRequest(){		//alert('${bookId}');
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BookAction!findBookById.action",
    	data:{
    		"book.id" : "${bookId}",
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				//Vue响应式渲染数据--数据写入table
					bookD.$set("dataObj", data);
					//
    				setDataTable(data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false,				//不缓存
    	});
	};
	
	//根据图书ID查询章节信息
	function findChapter(){		//alert('${bookId}');
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BookAction!findChapterByBookId.action",
    	data:{
    		"book.id" : "${bookId}",
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				//if(){}
    				//Vue响应式渲染数据--数据写入table
					bookD.$set("dataObj2", data);
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false,			//不缓存
    	});
	};
	
	//根据章节ID查询章节信息
	function findContent(chapterId){		//alert('${bookId}');
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/BookAction!findChapterById.action",
    	data:{
    		"chapter.id" : chapterId,
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    			
    			if(data.status == "success"){
    				//if(){}
    				//Vue响应式渲染数据--数据写入table
					bookD.$set("dataObj3", data);
					//当点击章节时,显示
					$("#show").show();
    			}else{
    				alert("查询失败,编码的错误!");
    				addNullMessage();
    			}

			} else {
				alert("查询失败,ajax请求返回失败!");
				addNullMessage();
			}
    	},
    	cache:false,			//不缓存
    	});
	};
	
	//加入无数据div
	function addNullMessage(){
		$("#tableTbody").append("<tbody><tr><th>暂无数据</th></tr></tbody>");
	};
	
	//动态生成查询table
	function setDataTable(data){
		//判断是否有数据
		if (data.book == null) {
			addNullMessage();
		}else{
			//添加数据进表格
//			addDataToTable(data);
		}

	};
	

	//点击图片时,显示大图
	function showBigImg(imgUrl){
		$('#imgInModalID').attr("src", '${basePath}${pageContext.request.contextPath}'+imgUrl);
		$('#imgModal').modal('show');
	};
	
	//返回按钮
    function backManage(){
		toSkit('${basePath }${pageContext.request.contextPath}/model/manager/book/bookManage.jsp');
	};
	
	//编辑图书
	function EditProduct(id){
		toSkit("${basePath }${pageContext.request.contextPath}/ProductAction!productEditUI.action?product.id="+id) ;
	};
	
	

</script>
