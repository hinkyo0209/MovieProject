<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
 background-color: #FFC6A5;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="1500px" height="150px" align="center">
   <tr>
      <th>예매순서</th>
      <th>티켓번호</th>
      <th>회원아이디</th>
      <th>회원명</th>
      <th>예매일시</th>
      <th>상영날짜</th>
      <th>상영시간</th>
      <th>상영관</th>
      <th>영화명</th>
      <th>영화표지</th>
      <th>좌석</th>
      <th>성인 수</th>
      <th>청소년 수</th>
      <th>경로 수</th>
      <th>장애인 수</th>
   </tr>
   <c:forEach items="${tlist }" var="ti">
   <tr>
      <td>${ti.ticketnum}</td>
      <td>${ti.ticket_number}</td>
      <td>${ti.user_id}</td>
      <td>${ti.reserved_name}</td> <!-- 회원명 -->
      <td>${ti.reservation_date}</td>
      <td>${ti.screening_date}</td>
      <td>${ti.screening_time}</td>
      <td>${ti.screening_theater}</td>
      <td>${ti.movie_title}</td>
      <td><img src="./image2/${movie_cover }" alt="영화 포스터" width="200px" height="270px"></td>
      <td>${ti.selected_seats}</td>
      <td>${ti.adult_count}</td>
      <td>${ti.minor_count}</td>
      <td>${ti.elderly_count}</td>
      <td>${ti.disabled_count}</td>
   </tr>
   </c:forEach>
</table>
</body>
</html>