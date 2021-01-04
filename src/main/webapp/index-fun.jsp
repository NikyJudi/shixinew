<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的个人空间</title>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/dist/js/bootstrap.min.js"></script>
<link
	href="${pagaContext.request.contextPath }static/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://www.imooc.com/data/jquery-1.8.2.min.js"
	type="text/javascript"></script>
<script src="https://www.imooc.com/data/jquery-ui-1.9.2.min.js"
	type="text/javascript"></script>
<link href="https://www.imooc.com/data/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.container {
	width: 980px;
	margin-top: 15px;
}

#p1 {
	margin-left: 230px;
	padding-top: 50px;
}

.list-group {
	text-align: center;
}

.my_m {
	margin-left: 150px;
	font-size: 16px;
}

#find_btn {
	border-radius: 10px;
	background: black;
	border: 1px solid black;
	color: pink;
	box-shadow: 2px 4px 15px pink;
}

#tabs_1 {
	width: 980px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

input {
	border-radius: 10px;
}

.dd1 {
	background: #FFFAFA;
	margin-top: -25px;
	height: 700px;
}
#tabs_2 {
	width: 980px;
}
img{
	border:5px solid black;
}
#add_pic{
	width: 150px;
	background: black;
	color: pink;
	box-shadow: 2px 4px 15px pink;
	border-radius: 10px;
	border:2px solid pink;
	font-size: 16px;
}
#pic_input{
	box-shadow: 2px 4px 15px black;
	border-radius: 10px;

}

</style>
</head>
<body>
	<div class="dd1">
		<p id="p1">
			<button type="button" class="btn btn-info">
				<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
				<a href="login.jsp">Back Login</a>
			</button>
		</p>
		<div class="container">
			<!-- title -->
			<div class="row">
				<div class="col-md-12">
					<h2>个人空间</h2>
					<br />
				</div>
			</div>
			<div id="tabs">
				<ul class="nav nav-pills">
					<li role="presentation" class="active" id="my_1"><a
						href="#tabs_1">我的信息</a></li>
					<li role="presentation" id="my_2"><a href="#tabs_2">我的图库</a></li>
				</ul>
				<div id="tabs_1">
					<form class="form1">
						<label>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>&nbsp;&nbsp;
						<input type="text" id="input_id" />&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" id="find_btn" value="查看我的个人信息">查看我的个人信息</button>
						<br /> <br /> <label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>&nbsp;&nbsp;
						<input type="text" id="input_name" /> <br /> <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>&nbsp;&nbsp;
						<input type="text" id="input_sex" /> <br /> <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>&nbsp;&nbsp;
						<input type="text" id="input_email" /><br /> <label>联系方式:</label>&nbsp;&nbsp;
						<input type="text" id="input_phone" /> <br /> <label>出生日期:</label>&nbsp;&nbsp;
						<input type="text" id="input_birth" /><br /> <label>入职日期:</label>&nbsp;&nbsp;
						<input type="text" id="input_entry" /><br /> <label>所属部门:</label>&nbsp;&nbsp;
						<input type="text" id="input_dename" />
					</form>
				</div>
				<div id="tabs_2">
				<form  class="form2" method="post">
					<input type="file" name="file" id="pic_input" multiple size="20"/>
					<br/>
					<button type="button" id="add_pic" >上传</button>
					<br/>
					<div name="result" id="result">
					<img alt="" src="b1.png">
					<img alt="" src="b4.png">
					<img alt="" src="b5.png">
					<img alt="" src="b6.png">
					<img alt="" src="b4.png">
					<img alt="" src="b1.png">
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#add_pic").click(function(){
			var newpic=$("#pic_input").val();
			$("<img src="+newpic+">").appendTo("#result");
		})
		$(function() {
		$("#tabs").tabs({
				//设置各选项卡在切换时的动画效果
				fx : {
					opacity : "toggle",
					height : "toggle"
				},
				event : "mousedown" //通过鼠标按下事件切换选项卡
			})
		});
		$("#find_btn").click(
				function() {
					var jobId = $("#input_id").val();
					$.ajax({
						url : "${pagaContext.request.contextPath} funs/"
								+ jobId,
						type : "GET",
						success : function(result) {
							if (result.data.functionary != null) {
								var functionary = result.data.functionary;
								$("#input_name").val(functionary.name);
								$("#input_sex").val(functionary.position);
								$("#input_email").val(functionary.email);
								$("#input_phone").val(functionary.phoneNum);
								$("#input_birth").val(
										new Date(functionary.birth)
												.toLocaleDateString());
								$("#input_entry").val(
										new Date(functionary.entryTime)
												.toLocaleDateString());
								$("#input_dename").val(
										[ functionary.departmentId ]);
							}
						}
					});
				})

	</script>
</body>
</html>