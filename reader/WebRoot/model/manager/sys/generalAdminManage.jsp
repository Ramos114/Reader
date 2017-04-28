<%@ page language="java" pageEncoding="UTF-8"%>

<title>普通管理员管理</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">普通管理员管理</h1>
</div>
<div class="wrapper-md">
	<div class="panel panel-default">
		<div class="panel-heading">普通管理员</div>
		<div class="row wrapper">
			<div class="col-sm-5 m-b-xs">
				<small class="text-muted inline m-t-sm m-b-sm">性别：</small>
				<select id="sex_sele" class="input-sm form-control w-xxss inline v-middle">
					<option value="all">全部</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
				<button class="btn btn-sm btn-primary btn-addon" onclick="toSkit('${basePath }${pageContext.request.contextPath}/GeneralAdminManageAction!role_list.action')">
					<i class="fa fa-plus"></i>添加
				</button>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-3">
				<div class="input-group">
					<input id="keyWord" type="text" class="input-sm form-control"
						placeholder="请输入内容"> <span class="input-group-btn">
						<button id="searchKey" class="btn btn-sm btn-icon btn-success">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</span>
				</div>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-striped b-t b-light">
				<thead>
					<tr>
						<!-- <th style="width:20px;"><label class="i-checks m-b-none">
								<input type="checkbox"><i></i>
						</label></th> -->
						<th style="width:10%">姓名</th>
						<th style="width:10%">真实姓名</th>
						<th style="width:10%">性别</th>
						<th style="width:10%">角色</th>
						<th style="width:14%">身份证号</th>
						<th style="width:13%">电话</th>
						<th style="width:13%">邮箱</th>
						<th style="width:10%">状态</th>
						<th style="width:10%" class="text-info">操作</th>						
					</tr>
				</thead>

				<tbody id="tableTbody"></tbody>
			</table>
		</div>
		<footer class="panel-footer">
			<div class="row">
				<div class="col-sm-4 hidden-xs">
					<small class="text-muted inline m-t-sm m-b-sm">每页显示：</small> <select
						id="page_everySize"
						class="input-sm form-control w-xxss inline v-middle">
						<option value="10">10</option>
						<option value="25">25</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</div>

				<div class="col-sm-4 text-center">
					<small id="page_showPageSize"
						class="text-muted inline m-t-sm m-b-sm"></small>&nbsp;&nbsp; <small
						id="page_showPageNum" class="text-muted inline m-t-sm m-b-sm"></small>
				</div>
				<div class="col-sm-4 text-right text-center-xs">
					<ul
						class="pagination-sm m-t-none m-b pagination ng-isolate-scope ng-valid ng-dirty ng-valid-parse">
						<!-- ngIf: boundaryLinks <li ng-if="boundaryLinks" ng-class="{disabled: noPrevious()}" class="ng-scope"><a ng-click="selectPage(1)" class="ng-binding">首页</a></li> end ngIf: boundaryLinks -->
						<li id="sample-table-previous" class="ng-scope "><a
							onclick="selectPrevious()" class="ng-binding">上一页</a></li>

						<li id="sample-table-next" class="ng-scope"><a
							onclick="selectNext()" class="ng-binding">下一页</a></li>

						<!-- ngIf: boundaryLinks <li ng-if="boundaryLinks" ng-class="{disabled: noNext()}" class="ng-scope"><a ng-click="selectPage(totalPages)" class="ng-binding">尾页</a></li> end ngIf: boundaryLinks -->
					</ul>
				</div>
			</div>
		</footer>
	</div>
</div>

