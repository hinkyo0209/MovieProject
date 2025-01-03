<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
	background-color: #DDDDDD;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="list">
<form action="update2" method="post" enctype="multipart/form-data">
	<table border="1" width="600px" align="center">
	<input type="hidden" name="actornum" value="${list.actornum }">
	<tr>
		<th>배우이름</th>
		<td><input type="text" name="actor" value="${list.actor }"></td>
	</tr>
	<tr>
		<th>배우프로필</th>
		<td>
		<img src="./actorimage/${list.actorimage }" width="150px" height="200px">
		<input type="file" name="actorimage">
		</td>
	</tr>
	<tr>
		<th>대표작1</th>
		<td><input type="text" name="actortv1" value="${list.actortv1 }"></td>
	</tr>
	<tr>
		<th>대표작2</th>
		<td><input type="text" name="actortv2" value="${list.actortv2 }"></td>
	</tr>
	<tr>
		<th>대표작3</th>
		<td><input type="text" name="actortv3" value="${list.actortv3 }"></td>
	</tr>
	<tr style="text-align:center" >
		<td colspan="2">
		<input type="submit" value="수정하기">
		<input type="button" value="수정취소" onclick="location.href='actorout'">
		</td>	
	</tr>
	</table>
</form>
</c:forEach>
</body>
</html>