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
	font-weight: 500;
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

.table-2{
	margin-top: 10px;
	width: 800px;
	height: 200px;
	margin-left: 350px;
	border: 1px solid black;
}
.table-3{
	text-align: left;
	margin-left: 20%;
	margin-top: 4%;
	border: 1px solid black;
}
.table-5{
	text-align: left;
	margin: 2% 20%;
}
.th-star{
	width: 50px;
	text-align: right;
}
.td-w{
	width: 100px;
}
.td-c{
	width: 795px;
	
}
.td-reply-con{
	width: 99%;
	height: 70px;
}
.th-reply-wri, .th-reply-con{
	background-color: #eee;
}
.btn-s{
	width: 100%;
	height: 70px;
}

.table-4{
	text-align: left;
	margin-left: 21%;
	margin-top: 1%;
	border: 1px solid black;
}
.th-reply-wriout{
	width: 80px;
	background-color: #eee;
}
.td-reply-conout{
	width: 860px;
	height: 70px;
	border-top: 1px solid black;
}
.star-1{
	font-weight: 550;
}
.reply-date{
	text-align: right;
	font-size: 14px;
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
     <span class="movie-title"><strong>${dto.movietitle}</span><br>
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
	  	<button type="button" class="info-btn" onclick="location.href='#'">주요정보</button>
	  </span>
	  <span>
	  	<button type="button" class="casting-btn" onclick="location.href='castingdetail?number=${dto.movienum}'">감독 | 출연</button>
	  </span><br><br>
	  <button type="button" class="tic-btn" onclick="location.href='./step1in'">예매하기</button>
	</td>
</tr>
</table>


<table class="table-2">
<tr>
	<td>${dto.moviecontent }</td>	
</tr>
</table>



<table class="table-5" width="800px">
<tr>
   <td colspan="3">
   <video src="./image3/${dto.trailer}" controls autoplay loop muted width="800px" height="400px"></video><!-- 예고편 -->
   </td>
</tr>
</table>

<!-- 한줄평 -->
<form action="replyin" method="post">
<table class="table-3">
<input type="hidden" value="${dto.movienum}" name="movienum">
  <tr>
	<th class="th-reply-wri">작성자</th><td class="td-w"><input type="text" name="replywriter" class="td-reply-wri" placeholder="작성자"></td>
	<th class="th-star">평점</th>
	  <td class="td-star">
	    <select name="star">
	      <option value="5">5점</option>
	      <option value="4">4점</option>
	      <option value="3">3점</option>
	      <option value="2">2점</option>
	      <option value="1">1점</option>
	    </select>
	  </td>
  </tr>
  <tr>
    <th class="th-reply-con">내용</th><td class="td-c" colspan="3"><input type="text" name="replycontent" class="td-reply-con" placeholder="한줄평"></td>
    <td>
      <button type="submit" class="btn-s">입력</button>
    </td>
  </tr>
</table>
</form>

<c:forEach items="${list }" var="reply">
<table class="table-4" >
  <tr>
	<th class="th-reply-wriout">${reply.replywriter }</th>
	<td class="td-reply-starout"><span class="star-1">평점 :</span> ${reply.star }점</td>
	<td class="reply-date" data-replydate="${reply.replydate}"></td>
  </tr>
  <tr>
    <td class="td-reply-conout" colspan="3">${reply.replycontent }</td>
  </tr>
</table>
</c:forEach>

</body>
<script>
    function timeAgo(date) {
        const now = new Date();
        const seconds = Math.floor((now - date) / 1000);
        let interval;
        interval = Math.floor(seconds / 31536000); // 1 year
        if (interval >= 1) return interval + "년 전";
        interval = Math.floor(seconds / 2592000); // 1 month
        if (interval >= 1) return interval + "개월 전";
        interval = Math.floor(seconds / 86400); // 1 day
        if (interval >= 1) return interval + "일 전";
        interval = Math.floor(seconds / 3600); // 1 hour
        if (interval >= 1) return interval + "시간 전";
        interval = Math.floor(seconds / 60); // 1 minute
        if (interval >= 1) return interval + "분 전";
        return "방금 전";
    }

    document.addEventListener("DOMContentLoaded", function() {
        const replyDates = document.querySelectorAll('.reply-date');
        replyDates.forEach(function(element) {
            const replyDate = new Date(element.getAttribute('data-replydate'));
            element.innerText = timeAgo(replyDate);
        });
    });
</script>
</html>