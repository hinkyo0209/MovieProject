<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("#idcheck").click(function(){
         var id=$("#id").val();
         $.ajax({
            type:"post",
            url:"idcheck1",
            data:{"id":id},
            async:true,
            success:function(data){
                   if(id.length<=5)
                   {
                	  alert("아이디의 길이는 6자 이상으로 입력해주세요")
	               		document.frm.id.select();
                	  }//아이디 길이 체크는 여기서끝 이기 때문에 다음 if문을 실행 할수있도록 }닫아줘야한다.
               //중복체크 if문           
               else if(data=="ok"){//data 안에 중복된 아이디가 없으면 사용가능
                  alert("사용 가능한 아이디입니다.");
               }
               else//data안에 아이디가 중복되면 알람창으로 이미 사용중인 아이디라고 알려준다.
               {
               alert("이미 사용중인 아이디입니다.")   
            }
         }//아이디 길이,중복 체크 if문 종료 
      });
   });
});
   function signupConfirm() {
      	var f=document.frm;
      
	   //name유효성검사
	 
	   var vname=/^[가-힣]{2,5}$/;
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
	   //id유효성검사
	
	   var vid=/^[a-zA-Z0-9]{6,12}$/;
	   var cid=f.id.value;
	   if(cid==""){
	      alert("아이디를 입력해주세요");
	      f.id.select();
	      return false;
	   }
	   else if(!vid.test(cid)){
	      alert("아이디는 오직 영어 와 숫자로만 6~12자 이내 가능합니다"); //아이디 중복체크 하기전에 이게 먼저떠야한다..
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
	   
	 //전화번호 
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
	   
	   
	   //도메인 확인
	   const domain = document.getElementById('emailDomain').value;
	   if(domain == "도메인주소 선택") {
	      alert("도메인을 선택해주세요."); // 앞부분이 비어있을 때 경고
	      return;
	   }
	   
	   //생년월일 유효성검사
	   var vbirthdate=/^[0-9]{8}$/;
	   var cbirthdate=f.birthdate.value;
	   if(cbirthdate==""){
		   alert("생년월일 입력해주세요");
		   f.birthdate.select();
		   return false;
	   }
	   else if(!vbirthdate.test(cbirthdate)){
		  alert("생년월일은 공백없이 오직 숫자만 가능합니다");
		   f.birthdate.select();
		   return false;
	   }
	   
	   //성별 유효성검사
		var sb_val = $('input[name="sb"]:checked').val();
		if(sb_val == '' || sb_val == null) {			
		  alert("성별을 선택해주세요.");
		   return false;
		}
		
		//페이크질문 유효성검사
		//const pkdomain = document.getElementByid('pk').value;
		//if(pkdomain == "질문선택"){
			//alert("질문을 선택해주세요.");
			//return;
		//}
		
		//전화번호or이메일 수신 유효성검사
		  var reception_val = $('input[name="reception"]:checked').val();
		  if(reception_val=='' || reception_val == null){
			  alert("수신정보를 선택해주세요");
			  return false;
		  }
	
	   //약관 확인
	   var conditions_val = $('input[name="conditions"]:checked').val();
	   if(conditions_val == '비동의') {
	      alert("약관에 동의해주세요.");
	      return;         
	   }

	   //실행
	   $('#emailForm').submit();
   }

   function generateEmail() {
	     const prefix = document.getElementById('emailPrefix').value.trim();
	     const domain = document.getElementById('emailDomain').value;
	
	     if (prefix === "") {
	        alert("이메일 앞부분을 입력해 주세요."); // 앞부분이 비어있을 때 경고
	        return;
	     }
	
	     const fullEmail = prefix + domain; // 도메인과 결합
	     document.getElementById('resultEmail').value = fullEmail; // 결과 출력
	     console.log(fullEmail);
   }
   
   ///return true;
   ///}
//      $(document).ready(function() {
//         $("#idcheck").click(function() {
//            var id = $("#id").val();
//            if(id == null || id == ""){
//               alert('아이디를입력해주세요');
//               $("#id").focus();
//               return false;
//            }else{
//               $.ajax({
//               type:"post",
//               url:"idcheck",
//               async:true,
//               date:{"id":id},
//               success:function(data){
//                  alert(data);
//               },
//               error:function(){
//                  alert("에러");
//               }
//              });
//            }
//         });
//      });   
</script>
<style type="text/css">
	th{
		text-align: right;
	}
	.infrom{
		border: 1px solid black;
		margin: 0 30%;
		padding: 3% 0;
		background-color: #eee;
		border-radius: 5px;
	}

	.intable{
		text-align: left;
		width: 100%;
		height: 600px;
	}
	.in{
		width: 50%;
		height: 30px;
		border-radius: 5px;
	}
	.button-part-td{
		text-align: center;
	}
	
	.login{
		padding: 10px 20px;
		background-color: green;
		color: white;
		border-radius: 5px;
	}
	#idcheck{
		background-color: green;
		color: white;
		border-radius: 5px;
	}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입자료입력</h1>
