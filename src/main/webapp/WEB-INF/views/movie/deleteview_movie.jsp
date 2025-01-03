<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<c:forEach items="${list}" var="box">
<form action="moviedelete2" method="post">
<table border="1" width="400px" height="30px" align="center">
<tr style="background-color: #DDDDDD;">
	<td colspan="3">삭제할 영화목록</td>
</tr>
<tr>
	<th>영화번호</th>
	<td><input type="text" name="movienum" value="${box.movienum}" readonly></td>
</tr>
<tr>
	<th>영화제목</th>
	<td><input type="text" name="movietitle" value="${box.movietitle}" readonly></td>
</tr>
<tr>
	<th>장르</th>
	<td><input type="text" name="moviegenre" value="${box.moviegenre}" readonly></td>
</tr>
<tr>
	<th>나라</th>
	<td><input type="text" name="country" value="${box.country}" readonly></td>
</tr>
<tr>
	<th>러닝타임</th>
	<td><input type="text" name="runningtime" value="${box.runningtime}" readonly"></td>
</tr>
<tr>
	<th>개봉여부</th>
	<td><input type="text" name="movieopen" value="${box.movieopen}" readonly></td>
</tr>
<tr>
	<th>개봉일자</th>
	<td><input type="date" name="moviedate" value="${box.moviedate}" readonly></td>
</tr>
<tr>
	<th>줄거리</th>
	<td>
	<textarea rows="5" cols="10" name="moviecontent" readonly>${box.moviecontent}</textarea>
	</td>
</tr>
<tr>
	<th>감독</th>
	<td><input type="text" name="moviedirector" value="${box.moviedirector}" readonly></td>
</tr>
<tr>
	<th>출연진</th>
	<td><input type="text" name="casting" value="${box.casting}" readonly></td>
</tr>
<tr>
	<th>등급</th>
	<td><input type="text" name="moviegrade" value="${box.moviegrade}" readonly></td>
</tr>


<tr style="text-align: center;">
	<td colspan="2">
		<input type="submit" value="영화삭제">
		<input type="button" value="취소(메인으로)" onclick="location.href='main'">
	</td>
</tr>
</table>
</form>
</c:forEach>
</body>
</html>