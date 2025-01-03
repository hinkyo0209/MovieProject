<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">
.mydiv{
	border: 1px solid black;
	margin: 0 30%;
	padding: 2%;
}
.table-hover{
	width: 100%;
	height: 500px;
}
input[type="password"]{
	border: none;
	outline: none;
	text-align: center;
}
.dt{
	border: 1px solid black;
	border-radius: 5px;
}
</style>
</head>
<body>
<div class="mydiv">
<table class="table table-hover">
	<h2>${dto.name}님의 회원정보</h2>
<input type="hidden" name="pw" value="${dto.pw}">
<tr>
	<th>이름</th>
	<td class="dt">${dto.name}</td>
</tr>

<tr>
	<th>아이디</th>
	<td class="dt">${dto.id}</td>
</tr>

<tr>
	<th>비밀번호</th>
	<td class="dt">
		<input type="password" name="pw" value="${dto.pw}" readonly>
	</td>
</tr>

<tr>
   <th>전화번호</th>
   <td class="dt">${dto.phone}</td>
</tr>

<tr>
   <th>주소</th>
   <td class="dt">${dto.address }</td>
</tr>

<tr>
   <th>이메일</th>
   <td class="dt">${dto.email}${dto.domain}</td>
</tr>

<tr>
	<th>생년월일</th>
	<td class="dt">${dto.birthdate}</td>	
</tr>

<tr>
	<th>성별</th>
	<td class="dt">${dto.sb}</td>
</tr>
<tr>
	<td colspan="2"><a href="myup?id=${dto.id}"><button>회원정보수정</button></a></td>
</tr>
<tr>
   <td colspan="2" class="myde"><a href="mydelete?num=${dto.id }"
   onclick="return confirm('회원 탈퇴를 하시겠습니까?');">회원 탈퇴</a></td>
</tr>
</table>
</div>
</body>
</html>