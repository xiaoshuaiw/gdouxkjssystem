<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'upload.jsp' starting page</title>
</head>

<body>
<!-- 想要上传文件给服务器，需要设定method及enctype
	1、method = "post"
	2、enctype = "multipart/form-data"
 -->
<form action="up.action" method="post" enctype="multipart/form-data">
	<input type="file" name="filename">
	<input type="text" name="username" placeholder="上传人">
	<button type="submit">提交</button>
</form>
</body>
</html>
