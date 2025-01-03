<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
   background-color: #D2FFD2;
   padding: 70% 0;
   color: white;
}
#fourth{
   background-color: #FFF56E;
   padding: 70% 0;
}
h3{
   color: white;
}
.ticketnum{
   font-size: 25px;
   color: skyblue;
}
.top{
   padding: 1% 0;
   background-color: #444;
   color: white;
   border-radius: 10px;
   font-size: 20px;
}
.ticket{
   text-align: center;
   background: #222;
   border-radius: 10px;
   height: 670px;
}
.myticket{
   display: inline-block;
   border-radius: 10px;
   background-color: #444;
   margin: 1% 0;
   padding: 2% 5%;
   
}
.infor{
   display: inline-block;
   text-align: left;
   padding: 1% 5%;
   background-color: #444;
   border-radius: 10px;
}
.complete{
   margin-bottom: 10%; 
   font-size: 30px;
   color: teal;
   font-weight: 600;
   padding-bottom: 30px;
   border-bottom: 2px solid black;
}
img{
   width: 170px;
   height: 234px;
}
.fon{
   font-size: 17px;
   font-weight: 500;
   color: white;
}
.c{
   font-size: 17px;
   color: white;
}
.infod{
   margin: 2% 23%;
   text-align: left;
   color: white;
}
.infod1{
   margin-bottom: 5px;
   font-size: 16px;
   font-weight: 550;
}
.infodsub2{
   margin-bottom: 20px;
   margin-left: 2%;
}
.infodsub{
   margin-left: 2%;
}
.delete{
   text-align: right;
   color: red;
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
<c:forEach items="${tlist}" var="ti">
<div class="top">
${ti.reserved_name}님의 예매 내역
</div>
<div class="ticket">
  <div class="myticket">
    <h3>영화 예매번호</h3>
    <div class="ticketnum">${ti.ticket_number}</div><br>
    <div class="movieimg"><img src="./image2/${to.movie.cover }"></div>
  </div>
  <div class="infor">
    <div class="complete">
      예매가 완료되었습니다!
    </div>
  <div class="name">
    <span class="fon">ㆍ회원명&emsp;&emsp;</span>  : <span class="c">${ti.reserved_name}</span>
  </div>
  <div class="date">
    <span class="fon">ㆍ예매일시&emsp;</span> : <span class="c">${ti.reservation_date}</span>
  </div>
  <div class="moviedate">
    <span class="fon">ㆍ상영날짜&emsp;</span> : <span class="c">${ti.screening_date}</span>
  </div>
  <div class="movietime">
    <span class="fon">ㆍ상영시간&emsp;</span> : <span class="c">${ti.screening_time}</span>
  </div>
  <div class="sctheater">
    <span class="fon">ㆍ상영관&ensp;&ensp;&emsp;</span> : <span class="c">${ti.screening_theater}</span>
  </div>
  <div class="motitle">
     <span class="fon">ㆍ영화명&ensp;&ensp;&emsp;</span> : <span class="c">${ti.movie_title}</span>
  </div>
  <div class="seats">
     <span class="fon">ㆍ좌석&emsp;&emsp;&emsp;</span> : <span class="c">${ti.selected_seats}</span>
  </div>
  <div class="adult">
     <span class="fon">ㆍ성인&emsp;&emsp;&emsp;</span> : <span class="c">${ti.adult_count}</span>
  </div>
  <div class="minor">
    <span class="fon">ㆍ청소년&ensp;&ensp;&emsp;</span> : <span class="c">${ti.minor_count}</span>
  </div>
  <div class="elderly">
     <span class="fon">ㆍ경로수&ensp;&ensp;&emsp;</span> : <span class="c">${ti.elderly_count}</span>
  </div>
  <div class="disabled">
     <span class="fon">ㆍ장애인수&ensp;&ensp;</span> : <span class="c">${ti.disabled_count}</span>
  </div>
	<div class="delete">
     <a href="deleteticket?num=${ti.ticket_number}" 
     onclick="return confirm('정말로 예매를 취소하시겠습니까?');" >예매 취소</a>
  </div>
  </div>
  <div class="infod">
     <div class="infod1">
       ㆍ상영안내
     </div>
     <div class="infodsub2">
       - 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.<br>
       - 상영시간 20분전까지 취소 가능하며, 캡쳐화면으로는 입장하실 수 없습니다.
     </div>
     <div class="infod1">
       ㆍ주차안내
     </div>
     <div class="infodsub">
       - ABC 건물 1층 주차장, 행운주차장 이용.<br>
       - 매점에서 영화티켓 제시 후, 3시간 무료주차 등록 가능.
     </div>
  </div>
</div>
</c:forEach>



      <c:if test="${empty tlist}">
         <tr>
            <td colspan="12">예매 내역이 없습니다.</td>
         </tr>
      </c:if>
   </table>
</body>
</html>