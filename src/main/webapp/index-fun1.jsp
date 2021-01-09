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

#tabs_1 {
	width: 980px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
input {
	border:0;
}
.dd1 {
	background: #FFFAFA;
	margin-top: -25px;
	height: 700px;
}
#tabs_2 {
	width: 980px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
#pic_input{
	box-shadow: 2px 4px 15px black;
	border-radius: 10px;
}
h2{ 
	font-family: 'Times New Roman', Times, serif;
    color:rgb(3, 3, 22);
    text-shadow: 12px 15px 10px black;
	font-weight:bolder;
	font-size: 50px;
	display: inline-block;
    margin-top: -10px;
}
#back_btn{
	border-radius: 100px;
	margin-bottom: -40px;
	margin-left: -40px;
}
#input_pwd1,#input_pwd2{
	border:1px solid black;
	border-radius:5px;
}
#sub_btn{
	border-radius:5px;
	border:1px solid black;
	height:35px;
	background:white;
	width: 150px;
}
</style>
</head>
<body>
	<div class="dd1">
		<div class="container">
			<!-- title -->
			<div class="row">
				<div class="col-md-12">
				<div class="page-header">
					<h2>My Zone</h2>
				         <div>
          					<button type="button" class="btn btn-default" id="back_btn">
								<span class="glyphicon glyphicon-off"aria-hidden="true"></span>
								</button>
						</div>
					</div>
				</div>
			</div>
			<div id="tabs">
				<ul>
					<li role="presentation" id=""><a href="#tabs_0">空间简介</a></li>
					<li role="presentation" class="active" id="find_btn"><a href="#tabs_1">我的信息</a></li>
					<li role="presentation" id="up_pwd"><a href="#tabs_2">修改密码</a></li>
				</ul>
				<div id="tabs_0">
					<h4>在这里，您可以查看您的个人信息以及修改密码。</h4>
				</div>
				<div id="tabs_1">
					<form class="form1">
						<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>&nbsp;&nbsp;
						<input type="text" id="input_name" /> <br /> <br /> 
						<label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>&nbsp;&nbsp;
						<input type="text" id="input_sex" /> <br /> <br /> 
						<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>&nbsp;&nbsp;
						<input type="text" id="input_email" /><br /> <br /> 
						<label>联系方式:</label>&nbsp;&nbsp;
						<input type="text" id="input_phone" /> <br /> <br /> 
						<label>出生日期:</label>&nbsp;&nbsp;
						<input type="text" id="input_birth" /><br /> <br /> 
						<label>入职日期:</label>&nbsp;&nbsp;
						<input type="text" id="input_entry" /><br /> <br /> 
					</form>
				</div>
				<div id="tabs_2">
					<form class="form2" method="post">
						<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>&nbsp;&nbsp;
						<input type="password" id="input_pwd1" /> <br /> <br />
						<label>重新输入:</label>&nbsp;&nbsp;
						<input type="password" id="input_pwd2" /> <br /> <br />
						<button id="sub_btn">确定修改</button>
					</form>
				</div>
			</div>
		</div>
		<div class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Modal title</h4>
					</div>
					<div class="modal-body">
						<p>One fine body&hellip;</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
	<script type="text/javascript">
		var loc=location.href;
		var n1=loc.length;//地址的总长度
		var n2=loc.indexOf("?");//取得=号的位置
		var text=loc.substr(n2+1, n1);//从=号后面的内容
		var text_a=text.split("&");
		var text_b=text_a.splice(1,2);
		var id=text_a.toString();
		var n3=id.indexOf("=");
		var jobid=id.substr(n3+1,id.length);
		var pwd=text_b.toString();
		var n4=pwd.indexOf("=");
		var password=pwd.substr(n4+1,pwd.length);
		console.log(jobid);
		console.log(password);
		var urlnow = loc.substr(0,n2);
		var jobId = jobid;
	$("#sub_btn").click(function(){
		var pwd1 = $("#input_pwd1").val();
		var pwd2 = $("#input_pwd2").val();
		var jobId = jobid;
		if(pwd1 == pwd2){
			$.ajax({
				url : "${pagaContext.request.contextPath} funccc/"+jobId,
				type : "PUT",
				dataType: "json",
				data : {"password":pwd1},
				success : function(result) {
					if(result.code == 101){
						alert("修改成功，请重新登录！");
						window.open("login.jsp","_self");
					}
				}
			});
		}else{
			alert("两次输入密码不一致，请重新输入");
		}
	});
		$("#back_btn").click(function(){
			history.back();
		})
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
					var jobId = jobid;
					$.ajax({
						url : "${pagaContext.request.contextPath} funs/"
								+ jobId,
						type : "GET",
						success : function(result) {
							if (result.data.functionary != null) {
								var functionary = result.data.functionary;
								$("#input_name").val(functionary.name);
								$("#input_sex").val(functionary.sex);
								$("#input_email").val(functionary.email);
								$("#input_phone").val(functionary.phoneNum);
								$("#input_birth").val(
										new Date(functionary.birth)
												.toLocaleDateString());
								$("#input_entry").val(
										new Date(functionary.entryTime)
												.toLocaleDateString());
							}
						}
					});
				})

	</script>
</body>
</html>