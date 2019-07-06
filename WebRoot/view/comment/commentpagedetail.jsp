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
<title>评论详情</title>

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
										<label>每页 <select class="form-control input-sm" onchange="commentPage(${page.firstPage},this.value)">
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
									<th rowspan="1" colspan="1" style="width: 124px;">评论标题</th>
									<th rowspan="1" colspan="1" style="width: 120px;">竞赛的名称</th>
									<th rowspan="1" colspan="1" style="width: 120px;">评论内容</th>
									<th rowspan="1" colspan="1" style="width: 166px;">评论者</th>
									<th rowspan="1" colspan="1" style="width: 108px;">评论时间</th>
									<th rowspan="1" colspan="2" style="width: 208px;">操作</th>
								</tr>
								<c:forEach items="${page.pageData}" var="comment">
									<tr>
										<td>${comment.title}</td>
										<td>${comment.competitionName}</td>
										<td>${comment.content}</td>
										<td>${comment.author}</td>
										<td>${comment.updatetime}</td>
										<td><a href="javascript:void(0);" onclick="commentEdit(${comment.id});"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 修改</a></td>
										<td><a href="javascript:void(0);" onclick="commentDelete(${comment.id},this);"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</a></td>
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
		function commentEdit(commentid) {
			layer.open({
				type : 2,
				title : "竞赛信息修改",
				shadeClose : true,
				shade : 0.8,
				area : [ '90%', '90%' ],
				content : 'comment.action?cmd=editcommentbefore&commentid=' + commentid
			});
		}

		function commentDelete(commentid, ele) {
			layer.confirm('您确定要删除该条记录吗？', {
				btn : [ '确认', '取消' ]
			//按钮
			}, function() {
				$.ajax({
					url : "comment.action",
					data : {
						cmd : "deletecomment",
						commentid : commentid
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

		function commentPage(currPage, pageSize) {
			window.location.href = "comment.action?cmd=findPageComment&currPage=" + currPage + "&pageSize=" + pageSize;
		}

		function refreshSelf() {
			commentPage(${page.currPage}, ${page.pageSize})
		}
	</script>
</body>
</html>
