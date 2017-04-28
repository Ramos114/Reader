<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta charset="utf-8">
<title>登录页面</title>

<meta name="description" content="User login page">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- bootstrap & fontawesome -->
<%-- <link rel="stylesheet"
	href="${basePath }${pageContext.request.contextPath}/plugin/front_login/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }${pageContext.request.contextPath}/plugin/front_login/font-awesome/4.2.0/css/font-awesome.min.css">

<!-- text fonts1 -->
<link rel="stylesheet"
	href="${basePath }${pageContext.request.contextPath}/plugin/front_login/fonts/fonts.googleapis.com.css">

<!-- ace styles -->
<link rel="stylesheet"
	href="${basePath }${pageContext.request.contextPath}/plugin/front_login/css/ace.min.css">

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${basePath }${pageContext.request.contextPath}/plugin/front_login/css/ace-part2.min.css" />
		<![endif]-->
<link rel="stylesheet"
	href="${basePath }${pageContext.request.contextPath}/plugin/front_login/css/ace-rtl.min.css">
 --%>
<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${basePath }${pageContext.request.contextPath}/plugin/front_login/css/ace-ie.min.css" />
		<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="${basePath }${pageContext.request.contextPath}/plugin/front_login/js/html5shiv.min.js"></script>
		<script src="${basePath }${pageContext.request.contextPath}/plugin/front_login/js/respond.min.js"></script>
		<![endif]-->
</head>
<script src="${basePath }${pageContext.request.contextPath}/source/shopFront/js/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
$(function(){
window.location.href="FrontInitAction!InitMenu.action";
//window.location.href="${basePath }${pageContext.request.contextPath}/model/front/demo/index.jsp";
});
</script>
<body class="login-layout light-login">
	<%-- <div id="BAIDU_DUP_fp_wrapper"
		style="position: absolute; left: -1px; bottom: -1px; z-index: 0; width: 0px; height: 0px; overflow: hidden; visibility: hidden; display: none;">
		<iframe id="BAIDU_DUP_fp_iframe"
			src="https://pos.baidu.com/wh/o.htm?ltr="
			style="width: 0px; height: 0px; visibility: hidden; display: none;"></iframe>
	</div>
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<br /> <br /> <br /> <br />
							<h1>
								<i class="ace-icon fa fa-leaf green"></i> <span class="red">商城</span>
								<!-- 	<span class="grey" id="id-text2">登陆</span> -->
							</h1>
							<!-- <h4 class="blue" id="id-company-text">© 公司名称</h4> -->
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i> 请输入您的信息
										</h4>

										<div class="space-6"></div>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" placeholder="Username"
														id="login_name"> <i class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control"
														placeholder="Password" id="login_password"> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<!-- <label class="inline"> <input type="checkbox"
														id="rememberUser" class="ace"> <span class="lbl">
															记住</span>
													</label> -->

													<button id="login_button" type="button"
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-key"></i> <span
															class="bigger-110">登录</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> 忘记密码
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box"
												class="user-signup-link"> 注册 <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> 找回密码
										</h4>

										<div class="space-6"></div>
										<p>输入您的电子邮件和接收指令</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" placeholder="Email">
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button"
														class="width-35 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i> <span
															class="bigger-110">发送邮件</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> 返回登录 <i
											class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> 用户注册
										</h4>

										<div class="space-6"></div>
										<p>填写信息:</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" placeholder="用户名"
														id="register_userName"> <i
														class="ace-icon fa fa-user"></i> <img id="userName_error"
														src="${basePath }${pageContext.request.contextPath}/plugin/front_login/images/ichecked.png"
														style="width:20px;height:20px;margin:-27px -20px 0 0;float: right;">
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control" placeholder="密码"
														id="register_password"> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" class="form-control" placeholder="确认密码"
														id="register_password2"> <i
														class="ace-icon fa fa-lock"></i> <img
														id="checkedPassword_Img"
														src="${basePath }${pageContext.request.contextPath}/plugin/front_login/images/ichecked.png"
														style="width:20px;height:20px;margin:-27px -20px 0 0;float: right;">
												</span>

												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" placeholder="真实姓名"
														id="register_realName"> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" class="form-control" placeholder="联系电话"
														id="register_telNumber"> <i
														class="ace-icon fa fa-phone"></i> <i style="color:red"
														id="phone_error"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" placeholder="邮箱"
														id="register_email"> <i
														class="ace-icon fa fa-envelope"></i> <i style="color:red"
														id="email_error"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm"
														id="reset_button">
														<i class="ace-icon fa fa-refresh"></i> <span
															class="bigger-110">重置</span>
													</button>

													<button type="button"
														class="width-65 pull-right btn btn-sm btn-success"
														id="register_button">
														<span class="bigger-110">注册</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 返回登录
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->

					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script
		src="${basePath }${pageContext.request.contextPath}/plugin/front_login/js/jquery.2.1.1.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="${basePath }${pageContext.request.contextPath}/plugin/front_login/js/jquery.1.11.1.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='${basePath }${pageContext.request.contextPath}/plugin/front_login/js/jquery.min.js'>"
								+ "<"+"/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script
		src="${basePath }${pageContext.request.contextPath}/plugin/front_login/jquery.cookie.js"></script>
	<script type="text/javascript">
		if ('ontouchstart' in document.documentElement)
			document
					.write("<script src='${basePath }${pageContext.request.contextPath}/plugin/front_login/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
			$(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			});
