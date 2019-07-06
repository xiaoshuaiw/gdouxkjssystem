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
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">
<title>广东海洋大学学科竞赛系统</title>
<script src="js/ajaxutil.js"></script>
<head lang="en">
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery.min.js"></script>


<style type="text/css">
.container {
	position: relative;
	width: 751px;
	height: 455px;
}

.container .pic {
	position: absolute;
	left: 0px;
	top: 0px;
}

.slider-nav {
	bottom: 10px;
	height: 9px;
	position: absolute;
}

.slider-nav ul {
	line-height: 1;
}

.slider-nav li {
	background: #3e3e3e none repeat scroll 0 0;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	height: 9px;
	margin: 0 2px;
	overflow: hidden;
	text-align: center;
	width: 9px;
}

.slider-nav .slider-selected {
	background: #b61b1f none repeat scroll 0 0;
	color: #fff;
}

.slider-nav {
	height: 0;
	left: 250px;
	line-height: 0;
	text-align: center;
	top: 400px;
	width: 530px;
	font-size: 12px;
}

.slider-nav li {
	display: inline-block;
	height: 18px;
	line-height: 18px;
	width: 18px;
}

.slider-extra {
	position: absolute;
	z-index: 1000;
}

.nextPic {
	position: absolute;
	z-index: 1200;
	left: 1113px;
	top: 130px;
}

.beforePic {
	position: absolute;
	z-index: 1200;
	top: 130px;
}

.competition1 {
	width: 383px;
	border-right: 1px solid #e3e3e3;
	height: 450px;
	overflow: hidden;
}

.classification_one {
	height: 450px;
	border: 1px solid #E3E3E3;
	border-top: 2px solid #0067B4;
	overflow: hidden;
	margin-bottom: 55px;
}

.competition_two_sonr {
	margin-top: 25px;
	border: 1px solid #E3E3E3;
	margin-left: 25px;
	border-top: 2px solid #0067B4;
	height: 553px;
}

style.css: 10 .fl {
	float: left;
	display: inline;
}

style.css: 15 .w1150 {
	width: 1150px;
	margin: 0 auto;
	zoom: 1;
}

.fl {
	float: left;
	display: inline;
}

.c_title {
	border-bottom: 1px solid #E3E3E3;
	height: 56px;
	line-height: 56px;
}

body {
	font-size: 12px;
	font-family: 微软雅黑;
}

.clear {
	clear: both;
}

.competition3 {
	width: 415px;
	height: 553px;
	overflow: hidden;
	border-right: 1px solid #e3e3e3;
}

.c_title a {
	float: right;
	display: inline-block;
	color: #666666;
	font-size: 15px;
	text-align: right;
	margin-right: 10px;
}

style.css: 4 a {
	text-decoration: none;
	outline: none;
	color: #666666;
}

user agent stylesheet
a:-webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
	text-decoration: underline;
}

h2 {
	display: block;
	font-size: 1.5em;
	-webkit-margin-before: 0.83em;
	-webkit-margin-after: 0.83em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	font-weight: bold;
}

