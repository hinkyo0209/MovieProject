<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function showAlert() {
   alert('예매가 성공적으로 완료되었습니다.');
   return true;
}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#ticketInfo {
letter-spacing: 15px;
font-size: 30px;
background-color: #282828;
color: #f4f4f4;
border: 2px solid black;
}
#btn-1 {
   border: 1px;
   background-color: #AECDFF;
   cursor: pointer;
   border-radius: 5px;
   font-size: 20px;
}
/* 사이드바 */
.sideba{
   position:absolute;
   width: 90px;
   font-size: 13px;
}
#first{
   background-color: #FFD1B7;
   padding: 70% 0;
   color: white;
}
#second{
   background-color: #D2E1FF;
   padding: 70% 0;
   color: white;
}
#third{
   background-color: #AAEBAA;
   padding: 70% 0;
}
#fourth{
   background-color: #FFFF96;
   padding: 70% 0;
   color: white;
}


.step3{
   border: 2px solid black;
   background-color: #333;
   margin-bottom: 3%;
   height: 683px;
}

.info{
   display: inline-block;
   border: 2px solid black;
   text-align: left;
   padding: 5% 3%;
   background-color: #444;
   border-radius: 10px;
   margin-left: 3%;
   vertical-align: top;
   margin-top: 2%;
}
.movieinfo{
   display: inline-block;
   border: 2px solid black;
   padding: 2% 3%;
   background-color: #444;
   margin: 2% 0;
   border-radius: 10px;
   margin-left: 4%;
}
.in{
   font-size: 17px;
   font-weight: 550;
}
.c{
   font-size: 17px;
}
.grade{
   font-size: 17px;
   font-weight: 550;
   margin-bottom: 10%;
   border-bottom: 1px solid white;
   color: white;
}
.count, .name{
   color: white;
}
.date, .time, .theater{
   text-align: left;
}
.date1, .time1, .theater1{
   font-size: 17px;
   font-weight: 550;
   color: white;
}
.date2, .time2, .theater2{
   font-size: 17px;
   color: white;
}
.dan{
   margin: 0 25%;
   margin-top: 2%;
   text-align: left;
   color: white;
}
.dan1{
   font-size: 17px;
   font-weight: 550;
   margin-bottom: 5px;
}
.dan2{
   margin-left: 3%;
}
</style>
</head>
<body>
<!--사이드바 -->
<aside class="sideba">
<div class= 'container'> 
  <section id= 'first'>
    <h1>1. 상영시간</h1>
  </section>
  
  <section id= 'second'>
    <h1>2. 인원/좌석</h1>
  </section>
  
 <section id= 'third'>
   <h1>3. 예매정보확인</h1>
  </section>
  
 <section id= 'fourth'>
   <h1>4. 예매완료</h1>
  </section>
</div>
</aside>
<!--  -->
<div id="ticketInfo">
      <span>예매 정보<span> | </span>영화 정보</span>
</div>
<div class="step3">
<div class="info">
  <div class="name">
    <span class="in">예매자명&emsp;</span><span class="c"> : ${reserved_name}</span>
  </div>
  <div class="count">
    <span class="in">성인&emsp;&ensp;&ensp;&emsp;</span><span class="c"> : ${adult_count}명</span>
  </div>
  <div class="count">
    <span class="in">청소년&emsp;&emsp;</span><span class="c"> : ${minor_count}명</span>
  </div>
  <div class="count">
    <span class="in">경로&emsp;&ensp;&ensp;&emsp;</span><span class="c"> : ${elderly_count}명</span>
  </div>
  <div class="count">
    <span class="in">장애인&emsp;&emsp;</span><span class="c"> : ${disabled_count}명</span>
  </div>
   <div class="count">
   <span class="in">좌석&emsp;&emsp;</span><span class="c"> : ${selected_seats}</span>
   </div>
</div>
  
  <div class="movieinfo">
    <div class="cover">
      <img src="./image2/${movie_cover }" alt="영화 포스터" width="200px" height="270px">
    </div>
    <div class="grade">
      <img src="./image/${grade_image}" width="20px" height="20px">
      ${movie_title}
    </div>
    <div class="date">
      <span class="date1">상영일</span><span class="date2"> : ${screening_date}</span>
    </div>
    <div class="time">
      <span class="time1">상영시간</span><span class="time2"> : ${screening_time}</span>
    </div>
    <div class="theater">
      <span class="theater1">상영관</span><span class="theater2"> : ${screening_theater}</span>
    </div>
  </div>
  
  <div class="dan">
     <div class="dan1">
       ㆍ예매완료후 주의사항
     </div>
     <div class="dan2">
       - 예매완료 후 극장에서 현장 취소 후 현금환불은 불가하오니 이점 숙지하시어 예매 하시기 바랍니다.<br>
     - 현장취소시 환불불가 및 더이상 예매를 하실 수 없으니 꼭 참고 바랍니다.
     </div>
  </div>
</div>
   



<form action="step4" method="get" onsubmit="return showAlert()"> <!-- POST 방식으로 데이터 전송 -->
    <!-- 숨겨진 필드를 추가하여 필요한 데이터를 전송합니다. -->
    <input type="hidden" name="movie_title" value="${movie_title}">
    <input type="hidden" name="movie_cover" value="${movie_cover}">
    <input type="hidden" name="grade_image" value="${grade_image}">
    <input type="hidden" name="screening_date" value="${screening_date}">
    <input type="hidden" name="screening_time" value="${screening_time}">
    <input type="hidden" name="screening_theater" value="${screening_theater}">
    <input type="hidden" name="selected_seats" value="${selected_seats}">
    <input type="hidden" name="adult_count" value="${adult_count}">
    <input type="hidden" name="minor_count" value="${minor_count}">
    <input type="hidden" name="elderly_count" value="${elderly_count}">
    <input type="hidden" name="disabled_count" value="${disabled_count}">
    <input type="hidden" name="reserved_name" value="${reserved_name}">
    <input type="hidden" name="user_id" value="${user_id}">

    <input type="submit" value="예매하기" id="btn-1"> <!-- 제출 버튼 -->
</form>
</body>
</html>