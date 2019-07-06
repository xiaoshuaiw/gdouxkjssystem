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
<title>竞赛类添加</title> 
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body>

	<div class="ibox-content">
		<form id="addtypeform" action="game.action" method="post" class="form-horizontal">
			<input type="hidden" name="cmd" value="typeadd" /> <input type="hidden" name="id" value="${user.id}" />
			<div class="form-group">
				<label class="col-sm-2 control-label">竞赛类别</label>
				<div class="col-sm-9">
					<input id="competitionClassid" type="text" class="form-control" name="competitionClass">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-2">
					<button class="btn btn-primary" type="submit">确认</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>
	<!-- 表单验证插件 -->
	<script src="js/Formvalidate.js"></script>

	<!-- layer.js -->
	<script src="js/plugins/layer/layer.min.js"></script>

	<!-- 引入jQuery Form 插件 -->
	<script src="js/jquery.form.js"></script>

	<script type="text/javascript">
		
		
		$(function() {
			$("#addtypeform").ajaxForm({
				beforeSubmit : function() {
					return true;
				},
				dataType : "json",
				clearForm : true,
				success : function(data) {
					if (data.msgId == 1) {
						layer.alert(data.msgContent, {
							icon : 6,
							time : 3500,
							end : function() {
								var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
								parent.layer.close(index);
							}
						})
					} else if (data.msgId == 2) {
						layer.alert(data.msgContent, {
							icon : 5
						})
					}
				}
			})
		})
	</script>
</body>
</html>
