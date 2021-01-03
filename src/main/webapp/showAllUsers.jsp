<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<style type="text/css">
		table{width:100% }
		table,tr,th{border:1px solid gray;border-collapse:collapse; }
		#head_text{
			width: 600px;
			height: 50px;
			margin: auto;
			text-align: center;
			font-size: 25px;
		}
		#ta_body{
			margin-left: auto;
			margin-right: auto;
			width: 800px;
			height: 200px;
			border: 2px mediumpurple solid;
		}
	</style>
  </head>
  
  <body>
    	<div id="head_text">${user.username} 先生/女生，欢迎您  &nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="user/logout" style="text-decoration: none;">【退出】</a></div>
    	<hr/>
		<br />
    	<table id="ta_body">
    		<thead>
    			<tr><th>用户编号</th><th>用户名称</th><th>用户密码</th><th>用户性别</th><th>操作</th></tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${userList}" var="user" >
    				<tr>
    					<th>${user.userid}</th>
    					<th>${user.username}</th>
    					<th id='${user.userid}'>${user.password}</th>
    					<th>${user.sex}</th>
    					<th>
    						<button onclick="modifyUserinfoById('${user.userid}')">修改</button> &nbsp;&nbsp;&nbsp;&nbsp;
    						<button onclick="deleteUserinfoById('${user.userid}')">删除</button>
    					</th>
    					
    				</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    	<br /><br />
    	<center>
    		当前第${pageInfo.pageNum}页/总共${pageInfo.pages}页,
    		<a id="pre_page" href="user/getAllUsers?pageNum=${pageInfo.pageNum-1}&maxPage=${pageInfo.pages}">上一页</a>
    		<a id="next_page" href="user/getAllUsers?pageNum=${pageInfo.pageNum+1}&maxPage=${pageInfo.pages}">下一页</a>
    		&nbsp;&nbsp;查看第<input type="text" id="page_num" size="2" onblur="quick()" placeholder="${pageInfo.pageNum}">页
    	</center>
  </body>
  <script type="text/javascript">
	  var page = ${pageInfo.pageNum};
	  var pages = ${pageInfo.pages};
	  function quick(){
	  	var pagenow=$("#page_num").val();
		  window.open("user/getAllUsers?pageNum="+pagenow+"&maxPage=${pageInfo.pages}","_self")
	  }
	  $("#pre_page").live("click",function(event){
	  	console.log(page)
	  	if(page==1){
	  		event.preventDefault();
		}
	  });
	  $("#next_page").live("click",function(event){
		  console.log(pages)
		  if(page==pages){
			  event.preventDefault();
		  }
	  });

  	function modifyUserinfoById(userid){
  		var newPass=prompt("请输入新密码");
			 $.ajax({
  				type:"post",//提交方式
  				url:"user/modify?userid="+userid+"&password="+newPass, //请求地址
  				data:null, //携带的参数（地址栏拼参）
  				success:function(msg){ //成功回调函数  msg ---返回的内容
  					/*  alert(msg);  */
  					if(msg>0){
  					//js方式
  					//object.parentNode.parentNode.cells[2].innerHTML=newPass;
  					/* alert("jquery"); */
  					$("#"+userid).html(newPass);
  					}
  				}
  			}); 
  	}

	function deleteUserinfoById(userid){
		var newPass=alert("确认删除吗");
		$.ajax({
			type:"delete",//提交方式
			url:"user/delete?userid="+userid, //请求地址
			data:null, //携带的参数（地址栏拼参）
			success:function(msg){ //成功回调函数  msg ---返回的内容
				/*  alert(msg);  */
				if(msg>0){
					//js方式
					//object.parentNode.parentNode.cells[2].innerHTML=newPass;
					/* alert("jquery"); */
					alert("success！");
					location.reload();
				}
			}
		});
	}
  </script>
</html>
