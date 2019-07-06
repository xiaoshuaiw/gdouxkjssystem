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
<title>参加学科竞赛的详情</title>

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
							基本 <small>分类，查找</small>
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

						<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid">
							<div class="row">
								<div class="col-sm-6">
									<div class="dataTables_length" id="DataTables_Table_0_length">
										<label>每页 <select class="form-control input-sm" onchange="competitionPage(${page.firstPage},this.value)">
												<option value="10" <c:if test="${page.pageSize == 10 }"> selected="selected"</c:if>>10</option>
												<option value="25" <c:if test="${page.pageSize == 25 }"> selected="selected"</c:if>>25</option>
												<option value="50" <c:if test="${page.pageSize == 50 }"> selected="selected"</c:if>>50</option>
												<option value="100" <c:if test="${page.pageSize == 100 }"> selected="selected"</c:if>>100</option>
										</select> 条记录
										</label>
									</div>
								</div>
								<div class="col-sm-6">
									<div id="DataTables_Table_0_filter" class="dataTables_filter">
										<label>查找：<input type="search" class="form-control input-sm" aria-controls="DataTables_Table_0"></label>
									</div>
								</div>
							</div>
							<table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
								<tr role="row">
									<th rowspan="1" colspan="1" style="width: 124px;">竞赛名称</th>
									<th rowspan="1" colspan="1" style="width: 120px;">竞赛类别</th>
									<th rowspan="1" colspan="1" style="width: 120px;">所属院系</th>
									<th rowspan="1" colspan="1" style="width: 166px;">参与学生</th>
									<th rowspan="1" colspan="1" style="width: 108px;">指导教师</th>
									<th rowspan="1" colspan="1" style="width: 100px;">电话</th>
									<th rowspan="1" colspan="1" style="width: 98px;">竞赛作品</th>
									<th rowspan="1" colspan="1" style="width: 158px;">更新时间</th>
									<th rowspan="1" colspan="2" style="width: 208px;">操作</th>
								</tr>
								<c:forEach items="${page.pageData}" var="competition">
									<tr>
										<td>${competition.competitionName}</td>
										<td>${competition.competitionClass}</td>
										<td>${competition.department}</td>
										<td>${competition.allStudent}</td>
										<td>${competition.teacher}</td>
										<td>${competition.phone}</td>
										<td>${competition.work}</td>
										<td><fmt:formatDate value="${competition.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><a href="javascript:void(0);" onclick="competitionEdit(${competition.id});"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</a></td>
										<td><a href="javascript:void(0);" onclick="competitionDelete(${competition.id},this);"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</a></td>
									</tr>
								</c:forEach>
							</table>
							<div class="row">
								<div class="col-sm-4">
									<div class="dataTables_info" id="DataTables_Table_0_info" role="alert" aria-live="polite" aria-relevant="all">当前第 ${page.currPage} 页，共 ${page.totalPage} 页</div>
								</div>
								<div class="col-sm-8">
									<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
										<ul class="pagination">
											<c:if test="${page.currPage != page.firstPage }">
												<li class="paginate_button previous" aria-controls="DataTables_Table_0" tabindex="0" id="DataTables_Table_0_previous"><a href="javascript:void(0);" onclick="competitionPage(${page.firstPage},${page.pageSize})">首页</a></li>
												<li class="paginate_button previous" aria-controls="DataTables_Table_0" tabindex="0" id="DataTables_Table_0_previous"><a href="javascript:void(0);" onclick="competitionPage(${page.prevPage},${page.pageSize})">上一页</a></li>
											</c:if>
											<c:forEach begin="${page.startNav }" end="${page.endNav }" var="num">
												<c:if test="${num == page.currPage }">
													<li class="paginate_button active" aria-controls="DataTables_Table_0" tabindex="0"><a href="javascript:void(0);">${num }</a></li>
												</c:if>
												<c:if test="${num != page.currPage }">
													<li class="paginate_button" aria-controls="DataTables_Table_0" tabindex="0"><a href="javascript:void(0);" onclick="competitionPage(${num},${page.pageSize})">${num }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${page.currPage != page.lastPage }">
												<li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" id="DataTables_Table_0_next"><a href="javascript:void(0);" onclick="competitionPage(${page.nextPage},${page.pageSize})">下一页</a></li>
												<li class="paginate_button next" aria-controls="DataTables_Table_0" tabindex="0" id="DataTables_Table_0_next"><a href="javascript:void(0);" onclick="competitionPage(${page.lastPage},${page.pageSize})">尾页</a></li>
											</c:if>
										</ul>
									</div>
								</div>
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
		function competitionEdit(competitionid) {
			layer.open({
				type : 2,
				title : "竞赛信息修改",
				shadeClose : true,
				shade : 0.8,
				area : [ '90%', '90%' ],
				content : 'competition.action?cmd=editcompetitionbefore&competitionid=' + competitionid
			});
		}

		function competitionDelete(competitionid, ele) {
			if (competitionid == 1) {
				layer.msg("超级管理员不能删除", {
					icon : 5
				})
				return;
			}

			layer.confirm('您确定要删除该条记录吗？', {
				btn : [ '确认', '取消' ]
			//按钮
			}, function() {
				$.ajax({
					url : "competition.action",
					data : {
						cmd : "deleteCompetition",
						competitionid : competitionid
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

		function competitionPage(currPage, pageSize) {
			window.location.href = "competition.action?cmd=findPageCompetition&currPage=" + currPage + "&pageSize=" + pageSize;
		}

		function refreshSelf() {
			competitionPage(${page.currPage}, ${page.pageSize})
		}
	</script>
</body>
</html>