/* 
			if ($.cookie("rmbUser") == "true") {
				$("#rememberUser").attr("checked", true);
				$("#login_name").val($.cookie("c_username"));
				$("#login_password").val($.cookie("c_password"));
			}
 //记住用户名密码
    function Save() {
    alert(1);
        if ($("#rememberUser").attr("checked")) {
            var userName = $("#login_name").val();
            var passWord = $("#login_password").val();
            $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
            $.cookie("c_username", userName, { expires: 7 });
            $.cookie("c_password", passWord, { expires: 7 });
        }
        else {
            $.cookie("rmbUser", "false", { expire: -1 });
            $.cookie("c_username", "", { expires: -1 });
            $.cookie("c_password", "", { expires: -1 });
        }
    }; */
			$("#login_button")
					.click(
							function() {//登陆按钮
							//Save();//记住用户名密码
								var userName = $("#login_name").val();
								var passWord = $("#login_password").val();
								$
										.ajax({
											type : 'post',
											url : "LoginAction!login.action",
											data : {
												"userName" : userName,
												"passWord" : passWord,
											},
											dataType : 'text',
											success : function(data, status) {
												if (data == "success") {
													window.location.href = "LoginAction!forward_front.action";
												} else if (data == "not") {
													alert("用户不存在或者密码错误!");
												} else {
													alert("登陆失败!");
												}
											},
											cache : false
										//不缓存
										});//ajax
							});//login_button

			$("#reset_button")
					.click(
							function() {//重置按钮
								$("#checkedPassword_Img")
										.attr(
												"src",
												"${basePath }${pageContext.request.contextPath}/plugin/front_login/images/ichecked.png");
								$("#userName_error")
										.attr(
												"src",
												"${basePath }${pageContext.request.contextPath}/plugin/front_login/images/ichecked.png");
								$("#phone_error").html("");
								$("#email_error").html("");
							});

			$("#register_userName")
					.keyup(
							function() {//验证有无重复用户名			
								$
										.ajax({
											type : 'post',
											url : "RegisterAction!findSameCusName.action",
											data : {
												"customer.userName" : $(
														"#register_userName")
														.val(),
											},
											dataType : 'text',
											success : function(data) {
												if (data == "notsame") {
													$("#userName_error")
															.attr(
																	"src",
																	"${basePath }${pageContext.request.contextPath}/plugin/front_login/images/checked.png");
												} else {
													$("#userName_error")
															.attr(
																	"src",
																	"${basePath }${pageContext.request.contextPath}/plugin/front_login/images/sign-error-icon.png");
												}
											},
											cache : false
										//不缓存
										});//ajax
								$("#userName_error").html("不可用");
							});

			$("#register_password2").keyup(function() {//验证密码
				checkedPassWord();
			});
			$("#register_password2").blur(function() {//验证密码
				checkedPassWord();
			});
			function checkedPassWord() {//验证密码
				var passWord = $("#register_password").val();
				var passWord2 = $("#register_password2").val();
				if (passWord == passWord2) {
					$("#checkedPassword_Img")
							.attr(
									"src",
									"${basePath }${pageContext.request.contextPath}/plugin/front_login/images/checked.png");
				} else {
					$("#checkedPassword_Img")
							.attr(
									"src",
									"${basePath }${pageContext.request.contextPath}/plugin/front_login/images/sign-error-icon.png");
				}
			}

			$("#register_telNumber").change(function() {// 手机格式验证
				var tel = $("#register_telNumber").val();
				if (!tel.match(/^(((13[0-9]{1})|159|153)+\d{8})$/)) {
					$("#phone_error").html("手机格式不正确，请重新填写!");
				} else {
					$("#phone_error").html("");
				}
			});

			$("#register_email")
					.blur(
							function() {//验证邮箱格式
								var mail = $("#register_email").val().trim();
								if (mail !== null) {//判断
									var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
									if (!reg.test(mail)) {
										$("#email_error")
												.html("邮箱格式不正确，请重新填写!");
									} else {
										$("#email_error").html("");
									}
								}
							});

			$("#register_button")
					.click(
							function() {//注册按钮
								if ($("#email_error").html() == ""
										&& $("#phone_error").html() == ""
										&& $("#checkedPassword_Img")
												.attr("src") == "${basePath }${pageContext.request.contextPath}/plugin/front_login/images/checked.png"
										&& $("#userName_error").attr("src") == "${basePath }${pageContext.request.contextPath}/plugin/front_login/images/checked.png"
										&& $("#register_realName").val() != ""
										&& $("#register_telNumber").val() != ""
										&& $("#register_email").val() != "") {

									registerok();//所有信息正确，才注册
								} else {
									alert("请输入正确信息！");
								}
							});//login_button
			function registerok() {//所有信息正确，才注册
				var userName = $("#register_userName").val();
				var passWord = $("#register_password").val();
				var passWord2 = $("#register_password2").val();
				var realName = $("#register_realName").val();
				var telNumber = $("#register_telNumber").val();
				var email = $("#register_email").val();
				$.ajax({
					type : 'post',
					url : "RegisterAction!register.action",
					data : {
						"customer.userName" : userName,
						"customer.loginPassword" : passWord,
						"customer.realName" : realName,
						"customer.telNumber" : telNumber,
						"customer.email" : email,
					},
					dataType : 'text',
					success : function(data) {
						if (data == "success") {
							alert("注册成功啦!请登录！");
							window.location.href = "shopLogin.jsp";
						} else {
							alert("注册失败啦!");
						}
					},
					cache : false
				//不缓存
				});//ajax
			}

		});
	</script>

 --%>
</body>
</html>