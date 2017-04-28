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
    width: 33.333%;
    height: 100%;
  }
</style>
<title>收货地址管理</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">收货地址管理</h1>
  <input type="text" value="${customer_info.id }" id="customerId" hidden="hidden">
  <input type="text" value="${customer_info.optLock }" id="customerOptLock" hidden="hidden">
</div>

<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">收货地址管理</div>
    <div class="row wrapper">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
          <div class="form-group">
            <label class="col-sm-1 control-label" >收货地址</label>                 
            <div class="col-sm-8">
              <button class="btn btn-rounded btn btn-icon btn-default" data-toggle="modal" data-target="#myAddress"><i class="fa fa-plus"></i></button>&nbsp;&nbsp;
              <small class="text-muted inline m-t-sm m-b-sm">您已创建${address_size}条收货地址，最多可创建6条</small>    
            </div>
          </div>
          <div class="line line-dashed b-b line-lg pull-in"></div>
          <div class="form_group">
            <ul ui-jq="sortable" class="list-group gutter list-group-lg list-group-sp">
              <c:forEach var="address" items="${address_info}">
              <li class="list-group-item address-item" draggable="true">
                <span class="pull-right">
                <a><i class="fa fa-pencil fa-fw m-r-xs" data-toggle="modal" data-target="#addressEdit" onclick="editAddress('${address.id}');"></i></a>
                <a><i class="fa fa-times fa-fw" onclick="deleteAddress('${address.id}');"></i></a>                  
                </span>            
                <small class="text-muted inline m-t-sm m-b-sm">收货人姓名：${address.consigneeName}</small><br>
                <small class="text-muted inline m-t-sm m-b-sm">所在地区：${address.province}-${address.city}-${address.town}</small><br>
                <small class="text-muted inline m-t-sm m-b-sm">地址：${address.detailAddress}</small><br>
                <small class="text-muted inline m-t-sm m-b-sm">手机：${address.telNumber}</small><br>
                <small class="text-muted inline m-t-sm m-b-sm">固定电话：${address.fixedNumber}</small><br>
                <small class="text-muted inline m-t-sm m-b-sm">是否默认地址：${address.status}</small><br>
              </li>
              </c:forEach>
            </ul>         
          </div>
        </div>
      </div>
    </div>
  </div>
</div>    

<!-- 添加收货地址模态框 -->
<div class="modal fade" id="myAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>				
				<h4 class="modal-title" id="myModalLabel"><i class="icon-pencil"></i>添加收货地址</h4>  
			</div>
			<div class="modal-body">
			  <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
		        <div class="form-group">
                  <label class="col-sm-3 control-label">收货人姓名</label>
                  <div class="col-sm-6">
                    <input type="text" id="consigneeName" class="form-control" placeholder="由2-10个中文字符组成">  
                    <i id="consigneeName_check" class=""></i>                        
                  </div>
                </div>
                <div class="line line-dashed b-b line-lg pull-in2"></div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">所在地区</label>
                  <div class="col-sm-8">
                    <div class="col-sm-4-select">
                      <select id="province" class="form-control">
                        <option value="广东省">广东省</option>
                      </select> 
                    </div>
                    <div class="col-sm-4-select">
                      <select id="city" class="form-control">
                        <option value="东莞市">东莞市</option>
                      </select> 
                    </div>   
                    <div class="col-sm-4-select">
                      <select id="town" class="form-control">
                        <option value="南城区">南城区</option>
                        <option value="寮步镇">寮步镇</option>
                      </select> 
                    </div>                              
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">详细地址</label>
                  <div class="col-sm-8">
                    <textarea id="addressInfo" class="form-control" rows="4" placeholder="建议您如实填写详细收货地址，例如街道名称、门牌号、楼层和房间号等信息"></textarea>
                    <i id="addressInfo_check" class=""></i>   
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">邮编</label>
                  <div class="col-sm-6">
                    <input type="text" id="zipCode" class="form-control" placeholder="如您不清楚邮递区号，请填写000000">
                    <i id="zipCode_check" class=""></i>                       
                  </div>
                </div>
                <div class="line line-dashed b-b line-lg pull-in2"></div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">手机号码</label>
                  <div class="col-sm-6">
                    <input type="text" id="telNumber" class="form-control" placeholder="手机号码和电话号码必须填一项">   
                    <i id="telNumber_check" class=""></i>                     
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">电话号码</label>
                  <div class="col-sm-6">
                    <input type="text" id="fixedNumber" class="form-control" placeholder="手机号码和电话号码必须填一项">   
                    <i id="fixedNumber_check" class=""></i>                     
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label"></label>
                  <div class="col-sm-5">
                    <label class="i-checks col-sm-9 control-label">
                      <input type="checkbox" class="form-control"><i></i>设置为默认收货地址
                    </label>
                  </div>
                </div>
              </div>
			</div>
	        <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" id="saveAddress">提交</button>
	        </div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 更改收货地址模态框 -->