<form id="emailForm" name="frm" action="membersave" method="post" class="infrom">
<table align="center" class="intable" >
<tr>
   <th>회원명</th>
   <td><input type="text" name="name" placeholder="회원명입력" class="in"></td>
</tr>
<tr>
   <th>아이디</th>
   <td>
   <input type="text" name="id" placeholder="아이디입력" id="id" class="in">
   <input type="button" name="idcheck" id="idcheck" value="중복확인" >
   </td>
</tr>
<tr>
   <th>비밀번호</th>
   <td><input type="password" name="pw" placeholder="비밀번호입력" class="in"></td>
</tr>
<tr>
   <th>전화번호</th>
   <td> 
   <input type="text" name="phone" placeholder="예)010-1234-5678" class="in">
   </td>
</tr>
<tr>
   <th>주소</th>
   <td>
   <input type="text" name="address" placeholder="주소입력" class="in">
   </td>
</tr>
<tr>
   <th>이메일</th>
         <td>
            <input type="text" id="emailPrefix" name="email" class="in" placeholder="이메일 입력" required >
            <select id="emailDomain" name="domain" onchange="generateEmail()">
               <option value="도메인주소 선택" selected>도메인을 선택하세요.</option>
               <option value="@naver.com">@naver.com</option>
               <option value="@nate.com">@nate.com</option>
               <option value="@gmail.com">@gmail.com</option>
            </select>
            <input type="hidden" id="resultEmail" name="resultEmail">
         </td>
</tr>
<tr>
   <th>생년월일</th>
   <td><input type="text" name="birthdate" id="birthdate" placeholder="예)20240716" class="in"></td>
</tr>
<tr >
   <th>성별</th>
   <td class="sb-part">
   <input type="radio" name="sb" value="남자" id="sb">남자
   <input type="radio" name="sb" value="여자" id="sb">여자
   </td>
</tr>
<tr>
   <th>비밀번호 확인 질문</th>
   <td>
   <select id="pk" name="pkdomain" onchange="generatepk()" class="pk">
   <option value="질문 선택">질문 선택
   <option value="내가 가장 좋아하는 배우는?">내가 가장 좋아하는 배우는?
   <option value="우리집 강아지 이름은?">우리집 강아지 이름은?
   <option value="내가 다니던 초등학교 이름은?">내가 다니던 초등학교 이름은?       
   <option value="나의 장래희망">나의 장래희망        
   <option value="내가 좋아하는 음식은?">내가 좋아하는 음식은?       
   </select><br>
   <input type="text" name="question" placeholder="정답입력" class="in">
   <input type="hidden" id="resultquestion" name="resultquestion">
   </td>
</tr>
<tr>
   <th>전화번호 or<br>이메일 수신</th>
   <td class="phone-part">
   <input type="radio" name="reception" value="전화수신" id="reception">전화수신
   <input type="radio" name="reception" value="email수신" id="reception">email수신
   </td>
</tr>
<tr>
   <th>약관동의</th>
   <td class="con-part">
   <input type="radio" name="conditions" value="동의" checked>동의
   <input type="radio" name="conditions" value="비동의" >비동의
   </td>
</tr>
<input type="hidden" name="num" value="1">
<tr>
   <td colspan="2" class="button-part-td">
      <input type="button" value="가입완료" onclick="signupConfirm()" class="login">
      <input type="button" onclick="location.href='./'" value="가입취소" class="login">
   </td>
</tr>
</table>
</form>
</body>
</html>