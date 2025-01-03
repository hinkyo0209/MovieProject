<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.usermovie_main ol li img{
	width: 170px;
	height: 234px;
}

.usermovie_main {
    width: 100%;
    overflow-x: auto; /* 가로 스크롤 가능하게 */
    justify-content: center; /* 부모 요소 내에서 자식 요소들을 중앙 정렬 */
    margin-bottom: 100px;
    text-align: left;
}

#movielist {
    display: flex; /* Flexbox로 가로 정렬 */
    list-style-type: none; /* 리스트의 기본 숫자 또는 점 제거 */
    padding: 0;
    margin: 0;
    justify-content: center;
}

#movielist .noimg {
    display: flex;
}

.movie-list {
    margin-right: 15px; /* 각 이미지 간 간격 */
}

.movie-list img {
    width: 150px; /* 이미지 크기 조정 */
    height: auto; /* 이미지 비율 유지 */
}

.movie-info {
    display: flex; /* 플렉스 박스 사용 */
    gap: 10px; /* 항목 간의 간격 조정 */
    justify-content: center; /* 중앙 정렬 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.movie-info p {
    margin: 0; /* 마진 제거 */
}
.movie-title{
	width: 15ch;
	font-size: 15px;
	font-weight: 550;
}

.opentitle{
	font-size: 24px;
  	margin-bottom: 20px;
 	text-align: left;
 	margin-left: 270px;
}
.opentitlety2{
	margin-left: 670px;
	font-size: 13px;
}
.ranktitle{
	color: red;
}
.movie-runningtime p{
	margin: 0;
}
.movietime {
  font-size: 12px;
  color: #666;
  top:20px;
  text-align: center;
  display: block;
}
.movie-list{
	position: relative;
}
.overlay{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 234px;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgb(0,0,0,0.5);
	opacity: 0;
	transition: opacity 0.2s;
}
.movie-list:hover .overlay{
	opacity: 1;
}
.overlay {
    /* Overlay 스타일 추가 */
}

.button-container {
    display: flex; /* 플렉스 박스 사용 */
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 가운데 정렬 */
}

.lay {
    margin: 10px 0; /* 간격 조정 */
}

.butt {
    background-color: #4CAF50; /* 배경색 */
    color: white; /* 글자색 */
    border: none; /* 테두리 제거 */
    padding: 10px 20px; /* 패딩 */
    cursor: pointer; /* 커서 모양 변경 */
    border-radius: 5px; /* 둥근 모서리 */
}

.butt:hover{
    background-color: #45a049; /* Hover 시 색상 변경 */
}
.movie-search-box{
   height: 30px;
   width: 300px;
   background: white;
   border-radius: 40px;
   padding: 10px;
   border : 1px solid black;
   margin-left: 40%;
}
.movie-search-txt{
   border: none;
   background: #ffffff;
   
   outline: none;
   float: left;
   padding-left: 10px;
   color: black;
   font-size: 16px;
   line-height: 30px;
   width: 200px;
}
.movie-search-btn {
   color: black;
   width: 40px;
   height: 100%;
   border-radius: 50%;
   background: white;
   border: none;
   font-size: 16px;
   display: flex;
   justify-content: center;
   align-items: center;
}
</style>

</head>
<body>

<div class="usermovie_main">
  <h3 class="opentitle">현재 상영작 <strong class="ranktitle">TOP 5</strong>
  <a href="openmovieall?btn=1" class="opentitlety2">더보기></a>
  </h3>
	<ol class="list" id="movielist">
		<li class="noimg">
			<c:forEach items="${open }" var="open" begin="0" end="4">
				<div class="movie-list">
					<img alt="" src="./image2/${open.moviecover }">
					  <div class="overlay">
						<div class="button-container">
						  <p class="lay"><button value="예매하기" class="butt" onclick="location.href='step1in'">예매하기</button></p>
						   <p class="lay"><button value="상세보기" class="butt" onclick="location.href='moviedetail?number=${open.movienum}'">상세보기</button></p>
						</div>
					  </div>
						<div class="movie-info">
							<p class="movie-gradeimage"><img alt="" src="./image/${open.gradeimage}" style="width: 23px; height: 23px;"></p>
							<p class="movie-title">${open.movietitle }</p>
						</div>
						<div class="movie-runningtime">
							<p class="movietime"><i class="fa fa-clock" aria-hidden="true"> ${open.runningtime }분</i></p>
						</div>
				</div>
			</c:forEach>		
		</li>
	</ol>
</div>

<div class="usermovie_main">
  <h3 class="opentitle">상영 예정작 <strong class="ranktitle">TOP 5</strong>
  <a href="openmovieall?btn=2" class="opentitlety2">더보기></a>
  </h3>
	<ol class="list" id="movielist">
		<li class="noimg">
			<c:forEach items="${noopen }" var="noopen" begin="0" end="4">
				<div class="movie-list">
					<img alt="" src="./image2/${noopen.moviecover }">
					  <div class="overlay">
						<div class="button-container">
						  <p class="lay"><button value="예매하기" class="butt" onclick="location.href='step1in'">예매하기</button></p>
						   <p class="lay"><button value="상세보기" class="butt" onclick="location.href='moviedetail?number=${noopen.movienum}'">상세보기</button></p>
						</div>
					  </div>
						<div class="movie-info">
							<p class="movie-gradeimage"><img alt="" src="./image/${noopen.gradeimage}" style="width: 23px; height: 23px;"></p>
							<p class="movie-title">${noopen.movietitle }</p>
						</div>
						<div class="movie-runningtime">
							<p class="movietime"><i class="fa fa-clock" aria-hidden="true">${noopen.runningtime }분</i></p>
						</div>
				</div>
			</c:forEach>		
		</li>
	</ol>
</div>

<div class="usermovie_main">
  <h3 class="opentitle">재개봉 <strong class="ranktitle">TOP 5</strong>
  <a href="openmovieall?btn=3" class="opentitlety2">더보기></a>
  </h3>
	<ol class="list" id="movielist">
		<li class="noimg">
			<c:forEach items="${reopen }" var="reopen" begin="0" end="4">
				<div class="movie-list">
					<img alt="" src="./image2/${reopen.moviecover }">
					  <div class="overlay">
						<div class="button-container">
						  <p class="lay"><button value="예매하기" class="butt" onclick="location.href='step1in'">예매하기</button></p>
						   <p class="lay"><button value="상세보기" class="butt" onclick="location.href='moviedetail?number=${reopen.movienum}'">상세보기</button></p>
						</div>
					  </div>
						<div class="movie-info">
							<p class="movie-gradeimage"><img alt="" src="./image/${reopen.gradeimage}" style="width: 23px; height: 23px;"></p>
							<p class="movie-title">${reopen.movietitle }</p>
						</div>
						<div class="movie-runningtime">
							<p class="movietime"><i class="fa fa-clock" aria-hidden="true">${reopen.runningtime }분</i></p>
						</div>
				</div>
			</c:forEach>		
		</li>
	</ol>
</div>
</body>
</html>