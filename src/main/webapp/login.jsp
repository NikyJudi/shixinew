<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <script type="text/javascript"
            src="${pagaContext.request.contextPath }static/jquery-3.5.0.min.js"></script>
    <script type="text/javascript"
            src="${pagaContext.request.contextPath }static/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.jq22.com/jquery/animate-3.1.0.min.css">
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
            background: #FFFAFA;
            border: 13px dashed #2376B7;
            border-radius: 15px;
            box-shadow: 15px 20px 70px black;
        }

        .form-group {
            margin-top: 20px;
        }

        #btns {
            margin-top: 10px;
        }

        #body_inp {
            margin-top: 35px;
        }

        #change_pwd {
            color: black;
        }
    </style>
</head>
<body background="images/b2.png">
<div class="body_x animated fadeInLeftBig">
    <form class="form-horizontal">
        <div class="body_in">
            <div class="form-group" id="body_inp">
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
                           placeholder="(请输入您的密码)"><span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-10">
                    <div class="checkbox">
                        <label> <input type="checkbox"> 记住我
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a role="button" id="change_pwd"><span class="glyphicon glyphicon-user"
                                                               aria-hidden="true"></span>修改密码</a>
                    </div>
                </div>
            </div>
            <div class="form-group" id="btns">
                <div class="col-sm-offset-4">
                    <button type="button" class="btn btn-default" id="back_btn">取消</button>
                    &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" id="login_btn">登陆</button>
                    &nbsp;&nbsp;&nbsp;

                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $("#back_btn").click(function () {
        window.open('homepage.html', '_self');
    })

    $("#login_btn").click(
        function () {
            var data = {}
            data["jobId"] = $("#inputId").val();
            data["password"] = $("#inputPassword").val();
            var jobId = data["jobId"];
            var password = data["password"];
            $
                .ajax({
                    url: "${pagaContext.request.contextPath} login",
                    type: "POST",
                    data: data,
                    dataType: "json",
                    success: function (result) {
                        if (result.code == 103) {
                            show_validate_status(
                                "#inputId",
                                "error",
                                "无权限账号，请检查后再登录。")

                            //window.open('login.jsp','_self');
                        }
                        if (jobId == 900) {
                            if (result.code == 101) {
                                location.href = "index-funm.jsp?" + "                           jobId=" + jobId + "&" + "                          password=" + password;
                            } else if (result.code == 102) {
                                show_validate_status(
                                    "#inputPassword",
                                    "error",
                                    "密码输入有误，请重新输入。")
                            }
                        } else if (jobId != 900) {
                            if (result.code == 101) {
                                location.href = "index-fun.jsp?" + "                            jobId=" + jobId + "&" + "                             password=" + password;
                            } else if (result.code == 102) {
                                show_validate_status(
                                    "#inputPassword",
                                    "error",
                                    "密码输入有误，请重新输入。")
                            }
                        }
                    }
                });
        });
    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#login_btn").trigger("click");
        }
    });

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