<script type="text/javascript">
	doRequest(1);
	//全选功能
	$(document).on(
			'click',
			'th input:checkbox',
			function() {
				var that = this;
				$(this).closest('table').find(
						'tr > td:first-child input:checkbox').each(function() {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});

	/*分页方法*/
	$("#page_everySize").change(function() { //点击改变设置页码记录数
		doRequest(1);
	});
	
	
	//性别选择绑定
	$("#sex_sele").change(function(){
		doRequest(1);
	});
	
	
	//查询姓名
	$("#searchKey").click(function(){
		doRequest(1);
	});

	//点击页码
	function clickPage(currentPage) {
		doRequest(currentPage);
	}

	//点击上一页
	function selectPrevious() {
		if ($("#sample-table-previous").hasClass("disabled")) {
			return false;
		}
		//查询当前页
		$(".pagination").find("li").each(function() {
			if ($(this).hasClass("active")) {
				doRequest(window.parseInt($(this).children("a").html()) - 1);
			}
		});
	}
	

	//点击下一页	
	function selectNext() {
		if ($("#sample-table-next").hasClass("disabled")) {
			return false;
		}
		//查询当前页
		$(".pagination").find("li").each(function() {
			if ($(this).hasClass("active")) {
				doRequest(window.parseInt($(this).children("a").html()) + 1);
			}
		});
	}

	//ajax请求table数据
	function doRequest(currentPage) {
		$
				.ajax({
					type : 'post',
					url : "${basePath}${pageContext.request.contextPath}/GeneralAdminManageAction!findPageGeneralAdmin.action",
					data : {
						"page" : currentPage,
						"rows" : $("#page_everySize").val(),
						"keyWord":$("#keyWord").val(),
						"sex_sele":$("#sex_sele").val(),
					},
					dataType : 'json',
					success : function(data, status) {
						if (status == "success") {

							if (data.status == "success") {
								setDataTable(data);
							} else {
								alert("查询失败,编码的错误!");
								addNullMessage();
							}

						} else {
							alert("查询失败,ajax请求返回失败!");
							addNullMessage();
						}
					},
					cache : false
				//不缓存
				});
	}

	//加入无数据div
	function addNullMessage() {
		$("#tableTbody")
				.append(
						"<tr class=\"odd\"><td valign=\"top\" colspan=\"8\" class=\"dataTables_empty\">暂无数据</td></td>");
	}

	//动态生成查询table
	function setDataTable(data) {
		//页码开始
		var begin = 0;
		//页码结束
		var end = 0;
		//先移除表格中的数据
		$("#tableTbody>tr").remove();
		//移除页码
		$(".pagination>li").not(":first").not(":last").remove();

		//组装数据
		for (var i = 0; i < data.result.length; i++) {
/* 			if (data.result[i].id == null) {
				data.result[i].id = "";
			}
			if (data.result[i].generalNo == null) {
				data.result[i].generalNo = "";
			}
			if (data.result[i].userName == null) {
				data.result[i].userName = "";
			}
			if (data.result[i].passWord == null) {
				data.result[i].passWord = "";
			} */
			//添加数据进表格
			addDataToTable(data.result[i]);
		}

		//设置好页码信息
		$("#page_showPageSize").html("显示" + data.page + "-" + data.total + "页");
		$("#page_showPageNum").html("共" + data.rows + "条记录");

		//判断是否有数据
		if (data.result.length == 0) {
			addNullMessage();
		}

		//计算分页
		//总页数小于7，全部显示。
		if (data.total < 7) {
			begin = 1;
			end = data.total;
		} else {
			begin = data.page - 3;
			end = data.page + 3;
			//头溢出
			if (begin < 1) {
				begin = 1;
				end = 7;
			}
			//尾溢出
			if (end > data.total) {
				begin = data.total - 6;
				end = data.total;
			}
		} //else

		//添加页码
		for (var i = end; begin <= i; i--) {
			if (data.page == i) {
				$("#sample-table-previous").after(
						"<li class=\"ng-scope active\"><a onclick=\"clickPage("
								+ i + ")\" class=\"ng-binding\">" + i
								+ "</a></li>");
			} else {
				$("#sample-table-previous")
						.after(
								"<li class=\"ng-scope\"><a onclick=\"clickPage("
										+ i + ")\" class=\"ng-binding\">" + i
										+ "</a></li>");
			}
		}

		begin = 0;
		end = 0;

		//当前页为第一页时，上一页不可用
		if (data.page == 1) {
			$("#sample-table-previous").addClass("disabled");
		} else {
			$("#sample-table-previous").removeClass("disabled");
		}
		//当前页为最后一页时，下一页不可用
		if (data.page == data.total) {
			$("#sample-table-next").addClass("disabled");
		} else {
			$("#sample-table-next").removeClass("disabled");
		}
	}

	//数据写入table
	function addDataToTable(data) {
		$("#tableTbody")
				.append(
						"<tr>"
							/* 	+ "<td><label class=\"i-checks m-b-none\">"
								+ "<input type=\"checkbox\" value="+data.id+"><i></i></label>"
								+ "</td>"  */
								+ "<td>" + data.userName + "</td>"
								/* + "<td>" + data.passWord + "</td>" */
								+ "<td>" + data.realName + "</td>"
								+ "<td>" + data.gender + "</td>"
								+ "<td>" + data.role.roleName + "</td>"
								+ "<td>" + data.idCard + "</td>"
								+ "<td>" + data.telNumber + "</td>"
								+ "<td>" + data.email + "</td>"
								+ "<td>" + data.status + "</td>"
								+ "<td><div style='white-space:normal; overflow:visible;'>"
                              /*   + "<button class='btn btn-sm btn-icon btn-primary' onclick='toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/productDetails.jsp')'>" */
                                /* + "<i class='fa fa-list'></i></button>" */
                                + "<button class='btn btn-sm btn-icon btn-info' onclick='toSkit(\"GeneralAdminManageAction!edit_ui.action?generalAdmin.id="+data.id+"\");'><i class='glyphicon glyphicon-pencil'></i></button>"                                
                                + "&nbsp;<button class='btn btn-sm btn-icon btn-danger' onclick='toSkit(\"GeneralAdminManageAction!deleteGA.action?generalAdmin.id="+data.id+"&generalAdmin.optLock="+data.optLock+"\");'><i class='glyphicon glyphicon-trash'></i></button>"
                                + "</div></td>"                                 
								+ "</tr>");
	}
</script>