.c_list li {
	padding-left: 10px;
	width: 340px;
	overflow: hidden;
	height: 25px;
	line-height: 25px;
	margin: 0 0 13px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

ul {
	list-style: none;
}

user agent stylesheet
ul,menu,dir {
	display: block;
	list-style-type: disc;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	-webkit-padding-start: 40px;
}

.c_list {
	padding: 15px;
}

style.css: 19 .clearfix {
	zoom: 1;
}

.c_list li a {
	color: #666666;
	font-size: 15px;
	display: inline-block;
}
</style>
</head>
<body>
	<p>欢迎来到广东海洋大学学科竞赛系统</p>
	<div class="container">

		<a id="beforeid" class="beforePic" href="javascript:void(0)" onclick="beforePic();"><img src="img/left.png" /></a>

		<div id="allpic">
			<div class="pic" style="z-index: 1">
				<img src="img/p1.jpg">
			</div>
			<div class="pic" style="z-index: 2">
				<img src="img/p2.jpg">
			</div>
			<div class="pic" style="z-index: 3">
				<img src="img/p3.jpg">
			</div>
			<div class="pic" style="z-index: 4">
				<img src="img/p4.jpg">
			</div>
			<div class="pic" style="z-index: 5">
				<img src="img/p5.jpg">
			</div>
		</div>
		<a id="nextid" class="nextPic" href="javascript:void(0)" onclick="nextPic();"><img src="img/right.png" /></a>

		<div class="slider-extra">
			<ul class="slider-nav" id="ulid">
				<li class="slider-item">1</li>
				<li class="slider-item">2</li>
				<li class="slider-item">3</li>
				<li class="slider-item">4</li>
				<li class="slider-selected">5</li>
			</ul>
		</div>
	</div>

	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script type="application/javascript">
		
		
		
		
		

    var children = getElement(document.getElementById("allpic").childNodes);
    var lis = getElement(document.getElementById("ulid").childNodes);
    var taskid = window.setInterval(changePic,2500);

    var currPic = 0;
    function changePic(mousePointNum){
        if(mousePointNum != null){
            currPic = mousePointNum
        }

        for(var i = 0 ; i < children.length;i++){
            if(currPic == i){
                children[i].style.zIndex =888;
                lis[i].className="slider-selected"
            }else{
                children[i].style.zIndex = 1;
                lis[i].className = "slider-item"
            }
        }

        currPic++;
        if(currPic == children.length){
            currPic = 0;
        }

    }

    window.onload = function(){
        for(var i = 0 ; i<children.length;i++){
            lis[i].onmouseover = function(){
                clearInterval(taskid);
                var mousePointLi = this.innerText - 1;
                changePic(mousePointLi);
            }
            lis[i].onmouseout = function () {
                taskid = window.setInterval(changePic,2500);
            }
        }
    }
    function beforePic(){
        changePic(--currPic);
        if(currPic == 0){
            currPic = children.length;
            lis[lis.length-1].className="slider-selected";
        }
        currPic--;
    }

    function nextPic(){
        changePic(currPic);
        if(currPic == children.length+1){
            currPic = 0;
        }
        currPic;
    }
    function getElement(children){
        var arr = [];
        for(var i = 0; i < children.length;i++){
            if(children[i].nodeType == 1){
                arr.push(children[i]);
            }
        }
        return arr;
    }
	</script>
	<style type="text/css">
#myDiv {
	height: 30px;
	background-image: linear-gradient(to right, #ff9000 0, #ff5000 100%);
}
</style>
	<div id="mydiv">
		<ul id="typeid" name="competitionClass">
			<li><a >${competition.competitionClass}</a></li>
		</ul>
	</div>
	<div class="classification_one w1150">
		<div class="competition1 fl">
			<div class="c_title">
				<h2>推荐网站</h2>
				<a href="view/competition/competitionadd.jsp">报名&gt;&gt;</a>
			</div>
			<ul class="c_list clearfix">
				<li><a href="http://www.mcm.edu.cn/html_cn/node/7cec7725b9a0ea07b4dfd175e8042c33.html" target="_blank">广东海洋大学工程训练综合能力竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东海洋大学广告创意设计竞赛</a></li>
				<li><a href="http://www.mcm.edu.cn/html_cn/node/9c1f153b37c2fae6b1c87c734a4070fd.html" target="_blank"> 广东海洋大学英文演讲比赛</a></li>
				<li><a href="http://www.mcm.edu.cn/html_cn/node/9c1f153b37c2fae6b1c87c734a4070fd.html" target="_blank"> 广东海洋大学中文演讲比赛</a></li>
				<li><a href="http://www.mcm.edu.cn/html_cn/node/9c1f153b37c2fae6b1c87c734a4070fd.html" target="_blank"> 广东海洋大学话剧大赛</a></li>
			</ul>
		</div>
		<div class="competition1 fl">
			<div class="c_title">
			
				<h2>校级竞赛</h2>
				<a href="view/competition/competitionadd.jsp">报名&gt;&gt;</a>
			</div>
			<ul class="c_list clearfix">
				<li><a href="http://www.mcm.edu.cn/html_cn/node/7cec7725b9a0ea07b4dfd175e8042c33.html" target="_blank">广东海洋大学工程训练综合能力竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东海洋大学广告创意设计竞赛</a></li>
				<li><a href="http://www.mcm.edu.cn/html_cn/node/9c1f153b37c2fae6b1c87c734a4070fd.html" target="_blank"> 广东海洋大学英文演讲比赛</a></li>
				<li><a href="http://www.mcm.edu.cn/html_cn/node/9c1f153b37c2fae6b1c87c734a4070fd.html" target="_blank"> 广东海洋大学中文演讲比赛</a></li>
				<li><a href="http://www.mcm.edu.cn/html_cn/node/9c1f153b37c2fae6b1c87c734a4070fd.html" target="_blank"> 广东海洋大学话剧大赛</a></li>
			</ul>
		</div>
		<div class="competition1 competition2 fl">
			<div class="c_title">
				<h2>省级竞赛</h2>
				<a href="view/competition/competitionadd.jsp">报名&gt;&gt;</a>
			</div>
			<ul class="c_list clearfix">
				<li><a href="https://www.comap.com/undergraduate/contests/"  target="_blank"> 大学生职业生涯规划大赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/"  target="_blank"> 广东省大学生化学竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生广告设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生机器人竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生机械设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生程序设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生数学建模竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生光电设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank">广东省大学生电子设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 广东省大学生智能汽车竞赛</a></li>
			</ul>
			<img src="img/pic2.jpg" style="padding:8px 15px 15px; width:355px; height:115px;">
		</div>
	</div>
	<div class="clear"></div>
	<div class="competition_two_sonr fl">
		<div class="competition3 fl">
			<div class="c_title">
				<h2>国家级竞赛</h2>
				<a href="view/competition/competitionadd.jsp">报名&gt;&gt;</a>
			</div>
			<ul class="c_list c4_list clearfix">
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国周培源大学生力学竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生GIS应用技术大赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生信息安全竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生光电设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生公共卫生综合技能大赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生动物科学专业技能大赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生化学实验邀请赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生化工设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生工程训练综合能力竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生数学建模竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生智能汽车竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生电子商务“创新、创意及创业”挑战赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 全国大学生电子设计竞赛嵌入式系统专题邀请赛</a></li>
			</ul>
		</div>
		<div class="competition3 competition4 fl">
			<div class="c_title">
				<h2>国际级竞赛</h2>
				<a href="view/competition/competitionadd.jsp">报名&gt;&gt;</a>
			</div>
			<ul class="c_list c4_list clearfix" style="height:305px; overflow:hidden;">
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> ACM国际大学生程序设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> ASABE国际大学生机器人设计竞赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> IDC Robocon国际大学生机器人设计大赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> IEEE国际未来能源挑战赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> RoboCup机器人世界杯赛</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 世界大学生超级计算机竞赛（ASC\ISC\SC）</a></li>
				<li><a href="https://www.comap.com/undergraduate/contests/" target="_blank"> 国际基因工程机器竞赛</a></li>
			</ul>
			<img src="img/pic1.jpg" style="padding:15px 15px 15px 25px; width:355px; height:115px;">
		</div>
	</div>
	<script src="js/jquery.min.js?v=2.1.4"></script>
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
						var html = "<li style='float: left;margin-left: 30px;padding: 5px;'><a style='text-decoration: none;font-weight: bolder;color: #FFFFFF;'>"+typeArray[i].competitionClass+"</a></li>"
						$(typeid).append(html);
					}

				}
			})
		}
	</script>
</body>
</html>