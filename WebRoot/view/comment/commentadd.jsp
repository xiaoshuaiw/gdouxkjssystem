<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>发表评论</title>
<script src="js/ajaxutil.js"></script>

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<link href="js/webuploader.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>发表评论</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="form_basic.html#">选项1</a></li>
								<li><a href="form_basic.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<form id="addcommentform" action="comment.action" method="post" class="form-horizontal">
							<input type="hidden" name="cmd" value="addcomment" />

							<div class="form-group">
								<label class="col-sm-2 control-label">评论标题</label>
								<div class="col-sm-9">
									<input id="titileid" type="text" class="form-control" name="titile"> <span id="titilespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛名称</label>
								<div class="col-sm-9">
									<select id="typeid" name="competitionName">
										<option>--请选择--</option>
									</select>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">评论内容</label>
								<div class="col-sm-9">
									<input id="contentid" type="text" class="form-control" name="content">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">评论者</label>
								<div class="col-sm-9">
									<input id="authorid" type="text" class="form-control" name="author">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" type="submit">提交</button>
									&nbsp;
									<button class="btn btn-white" type="reset">重置</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/webuploader.js"></script>

	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>
	<!-- 表单验证插件 -->
	<script src="js/Formvalidate.js"></script>

	<!-- layer.js -->
	<script src="js/plugins/layer/layer.min.js"></script>

	<!-- 引入jQuery Form 插件 -->
	<script src="js/jquery.form.js"></script>
	<script src="js/plugins/layer/laydate/laydate.js"></script>

	<script type="text/javascript">
		window.onload = function() {
			ajax({
				url : "game.action",
				data : "cmd=type",
				handler200 : function(xhr) {
					//将服务器返回的json格式的数组转化为js中真正的数组
					eval("var typeArray = " + xhr.responseText);
					var typeid = document.getElementById("typeid");
					//for循环数组
					for (var i = 0; i < typeArray.length; i++) {
						var opt = document.createElement("option");
						opt.text = typeArray[i].competitionClass;
						typeid.appendChild(opt);
					}

				}
			})
		}
	</script>

	<script type="text/javascript">
		$(function() {
			$("#addcommentform").ajaxForm({
				beforeSubmit : function() {
				},
				dataType : "json",
				clearForm : true,
				success : function(data) {
					if (data.msgId == 1) {
						layer.alert(data.msgContent, {
							icon : 6
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

