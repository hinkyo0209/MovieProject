<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
   $(".seat_class").click(function() {
      seat_info = $(this).data("seat_info");
      $("#seat_info").val(seat_info);
   });
    $(".openModalPop").click(function() {
       //
       var movie_num = $(this).data('movie_num'); // 영화 번호 추가
       var schedule_num = $(this).data('schedule_num'); // 일정 번호 추가
       var movietitle = $(this).data('movietitle'); // 영화 제목 추가
       var gradeimage = $(this).data('gradeimage'); // 등급 이미지 추가
       var moviegrade = $(this).data('moviegrade'); // 등급 추가
       //
       //클릭한 버튼에서 데이터 가져오기
       var screening_time=$(this).data('screening_time');
       var screening_theater=$(this).data('screening_theater');
       
       //
       console.log("Movie Num: " + movie_num);
       console.log("Schedule Num: " + schedule_num);
       console.log("Movie Title: " + movietitle);
       console.log("Grade Image: " + gradeimage);
       console.log("Screening Time: " + screening_time);
       console.log("Screening Theater: " + screening_theater);
       console.log("Movie Grade: " + moviegrade);
       //
       
       //모달 내용 업데이트
       $("#banner_online h2").text(movietitle); //영화 제목 업데이트
       //$("#banner_online.pop_content p:nth-child(1)").text("1)상영시간대");
       $("#banner_online .p_bottom").eq(0).text("- " + screening_time); // 상영시간 업데이트
       $("#banner_online .p_bottom").eq(1).text("- " + screening_theater); // 상영관 업데이트
       //$("#banner_online .p_screening_theater").text("- " + screening_theater); // 상영관 업데이트
       $("#banner_online .p_gradeimage").attr("src","./image/" + gradeimage); // 등급이미지 업데이트
       $("#banner_online .p_bottom").eq(2).text("본 영화는 " + moviegrade + " 영화입니다."); // 영화 등급 업데이트
        
       //
        $("#banner_online").fadeIn();
        $("#modal").fadeIn();
        //가져가는 내용 업데이트
        $("#banner_online_link").attr("href","step2?movie_num=" + movie_num + "&schedule_num=" + schedule_num);
    });

    $("#close_button").click(function(){
        $("#banner_online").fadeOut();
        $("#modal").fadeOut();
    });
});

</script>


<!-- 스타일 -->
<style type="text/css">
.openModalPop {
   float: left;
   width: 100px;
   height: 50px;
   background-color: #ccc;
   border-radius: 20px;
   
   box-shadow: 3px 3px 3px black;
   
   transition-duration:0.3s;
   cursor: pointer;
}

.openModalPop:active {
   margin-left: 5px;
   margin-top: 5px;
   box-shadow: none;
   cursor: pointer;
}

<!-- -->

#banner_online {
    height: 270px;
    width: 350px;
    border: 1px solid black;
    box-shadow: 3px 3px 7px 1px grey;
    background-color: white;
    z-index: 9999;
    margin-left: 3%;
    margin-top: 2%;
    display: none;
    position: fixed;
}
#banner_online h2 {
    text-align: center;
    font-size: 17px;
    margin-bottom: 10px;
}

#banner_online p .second {
    margin-left: 6px;
}

.pop_content {
    font-size: 13px;
    margin-left: 20px;
}

#banner_online_how {
    height: 78px;
    width: 444px;
    margin-left: 28px;
    border: 1px solid #82bf77;
    margin-top: 22px;
}

#banner_online_how h3 {
    font-size: 12px;
    margin-left: 6px;
    margin-top: 16px;
}

#close_button {
    float: right;
    margin-top: -3px;
}

.p_bottom {
    margin-left: 30px;
}

#modal {
  position:fixed;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  top: 0;
  left: 0;
  z-index: 99;
  display: none;
}
/* 사이드바 */
.sideba{
   position:absolute;
   width: 90px;
   font-size: 13px;
   
}
#first{
   background-color: #FF9E7D;
   padding: 80% 0;
}
#second{
   background-color: #D2E1FF;
   padding: 80% 0;
   color: white;
}
#third{
   background-color: #D2FFD2;
   padding: 80% 0;
   color: white;
}
#fourth{
   background-color: #FFFF96;
   padding: 80% 0;
   color: white;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사이드바 -->
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
<form action="step1" method="get">

<table border="1" width="500px" align="center">
<caption><h2>영화선택</h2></caption>
</table>

<table width="500px" align="center">
<c:forEach items="${mlist}" var="st1_m">
   <tr>
      <td style="text-align: left;">
         <img src="./image/${st1_m.gradeimage}" width="25px" height="25px">
         <strong style="font-size: 20px;">${st1_m.movietitle}</strong>
      </td>
   </tr>

   <tr colspan="2">
      <td style="text-align: left;">
      
         <table align="center">
            <tr>
               <c:forEach items="${slist}" var="st1_s">
                  <c:if test="${st1_m.movienum == st1_s.movienum}">
                     <input type="hidden" value="${st1_s.schedule_num}">
                     <button type="button" style="width: 16.6667%; left: 0%;"
                           class="openModalPop" name="openModalPop"
                             data-movie_num="${st1_m.movienum}" 
                             data-schedule_num="${st1_s.schedule_num}" 
                             data-movietitle="${st1_m.movietitle}" 
                             data-gradeimage="${st1_m.gradeimage}" 
                           data-screening_time="${st1_s.screening_time}"
                           data-screening_theater="${st1_s.screening_theater}"
                           data-moviegrade="${st1_m.moviegrade}">
            
                           <strong>${st1_s.screening_time}</strong><br>${st1_s.screening_theater}
                     
                     </button>
                  
                  
                        <div id= "modal"> 
                        </div>
                            <div id = "banner_online">
                                <div id="close_button" style ="cursor: pointer;">
                                   <img src="./image/closeX.png">
                                </div>
                                <h2 style="background-color: #FFDBC1;" id="modal_movie_title">${st1_m.movietitle}</h2>
                                <div class="pop_content">
                                    <p>1) 상영시간대</p>
                                    <p class="p_bottom">${st1_s.screening_time}</p>
                                    <p class="p_bottom">${st1_s.screening_theater}</p>
                                    <p>
                                       <img src="./image/${st1_m.gradeimage}" width="20px" height="15px" class="p_gradeimage">
                                       <strong class="p_bottom">${st1_m.moviegrade}</strong>
                                    </p>
                                    
                                   <a id="banner_online_link" href="#" target="_self" style="float: right; margin-right: 13px;"><span style="text-align: center; color: blue;">인원/좌석 선택하러가기</span>
                                     <!-- 
                                     <button type="button" class="openModalPop">
                                        <strong>${st1_s.screening_time}</strong><br>${st1_s.screening_theater}
                                     </button>
                                     -->
                                    </a>
                                </div>
                            </div>
                                                
                  </c:if>
                  
               </c:forEach>
            </tr>
         </table>
         
      </td>   
   </tr>

</c:forEach>


</table>

</form>
</body>
</html>
