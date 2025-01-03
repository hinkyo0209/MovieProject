<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="1000px" align="center">
<tr>
   <th>영화번호</th>
   <th>스케쥴번호</th>
   <th>상영날짜</th>
   <th>상영시간</th>
   <th>상영관</th>
   <th>삭제/수정</th>
</tr>
<c:forEach items="${list}" var="schd">
<tr>
   <td>${schd.movienum}</td>
   <td>${schd.schedule_num}</td>
   <td>${schd.screening_date}</td>
   <td>${schd.screening_time}</td>
   <td>${schd.screening_theater}</td>
   <td>
   <a href="scheduledelete?number=${schd.schedule_num}">삭제</a>
   <a href="scheduleupdate?number=${schd.schedule_num}">수정</a>
   </td>
</tr>
</c:forEach>
<tr>
   <td colspan="2">
   <input type="button" value="메인" onclick="location.href='./'">
   </td>
</tr>
</table>
</body>
</html>