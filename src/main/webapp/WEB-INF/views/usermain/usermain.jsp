<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script src="https://code.jquery.com/jquery-3.7.0.js" 
   integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" 
   crossorigin="anonymous"></script>
   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
   <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   <style type="text/css">
.slick-prev{
   left: 160px;
   z-index: 1;
}
.slick-next{
   right: 160px;
   z-index: 1;
}
.slick-prev:before, .slick-next:before {
	font-size: 40px;
}
.slide_div video{
   margin: auto;
}
.slide_div_wrap{
   padding: 15px 0 15px 0;
    background: black;
}
.image_wrap img{
   max-width: 85%;
    height: auto;
    display: block;
   margin: auto;    
}
.movie_div_wrap{
   margin-top: 20px;
}
.usermovie_main ol li img{
	width: 170px;
	height: 234px;
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

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="slide_div_wrap">
    <div class="slide_div">
      <div>
         <a>
           <video src="./image3/베테랑2_수정1.mp4" controls autoplay loop muted width="910px" height="512px"></video>
         </a>
      </div>
      <div>
        <a>
          <video src="./image3/대도시의사랑법_수정1.mp4" controls autoplay loop muted width="910px" height="512px"></video>
         </a>
      </div>
      <div>
        <a>
          <video src="./image3/더커버넌트_수정1.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
      <div>
        <a>
          <video src="./image3/빅토리.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
      <div>
        <a>
          <video src="./image3/비긴어게인.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
      <div>
        <a>
          <video src="./image3/파일럿.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
      <div>
        <a>
          <video src="./image3/조커.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
      <div>
        <a>
          <video src="./image3/안녕할부지_수정1.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
      <div>
        <a>
          <video src="./image3/사랑의하츄핑.mp4" controls autoplay loop muted width="910px" height="512px"></video>
      </a>
      </div>
     </div>
</div>

<div class="usermovie_main">
  <h3 class="opentitle">현재 상영작 <strong class="ranktitle">TOP 5</strong>
  <a href="usermovie" class="opentitlety2">더보기></a>
  </h3>
	<ol class="list" id="movielist">
		<li class="noimg">
			<c:forEach items="${list }" var="list" begin="0" end="4">
				<div class="movie-list">
					<img alt="" src="./image2/${list.moviecover }" class="cover">
						<div class="overlay">
							<div class="button-container">
							  <p class="lay"><button value="예매하기" class="butt" onclick="location.href='step1in'">예매하기</button></p>
						 	  <p class="lay"><button value="상세보기" class="butt" onclick="location.href='moviedetail?number=${list.movienum}'">상세보기</button></p>
							</div>
						</div>
						<div class="movie-info">
							<p class="movie-gradeimage"><img alt="" src="./image/${list.gradeimage}" style="width: 23px; height: 23px;"></p>
							<p class="movie-title">${list.movietitle }</p>
						</div>
				</div>
			</c:forEach>		
		</li>
	</ol>
</div>

</body>
<script type="text/javascript">
   $(document).ready(function(){
      $(".slide_div").slick(
         {
            dots: true,
            autoplay: true,
            autoplaySpeed : 45000,
            pauseOnFocus: false, //마우스 클릭시 멈춤
            pauseOnHover: false  //마우스 호버시 멈춤
         }      
      );
   });
</script>

</html>