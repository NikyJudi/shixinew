<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <span style="color:red;"> ${loginDefeat}</span>
  <form action="${pageContext.request.contextPath}/user/login" method="post">
    	用户名称:<input name="username"><span>${loginError}</span><br>
    	用户密码:<input type="password" name="password"><br>
    	<input type="submit" value="登录">&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="取消">
  </form>
  	还没有账号？<a href="user/regist_page">注册</a>
  </body>
</html>