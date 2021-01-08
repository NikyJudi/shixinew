<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flowery World</title>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/jquery-3.5.0.min.js"></script>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/dist/js/bootstrap.min.js"></script>
<link
	href="${pagaContext.request.contextPath }static/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.jumbotron {
	margin-top: 130px;
	height: 250px;
	text-align: center;
	background: #FBEEE2;
	background-repeat: repeat-x;
}

#p1 {
	margin-top: -30px;
	font-family: "lixukexingshu1b969ad7dc1c3e5";
	font-weight: bold;
	color: black;
	font-size: 80px;
}

#le {
	margin-top: 120px;
	background: black;
	height: 47px;
	border: 0px;
}

span {
	color: LavenderBlush;
}

#p_1 {
	font-family: "lixukexingshu1b969ad7dc1c3e5";
	font-weight: bold;
	font-size: 40px;
	color: black;
}
#h1_btn_btn {
	background: black;
	border: 0px;
	color: white;
}

#h_btn_btn {
	background: black;
	border: 0px;
	color: white;
}
</style>
</head>
<body background="b2.png">
	<div>
		<button type="button" class="btn btn-info" id="h1_btn_btn">
			<a href="home-1.html"><span class="glyphicon glyphicon-star"
				aria-hidden="true">s-1</a></span>
		</button>
		<button type="button" class="btn btn-default" id="h_btn_btn">
			<a href="home.jsp"><span class="glyphicon glyphicon-star-empty"
				aria-hidden="true">s-2</a></span>
		</button>
		</div>
		<div class="jumbotron">
			<p id="p1">Flowery World</p>
			<p id="p_1">Make You More Beautiful</p>
			<p>...</p>
			<br /> <a id="le" class="btn btn-default btn-lg" href="body.html"
				role="button"><span>Learn more</span></a>

		</div>
</body>
</html>