<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.openmovie_main ol li img{
	width: 170px;
	height: 234px;
}

.openmovie_main {
    width: 100%;
    overflow-x: auto; /* 가로 스크롤 가능하게 */
    justify-content: center; /* 부모 요소 내에서 자식 요소들을 중앙 정렬 */
    margin-bottom: 100px;
    text-align: left;
}

#movielist {
    display: flex; /* Flexbox로 가로 정렬 */
    flex-wrap: wrap; /* 줄 바꿈을 허용 */
    list-style-type: none; /* 리스트의 기본 숫자 또는 점 제거 */
    padding: 0;
    margin: 0;
    justify-content: center;
}

.noimg {
    display: flex; 
    flex-wrap: wrap; /* 줄 바꿈을 허용 */
    width: 925px;
}

.movie-list {
    margin-right: 15px; /* 오른쪽 여백 */
    margin-bottom: 30px; /* 아래 여백 추가 */
    box-sizing: border-box; /* 패딩 및 마진 포함 */
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
.movie-btn{
	margin-left: 290px;
}
.opentitle{
	font-size: 24px;
  	margin-bottom: 20px;
 	text-align: center;
 	border: none;
 	background-color: white;
}
.opentitle:hover{
	color: red;
	border-bottom: 2px solid red;
}

.movie-btn button {
	padding: 0;
	margin-right: 20px;
}
</style>

</head>
<body>
<div class="openmovie_main">
  <h3 class="movie-btn">
    <button value="현재상영작" onclick="location.href='openmovieall?btn=1'" class="opentitle">현재상영작</button>
    <button value="상영예정작" onclick="location.href='openmovieall?btn=2'" class="opentitle">상영예정작</button>
    <button value="재개봉" onclick="location.href='openmovieall?btn=3'" class="opentitle">재개봉작</button>
  </h3>
    <ol class="list" id="movielist">
      <li class="noimg">
          <c:forEach items="${list }" var="open">
          	<div class="movie-list">
          	  <img alt="" src="./image2/${open.moviecover }">
          		<div class="overlay">
				  <div class="button-container">
					<p class="lay"><button value="예매하기" class="butt" onclick="location.href='step1in'">예매하기</button></p>
					<p class="lay"><button value="상세보기" class="butt" onclick="location.href='moviedetail?number=${open.movienum}'">상세보기</button></p>
				  </div>
			    </div>
			    <div class="movie-info">
			      <p class="movie-gradeimage"><img alt="" src="./image/${open.gradeimage }" style="width: 23px; height: 23px;"></p>
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
</body>
</html>