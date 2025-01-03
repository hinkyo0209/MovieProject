<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.table-1{
	margin-left: 350px;
	text-align: left;
}

.text-sub{
	padding: 0 50px;
}

.sub-td{
	padding-left: 20px;
	text-align: left;
}

.sub-td1{
	font-weight: 500;
	border: 1px solid black;
	padding: 0 20px;
}
.info-btn{
	margin-left: 100px;
	padding: 5px 10px;
}
.casting-btn{
	margin-left: 10px;
	padding: 5px 10px;
}

.sub-a1{
	border: 1px solid black;
	margin-left: 10px;
	padding: 5px 10px;
	background: #eee;
}

.movie-cover{
	width: 250px;
	height: auto;
}

.movie-grade-img{
	width: 23px;
	height: 23px;
}

.movie-title{
	font-size: 25px;
	font-weight: 800;
	padding-left: 20px;
}

.movie-date{
	padding-left: 20px;
}

.movie-run{
}
.tic-btn{
	margin-left: 60px;
	padding: 10px 100px;
	background: red;
	color: white;
	border: none;
}
.tic-btn:hover{
	color: black;
	background: gray;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table-1">
<input type="hidden" name="movienum" value="${dto.movienum }">
<tr class="movie-info">
   <td rowspan="6">
   <img src="./image2/${dto.moviecover}" class="movie-cover">      <!-- 영화표지 -->
   </td>
   
   <td colspan="2">
     <span class="movie-title">${dto.movietitle}</span><br>
	 <span class="movie-date">${dto.moviedate} 개봉</span><span class="text-sub">|</span>
	 <span class="movie-run"><i class="fa fa-clock" aria-hidden="true"></i>${dto.runningtime}분</span><span class="text-sub">|</span>
	 <span class="movie-grade"><img src="./image/${dto.gradeimage}" class="movie-grade-img"></span>
	 <span class="moviegrade">${dto.moviegrade}</span>
   </td>   <!-- 영화제목 -->
<tr>
<tr>
	<td class="sub-td">
	  <span class="sub-td1">장르</span>
	  <span>${dto.moviegenre} | ${dto.country}</span><br><br><!-- 장르 --><!-- 등급 --><!-- 상영시간 --><!-- 나라 -->
 	  <span class="sub-td1">감독</span>
	  <span>${dto.moviedirector}</span><br><br><!-- 감독 --><!-- 출연진 -->
	  <span class="sub-td1">출연</span>
	  <span>${dto.casting}</span><br><br>
	  <span>
	  	<button type="button" class="info-btn" onclick="location.href='moviedetail?number=${dto.movienum}'">주요정보</button>
	  </span>
	  <span>
	  	<button type="button" class="casting-btn" onclick="location.href='castingdetail?number=${dto.movienum}'">감독 | 출연</button>
	  </span><br><br>
	  <button type="button" class="tic-btn" onclick="location.href='./step1in'">예매하기</button>
	</td>
</tr>
</table>

<table width="800px" align="center" style="text-align: left;">
<tr style="background-color: gray; margin-left: 3px;">
   <th colspan="4">출연</th>
</tr>
</table>


<table width="800px" align="center" style="text-align: left;">
<c:forEach items="${list}" var="box">
<tr>
   <td rowspan="6">
   <img src="./actorimage/${box.actorimage}" width="105px" height="120px">
   </td>
   <td style="color: orange;">
   <strong>주연</strong>
   </td>
</tr>

<tr>
   <td>${box.actor}</td>
</tr>

<tr>
   <td>-------------------------------------</td>
</tr>

<tr>
   <td>${box.actortv1}</td>
</tr>

<tr>
   <td>${box.actortv2}</td>
</tr>

<tr>
   <td>${box.actortv3}</td>
</tr>

</c:forEach>
</table>
</body>
</html>