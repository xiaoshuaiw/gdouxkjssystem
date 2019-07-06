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
<link href="js/webuploader.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>报名竞赛活动</h5>
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
						<form id="addcompetitionform" action="competition.action" method="post" class="form-horizontal">
							<input type="hidden" name="cmd" value="addcompetition" />

							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛名称</label>
								<div class="col-sm-9">
									<input id="competitionid" type="text" class="form-control" name="competitionname" required=""> <span id="competitionspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛类别</label>
								<div class="col-sm-9">
									<input id="competitionclassid" type="text" class="form-control" name="competitionclass" required=""> <span id="competitionclassspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">所属院系</label>
								<div class="col-sm-9">
									<input id="departmentid" type="text" class="form-control" name="department" required=""> <span id="departmentspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">参与学生</label>
								<div class="col-sm-9">
									<input id="allstudentid" type="text" class="form-control" name="allstudent" required=""> <span id="allstudentspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">指导教师</label>
								<div class="col-sm-9">
									<input id="teacherid" type="text" class="form-control" name="teacher" required=""> <span id="teacherspan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">联系电话</label>
								<div class="col-sm-9">
									<input id="phoneid" type="text" class="form-control" name="phone" required=""> <span id="phonespan" class="help-block m-b-none"></span>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">竞赛作品上传</label>
								<div class="col-sm-4">
									<div id="uploader" class="wu-example">
										<!--用来存放文件信息-->
										<div id="thelist" class="uploader-list"></div>
										<div class="btns">
											<div id="picker">选择文件</div>
											<button id="ctlBtn" class="btn btn-default" type="button">开始上传</button>
										</div>
										<input id="workid" type="hidden" name="work">
									</div>
								</div>
								<div id="workimgid" class="col-sm-5"></div> 
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<label class="col-sm-2 control-label">报名时间：</label>
								<div class="col-sm-10">
									<input class="form-control layer-date laydate-icon" placeholder="报名时间：YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
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
		// 上传竞赛作品
		jQuery(function() {
			var $ = jQuery, $list = $('#thelist'), $btn = $('#ctlBtn'), state = 'pending', uploader;
			uploader = WebUploader.create({
				// 不压缩image
				resize : false,
				// swf文件路径
				swf : 'js/Uploader.swf',
				// 文件接收服务端。
				server : 'competition.action?cmd=addfile',
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				pick : '#picker'
			});

			// 当有文件添加进来的时候
			uploader.on('fileQueued', function(file) {
				$list.append('<div id="' + file.id + '" class="item">' + '<h4 class="info">' + file.name + '</h4>' + '<p class="state">等待上传...</p>' + '</div>');
			});

			// 文件上传过程中创建进度条实时显示。
			uploader.on('uploadProgress', function(file, percentage) {
				var $li = $('#' + file.id), $percent = $li.find('.progress .progress-bar');

				// 避免重复创建
				if (!$percent.length) {
					$percent = $('<div class="progress progress-striped active">' + '<div class="progress-bar" role="progressbar" style="width: 0%">' + '</div>' + '</div>').appendTo($li).find('.progress-bar');
				}

				$li.find('p.state').text('上传中');

				$percent.css('width', percentage * 100 + '%');
			});

			uploader.on('uploadSuccess', function(file,data) {
				if(data.msgId == 1){
					//上传成功之后，要做两件事：
					//1、把图片展示在页面中，给用户呈现缩略图
					$("#workimgid").html("<img src='"+data.msgContent+"' width='300px' height='200px'>")
					//2、把图片地址放在表单中
					$("#workid").val(data.msgContent)
				}
				$('#' + file.id).find('p.state').text('已上传');
			});

			uploader.on('uploadError', function(file) {
				$('#' + file.id).find('p.state').text('上传出错');
			});

			uploader.on('uploadComplete', function(file) {
				$('#' + file.id).find('.progress').fadeOut();
			});

			uploader.on('all', function(type) {
				if (type === 'startUpload') {
					state = 'uploading';
				} else if (type === 'stopUpload') {
					state = 'paused';
				} else if (type === 'uploadFinished') {
					state = 'done';
				}

				if (state === 'uploading') {
					$btn.text('暂停上传');
				} else {
					$btn.text('开始上传');
				}
			});

			$btn.on('click', function() {
				if (state === 'uploading') {
					uploader.stop();
				} else {
					uploader.upload();
				}
			});
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$("#addcompetitionform").ajaxForm({
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
