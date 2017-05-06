<%@ page language="java" pageEncoding="UTF-8"%>
<style>
table td{white-space:nowrap;overflow:hidden; text-overflow:ellipsis;}
table th{white-space:nowrap;overflow:hidden; text-overflow:ellipsis;}
table {table-layout:fixed;}
</style>

<title>大类别管理</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">大类别管理</h1>
</div>
<div class="wrapper-md" id="app">
	<div class="panel panel-default">
		<div class="panel-heading">类别列表   !!!!=1={{dataObj.result[0].bgcName}}=2={{dataObj.result[1].bgcName}}!!!</div>
		<div class="row wrapper">
			<div class="col-sm-5 m-b-xs">
				<button class="btn btn-sm btn-primary btn-addon" onclick="addbgc()">
					<i class="fa fa-plus"></i>添加
				</button>
			</div>
			<div class="col-sm-3"></div>
			<div class="col-sm-4">
				<div class="input-group">
					<input type="text" id="bgcName" class="input-sm form-control"
						placeholder="请输入类别名称"> 
					<span class="input-group-btn">
							<button class="btn btn-sm btn-icon btn-success" id="findbybgcName" title="查询">
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
						<th style="width:15%">大类别编号</th>
						<th style="width:20%">大类别名称</th>
						<th style="width:20%">类别说明</th>
						<th style="width:20%">类别副说明</th>
						<th style="width:15%">类别图片</th>
						<th style="width:15%">操作</th>
					</tr>
				</thead>

				<tbody id="tableTbody">

					<tr v-for="item in dataObj.result">
	
						<td title="{{item.bgcId}}">{{item.bgcId}}</td>
						<td>{{item.bgcName}}</td>
						<td title="{{item.bgcContent}}">{{item.bgcContent}}</td>
						<td title="{{item.bgcRcontent}}">{{item.bgcRcontent}}</td>

						<td>
							<a class=' pull-left thumbnail'> 
								<img src="${basePath }${pageContext.request.contextPath}{{item.bgcImgUrl}}" onclick="showBigImg('{{item.bgcImgUrl}}')">
							</a>
						</td>

						<td> 
						<div style="white-space:normal; overflow:visible;">
							<button class='btn btn-sm btn-icon btn-info' title="修改大类" onclick="toSkit('CategoryAction!edit_ui.action?bigcategory.id='+ data.id)">
								<i class='glyphicon glyphicon-pencil'></i></button>
							<button class='btn btn-sm btn-icon btn-danger' title="删除"  onclick="delbgc('CategoryAction!bgcDel.action?bid='+data.id)">
								<i class='glyphicon glyphicon-trash'></i></button>
						</div>
						</td>
								
					</tr>

				</tbody> 
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

		<!--放大图的imgModal-->
        <div class="modal fade bs-example-modal-lg text-center" id="imgModal"tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
          <div class="modal-dialog modal-lg" style="display: inline-block; width: auto;">
            <div class="modal-content">
             <img  id="imgInModalID" src="" >
            </div>
          </div>
        </div>
        
<script type="text/javascript">
	//Vue框架--用于客户端渲染数据
	var vm;
	vm = new Vue({
            el: '#app',
            data: {
                dataObj: {},
            }
    });
	
	doRequest(1);

	//ajax请求table数据
	function doRequest(currentPage) {	
		$.ajax({
					type : 'post',
					url : "${basePath}${pageContext.request.contextPath}/CategoryAction!findPageBigCategory.action",
					data : {
						"page" : currentPage,
						"rows" : $("#page_everySize").val(),
						"bgcName" : $("#bgcName").val(),
					},
					dataType : 'json',
					success : function(data, status) {
						if (status == "success") {

							if (data.status == "success") {
							
							//Vue响应式渲染数据--数据写入table
							vm.$set("dataObj", data);
                			//动态生成查询table
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
		/* 		//先移除表格中的数据
		 $("#tableTbody>tr").remove(); */
		//移除页码
		$(".pagination>li").not(":first").not(":last").remove();

		//添加数据到表格
		//addDataToTable(data);

		//设置好页码信息
		$("#page_showPageSize").html("显示" + data.page + "-" + data.total + "页");
		$("#page_showPageNum").html("共" + data.rows + "条记录");

		//判断是否有数据
		if (data.result.length == 0) {
			$("#tableTbody")
					.append(
							"<tr class=\"odd\"><td valign=\"top\" colspan=\"8\" class=\"dataTables_empty\">暂无数据</td></td>");
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

	//显示封面大图
	function showBigImg(imgUrl) {
		//alert(imgUrl);
		//var imgUrl = $(this)[0].src;
		//alert(imgUrl);
		$('#imgInModalID').attr("src","${basePath}${pageContext.request.contextPath}" + imgUrl);
		$('#imgModal').modal('show');
	}

	/*分页方法*/
	$("#page_everySize").change(function() { //点击改变设置页码记录数
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

	//大类别名称模糊查询
	$("#findbybgcName").click(function() { //点击按钮进行模糊查询
		doRequest(1);
	});

	//跳转添加大类页面
	function addbgc() {
		toSkit("${basePath }${pageContext.request.contextPath}/model/manager/book/bigCategoryAdd.jsp");
	}

	//删除小类
	function delbgc(url) {

		var msg = "该大类可能包含小类，将会一并删除\n确定继续此操作？";
		if (confirm(msg) == true) {
			$.ajax({
				type : 'post',
				url : url,
				success : function(status) {
					if (status == "bgcdel_success") {
						if ($("#bgcName").val() == null || $("#bgcName").val().length == 0) {
							doRequest(1);
						} else {
							findbybgcName(1, $("#bgcName").val());

						}

						layer.msg("恭喜，大类删除成功！", {
							icon : 1
						});
					} else {
						alert("删除失败,ajax请求返回失败!");
						addNullMessage();
					}
				},
				cache : false
			//不缓存
			});

		} else {
			return false;
		}

	}
</script>
