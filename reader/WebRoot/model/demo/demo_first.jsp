<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'demo_first.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<script type="text/javascript" src="././js/jquery2.js"></script>
<script type="text/javascript">
</script>
<body>
	<a href="<%=basePath%>DemoAction!find.action">查询</a>
	
	<form action="UploadFileAction!upload.action" enctype="multipart/form-data" method="post">
		<input type="file" name="upload"/>
		<input type="submit" value="上传"/>
	</form>
	<div id="d">ggg</div>
	<iframe name="f" width="100px" height="100px"></iframe>
</body>
</html>
