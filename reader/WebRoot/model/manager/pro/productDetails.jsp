<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>商品详情</title>
<style>
<!--
.thumb-md {display: inline-block;width: 90px;}
.m-r {margin-right: 55px;}
-->
</style>

<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">商品详情</h1>
</div>
<div class="wrapper-md">
	<div class="panel panel-default">
		<div class="panel-heading">商品列表</div>

		<div class="table-responsive">
			<div>
	
			<div class="panel-heading">
						<div class="clearfix">
				
					 		<a class='thumbnail pull-left thumb-lg avatar b-3x m-r'>
					 			<img src='${basePath }${pageContext.request.contextPath}${picImgUrl }' onclick='showBigImg("${picImgUrl }")'>
							</a>
							<div class="clear">
								<div class="h3 m-t-xs m-b-xs">
									名称：${product.proName }
									<i class= "fa fa-circle text-success pull-right text-xs m-t-sm"></i>
								</div>
								<div class="text-muted" >编号：<b class= "h5 m-t-xs m-b-xs">${product.proNo }</b></div>
								<div class="text-muted" >状态：<b class= "h5 m-t-xs m-b-xs text-danger">${product.status }</b></div>
							</div>
						</div>
					</div>

					<div class="list-group no-radius alt">
						<table class="table table-striped b-t b-light" id="tableTbody">
						  <tbody>
							<tr>
								<th style="width: 10%">大类别：</th><td style= "width: 30%">${product.smallcategory.bigcategory.bgcName }</td>
								<th style="width: 10%">小类别：</th><td style= "width: 50%">${product.smallcategory.slcName }</td>
							</tr>
							<tr>
								<th>标题：</th><td colspan= "3">${product.title }</td>
							</tr>
							<tr>
								<th>进货价￥：</th><td class= "text-danger">${product.purchasePrice }</td>
								<th>是否打折：</th><td class= "text-danger">${product.discountFlag }</td>
							</tr>
							<tr>
								<th>价格￥：</th><td class= "text-danger">${product.price }</td>
								<th>折后价格￥：</th><td class="text-danger ">${product.discountPrice }</td>
							</tr>
							<tr>
								<th>简介：</th><td colspan="3">${product.introduce }</td>
							</tr>
							<tr>
								<th>库存量(件)：</th><td class="text-danger">${product.store }</td>
								<th>月销量(件)：</th><td>${product.monthSale }</td>
							</tr>
							<tr>
								<th>累计评论数：</th><td>${product.commentNum }</td>
								<th>推荐商品：</th><td class="text-danger">${product.recommendFlag }</td>
							</tr>
							<tr>
								<th>上架时间：</th><td>${product.listingTime }</td>
								<th>下架时间：</th><td>${product.delistingTime }</td>
							</tr>
							<tr>
								<th>关键字：</th><td>${product.keywords }</td>
								<th>产地：</th><td>${product.origin }</td>
							</tr>
							<tr>
								<th>主图：</th>
								<c:forEach items="${list }" var="pic">
								<c:if test="${pic.mainFlag=='1' }">
								<td><a class='thumbnail pull-left' >
										<img src='${basePath }${pageContext.request.contextPath}${pic.picImgUrl }' onclick='showBigImg("${pic.picImgUrl }")'>
								</a></td>
								</c:if>
								</c:forEach>
							</tr>
							<tr>
								<th>非主图：</th>
								<td colspan= "3">
								<c:forEach items="${list }" var="pic">
								<c:if test="${pic.mainFlag=='0' }">
									<a class='thumbnail center-block thumb-lg b-3x m-r'>
										<img src='${basePath }${pageContext.request.contextPath}${pic.picImgUrl }' onclick='showBigImg("${pic.picImgUrl }")'>
									</a>
								</c:if>
								</c:forEach>
								</td>
							</tr>
						  </tbody>
						</table>
					</div>
					<div class="panel panel-info">
						<div class="panel-body">
							<button class="btn btn-sm btn-info btn-addon" onclick="editProductUI();">
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

	//点击图片时,显示大图
	function showBigImg(imgUrl){
		//alert(imgUrl);
		//var imgUrl = $(this)[0].src;
		//alert(imgUrl);
		$('#imgInModalID').attr("src", '${basePath}${pageContext.request.contextPath}'+imgUrl);
		$('#imgModal').modal('show');
	}
	
	//返回按钮
    function backManage(){
		toSkit("${basePath }${pageContext.request.contextPath}/model/manager/pro/productManage.jsp");
	};
	
	//编辑按钮
    function editProductUI(){
		toSkit("ProductAction!productEditUI.action?product.id=${product.id }");
	};

</script>