<div class="modal fade" id="addressEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>				
				<h4 class="modal-title" id="myModalLabel"><i class="icon-pencil"></i>更改收货地址</h4>  
			</div>
			<div class="modal-body">
			  <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
		        <div class="form-group">
                  <label class="col-sm-3 control-label">收货人姓名</label>
                  <div class="col-sm-6">
                    <input type="text" id="updateAddressId" hidden="hidden">
                    <input type="text" id="updateOptLock" hidden="hidden">
                    <input type="text" id="updateConsigneeName" class="form-control" placeholder="由2-10个中文字符组成">  
                    <i id="updateConsigneeName_check" class=""></i>                        
                  </div>
                </div>
                <div class="line line-dashed b-b line-lg pull-in2"></div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">所在地区</label>
                  <div class="col-sm-8">
                    <div class="col-sm-4-select">
                      <select id="updateProvince" class="form-control">
                        <option value="广东省">广东省</option>
                      </select> 
                    </div>
                    <div class="col-sm-4-select">
                      <select id="updateCity" class="form-control">
                        <option value="东莞市">东莞市</option>
                      </select> 
                    </div>   
                    <div class="col-sm-4-select">
                      <select id="updateTown" class="form-control">
                        <option value="南城区">南城区</option>
                        <option value="寮步镇">寮步镇</option>
                      </select> 
                    </div>                              
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">详细地址</label>
                  <div class="col-sm-8">
                    <textarea id="updateDetailAddress" class="form-control" rows="4" placeholder="建议您如实填写详细收货地址，例如街道名称、门牌号、楼层和房间号等信息"></textarea>
                    <i id="updateDetailAddress_check" class=""></i>   
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">邮编</label>
                  <div class="col-sm-6">
                    <input type="text" id="updateZipCode" class="form-control" placeholder="如您不清楚邮递区号，请填写000000">
                    <i id="updateZipCode_check" class=""></i>                       
                  </div>
                </div>
                <div class="line line-dashed b-b line-lg pull-in2"></div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">手机号码</label>
                  <div class="col-sm-6">
                    <input type="text" id="updateTelNumber" class="form-control" placeholder="手机号码和电话号码必须填一项">   
                    <i id="updateTelNumber_check" class=""></i>                     
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">电话号码</label>
                  <div class="col-sm-6">
                    <input type="text" id="updateFixedNumber" class="form-control" placeholder="手机号码和电话号码必须填一项">   
                    <i id="updateFixedNumber_check" class=""></i>                     
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label"></label>
                  <div class="col-sm-5">
                    <label class="i-checks col-sm-9 control-label">
                      <input id="updateStatus" type="checkbox" class="form-control"><i></i>设置为默认收货地址
                    </label>
                  </div>
                </div>
              </div>
			</div>
	        <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" id="updateAddress">保存</button>
	        </div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript">

