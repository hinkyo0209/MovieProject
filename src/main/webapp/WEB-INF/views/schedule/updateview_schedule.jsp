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
<c:forEach items="${list}" var="schd">
<form action="scheduleupdate2" method="post">
<table border="1" width="600px" align="center">
<caption><h1>수정할 스케쥴</h1></caption>
<tr>
   <th>영화번호</th>
   <td><input type="number" name="movienum" value="${schd.movienum}" readonly></td>
</tr>
<tr>
   <th>스케쥴번호</th>
   <td><input type="text" name="schedule_num" value="${schd.schedule_num}" readonly></td>
</tr>
<tr>
   <th>상영날짜</th>
   <td><input type="date" name="screening_date" value="${schd.screening_date}"></td>
</tr>
<tr>
   <th>상영시간</th>
   <td><input type="time" name="screening_time" value="${schd.screening_time}"></td>
</tr>
<tr>
   <th>상영관</th>
   <td><input type="text" name="screening_theater" value="${schd.screening_theater}"></td>
</tr>

<tr style="text-align:center;">
   <td colspan="2">
      <input type="submit" value="스케쥴 수정">
      <input type="button" value="수정 취소" onclick="location.href='./'">
   </td>
</tr>
</table>
</form>
</c:forEach>
</body>
</html>