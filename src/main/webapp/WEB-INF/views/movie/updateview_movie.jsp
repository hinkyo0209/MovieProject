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
<form action="movieupdate2" method="post" enctype="multipart/form-data">
<table border="1" width="600px" height="30px" align="center">
<tr style="background-color: #DDDDDD;">
	<td colspan="3">수정할 영화목록</td>
</tr>
<tr>
	<th>영화번호</th>
	<td><input type="text" name="movienum" value="${box.movienum}" readonly style="background-color: #DDDDDD;"></td>
</tr>
<tr>
	<th>영화제목</th>
	<td><input type="text" name="movietitle" value="${box.movietitle}"></td>
</tr>
<tr>
	<th>장르</th>
	<td><input type="text" name="moviegenre" value="${box.moviegenre}"></td>
</tr>
<tr>
	<th>나라</th>
	<td><input type="text" name="country" value="${box.country}"></td>
</tr>
<tr>
	<th>러닝타임</th>
	<td><input type="text" name="runningtime" value="${box.runningtime}"></td>
</tr>
<tr>
	<th>개봉여부</th>
	<td><input type="text" name="movieopen" value="${box.movieopen}"></td>
</tr>
<tr>
	<th>개봉일자</th>
	<td><input type="date" name="moviedate" value="${box.moviedate}"></td>
</tr>
<tr>
	<th>줄거리</th>
	<td>
	<textarea rows="5" cols="10" name="moviecontent">${box.moviecontent}</textarea>
	</td>
</tr>
<tr>
	<th>감독</th>
	<td><input type="text" name="moviedirector" value="${box.moviedirector}"></td>
</tr>
<tr>
	<th>출연진</th>
	<td><input type="text" name="casting" value="${box.casting}"></td>
</tr>
<tr>
	<th>등급</th>
	<td><input type="text" name="moviegrade" value="${box.moviegrade}"></td>
</tr>
<tr>
	<th>등급이미지</th>
	<td>
	<img alt="" src="./image/${dto.gradeimage}" width="50px" height="40px">
	<input type="file" name="gradeimage"></td>
</tr>
<tr>
	<th>표지</th>
	<td>
	<img alt="" src="./image2/${dto.moviecover}" width="50px" height="40px">
	<input type="file" name="moviecover"></td>
</tr>
<tr>
	<th>예고편</th>
	<td>
	<video src="./image3/${dto.trailer}" controls autoplay loop  width="200px" height="150px"></video>
	<input type="file" name="trailer"></td>
</tr>


<tr style="text-align: center;">
	<td colspan="2">
		<input type="submit" value="수정완료">
		<input type="button" value="취소(메인으로)" onclick="location.href='main'">
	</td>
</tr>
</table>
</form>
</c:forEach>
</body>
</html>