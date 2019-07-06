<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>广东海洋大学学科竞赛列表</title>
<meta name="keywords" content="广东海洋大学,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight blog">
		<c:forEach items="${gamelist}" var="game">
			<div class="col-sm-6 clearfix">
				<div class="ibox">
					<div class="ibox-content">
						<a href="javascript:void(0);" onclick="gameGet(${game.gameid},this);" class="btn-link">
							<h2>${game.competitionName}</h2>
						</a>
						<div class="small m-b-xs">
							<strong>${game.hostunit}</strong> <span class="text-muted"><i class="fa fa-clock-o"></i>${game.time}</span>
						</div>
						<p>${game.introduction}</p>
						<div class="row">
							<div class="col-md-6">
								<h5>标签：</h5>
								<button class="btn btn-primary btn-xs" type="button">${game.competitionClass}</button>
							</div>
							<div class="col-md-6">
								<div class="small text-right">
									<h5>状态：</h5>
									<div>
										<i class="fa fa-comments-o"> </i> 56 评论
									</div>
									<i class="fa fa-eye"> </i> 144 浏览
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>

	<script src="js/plugins/layer/layer.min.js"></script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>
	
	<script type="text/javascript">
		function gameGet(gameid){
			window.location.href = "game.action?cmd=getCompetition&gameid="+ gameid;
		}
	
	
	</script>
</body>

</html>
