<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function signupConfirm(){
	var f = document.frm;
	//name유효성검사
	var vname = /^[가-힣]{2,5}$/;
	   var cname=f.name.value;
	   if(cname==""){
	      alert("이름을 입력해주세요");
	      f.name.select();
	      return false;
	   }
	   else if(!vname.test(cname)){
	      alert("이름이 오직 한글로만 2~5자이내 가능합니다");
	      f.name.select();
	      return false;
	   }
	   //pw유효성검사
	   var vpw=/^[a-z0-9]*$/;
	   var cpw=f.pw.value;
	   if(cpw==""){
	      alert("비밀번호를 입력해주세요");
	      f.pw.select();
	      return false;
	   }
	   else if(!vpw.test(cpw)){
	      alert("비밀번호는 오직 영어소문자 와 숫자로만 가능합니다");
	      f.name.select();
	      return false;
	   }
	   //phone유효성검사
	   var vphone=/^\d{3}-\d{4}-\d{4}$/;
	      var cphone=f.phone.value;
	      if(cphone==""){
	         alert("전화번호는 반드시 입력해주세요");
	         f.phone.select();
	         return false;
	      }
	      else if(!vphone.test(cphone)){
	         alert("전화번호는 010-1111-2222 형식으로 가능합니다.");
	         f.phone.select();
	         return false;
	      }
	  //address유효성검사
	      var vaddress=/^[가-힣0-9\s$/g]{3,50}$/;
		   var caddress=f.address.value;
		   if(caddress==""){
		      alert("주소를 입력해주세요");
		      f.address.select();
		      return false; 
		   }
		   else if(!vaddress.test(caddress)){
		      alert("주소는 오직 한글과 숫자로 만 입력이 가능합니다");
		      f.name.select();
		      return false;
		   }
	//실행
	$('#emailForm').submit();   
}
</script>
<style type="text/css">
	.upform{
		border: 1px solid black;
		margin: 0 30%;
		padding: 2% 0;
	}
	.up{
		width: 100;
		height: 20px;
	}

input[placeholder]{
text-align: left;	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update2" method="post" id="emailForm" name="frm" class="upform">
<table class="table table-hover" align="center">
<c:forEach items="${list }" var="list">
<tr>
	<th>회원명</th>
	<td>
	<input type="text" name="name" value="${list.name }" placeholder="회원명입력" class="up" >
	<input type="hidden" name="id" value="${list.id }">	
	</td>
</tr>
<tr>
	<th>새 비밀번호</th>
	<td>
	<input type="password" name="pw" value="${list.pw }" placeholder="새 비밀번호입력" class="up">
	</td>
</tr>

<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone" value="${list.phone }" placeholder="전화번호입력" class="up"></td>
</tr>

<tr>
	<th>주소</th>
	<td><input type="text" name="address" value="${list.address }" placeholder="주소입력" class="up"></td>
</tr>
</c:forEach>
<tr style="text-align: center;">
	<td colspan="5">
		<input type="button" value="변경완료" onclick="signupConfirm()" class="mypage">
		<input type="button" value="취소" onclick="location.href='./'">		
	</td>
</tr>
</table>
</form>
</body>
</html>