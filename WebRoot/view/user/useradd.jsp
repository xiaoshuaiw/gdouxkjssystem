<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 基本表单</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>添加用户账户</h5>
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
						<form id="adduserform" action="user.action" method="post" class="form-horizontal">
							<input type="hidden" name="cmd" value="adduser" />

							<div class="form-group">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-9">
									<input id="usernameid" type="text" class="form-control" name="username"> <span id="usernamespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">密码</label>
								<div class="col-sm-9">
									<input id="passwordid" type="password" class="form-control" name="password"> <span id="passwordspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">真实姓名</label>
								<div class="col-sm-9">
									<input id="realnameid" type="text" class="form-control" name="realname"> <span id="realnamespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">电话号码</label>
								<div class="col-sm-9">
									<input id="phoneid" type="text" name="phone" class="form-control" required=""> <span id="phonespan" class="help-block m-b-none"></span>
								</div>
							</div>
								<div class="hr-line-dashed"></div>
								<div class="form-group">
								<label class="col-sm-2 control-label">用户身份:</label>
									 <select name="role">
										<option selected="selected">--请选择--</option>
										<option id="adminid" value="管理员">管理员</option>
										<option id="studentid" value="学生">学生</option>
										<option id="teacherid" value="教师">教师</option>
									</select>
								</div>
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
					var realflag = checkForm($("#realnameid"), /^[\u4e00-\u9fa5]{2,10}$/, $("#realnamespan"), "真实姓名必须是2-10之间的汉字", "真实姓名不能为空", true);
					return unameflag && pwdflag && realflag;
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
