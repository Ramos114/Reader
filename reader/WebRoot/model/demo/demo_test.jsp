<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'demo_test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- 导入需要的分页样式 -->
<link rel="stylesheet" type="text/css" href="././css/pagination.css" />
<!-- 导入jquery -->
<script type="text/javascript" src="././js/jquery2.js"></script>
<!-- 导入分页插件的js -->
<script type="text/javascript" src="././js/jquery.pagination.js"></script>
</head>
<script type="text/javascript">
	// 点击分页按钮以后触发的动作
	function handlePaginationClick(new_page_index, pagination_container) {
		location.href = "DemoAction!find.action?pageNum="
				+ (new_page_index + 1) + "";
		return false;
	}

	$(function() {//根据后台保存在session中的demop获得分页信息
		$("#News-Pagination").pagination(${demop.totalRecords}, {//总记录数
			items_per_page : ${demop.pageSize}, // 每页显示多少条记录
			current_page : ${demop.currentPage} - 1, // 当前显示第几页数据
			num_display_entries : 4, // 分页显示的条目数
			next_text : "下一页",
			prev_text : "上一页",
			num_edge_entries : 2, // 连接分页主体，显示的条目数
			callback : handlePaginationClick//回调,执行上面的函数
		});

	});
</script>
<body>
	<table>
		<thead>
			<tr>
		
				<th>名称</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>
		</thead>
		<!-- 通过jstl进行遍历，显示封装在PageModel<T> result中的数据 -->
		<c:forEach items="${demop.result}" var="demo">
				<tr>
					
					<td><c:out value="${demo.demo_name}" /><br /></td>
					<td>编辑</td>
					<td>删除</td>
				</tr>
			</c:forEach>
	</table>
	<!-- 该出为分页插件的显示 div,id要与 javascript上要引用的一致 -->
	<div id="News-Pagination" style="float: right;margin-right: 80px"></div>
</body>
</html>
