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
		</div>
		<div class="jumbotron">
			<p id="p1">Flowery World</p>
			<p id="p_1">Make the best logo design</p>
			<p>...</p>
			<br /> <a id="le" class="btn btn-default btn-lg" href="homepage.html"
				role="button"><span>Learn more</span></a>

		</div>
</body>
</html>