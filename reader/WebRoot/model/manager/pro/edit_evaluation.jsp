<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<title>修改大类别信息</title>
<div class="bg-light lter b-b wrapper-md">
	<h1 class="m-n font-thin h3">商品评价管理</h1>
	<label id="bgc_id" hidden="hidden" >${session.bgc_info.id }</label>
  <label id="createDate" hidden="hidden">${session.bgc_info.createDate }</label>
  <label id="createName" hidden="hidden">${session.bgc_info.createName }</label>
  <label id="optLock" hidden="hidden">${session.bgc_info.optLock }</label>
</div>
<div class="panel panel-default">
	<div class="panel-heading font-bold">商品评价详情</div>
	<div class="panel-body">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<p class="text-muted">商品评价信息</p>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">评价编号</label>
						<label class="col-sm-3 control-label">${session.vel_info.id}</label>
						
						<label class="col-sm-2 control-label">评价时间</label>
						<label class="col-sm-3 control-label">${session.vel_info.cedate}</label>
						
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">商品编号</label>
						<label class="col-sm-3 control-label">${session.vel_info.product.proNo}</label>
						
						<label class="col-sm-2 control-label">商品名称</label>
						<label class="col-sm-3 control-label">${session.vel_info.product.proName}</label>
						
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label">会员名</label>
						<label class="col-sm-3 control-label">${session.vel_info.customer.userName}</label>
						
						<label class="col-sm-2 control-label">订单号</label>
						<label class="col-sm-3 control-label">${session.vel_info.orderId.id}</label>
					</div>
					<div class="line line-dashed b-b line-lg pull-in"></div>
					<div class="form-group">
						<label>评价内容</label>
						<textarea class="form-control" rows="6"  disabled="true "
							id="bgcContent"  >${session.vel_info.content}</textarea>
					</div>
					
				</div>
				<footer class="panel-footer text-center bg-light lter">
					<button class="btn btn-success"
						onclick="toSkit('${basePath }${pageContext.request.contextPath}/model/manager/pro/evaluationManage.jsp')">
						确定</button>
				</footer>
			</div>

		</div>
	</div>

</div>
