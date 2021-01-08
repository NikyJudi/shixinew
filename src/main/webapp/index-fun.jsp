<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<script type="text/javascript" src="static/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="static/dist/js/bootstrap.min.js"></script>
<link href="static/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://www.imooc.com/data/jquery-1.8.2.min.js"
	type="text/javascript"></script>
<script src="https://www.imooc.com/data/jquery-ui-1.9.2.min.js"
	type="text/javascript"></script>
<link href="https://www.imooc.com/data/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
body{
    background-color:#FFFAFA ;
}
footer {
	text-align: center;
}
h1 {
    font-family: 'Times New Roman', Times, serif;
    color:rgb(3, 3, 22);
    text-shadow: 12px 15px 10px black;
	font-weight:bolder;
	font-size: 50px;
	display: inline-block;
    margin-top: -10px;
    margin-left: 150px;
}
#dd1 {
	background: #FFFAFA;
}
#nav_item{
    margin: auto;
    width: 980px;
}
#fi_file,#up_file{
    width: 65px;
}
#text_file{
    width: 220px;
}
#name {
	box-shadow:5px 5px 5px pink;
	background:#FFFAFA;
	width:100px;
	height:30px;
	border:0;
}
#back_btn1{
	border-radius: 100px;
	margin-left: 90px;
	margin-bottom: -40px;
}
#myzone{
}
</style>
</head>
<body>
	<div id="dd1">
		<div class="page-header">
            <h1>Logo-Design Zone <small>Sharing pool</small></h1>
         <div>
          <button type="button" class="btn btn-default" id="back_btn1">
			<span class="glyphicon glyphicon-off"aria-hidden="true"></span>
		</button>
		</div>
        </div>
        <div id="nav_item">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" aria-disabled="true">♻</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">公共资源池</a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                    <input type="text" class="form-control" placeholder="查找资源文件……" id="text_file">
                    </div>
                    <button type="submit" class="btn btn-default" id="fi_file">查找</button>
                    <button type="submit" class="btn btn-default" id="up_file">上传</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                	<li><a href="#">回收站</a></li>
                    <li><a href="#">个人资源池</a></li>
                    <li id="myzone">
                    <a>个人空间</a>
					</li>
                </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
            </nav>
        </div>
	</div>
	<footer>
		<hr width="60%" />
		&copy;<a>版权信息： Copyright ? 2020 - 2200 Flowery World. All Rights
			Reserved.</a>
	</footer>

	<script type="text/javascript">
	var loc=location.href;
	var n1=loc.length;//地址的总长度
	var n2=loc.indexOf("=");//取得=号的位置
	var text=decodeURI(loc.substr(n2-5, n1));//从=号后面的内容
	var text_a=text.split("=");
	var jobid = text_a[1];
	var pwd = text_a[3];
	var n3 = loc.indexOf("?");
	var urlnow = loc.substr(0,n3);
	//console.log(jobid);

	$("#name").on('click',function(){
		var jobId = jobid;
		$.ajax({
			url : "${urlnow} funs/"
					+ jobId,
			type : "GET",
			success : function(result) {
				if (result.data.functionary != null) {
					var functionary = result.data.functionary;
					$("#name").val(functionary.name);
				}
			}
		});
	});
	 $("#name").mouseover(function(){
	        $(this).trigger("click"); 	//调用trigger()方法直接触发click事件
	    }); 
	 $("#myzone").click(function(){
		 location.href="index-fun1.jsp?"+"jobId="+jobid+"="+"password="+pwd;
	 })
    $("#back_btn1").click(function(){
        window.open("login.jsp","_self");
    });
	</script>
</body>
</html>