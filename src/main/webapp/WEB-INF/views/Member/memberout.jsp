<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,td{
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-hover">
<caption><h2>회원자료출력</h2></caption>
<tr>
   <th>회원명</th>
   <th>아이디</th>
   <th>비밀번호</th>
   <th>전화번호</th>
   <th>주소</th>
   <th>이메일</th>
   <th>생년월일</th>
   <th>성별</th>
   <th>페이크질문</th>
   <th>수신여부</th>
   <th>약관동의</th>
</tr>
<c:forEach items="${list }" var="mm">
<tr>
   <td>${mm.name }</td>
   <td>${mm.id }</td>
   <td>${mm.pw }</td>
   <td>${mm.phone }</td>
   <td>${mm.address }</td>
   <td>${mm.email }${mm.domain }</td>
   <td>${mm.birthdate }</td>
   <td>${mm.sb }</td>
   <td>${mm.question }</td>
   <td>${mm.reception }</td>
   <td>${mm.conditions }</td>
</tr>
</c:forEach>
</table>
</body>
</html>