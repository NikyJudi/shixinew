<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登陆</title>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/jquery-3.5.0.min.js"></script>
<script type="text/javascript"
	src="${pagaContext.request.contextPath }static/dist/js/bootstrap.min.js"></script>
<link
	href="${pagaContext.request.contextPath }static/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
.body_x {
	width: 980px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 150px;
}

.body_in {
	width: 400px;
	height: 300px;
	background: white;
	border: 13px solid white;
	border-radius: 15px;
	box-shadow: 0px 0px 47px #FFFAFA;
}

.form-group {
	margin-top: 20px;
}
#btns{
	margin-top: 10px;
}
</style>
</head>
<body background="bbg3.png">
	<div class="body_x" >
		<form class="form-horizontal">
			<div class="body_in">
				<div class="form-group">
					<label for="inputId" class="col-sm-3 control-label">账号：</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="inputId"
							placeholder="(请输入您的账号)"><span class="help-block"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-3 control-label">密码：</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="(请输入您的密码)"><span
									class="help-block"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox"> 记住我
							</label>
						</div>
					</div>
				</div>
				<div class="form-group" id="btns">
					<div class="col-sm-offset-3">
						<button type="button" class="btn btn-default" id="back_btn">取消</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default" id="login_btn">登陆</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default" id="login_btn1">员工登陆</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	    $("#back_btn").click(function(){
	    	window.open('body-1.html','_self');
	    })
	    $("#login_btn")
				.click(
						function() {
							var jobId = $("#inputId").val();
							var password = $("#inputPassword").val();
							$
									.ajax({
										url : "${pagaContext.request.contextPath} funs/"
												+ jobId,
										type : "GET",
										success : function(result) {
											if (jobId == 889) {
												if (result.data.functionary != null) {
													if (result.code == 101) {
														var functionary = result.data.functionary;
														if (password == functionary.phoneNum) {
															window
																	.open(
																			'index.jsp',
																			'_self');
														} else {
															show_validate_status(
																	"#inputPassword",
																	"error",
																	"密码输入有误，请重新输入。")
														}
													}
												}
											}
											else if(jobId != 889){
												show_validate_status(
														"#inputId",
														"error",
														"您不是管理员，没有登录权限。")
											}
										}
									});
						})
		$("#login_btn1").click(function() {
			var jobId = $("#inputId").val();
			var password = $("#inputPassword").val();
			$.ajax({
				url : "${pagaContext.request.contextPath} funs/" + jobId,
				type : "GET",
				success : function(result) {
					if (result.data.functionary != null) {
						if (result.code == 101) {
							var functionary = result.data.functionary;
							if (password == functionary.phoneNum) {
								window.open('index-2.jsp', '_self');
							} else {
								show_validate_status("#inputPassword","error","密码输入有误，请重新输入。")
							}
						}
					}
				}
			});
		})
		function show_validate_status(ele, status, msg) {
			$(ele).parent().removeClass("has-error has-success has-warning");
			if (status == "success") {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if (status == "error") {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			} else if (status == "warning") {
				$(ele).parent().addClass("has-warning");
				$(ele).next("span").text(msg);
			}
		}
	</script>
</body>
</html>