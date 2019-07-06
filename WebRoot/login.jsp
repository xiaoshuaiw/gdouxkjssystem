<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<base href="<%=basePath%>">
<title>广东海洋大学学科竞赛网站 登录</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>
<style>
#demo {
	width: 318px;
	height: 450px;
	border: 1px solid #000;
	background-color: white;
}

.iradio_square-green.checked {
	background-position: -168px 0;
}

@media not all , ( -webkit-min-device-pixel-ratio : 1.25) , ( min-resolution :
		120dpi) .icheckbox_square-green , . iradio_square-green {
	background-image
	:
	 
	url
	(green@2x
	.png
	);
	
    
	-webkit-background-size
	:
	 
	240
	px
	 
	24
	px
	;
	
    
	background-size
	:
	 
	240
	px
	 
	24
	px
	;
	

}

.iradio_square-green {
	background-position: -120px 0;
}
</style>
</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<p class="login-collage">
			<div class="col-sm-3">
				<img id="school_logo" src="img/gdou.png"> <span id="school_name" class="login-collage">广东海洋大学</span>
			</div>
			</p>
			<div class="col-sm-9">
				<p class="login-paper" id="xtmc">广东海洋大学学科竞赛管理系统</p>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-7">
				<div class="signin-info">
					<div class="logopanel m-b">
						<h1>欢迎使用</h1>
					</div>
					<div class="m-b"></div>
					<h4>
						广东海洋大学 <strong>学科竞赛系统系统</strong>
					</h4>
					<ul class="m-b">
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四</li>
						<li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五</li>
					</ul>
					<strong>还没有账号？ <a href="register.jsp">立即注册&raquo;</a></strong>
				</div>
			</div>
			<div class="col-sm-5" id="demo">
				<h4 class="no-margins">登录：</h4>
				<p class="m-t-md">登录到广东海洋大学学科竞赛主页</p>
				<div class="form-group has-error">
					<label class="control-label" for="inputError1" id="inputErrorid">欢迎使用本系统！</label>
				</div>
				<input id="usernameid" name="userename" type="text" class="form-control uname" placeholder="用户名" />
				<div class="form-group has-error">
					<label class="control-label" id="usernamelabel"></label>
				</div>
				<input id="passwordid" name="password" type="password" class="form-control pword" placeholder="密码" />
				<div class="form-group has-error">
					<label class="control-label" id="passwordlabel"></label>
				</div>
				<select id="roleid" name="role" class="form-control uname" >
					<option selected="selected">--请选择身份--</option>
					<option  value="管理员">管理员</option>
					<option  value="学生">学生</option>
					<option  value="教师">教师</option>
				</select>
				<input id="verifycodeid" name="verifycode" style="color: black;" type="text" maxlength="4" class="form-control  code	" width="50%" placeholder="验证码" />
				<div class="form-group has-error">
					<label class="control-label" id="verifycodelabel"></label>
				</div>
				<span><img src="image.jsp" id="verId"></span> <a href="javascript:void(0)" id="verId2">看不清？点击图片更换</a> <a href="">忘记密码了？</a>
				<button id="btnid" class="btn btn-success btn-block" type="submit">登录</button>
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">&copy; 2018 All Rights Reserved. SXT</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>

	<script type="text/javascript">
		//页面加载完成给图片绑定点击事件
		$(function() {
			$("#verId,#verId2").click(function() {
				//如何重新得到一张图片
				$("#verId").attr("src", "image.jsp?date=" + new Date());
			})

			$("#btnid").click(function() {
				login();
			})
		})

		function login() {
			//每次登录之前，清空提示框中的信息
			$("#usernamelabel").text("");
			$("#passwordlabel").text("");
			$("#verifycodelabel").text("");

			//发送ajax之前需要获取用户输入的值
			var uname = $("#usernameid").val();
			var pword = $("#passwordid").val();
			var vcode = $("#verifycodeid").val();
			var role = $("#roleid").val();

			//设定三个bool值用于控制用户是否输入了三个input框
			var unameflag = true;
			var pwordflag = true;
			var vcodeflag = true;

			//发送ajax之前先判断用户是否输入三个值
			if (uname.length == 0) {
				$("#usernamelabel").text("用户名不能为空");
				unameflag = false;
			}
			if (pword.length == 0) {
				$("#passwordlabel").text("密码不能为空");
				pwordflag = false;
			}
			if (vcode.length == 0) {
				$("#verifycodelabel").text("验证码不能为空");
				vcodeflag = false;
			}
			if(role == "管理员"){
				if (unameflag && pwordflag && vcodeflag) {
					$.ajax({
						url : "user.action",
						type : "post",
						dataType : "json",
						data : {
							cmd : "login",
							username : uname,
							password : pword,
							verifycode : vcode
						},
						success : function(data) {
							if (data.msgId == 1) {
								//跳转到主页
								window.location.href = "index.jsp";
							} else if (data.msgId == 2) {
								$("#passwordlabel").text(data.msgContent)
							} else if (data.msgId == 3) {
								$("#verifycodelabel").text(data.msgContent)
							}
						}
					})
				}
		}else if(role == "教师"){
			if (unameflag && pwordflag && vcodeflag) {
					$.ajax({
						url : "user.action",
						type : "post",
						dataType : "json",
						data : {
							cmd : "login",
							username : uname,
							password : pword,
							verifycode : vcode
						},
						success : function(data) {
							if (data.msgId == 1) {
								//跳转到主页
								window.location.href = "index_teacher.jsp";
							} else if (data.msgId == 2) {
								$("#passwordlabel").text(data.msgContent)
							} else if (data.msgId == 3) {
								$("#verifycodelabel").text(data.msgContent)
							}
						}
					})
				}
			}else if(role == "学生"){
				if (unameflag && pwordflag && vcodeflag) {
					$.ajax({
						url : "user.action",
						type : "post",
						dataType : "json",
						data : {
							cmd : "login",
							username : uname,
							password : pword,
							verifycode : vcode
						},
						success : function(data) {
							if (data.msgId == 1) {
								//跳转到主页
								window.location.href = "index_student.jsp";
							} else if (data.msgId == 2) {
								$("#passwordlabel").text(data.msgContent)
							} else if (data.msgId == 3) {
								$("#verifycodelabel").text(data.msgContent)
							}
						}
					})
				}
			}
		}
	</script>
</body>
</html>