//添加地址
$(document).ready(function() {
	
	//验证收货人姓名
	$("#consigneeName").keyup(function() {
		var consigneeName = $("#consigneeName").val();
		var reg = /^([\u4e00-\u9fa5]{2,10})$/g;
		if(!reg.test(consigneeName)){
			$("#consigneeName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#consigneeName_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});
	
	//验证详细地址
	$("#addressInfo").keyup(function() {
		var addressInfo = $("#addressInfo").val();
		var reg = /[\u4e00-\u9fa5_a-zA-Z0-9_]{4,10}/g;
		if(addressInfo == ""){
			$("#addressInfo_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			if(!reg.test(addressInfo)){
				$("#addressInfo_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
			}else{
				$("#addressInfo_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
			}
		}
	});
	
	//验证邮编
	$("#zipCode").keyup(function() {
		var zipCode = $("#zipCode").val();
		var reg =  /^[0-9][0-9]{5}$/;
		if(!reg.test(zipCode)){
			$("#zipCode_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#zipCode_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});
	
	//验证手机号
	$("#telNumber").keyup(function() {
		var telNumber = $("#telNumber").val();
		var reg =   /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9])[0-9]{8}$/;
		if(telNumber == ""){
			$("#telNumber_check").removeClass().addClass("text-warning fa fa-exclamation-circle formCheck");
		}else{
			if(!reg.test(telNumber)){
			  $("#telNumber_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		    }else{
			  $("#telNumber_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		    }
		}	
	});
	
	//验证固定电话
	$("#fixedNumber").keyup(function() {
		var fixedNumber = $("#fixedNumber").val();
		var reg = /^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
		if(fixedNumber == ""){
			$("#fixedNumber_check").removeClass().addClass("text-warning fa fa-exclamation-circle formCheck");
		}else{
			if(!reg.test(fixedNumber)){
				$("#fixedNumber_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
			}else{
				$("#fixedNumber_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
			}
		}
	});
	
	//提交地址确认
	$("#saveAddress").click(function() {
		var consigneeName = $("#consigneeName").val();
		var addressInfo = $("#addressInfo").val();
		var zipCode = $("#zipCode").val();
		var telNumber = $("#telNumber").val();
		var fixedNumber = $("#fixedNumber").val();
		var province =  $('#province option:checked').val();
		var city =  $('#city option:checked').val();
		var town =  $('#town option:checked').val();
		var status = $('input:checkBox:checked').val();
		var customerId = $("#customerId").val();
		
		if(status == "on"){ //判断是否默认地址
			status = "是"; //默认
		}else{
			status = "否" ; //非默认
		}
		if(($("#consigneeName_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#addressInfo_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#zipCode_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#telNumber_check").hasClass("text-success glyphicon glyphicon-ok formCheck"))||(
		   $("#consigneeName_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#addressInfo_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#zipCode_check").hasClass("text-success glyphicon glyphicon-ok formCheck")&&
		   $("#fixedNumber_check").hasClass("text-success glyphicon glyphicon-ok formCheck"))){ //判断所有信息格式都正确
			$.ajax({
				type: 'post',
				url: "AddressAction!saveAddress.action",
				data:{
					"address.consigneeName":consigneeName,
					"address.detailAddress":addressInfo,
					"address.zipCode":zipCode,
					"address.telNumber":telNumber,
					"address.fixedNumber":fixedNumber,
					"address.status":status,
					"address.city":city,
					"address.town":town,
					"address.province":province,
					"address.customerId.id":customerId,
				},
			    dataType: 'text',
			    success: function(data){
					if (data == "success") {						
						//跳转刷新
						$("#myAddress").show("hide");
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/AddressAction!edit_ui.action?customer.id="+customerId);
						layer.msg("恭喜，添加地址成功！！", {icon: 1});
					} else {
						layer.msg("抱歉，添加地址失败！", {icon: 2});
					}
			    },
			    cache:false
			});
		}else{
			layer.msg("请先填写正确的地址信息再进行确认操作！", {icon: 7});
		}
	});	
});

//删除地址
function deleteAddress(addressId){
	layer.confirm("确认删除该地址记录吗？",{icon:3},function(){
		$("#content_load").load("AddressAction!deleteAddress.action?addressId="+addressId+"");
		layer.msg("恭喜，删除地址记录成功！",{icon:1});
	});
}

//模态框获取要更改地址的信息
function editAddress(id){
	
	$.ajax({
		type:'post',
		url:"AddressAction!findAddressById.action",
		data:{
			"id":id
		},
		dataType:'json',
	    success:function(data){
	    	if(data.status == "success"){
	    		$("#updateAddressId").val(data.address.id);
	    		$("#updateOptLock").val(data.address.optLock);
	    		$("#updateConsigneeName").val(data.address.consigneeName);
	    		$("#updateDetailAddress").val(data.address.detailAddress);
	    		$("#updateZipCode").val(data.address.zipCode);
	    		$("#updateTelNumber").val(data.address.telNumber);
	    		$("#updateFixedNumber").val(data.address.fixedNumber);
	    		if(data.address.status == "是"){
	    			$("#updateStatus").attr("checked",'checked');
	    		}else{
	    			
	    		}
	    	}else{
	    		
	    	}
	    }
	});
}

//更改地址
$(document).ready(function() {
	
	//验证收货人姓名
	$("#updateConsigneeName").keyup(function() {
		var consigneeName = $("#updateConsigneeName").val();
		var reg = /^([\u4e00-\u9fa5]{2,10})$/g;
		if(!reg.test(consigneeName)){
			$("#updateConsigneeName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#updateConsigneeName_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});
	
	//验证详细地址
	$("#updateDetailAddress").keyup(function() {
		var addressInfo = $("#updateDetailAddress").val();
		var reg = /[\u4e00-\u9fa5_a-zA-Z0-9_]{4,10}/g;
		if(addressInfo == ""){
			$("#updateDetailAddress_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			if(!reg.test(addressInfo)){
				$("#updateDetailAddress_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
			}else{
				$("#updateDetailAddress_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
			}
		}
	});
	
	//验证邮编
	$("#updateZipCode").keyup(function() {
		var zipCode = $("#updateZipCode").val();
		var reg =  /^[0-9][0-9]{5}$/;
		if(!reg.test(zipCode)){
			$("#updateZipCode_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#updateZipCode_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});
	
	//验证手机号
	$("#updateTelNumber").keyup(function() {
		var telNumber = $("#updateTelNumber").val();
		var reg =   /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9])[0-9]{8}$/;
		if(telNumber == ""){
			$("#updateTelNumber_check").removeClass().addClass("text-warning fa fa-exclamation-circle formCheck");
		}else{
			if(!reg.test(telNumber)){
			  $("#updateTelNumber_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		    }else{
			  $("#updateTelNumber_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		    }
		}	
	});
	
	//验证固定电话
	$("#updateFixedNumber").keyup(function() {
		var fixedNumber = $("#updateFixedNumber").val();
		var reg = /^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
		if(fixedNumber == ""){
			$("#updateFixedNumber_check").removeClass().addClass("text-warning fa fa-exclamation-circle formCheck");
		}else{
			if(!reg.test(fixedNumber)){
				$("#updateFixedNumber_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
			}else{
				$("#updateFixedNumber_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
			}
		}
	});
	
	//保存地址确认
	$("#updateAddress").click(function() {
		var optLock = $("#updateOptLock").val();
		var id = $("#updateAddressId").val();
		var consigneeName = $("#updateConsigneeName").val();
		var addressInfo = $("#updateDetailAddress").val();
		var zipCode = $("#updateZipCode").val();
		var telNumber = $("#updateTelNumber").val();
		var fixedNumber = $("#updateFixedNumber").val();
		var province =  $('#updateProvince option:checked').val();
		var city =  $('#updateCity option:checked').val();
		var town =  $('#updateTown option:checked').val();
		var status = $('input:checkBox:checked').val();
		var customerId = $("#customerId").val();
		
		if(status == "on"){ //判断是否默认地址
			status = "是"; //默认
		}else{
			status = "否" ; //非默认
		}
		if((!$("#updateConsigneeName_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#updateDetailAddress_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#updateZipCode_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#updateTelNumber_check").hasClass("text-danger glyphicon glyphicon-remove formCheck"))||(
		   !$("#updateConsigneeName_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#updateDetailAddress_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#updateZipCode_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#updateFixedNumber_check").hasClass("text-danger glyphicon glyphicon-remove formCheck"))){ //判断所有信息格式都正确
			$.ajax({
				type: 'post',
				url: "AddressAction!updateAddress.action",
				data:{
					"address.id":id,
					"address.optLock":optLock,
					"address.consigneeName":consigneeName,
					"address.detailAddress":addressInfo,
					"address.zipCode":zipCode,
					"address.telNumber":telNumber,
					"address.fixedNumber":fixedNumber,
					"address.status":status,
					"address.city":city,
					"address.town":town,
					"address.province":province,
					"address.customerId.id":customerId,
				},
			    dataType: 'text',
			    success: function(data){
					if (data == "success") {						
						//跳转刷新
						$("#myAddress").show("hide");
						$("#content_load").load("${basePath}${pageContext.request.contextPath}/AddressAction!edit_ui.action?customer.id="+customerId);
						layer.msg("恭喜，更改地址成功！！", {icon: 1});
					} else {
						layer.msg("抱歉，更改地址失败！", {icon: 2});
					}
			    },
			    cache:false
			});
		}else{
			layer.msg("请先填写正确的地址信息再进行确认操作！", {icon: 7});
		}
	});	
});

</script>