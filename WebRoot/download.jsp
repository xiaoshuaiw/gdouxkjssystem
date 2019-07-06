<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>竞赛表格下载界面</title>
</head>
<body>
	<img src="img/form.jpg" width="500px" height="500px" />
	<br />
	<button onclick="getForm();">下载该表格</button>
	
	<script type="text/javascript">
		function getForm(){
			window.location.href = "down.action";
		}
	</script>
</body>
</html>
