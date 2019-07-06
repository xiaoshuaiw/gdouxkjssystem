<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>教师学生的比率</title>
<script src="js/echarts.min.js"></script>
<script src="js/jquery.min.js"></script>

</head>
<body>
	<div id="main" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
		//初始化图表
		var myChart = echarts.init(document.getElementById('main'));
		$.ajax({
			url : "user.action",
			data : {
				cmd : "userrate"
			},
			dataType : "json",
			success : function(data) {
				var option = {
					title : {
						text : '教师学生比率',
						x : 'center'
					},
					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b} : {c} ({d}%)"
					},
					legend : {
						orient : 'vertical',
						left : 'left',
						data : [ '教师', '学生' ]
					},
					series : [ {
						name : '教师学生比率',
						type : 'pie',
						radius : '55%',
						center : [ '50%', '60%' ],
						data : [ {
							value : data.teacher,
							name : '教师'
						}, {
							value : data.student,
							name : '学生'
						} ],
						itemStyle : {
							emphasis : {
								shadowBlur : 10,
								shadowOffsetX : 0,
								shadowColor : 'rgba(0, 0, 0, 0.5)'
							}
						}
					} ]
				};
				myChart.setOption(option);
			}
		})
	</script>
	<!--1.引入js
		2.准备dom容器
		3.初始化容器 
		4.挑选一个图 -->

</body>
</html>
