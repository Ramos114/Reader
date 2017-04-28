<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<title>订单详情</title>
<style>
<!--
.thumb-md {display: inline-block;width: 90px;}
.m-r {margin-right: 55px;}
-->
</style>

<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">订单详情</h1>
</div>
<div class="wrapper-md">
	<div class="panel panel-default">
		<div class="panel-heading">订单信息列表</div>

		<div class="table-responsive">
			<div>
				<div class="panel panel-default">
					<div class="panel-heading">
		
				<div class="panel b-a">
        <div class="panel-heading b-b b-light"><div class="h4 m-t-xs m-b-xs">
								<strong>订单号：<span id="order_info_id">${session.order_info.id} </span></strong>	
									<i class="fa fa-circle text-success pull-right text-xs m-t-sm"></i>
								</div>
        </div>
        <div collapse="isCollapsed" class="panel-body collapse in" style="height: auto;">
       <span> 订单时间：</span><b class="h5 m-t-xs m-b-xs text-danger"><strong>${session.order_info.createDate }</strong></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								订单状态：<b class="h5 m-t-xs m-b-xs text-danger"><strong><s:if test="#session.order_info.orderStatus==1">待付款</s:if>
											<s:if test="#session.order_info.orderStatus==2">待发货</s:if>
											<s:if test="#session.order_info.orderStatus==3">待收货</s:if>
											<s:if test="#session.order_info.orderStatus==4">待评价</s:if>
											<s:if test="#session.order_info.orderStatus==5">已完成</s:if>
											</strong></b>
        </div>
      </div>
      
      <div class="panel b-a">
        <div class="panel-heading b-b b-light"><div class="h4 m-t-xs m-b-xs">
								<strong>会员信息</strong>	
									<i class="fa fa-circle text-success pull-right text-xs m-t-sm"></i>
								</div>
        </div>
        <div collapse="isCollapsed" class="panel-body collapse in" style="height: auto;">
       <span> 会员真实姓名：</span><b class="h5 m-t-xs m-b-xs"><strong>${session.order_info.customer.realName}</strong></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			收货地址：<b class="h5 m-t-xs m-b-xs "><strong>${session.order_info.address.detailAddress}</strong></b>
        </div>
      </div>
      
      <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
          <th style="width: 10%">宝贝</th>
		  <th style="width: 10%">单价</th>
		  <th style="width: 10%">数量</th>
		  <th style="width: 10%">商品总价</th>
          </tr>
        </thead>     
        <tbody id="tableTbody">
        	<tr class="odd"><td valign="top" colspan="5" class="dataTables_empty">Loading...</td></tr>
        </tbody>
      </table>
    </div>
						<div align="right">
						邮费：${session.order_info.freight}元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						实付款：<b class="h2 m-t-xs m-b-xs text-danger"><strong>${session.order_info.totalPrice}</strong></b>元</div>
					</div>
				</div>  
				<div class="panel panel-info">
					<div class="panel-body">					
						<button class="btn btn-sm btn-danger btn-addon">
							<i class="glyphicon glyphicon-trash" 
					onclick="toSkit('${basePath }${pageContext.request.contextPath}/OrderAction!deleteOrderById.action?id=${session.order_info.id}')">
							</i>删除
						</button>
						
						<button class="btn btn-sm btn-success btn-addon"
							onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/ord/orderManage.jsp')">
							<i class="fa fa-mail-reply"></i>返回
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
   </div>

<script type="text/javascript"> 
//查询订单中的商品详细清单
doRequest();
function doRequest(){	
var id=$("#order_info_id").html();
		$.ajax({
    	type:'post',
    	url:"${basePath}${pageContext.request.contextPath}/OrderAction!findOrderDetail.action",
    	data:{
    		"id" : id,
    		},  
     	dataType:'json',  
    	success:function(data,status){
    		if (status == "success") {
    	
    			if(data.status == "success"){

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
    	cache:false					//不缓存
    	});
	};  
	
	
	
	//加入无数据div
	function addNullMessage(){
		$("#tableTbody").append("<tr class=\"odd\"><td valign=\"top\" colspan=\"8\" class=\"dataTables_empty\">暂无数据</td></td>");
	}
	
	//动态生成查询table
	function setDataTable(data){
		
		//先移除表格中的数据
		$("#tableTbody>tr").remove();


		//组装数据
		for(var i=0; i<data.detail.length; i++){
			
			if(data.detail[i].buyNum == null  ){
				data.detail[i].buyNum="";
			}
			//添加数据进表格
			addDataToTable(data.detail[i]);
		}
		
		
		//判断是否有数据
		if (data.result.length == 0) {
			addNullMessage();
			
		}
		
		}
	
	//数据写入table
	function addDataToTable(data){
	$("#tableTbody").append("<tr>"
								+"<td>"+data.proId.proName+"</td>"
								+"<td>"+data.proId.price+"</td>"
								+"<td>"+data.buyNum+"</td>"
								+"<td>"+data.proPrice+"</td>"
								+"</tr>");
	}
			
</script>