<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style type="text/css">

</style>

</head>
<body>
<c:forEach items="${list }" var="m">
<table border="1" width="600px" align="center">
<input type="hidden" name="actornum" value="${m.actornum }">
<tr>
	<th>영화번호</th>	
	<td>${m.movienum }</td>
</tr>
<tr>
	<th>이름</th>	
	<td>${m.actor }</td>
</tr>
<tr>
	<th>프로필</th>
	<td><img src="./actorimage/${m.actorimage }" width="150px" height="200px"></td>
</tr>
<tr>
	<th>대표작</th>
	<td>
		${m.actortv1}<br>
		${m.actortv2}<br>
		${m.actortv3}<br>
	</td>
</tr>
</table>
<a href="update?num=${m.actornum}">수정</a>
</c:forEach>
<input type="button" value="메인" onclick="location.href='./'">
</body>
</html>