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
						<h5>用户修改</h5>
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
						<form id="edituserform" action="user.action" method="post" class="form-horizontal">
							<input type="hidden" name="cmd" value="edituserafter" />
							<input type="hidden" name="id" value="${user.id}" />
							<div class="form-group">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-9">
									<input id="userNameid" type="text" class="form-control" name="userName" value="${user.userName}"> <span id="usernamespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">密码</label>
								<div class="col-sm-9">
									<input id="passwordid" type="password" class="form-control" name="password" value="${user.password}"> <span id="passwordspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">真实姓名</label>
								<div class="col-sm-9">
									<input id="realNameid" type="text" class="form-control" name="realName" value="${user.realName }"> <span id="realnamespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-9">
									<input id="phoneid" type="text" class="form-control" name="phone" value="${user.phone }"> <span id="phonespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">用户身份</label>
								<div class="col-sm-9">
									<input id="roleid" type="text" class="form-control" name="role" value="${user.role }"> <span id="emailspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
									<button class="btn btn-primary" type="submit">用户修改</button>
									&nbsp;
									<button class="btn btn-white" type="reset">重置表单</button>
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

	<script type="text/javascript">
		/* function checkUername() {
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
							$("#usernamespan").parent().parent().attr("class","form-group has-success");
							flag = true;
						} else if (data.msgId == 2) {
							$("#usernamespan").html(data.msgContent);
							$("#usernamespan").parent().parent().attr("class","form-group has-error");
							flag = false;
						}
					}
				})
			}
			return flag;
		}
 		*/
		$(function() {
			$("#edituserform").ajaxForm({
				beforeSubmit : function() {
					/* var unameflag = checkUername();
					var pwdflag = checkForm($("#passwordid"), /^[a-zA-Z_]\w{7,19}$/, $("#passwordspan"), "密码长度8-20，只能含有字母、数字、下划线且第一位不能是数字", "密码不能为空", true);
					var realfalg = checkForm($("#realnameid"), /^[\u4e00-\u9fa5]{2,10}$/, $("#realnamespan"), "真实姓名必须是2-10之间的汉字", "真实姓名不能为空", true);
					var phoneflag = checkForm($("#phoneid"), /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/, $("#phonespan"), "请输入正确的11位手机号", "手机号不能为空", true);
					var emailflag = checkForm($("#emailid"), /^\w{6,18}@\w{2,10}(\.\w{2,3}){1,3}$/, $("#emailspan"), "请输入正确的邮箱", "邮箱不能为空", true);
					var qqflag = checkForm($("#qqid"), /^[1-9][0-9]{4,10}$/, $("#qqspan"), "请输入正确的qq号码", "qq不能为空", false);
					return unameflag && pwdflag && realfalg && phoneflag && emailflag && qqflag; */
					return true;
				},
				dataType : "json",
				clearForm : true,
				success : function(data) {
					if (data.msgId == 1) {
						layer.alert(data.msgContent,{
							icon:6,
							time:3500,
							end:function(){
								var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
								parent.refreshSelf();
								parent.layer.close(index);
							}
						})
					} else if (data.msgId == 2) {
						layer.alert(data.msgContent,{icon:5})
					}
				}
			})
		})
	</script>
</body>
</html>
