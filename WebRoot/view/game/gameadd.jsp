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


<title>添加竞赛信息</title>
<script src="js/ajaxutil.js"></script>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
						<h5>竞赛添加</h5>
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
						<form id="addgameform" action="game.action" method="post" class="form-horizontal">
							<input type="hidden" name="cmd" value="addgame" />

							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛名称</label>
								<div class="col-sm-9">
									<input id="competitionNameid" type="text" class="form-control" name="competitionName"> <span id="competitionspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛类别</label>
								<div class="col-sm-9">
									<select id="typeid" name="competitionClass">
										<option>--请选择--</option>
									</select>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛内容</label>
								<div class="col-sm-9">
									<textarea id="introductionid" type="text" class="form-control" name="introduction" rows="3"></textarea>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛要求</label>
								<div class="col-sm-9">
									<textarea id="demandid" class="form-control" name="demand" rows="3"></textarea>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">时间要求</label>
								<div class="col-sm-9">
									<input id="timeid" type="text" class="form-control" name="time">
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主办单位</label>
								<div class="col-sm-9">
									<input id="hostunitid" type="text" class="form-control" name="hostunit">
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
			$("#addgameform").ajaxForm({
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

