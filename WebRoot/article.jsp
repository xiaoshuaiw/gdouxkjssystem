<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 文章页面</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight article">
		<div class="row">
			<div class="col-lg-10 col-lg-offset-1">
				<div class="ibox">
					<c:set var="length" value="${fn:length(websiteList)}"></c:set>
					<div class="ibox-content">
						<div class="pull-right">
							<button class="btn btn-white btn-xs" type="button">${game.competitionClass}</button>
						</div>
						<div class="text-center article-title">
							<h1>${game.competitionName}</h1>
						</div>
						<p>${game.introduction}</p>
						<p>${game.demand}</p>
						<p>${game.time}</p>
						<p>${game.hostunit}</p>
						<hr>
						<div class="col-sm-4 col-sm-offset-2">
							<a class="btn btn-primary" href="view/competition/competitionadd.jsp">我要报名</a> &nbsp;
							<button class="btn btn-primary" onclick="">查看参赛队伍</button>
						</div>
						<div class="row">
							<div class="col-lg-12">

								<h2>评论：</h2>
								<c:forEach items="${commentList}" var="comment">
									<div class="social-feed-box">
										<div class="social-avatar">
											<a href="" class="pull-left"> <img alt="image" src="img/a1.jpg">
											</a>
											<div class="media-body">
												<a href="#"> ${comment.author} </a> <small class="text-muted">${comment.updatetime}</small>
											</div>
										</div>
										<div class="social-body">
											<p>${comment.content}</p>
										</div>
									</div>
								</c:forEach>
								<div class="row" style="border-top: thick;border-top-style: solid;border-top-color: #43CD80">
									<textarea id="textarea" class="form-control" rows="8" placeholder="请在这里输入。。。。" style="margin-top: 10px color: #43CD80"></textarea>
									<button onclick="submit(this);">发表评论</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 全局js -->
		<script src="js/jquery.min.js?v=2.1.4"></script>
		<script src="js/bootstrap.min.js?v=3.3.6"></script>
		<script src="js/plugins/layer/layer.min.js"></script>

		<!-- 自定义js -->
		<script src="js/content.js?v=1.0.0"></script>

		<script type="text/javascript">
			function submit(ele) {
				var content = $("#textarea").val();
				$.ajax({
					url : "comment.action",
					data : {
						cmd : "addComment",
						contentVal : content,
						gameid : ${game.gameid}
					},
					dataType : "json",
					success : function(data) {
						if (data.msgId == 1) {
							location.href = "game.action?cmd=getCompetition&gameid=${game.gameid}";
						} else if (data.msgId == 2) {
							layer.alert(data.msgContent, {
								icon : 5
							});
						}
					}
				})
			}
		</script>
</body>



</html>