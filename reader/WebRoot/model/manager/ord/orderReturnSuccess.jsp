<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
  .modal-body{
    padding: 10px;
    height: 440px;
  }
  .modal-body2{
    padding: 10px;
    height: 300px;
  }
  .col-sm-4-select{
    width: 31%;
    position: relative;
    min-height: 1px;
    padding-right: 10px;
    float: left;
  }
  .pull-in2{
    margin-right: -15px;
  }
  .formCheck{
    float: right;
    margin-right: -18px;
    margin-top: -25px;
  }
  .address-item{
    float: left;
    width: 33.3333%;
    height: 100%;
  }

</style>
<title>确认退单信息</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">确认退单信息</h1>
      <input type="text" id="order_id" hidden="hidden" value="${ordId}">
    <input type="text" id="orderReturn_id" hidden="hidden" value="${orderReturn_info.id}">
</div>

<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">退单信息</div>
    <div class="row wrapper">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
          <div class="form-group">
            <label class="col-sm-2 control-label">需退款金额</label>
            <div class="col-sm-4">
              <input type="text" id="userName" class="form-control" placeholder="6-16位，由字母、数字、字符组成" readonly="readonly" value="${orderReturn_info.totalPrice }"> 
              <i id="userName_check" class=""></i>                       
            </div>
          </div>
       <div class="form-group">
            <label class="col-sm-2 control-label">商家实际退款金额</label>
            <div class="col-sm-4">
              <input type="text" id="userName" class="form-control" placeholder="6-16位，由字母、数字、字符组成" readonly="readonly" value="${orderReturn_info.nowsPrice }"> 
              <i id="userName_check" class=""></i>                       
            </div>
          </div>
          <div class="line line-dashed b-b line-lg pull-in"></div>
          <div class="form-group">
            <div class="col-sm-4 col-sm-offset-2">
              <button type="submit" class="btn btn-default" onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/ord/orderManage.jsp')">返回</button>
              <button type="submit" class="btn btn-primary" id="saveOrderReturn">确定</button>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function(){	
	
	
	//退单
	$("#saveOrderReturn").click(function() {
		var orderReturn_id = $("#orderReturn_id").val();
		var   order_id =$("#order_id").val();
			layer.confirm("是否确认允许退单？",{icon: 3},function(){
				$.ajax({
					type: 'post',
					url: "OrderAction!updateOrderReturn.action",
					data:{
						"id":orderReturn_id,
						"order_id":order_id
					},
				    dataType: 'text',
				    success: function(data){
						if (data == "success") {						
							//跳转刷新
							$("#content_load").load("${basePath }${pageContext.request.contextPath}/OrderAction!updateOrderById.action?id="+order_id+"");
							layer.msg("恭喜，退单成功！！", {icon: 1});
						} else {
							layer.msg("抱歉，退单失败！", {icon: 2});
						}
				    },
				    cache:false
				});
			});
		
	});
	
});
</script>