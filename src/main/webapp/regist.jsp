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
	<style type="text/css">
		span{color:red;}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  </head>
  
  <body>
  <span style="color:red;">${registDefeat}</span>
  <form action="${pageContext.request.contextPath}/user/regist" method="post">
    	用户名称:<input name="username" id="username" onblur="ajaxSubmit()"><span id="state">${loginError}</span><br>
    	用户密码:<input type="password" name="password"><br>
    	用户性别:男<input type="radio" value="男" checked name="sex">
    		      女<input type="radio" value="女" name="sex"><br>
    	<input type="submit" id="submit" value="注册">&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="取消">
  </form>
  	已有账号？<a href="user/login_page">登录</a>
  </body>
  
  <script type="text/javascript">
  /* 原生ajax */
  /*
  		function ajaxSubmit(){
 			var xmlHttp;
 			//浏览器兼容
 			try{
   				// Firefox, Opera 8.0+, Safari
    			xmlHttp=new XMLHttpRequest();
    		}catch (e){
  			// Internet Explorer
   			try{
      			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
      		}catch (e){
      			try{
         			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
         		}catch (e){
         			alert("您的浏览器不支持AJAX！");
         			return false;
         		}
      		}
    	}
     //真正的去后台验证
    var span=document.getElementById("state");//用户姓名框后的提示信息的span
    var username=document.getElementById("username").value;
    var url="user?action=ajax&username="+username;    
    //xmlHttp.open("提交方式",请求地址,是否异步);	
   	xmlHttp.open("post",url,true);
    xmlHttp.send(null);
    xmlHttp.onreadystatechange=function(){//指定回调函数
      if(xmlHttp.readyState==4&&xmlHttp.status==200){
      var content=xmlHttp.responseText;//响应的结果
      //alert(content); 
      var sub=document.getElementById("submit");
      	if(content=="no"){
      		span.innerHTML="<font color='red'>用户名已存在</font>";
      		sub.disabled=true;
      	}else{
      		span.innerHTML="<font color='green'>√</font>";
      		sub.disabled=false;
      	}	
      }    
   } 	
  }
 */
 /* JQuery.ajax*/
/*  
$.ajax({
   type: "POST",
   url: "some.php",
   data: "name=John&location=Boston",
   cache: false,
   async: false
   success: function(msg){
     alert( "Data Saved: " + msg );
   }
}); 
*/
 
 
 function ajaxSubmit(){
 	/* alert($("form").serialize()); */
 	$.ajax({
		//提交类型
   		type: "post",
   	/* 	url: "user?action=ajax&username="+$("#username").val(),
   		data: null, */
   		//请求地址
   		url: "user",
   		//传递的参数
   		data: "action=ajax&username="+$("#username").val(),//$("form").serialize()
   		//成功回调函数
   		success: function(msg){//msg--回传的数据
   			if(msg=="no"){
				$("#state").html("<font color='red'>用户名已存在啊啊</font>"); 
				$("#submit").prop("disabled", true);    		
   			}else{
   				$("#state").html("<font color='green'>√</font>"); 
   				$("#submit").prop("disabled", false);
   			}
   		},
   		error:function(){//当出现的错误--服务器异常--500
   			console.log("错误回调函数");
		}   		
	});
 
 }
 
  </script>
</html>
