<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
        padding-top: 60px;
    }
    
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
    }
    
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .so > div > .logo-bar__logo{
      font-size: 50px;
      padding: 0;
      margin: 0;
      text-decoration: ;
}
.company, #companyInfoBtn, #boardgo{
   font-size: 13px;
}
.GOP{
   display: inline-block;
   font-size: 10px;
   text-align: left;
   font-size: 13px;
   font-weight: 0;
}
.con1{
   display: inline-block;
   vertical-align: top;
}    
    
 .small-text{
   font-size: 20px;
   position: relative;
   top:13px;
   right: 113px;
   }
   .ico-1{
   color:#90AFFF; 
   } 
</style>
<meta charset="UTF-8">
<title>footer.jsp</title>
</head>
<body>
<footer>
<div class="foot">
  <div class="company">
     <a href="#" id="companyInfoBtn">회사소개</a>
     &emsp;&emsp;인재채용&emsp;&emsp;사회공헌
     &emsp;&emsp;제휴/광고/부대사업문의&emsp;&emsp;
     이용약관&emsp;&emsp;위치기반서비스 이용약관&emsp;&emsp;
     개인정보처림방침&emsp;&emsp;<a href="boardgo" id="boardgo">자주 묻는 질문</a>
  </div>
  <h1 class="so">
      <div class="con1">
         <a href="./" class="logo-bar__logo">
            <span class="ico-1"><i class="fa fa-video-camera"></i></span>
            <span style="color: #90AFFF;">
             <span>DuDBox</span><span class="small-text">ung</span>
            </span>
         </a>
    </div>
    <div class="GOP">
      경기 수원시 팔달구 덕영대로 899 3층 ARS 0507-1361-5225 대표이메일 mjy@naver.com<br>
      대표자명 민지영 · 개인정보보호책임자 황인교 · 사업자등록번호 123-45-67891 · 통신판매업신고번호 2023-경기팔달-0177<br>
      COPYRIGHT © MegaboxJoongAng, Inc. All rights reserved
    </div>
  </h1>
</div>
</footer>
<!-- 모달 -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>회사 정보</h2>
    <p>3조 프로젝트</p>
  </div>
</div>

<script>
    // 모달 관련 스크립트
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("companyInfoBtn");
    var span = document.getElementsByClassName("close")[0];

    // 버튼 클릭 시 모달 열기
    btn.onclick = function(event) {
        event.preventDefault(); // 링크의 기본 동작 방지
        modal.style.display = "block";
    }

    // X 버튼 클릭 시 모달 닫기
    span.onclick = function() {
        modal.style.display = "none";
    }

    // 모달 바깥 클릭 시 모달 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>