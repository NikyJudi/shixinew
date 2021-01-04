<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".delete").click(function(){
			var name=$(this).parent().parent.find("td:eq(1)").text();
			var flag=confirm("确定要删除"+name+"吗？")
			var href=$(this).attr("href");
			if(flag){
				$("form").attr("action",href).submit();
			}
			return false;
		})
	});
</script>
</head>
<body>
	view all functionaries
	<!--  <form action="func" method="post">
	<input type="hidden" name="_method" value="DELETE" />
	</form>-->
	<c:if test="${empty requestScope.funcs}">
	none
	</c:if>
	<c:if test="${!empty requestScope.funcs}">
		<table border="1" cellspacing="1px" >
			<tr>
				<th>jobId</th>
				<th>name</th>
				<th>sex</th>
				<th>email</th>
				<th>phoneNum</th>
				<th>birth</th>
				<th>entryTime</th>
				<th>departmentId</th>
				<th>departmentName</th>
				<th>EDIT</th>
				<th>DELETE</th>
			</tr>
			<c:forEach items="${requestScope.funcs}" var="func">
				<tr>
					<td>${func.jobId}</td>
					<td>${func.name}</td>
					<td>${func.position}</td>
					<td>${func.email}</td>
					<td>${func.phoneNum}</td>
					<td><fmt:formatDate value="${func.birth}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${func.entryTime}" pattern="yyyy-MM-dd" /></td>
					<td>${func.departmentId}</td>
					<td>${func.depart.departName}</td>
					<td><a href="func/${func.jobId}"}>Edit</a></td>
					<td><a href="func/${func.jobId}" class="delete"}>Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<a href="func">添加</a>
</body>
</html>