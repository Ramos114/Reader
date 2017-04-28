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
<title>更新会员信息</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">更新会员信息</h1>
    <input type="text" id="id" hidden="hidden" value="${customer_info.id }">
    <input type="text" id="optLock" value="${customer_info.optLock }" hidden="hidden">
    <input type="text" id="rankId" value="${customer_info.rankId.id }" hidden="hidden">
    <input type="text" id="createDate" value="${customer_info.createDate }" hidden="hidden">
    <input type="text" id="rankOptLock" value="${customer_info.rankId.optLock }" hidden="hidden">
    <input type="text" id="gender_select" value="${customer_info.gender }" hidden="hidden">
</div>

<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">基础信息</div>
    <div class="row wrapper">
      <div class="panel-body">
        <div class="form-horizontal ng-pristine ng-valid ng-valid-date ng-valid-required ng-valid-parse ng-valid-date-disabled">
          <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-4">
              <input type="text" id="userName" class="form-control" placeholder="6-16位，由字母、数字、字符组成" readonly="readonly" value="${customer_info.userName }"> 
              <i id="userName_check" class=""></i>                       
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">登录密码</label>
            <div class="col-sm-4">
              <input type="password" id="loginPassword" class="form-control" placeholder="6-16位，由字母、数字、字符组成" value="${customer_info.loginPassword }"> 
              <i id="loginPassword_check" class=""></i>  
              <span id="enough" class="label bg-default col-sm-4" style="height: 6px;"> </span>
              <span id="medium" class="label bg-default col-sm-4" style="height: 6px;"> </span> 
              <span id="strong" class="label bg-default col-sm-4" style="height: 6px;"> </span>                        
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">重复密码</label>
            <div class="col-sm-4">
              <input type="password" id="loginPassword2" class="form-control" placeholder="重复密码与登录密码须一致" value="${customer_info.loginPassword }">      
              <i id="loginPassword2_check" class=""></i>                   
            </div>
          </div>
          <div class="line line-dashed b-b line-lg pull-in"></div>
          <div class="form-group">
            <label class="col-sm-2 control-label">真实姓名</label>
            <div class="col-sm-3">
              <input type="text" id="realName" class="form-control" placeholder="由2-10个中文字符组成"  value="${customer_info.realName }">    
              <i id="realName_check" class=""></i>                       
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4">
              <div class="radio">
                 <c:if test="${empty customer_info.gender}">
                  <label class="i-checks">
                    <input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse" id="male" name="gender" value="男"><i></i>男
                  </label>
                  <label class="i-checks">
                    <input type="radio" class="ng-valid ng-dirty ng-touched" id="female" name="gender" value="女"><i></i>女
                  </label>
                 </c:if>
                 <c:if test="${customer_info.gender=='男'}">
                  <label class="i-checks">
                    <input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse" id="male" name="gender" value="男" checked="checked"><i></i>男
                  </label>
                  <label class="i-checks">
                    <input type="radio" class="ng-valid ng-dirty ng-touched" id="female" name="gender" value="女"><i></i>女
                  </label>
                </c:if>
                <c:if test="${customer_info.gender=='女'}">
                  <label class="i-checks">
                    <input type="radio" class="ng-valid ng-dirty ng-touched ng-valid-parse" id="male" name="gender" value="男" ><i></i>男
                  </label>
                  <label class="i-checks">
                    <input type="radio" class="ng-valid ng-dirty ng-touched" id="female" name="gender" value="女" checked="checked"><i></i>女
                  </label>
                </c:if>
              </div>                      
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">身份证号码</label>
            <div class="col-sm-4">
              <input type="text" id="idCard" class="form-control" placeholder="请输入身份证号码，为15或18位数字字符组成"  value="${customer_info.idCard }">
              <i id="idCard_check" class=""></i>                         
            </div>
          </div>
          <input id="rank_id" value="${customer_info.rankId.level }" type="hidden">
          <div class="form-group">
            <label class="col-sm-2 control-label">会员等级</label>
            <div class="col-sm-3">
              <select id="level" class="form-control">
                <c:forEach items="${rank_list}" var="rank">
                <option value="${rank.level }" >${rank.level }</option>
                </c:forEach>
              </select>                       
            </div>
          </div>
          <div class="line line-dashed b-b line-lg pull-in"></div>
          <div class="form-group">
            <label class="col-sm-2 control-label">邮箱地址</label>
            <div class="col-sm-4">
              <input type="text" id="email" class="form-control" placeholder="请输入正确的邮箱格式，例如zhangsan@163.com"  value="${customer_info.email }">
              <i id="email_check" class=""></i>                         
            </div>
          </div>
          <div class="line line-dashed b-b line-lg pull-in"></div>
          <div class="form-group">
            <div class="col-sm-4 col-sm-offset-2">
              <button type="submit" class="btn btn-default" onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/cus/customerManage.jsp')">返回</button>
              <button type="submit" class="btn btn-primary" id="saveCustomer">保存</button>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function(){	
	//验证等级
	var rankId = $("#rank_id").val();
	$("#level").val(rankId);
	
	//验证用户名
	$("#userName").keyup(function(){		
		var userName = $("#userName").val();
		var length = userName.length;
		var reg = /^[A-Za-z0-9]+$/;
		if(userName == null || length > 16 || length < 6){ //验证长度
			$("#userName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else if(!reg.test(userName)){ //验证格式
			$("#userName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}
		else { //验证是否同名			
		$.ajax({
			type:'post',
			url:"CustomerAction!findSameCusName.action",
			data:{
				"customer.userName":userName
			},
			dataType:'text',
			success:function(data){
				if(data == "notsame"){
					$("#userName_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
				}else{
					$("#userName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
				}
			},
			cache:false,	
		});//ajax
		$("#userName_error").html("不可用");
		}
	});		
	
	//验证密码格式，验证密码强度
	$("#loginPassword").keyup(function() {
		var loginPassword = $(this).val();
		var length = loginPassword.length;
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
		var enoughRegex = new RegExp("(?=.{6,}).*", "g");
		if (false == enoughRegex.test($(this).val()) || length > 16) {
			 $("#loginPassword_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		     $("#enough").removeClass().addClass("label bg-default col-sm-4");
			 $("#medium").removeClass().addClass("label bg-default col-sm-4");
			 $("#strong").removeClass().addClass("label bg-default col-sm-4");
			 } else if (strongRegex.test($(this).val())) {
				 $("#loginPassword_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
			     $("#strong").removeClass().addClass("label bg-success col-sm-4");
			 } else if (mediumRegex.test($(this).val())) {
				 $("#loginPassword_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
				 $("#medium").removeClass().addClass("label bg-warning col-sm-4");
			 } else {
				 $("#loginPassword_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
				 $("#enough").removeClass().addClass("label bg-danger col-sm-4");
			 } 
			 return true;
	});
	
	//验证重复密码是否与登录密码一致
	$("#loginPassword2").blur(function() {
		var loginPassword = $("#loginPassword").val();
		var loginPassword2 = $("#loginPassword2").val();
		if(loginPassword2 == null){
			$("#loginPassword2_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else if(loginPassword2 == loginPassword){
			$("#loginPassword2_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}else{
			$("#loginPassword2_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}
	});
	
	//验证真实姓名格式
	$("#realName").blur(function() {
		var realName = $("#realName").val();
		var reg = /^[\u4E00-\u9FA5]{2,10}$/;
		if(!reg.test(realName) || realName == null){ //判断
			$("#realName_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		}else{
			$("#realName_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		}
	});
	
	//验证身份证格式
	$("#idCard").keyup(function() {
		var idCard = $("#idCard").val();
		if(idCard != null){ //判断
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		    if(!reg.test(idCard)){	    	
		    	$("#idCard_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
		    }else{
		    	$("#idCard_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
		    }
		}
	});
	
	//验证邮箱格式
	$("#email").blur(function() {
		var email = $("#email").val().trim();
		if (email != null) {//判断
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
			if (!reg.test(email)) {
				$("#email_check").removeClass().addClass("text-danger glyphicon glyphicon-remove formCheck");
			} else {
				$("#email_check").removeClass().addClass("text-success glyphicon glyphicon-ok formCheck");
			}
		}
	});
	
	//保存会员
	$("#saveCustomer").click(function() {
		var id = $("#id").val();
		var createDate = $("#createDate").val();
		var optLock = $("#optLock").val();
		var userName = $("#userName").val();
		var loginPassword = $("#loginPassword").val();
		var realName = $("#realName").val();
		var gender = $('input:radio:checked').val();
		var idCard = $("#idCard").val();
		var email = $("#email").val();
		var level = $('#level option:checked').val();
		var rankId = $("#rankId").val();
		var rankOptLock = $("#rankOptLock").val();
		
		if(
		   !$("#loginPassword_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#loginPassword2_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#realName_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#idCard_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")&&
		   !$("#email_check").hasClass("text-danger glyphicon glyphicon-remove formCheck")){ //判断所有信息格式都正确
		   
			layer.confirm("是否确认保存？",{icon: 3},function(){
				$.ajax({
					type: 'post',
					url: "CustomerAction!updateCustomer.action",
					data:{
						"customer.id":id,
						"customer.optLock":optLock,
						"customer.createDate":createDate,
						"customer.userName":userName,
						"customer.loginPassword":loginPassword,
						"customer.realName":realName,
						"customer.gender":gender,
						"customer.idCard":idCard,
						"customer.email":email,
						"customer.rankId.id":rankId,
						"customer.rankId.level":level,
						"customer.rankId.optLock":rankOptLock
					},
				    dataType: 'text',
				    success: function(data){
						if (data == "success") {						
							//跳转刷新
							$("#content_load").load("${basePath}${pageContext.request.contextPath}/model/manager/cus/customerManage.jsp");
							layer.msg("恭喜，更新会员成功！！", {icon: 1});
						} else {
							layer.msg("抱歉，更新会员失败！", {icon: 2});
						}
				    },
				    cache:false
				});
			});
		}else{
			layer.msg("请先填写正确的会员信息再进行确认操作！", {icon: 7});
		}
	});
	
});
</script>