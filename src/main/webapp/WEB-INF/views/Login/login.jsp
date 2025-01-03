<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url("./loginimage/영화관스크린.jpg");
	background-size: cover;
}

.title{
	margin-left: 20%;
}
.table-part{
	margin-left: 55%;
	text-align: left;
	border: 1px solid black;
	padding: 50px 50px;
	border-radius: 5px;
	background-color: #eee;
	box-shadow: 0 2px 5px rgba(0,0,0,.25);
	
}
.login{
	padding: 10px 0;
}
.id, .pw{
	width: 100%;
	padding: 10px 0;
	border-radius: 5px;
}
.submit{
	margin-top: 15%;	
	margin-bottom: 10%;
	width: 100%;
	padding: 10px 0;
	border-radius: 5px;
	background-color: green;
	color: white;
}
	
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="title" style="color: white;">LOGIN</h1>
<div class="loginform">
<form action="logincheck" method="post" class="form-part">
	<table class="table-part" align="left">
		<tr>
		   <th class="login" colspan="2">아이디</th>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="id" class="id" placeholder="아이디를 입력하세요."></td>
		</tr>
		<tr>
		   <th class="login" colspan="2">비밀번호</th>
		</tr>
		<tr>
		   <td colspan="2"><input type="password" name="pw" class="pw" placeholder="비밀번호를 입력하세요."></td>
		</tr>
		<tr style="text-align: center;">
		<td colspan="2">
		   <input type="submit" class="submit" value="로그인">
		</td>
		</tr>
		<tr>
		  <td colspan="2">
		    <a href="#">아이디 찾기 |</a> 
		    <a href="#">비밀번호 찾기 |</a> 
		    <a href="member">회원가입</a>
		  </td>
		</tr>
	</table>
</form>
</div>
</body>
</html>