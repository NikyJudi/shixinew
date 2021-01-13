<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flowery World</title>
    <script type="text/javascript"
            src="${pagaContext.request.contextPath }static/jquery-3.5.0.min.js"></script>
    <script type="text/javascript"
            src="${pagaContext.request.contextPath }static/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.jq22.com/jquery/animate-3.1.0.min.css">
    <link
            href="${pagaContext.request.contextPath }static/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <style type="text/css">
        .jumbotron {
            margin-top: 140px;
            height: 550px;
            text-align: center;
            background: LavenderBlush;
            background-repeat: repeat-x;
        }

        #p1 {
            margin-top: -25px;
            font-family: 'Times New Roman', Times, serif;
            text-shadow: 12px 15px 10px black;
            font-weight: bolder;
            font-weight: bold;
            color: black;
            font-size: 80px;
        }

        #le {
            margin-top: 150px;
            background: black;
            height: 47px;
            border: 0px;
        }

        span {
            color: LavenderBlush;
        }

        #p_1 {
            font-family: 'Times New Roman', Times, serif;
            text-shadow: 12px 15px 10px black;
            font-weight: bolder;
            font-weight: bold;
            font-size: 40px;
            color: black;
        }
    </style>
</head>
<body background="images/b2.png">
<div>
</div>
<div class="jumbotron animated fadeInLeftBig">
    <p id="p1">Flowery World</p>
    <p id="p_1">Make the best logo design</p>
    <p>...</p>
    <br/> <a id="le" class="btn btn-default btn-lg" href="homepage.html"
             role="button"><span>Learn more</span></a>
</div>
</body>
</html>