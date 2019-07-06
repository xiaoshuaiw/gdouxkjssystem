<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>分类管理</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							学科竞赛 <small>添加，删除</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">选项1</a></li>
								<li><a href="table_data_tables.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<button class="btn btn-primary" onclick="typeadd();"">添加竞赛类别</button>

						<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid">
							<table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
								<tr role="row">
									<th rowspan="1" colspan="1" style="width: 120px;">竞赛类别</th>
									<th rowspan="1" colspan="1" style="width: 100px;">操作</th>
								</tr>
								<c:forEach items="${typelist}" var="type">
									<tr>
										<td>${type.competitionClass}</td>
										<td><a href="javascript:void(0);" onclick="typeDelete(${type.id},this);"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</a></td>
									</tr>
								</c:forEach>
							</table>

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
		function typeDelete(typeid, ele) {
			layer.confirm('您确定要删除该分类吗？', {
				btn : [ '确认', '取消' ]
			//按钮
			}, function() {
				$.ajax({
					url : "game.action",
					data : {
						cmd : "typeDelete",
						typeid : typeid
					},
					dataType : "json",
					success : function(data) {
						if (data.msgId == 1) {
							layer.alert(data.msgContent, {
								icon : 6
							})
							$(ele).parent().parent().remove()
						} else if (data.msgId == 2) {
							layer.alert(data.msgContent, {
								icon : 5
							})
						}
					}
				})
			});
		}
		function typeadd() {
			layer.open({
				type : 2,
				title : "添加分类",
				shadeClose : true,
				shade : 0.8,
				area : [ '90%', '90%' ],
				content : 'view/game/addtype.jsp'
			});
		}
		
		
	</script>
</body>
</html>
