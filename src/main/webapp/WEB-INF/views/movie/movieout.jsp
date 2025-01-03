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
<table border="1" width="1800px" align="center">
<tr>
<th>영화번호</th><th>영화제목</th><th>장르</th><th>나라</th><th>러닝타임</th>
<th>개봉여부</th><th>개봉일자</th>			<th>감독</th><th>출연진</th>
<th>등급</th><th>등급이미지</th><th>표지</th><th>예고편</th>
<th width="45px;">삭제/수정</th>
</tr>
<c:forEach items="${list}" var="box">
<tr>
<td style="background-color: #DDDDDD;">${box.movienum}</td>
<td>
<a href="moviedetail?number=${box.movienum}">${box.movietitle}</a>
</td>
<td>${box.moviegenre}</td>
<td>${box.country}</td>
<td>${box.runningtime}분</td>
<td>${box.movieopen}</td>
<td>${box.moviedate}</td>

<td>${box.moviedirector}</td>
<td>${box.casting}</td>
<td>${box.moviegrade}</td>
<td>
<img src="./image/${box.gradeimage}" width="50px" height="40px">
</td>
<td>
<img src="./image2/${box.moviecover}" width="150px" height="100px">
</td>
<td>
<video src="./image3/${box.trailer}" controls autoplay loop muted width="200px" height="150px"></video>
</td>
<td>
<a href="moviedelete?number=${box.movienum}">삭제</a>
<a href="movieupdate?number=${box.movienum}">수정</a>
</td>
</tr>
<tr>
<td colspan="14">줄거리</td>
</tr>
<tr>
<td colspan="14" height="200px">${box.moviecontent}</td>
</tr>
</c:forEach>
</table>
</body>
</html>