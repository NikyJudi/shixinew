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
.table th {
    font-size: 15.4px;
    text-align: center;
}
.table {
    text-align: center;
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
#up_file{
    margin-left: 300px;
    margin-top: -35px;
    width: 200px;
}
#fun_table{
    width: 980px;
}
#page_nav_area{
    margin-top: -45px;
    margin-left: 700px;
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
                    <li><a id="allpool">公共资源池</a></li>
                </ul>
                <form class="navbar-form navbar-left" id="form">
                    <div class="form-group">
                    <input type="text" class="form-control" placeholder="查找资源文件……" id="text_file">
                    </div>
                    <button type="submit" class="btn btn-default" id="fi_file">查找</button>
                    <input type="file" class="btn btn-default" id="up_file" name="up_file" />
                </form>
                <ul class="nav navbar-nav navbar-right">
                	<li><a href="#">回收站</a></li>
                    <li><a id="myfun">个人资源池</a></li>
                    <li id="myzone">
                    <a>个人空间</a>
					</li>
                </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
            </nav>
            <div class="container">
                <!-- data -->
                <div class="row">
                    <table class="table table-striped table-hover table-condensed"
                           id="fun_table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="check_All" /></th>
                            <th>序号</th>
                            <th>文件名称</th>
                            <th>上传时间</th>
                            <th>文件大小（b）</th>
                            <th>文件类型</th>
                            <th>上传者</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <!-- paging info -->
                <div class="row">
                    <div class="col-md-6" id="page_info_area"></div>
                    <div class="col-md-6 " id="page_nav_area"></div>
                </div>
        </div>
	</div>
	<footer>
		<hr width="60%" />
		&copy;<a>版权信息： Copyright ? 2020 - 2200 Flowery World. All Rights
			Reserved.</a>
	</footer>

	<script type="text/javascript">
        var totalPage;
        var currPage;
        var listPage;
        var allPage;
        $(function() {
            showPage(1);
        });
        function showPage(n) {
            $.ajax({
                url : "${pagaContext.request.contextPath} file",
                data : "pn=" + n,
                type : "GET",
                success : function(result) {
                    //显示数据
                    build_fun_table(result);
                    //显示分页信息
                    build_page_info_area(result);
                    //显示分页页面导航信息
                    build_page_nav_area(result);
                }
            });
        }

        function build_fun_table(result) {
            $("#fun_table tbody").empty();
            var fpage = result.data.page.list;
            $
                .each(
                    fpage,
                    function(index, item) {
                        var checkTd = $("<td><input type='checkbox' class='check_item'/></td>");
                        var f_idTd = $("<td></td>").append(item.id);
                        var nameTd = $("<td></td>").append(item.fname);
                        //var urlTd = $("<td></td>").append(item.url);
                        var dateTd = $("<td></td>").append(
                            new Date(item.cdate)
                                .toLocaleDateString());
                        var sizeTd = $("<td></td>").append(item.fsize);
                        var typeTd = $("<td></td>").append(item.ftype);
                        var f_nameTd = $("<td></td>").append(item.functionary.name);
                        var delBtn = $("<button></button>")
                            .addClass(
                                "btn btn-danger btn-sm delete-btn")
                            .append(
                                $("<span></span>")
                                    .addClass(
                                        "glyphicon glyphicon-trash"))
                            .append("删除");
                        delBtn.attr("delete-funid", item.id);
                        var delBtnTd = $("<td></td>").append(delBtn);

                        var lookBtn = $("<button></button>")
                            .addClass(
                                "btn btn-primary btn-sm look-btn")
                            .append(
                                $("<span></span>")
                                    .addClass(
                                        "glyphicon glyphicon-play-circle"))
                            .append("预览");
                        lookBtn.attr("look-funid", item.id);
                        var lookBtnTd = $("<td></td>").append(lookBtn);

                        var dowBtn = $("<button></button>")
                            .addClass(
                                "btn btn-success btn-sm dow-btn")
                            .append(
                                $("<span></span>")
                                    .addClass(
                                        "glyphicon glyphicon-download-alt"))
                            .append("下载");
                        dowBtn.attr("dow-funid", item.id);
                        var dowBtnTd = $("<td></td>").append(dowBtn);

                        $("<tr></tr>").append(checkTd).append(f_idTd)
                            .append(nameTd).append(
                            dateTd).append(sizeTd)
                            .append(typeTd).append(f_nameTd).append(lookBtnTd).append(dowBtnTd)
                            .append(delBtnTd).appendTo(
                            "#fun_table tbody");
                        var trnum = $("#fun_table tbody").children("tr");
                    });
        }
        function build_page_info_area(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append(
                "当前第" + result.data.page.pageNum + "页/共"
                + result.data.page.pages + "页" + "，文件总数为"
                + result.data.page.total);
            allPage = result.data.page.pages;
            totalPage = result.data.page.total;
            currPage = result.data.page.pageNum;
            listPage = result.data.page.list;
        }
        function build_page_nav_area(result) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").append(
                $("<a></a>").append("首页").attr("href", "#"));
            var previousPageLi = $("<li></li>").append(
                $("<a></a>").append("&laquo;").attr("href", "#"));
            if (result.data.page.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                previousPageLi.addClass("disabled");
            } else {
                firstPageLi.click(function() {
                    showPage(1);
                });
                previousPageLi.click(function() {
                    showPage(result.data.page.pageNum - 1);
                });
            }
            var nextPageLi = $("<li></li>").append(
                $("<a></a>").append("&raquo;").attr("href", "#"));
            var lastPageLi = $("<li></li>").append(
                $("<a></a>").append("尾页").attr("href", "#"));

            if (result.data.page.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                nextPageLi.click(function() {
                    showPage(result.data.page.pageNum + 1);
                });
                lastPageLi.click(function() {
                    showPage(result.data.page.pages);
                });
            }
            ul.append(firstPageLi).append(previousPageLi);
            $.each(result.data.page.navigatepageNums, function(index, item) {
                var numLi = $("<li></li>").append(
                    $("<a></a>").append(item).attr("href", "#"));
                if (result.data.page.pageNum == item) {
                    numLi.addClass("active");
                }

                numLi.click(function() {
                    showPage(item);
                });
                ul.append(numLi);
            });
            ul.append(nextPageLi).append(lastPageLi);
            var navElement = $("<nav></nav>").append(ul).appendTo(
                "#page_nav_area");
        }
        $("#check_All").click(function() {
            //alert($(this).prop("checked"));
            $(".check_item").prop("checked", $(this).prop("checked"));
        });

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
    $("#up_file").click().change(function () {
        var file_name ;
        $.ajax({
            type: "post",
            url: "${pagaContext.request.contextPath} file/" + jobId,
            enctype: "multipart/form-data",
            data: new FormData($("#form")[0]),
            processData: false,
            contentType: false,
            cache: false,
            success: function (msg) {
                alert("上传成功！");
                showPage(allPage);
            }
        });
    });

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
		 location.href="index-fun1.jsp?"+"                           jobId="+jobid+"&"+"                              password="+password;
	 })
    $("#back_btn1").click(function(){
        window.open("login.jsp","_self");
    });
	 $("#myfun").click(function(){
         location.href="index-funfun.jsp?"+"                           jobId="+jobid+"&"+"                              password="+password;
     });
	 $("#allpool").click(function(){
         location.href="index-fun.jsp?"+"                           jobId="+jobid+"&"+"                              password="+password;
     });
	</script>
</body>
</html>