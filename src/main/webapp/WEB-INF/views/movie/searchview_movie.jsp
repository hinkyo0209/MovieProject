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
   background: black;
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
   margin-top: 10px;
   width: 800px;
   height: 200px;
   margin-left: 350px;
   border: 1px solid black;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

        <c:if test="${not empty list}">
            <c:forEach items="${list}" var="movie">
                <table class="table-1">
                    <input type="hidden" name="movienum" value="${movie.movienum}">
                    <tr class="movie-info">
                        <td rowspan="6">
                            <img src="./image2/${movie.moviecover}" class="movie-cover"> <!-- 영화 표지 -->
                        </td>
                        <td colspan="2">
                            <span class="movie-title">${movie.movietitle}</span><br>
                            <span class="movie-date">${movie.moviedate} 개봉</span><span class="text-sub">|</span>
                            <span class="movie-run"><i class="fa fa-clock" aria-hidden="true"></i>${movie.runningtime}분</span><span class="text-sub">|</span>
                            <span class="movie-grade"><img src="./image/${movie.gradeimage}" class="movie-grade-img"></span>
                            <span class="moviegrade">${movie.moviegrade}</span>
                        </td> <!-- 영화 제목 -->
                    </tr>
                    <tr>
                        <td class="sub-td">
                            <span class="sub-td1">장르</span>
                            <span>${movie.moviegenre} | ${movie.country}</span><br><br>
                            <span class="sub-td1">감독</span>
                            <span>${movie.moviedirector}</span><br><br>
                            <span class="sub-td1">출연</span>
                            <span>${movie.casting}</span><br><br>
                            <span>
                                <button type="button" class="info-btn" onclick="location.href='#'">주요정보</button>
                            </span>
                            <span>
                                <button type="button" class="casting-btn" onclick="location.href='castingdetail?number=${movie.movienum}'">감독 | 출연</button>
                            </span><br><br>
                            <button type="button" class="tic-btn" onclick="location.href='#'">예매하기</button>
                        </td>
                    </tr>
                </table>

                <table class="table-2">
                    <tr>
                        <td>${movie.moviecontent}</td>   
                    </tr>
                </table>

                <table class="table-3" width="800px">
                    <tr>
                        <td colspan="3">
                            <video src="./image3/${movie.trailer}" controls autoplay loop muted width="800px" height="400px"></video><!-- 예고편 -->
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </c:if>

        <c:if test="${empty list}">
            <p>검색 결과가 없습니다.</p> <!-- 결과가 없는 경우 메시지 -->
        </c:if>
    
</body>
</html>