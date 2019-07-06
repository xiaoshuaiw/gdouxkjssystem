<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>广东海洋大学学科竞赛账户 - 注册</title>
<meta name="keywords" content="广东海洋大学学科竞赛账户 - 注册">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>
<style type="text/css">
#mydiv {
	background-image: url("img/login-background.jpg");
}
#demo {
	width:350px;
	height:470px;
	border:1px solid #000;
	background-color: white;
}
</style>

</head>

<body id="mydiv">
	<div class="middle-box text-center loginscreen   animated fadeInDown">
		<div>
			<div>

				<p>
					<img src="img/gdou.png">
				<h6 class="logo-name">Gdou</h6>
				</p>

			</div>
			<div id="demo">
			<h3 >欢迎注册 创建一个新账户</h3>
			<form id="adduserform" class="m-t" role="form" action="user.action" method="post">
				<input type="hidden" name="cmd" value="adduser" />
				<div class="form-group">
					<input id="usernameid" type="text" name="username" class="form-control" placeholder="请输入用户名" required=""> <span id="usernamespan" class="help-block m-b-none"></span>
				</div>
				<div class="form-group">
					<input id="passwordid" type="password" name="password" class="form-control" placeholder="请输入密码" required=""> <span id="passwordspan" class="help-block m-b-none"></span>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="请再次输入密码" required=""> <span id="passwordspan" class="help-block m-b-none"></span>
				</div>
				<div class="form-group">
					<input id="realnameid" type="text" name="realname" class="form-control" placeholder="请输入真实姓名" required=""> <span id="realnamespan" class="help-block m-b-none"></span>
				</div>
				<div class="form-group">
					<input id="phoneid" type="text" name="phone" class="form-control" placeholder="请输入手机号码" required=""> <span id="phonespan" class="help-block m-b-none"></span>

				</div>
				<div class="form-group text-left">
					身份: <select name="role">
						<option selected="selected">--请选择--</option>
						<option id="studentid" value="学生">学生</option>
						<option id="teacherid" value="教师">教师</option>
					</select>
				</div>
				<div class="form-group ">
					<div class="checkbox i-checks">
						<label class="no-padding"> <input type="checkbox">我同意注册协议 
						</label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

				<p class="text-muted text-center">
					<small>已经有账户了？</small><a href="login.jsp">点此登录</a>
				</p>

			</form>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<!-- iCheck -->
	<script src="js/plugins/iCheck/icheck.min.js"></script>

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
		function checkUername() {
			var flag = checkForm($("#usernameid"), /^[a-zA-Z_]\w{5,17}$/, $("#usernamespan"), "用户名长度6-18，只能含有字母、数字、下划线且第一位不能是数字", "用户名不能为空", true);
			if (flag) {
				//验证用户名的唯一性
				$.ajax({
					url : "user.action",
					data : {
						cmd : "checkUnameUnique",
						username : $("#usernameid").val()
					},
					async : false,
					dataType : "json",
					success : function(data) {
						if (data.msgId == 1) {
							$("#usernamespan").parent().parent().attr("class", "form-group has-success");
							flag = true;
						} else if (data.msgId == 2) {
							$("#usernamespan").html(data.msgContent);
							$("#usernamespan").parent().parent().attr("class", "form-group has-error");
							flag = false;
						}
					}
				})
			}
			return flag;
		}

		$(function() {
			$("#adduserform").ajaxForm({
				beforeSubmit : function() {
					var unameflag = checkUername();
					var pwdflag = checkForm($("#passwordid"), /^[a-zA-Z_]\w{7,19}$/, $("#passwordspan"), "密码长度8-20，只能含有字母、数字、下划线且第一位不能是数字", "密码不能为空", true);
					var realfalg = checkForm($("#realnameid"), /^[\u4e00-\u9fa5]{2,10}$/, $("#realnamespan"), "真实姓名必须是2-10之间的汉字", "真实姓名不能为空", true);
					var phoneflag = checkForm($("#phoneid"), /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/, $("#phonespan"), "请输入正确的11位手机号", "手机号不能为空", true);
					return unameflag && pwdflag && realfalg && phoneflag;
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
	</ body>
</html>
