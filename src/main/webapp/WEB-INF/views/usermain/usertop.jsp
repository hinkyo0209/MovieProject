<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script>
    function validateSearch() {
        var searchInput = document.querySelector(".movie-search-txt").value;
        if (searchInput.trim() === "") {
            alert("검색어를 입력해 주세요.");
            return false; // 폼 제출 방지
        }
        return true; // 유효성 검사 통과
    }
</script>
<style type="text/css">


html {
  font-family: "Ubuntu", sans-serif;
  font-weight: 300;
  font-style: normal;
}

   body, ul, li{
      margin: 0;
      padding: 0;
      list-style: none; /*●이 표시를 없앰*/
   }
   a{
      color: inherit; /*부모 엘리먼트의 값을 물려받음*/
      text-decoration: none; /*밑줄을 없앰*/
      font-size: 15px;   
   }
   
   .menu-bar__menu-box-1 > ul ul { /*2차 메뉴만 none 표시*/
      display: none;
   }
   .menu-bar__menu-box-1 > ul > li:hover > ul { /* 1차 메뉴에 마우스가 올라가면 2차 메뉴가 나오게한다 */
      display: block;
   }
   .menu-bar__menu-box-1 > ul > li { /* 1차 메뉴를 제한 구역 설정 */
      position: relative;
   }
   .menu-bar__menu-box-1 > ul > li > ul {
      position: absolute;
      top: 100%;      /* 2차 메뉴를 1차 메뉴 아래로 위치 */
      left: 0;      /* 2차 메뉴를 1차 메뉴의 왼쪽 벽에 붙임 */
      width: 100%;
   }

   .menu-bar__menu-box-1 > ul > li{ /*<li>는 기본적으로  block 형태라 inline-block 형태로 바꿔줌 왜? inline-block 형태로 바꾸면 text-align으로 정렬 가능*/
      display: inline-block;
   }
   .menu-bar__menu-box-1 > ul{
      margin-left: 15%;
      text-align: left;
   }
   .menu-bar__menu-box-1 > ul > li > ul {
      text-align: center;
   }
   .logo-bar > div{
      margin-left: 15%;
      text-align:left;
   }
   .logo-bar > div > .logo-bar__logo{
      font-size: 5rem;
   }
   .menu-bar__menu-box-1 > ul > li > a {
      display: block;
      font-size: 25px;
      padding: 10px 20px; /*위/아래 10px, 좌/우 30px 확장*/
   }
   .menu-bar__menu-box-1 > ul > li:hover > a {
      background-color: black;
      color: white;
   }
   .menu-bar__menu-box-1 > ul > li > ul > li:hover > a{
      background-color: black;
      color: white;
   }
   .menu-bar__menu-box-1 > ul > li > .fa-btn:hover{
      background-color: white;
      color: black;
   }
   .logo-bar > div > .logo-bar__logo{
      font-size: 50px;
      text-decoration: ;
   }
   .logo-bar > div > .login-bar{
      margin-left: 70%;
   }
   .movie-search-box{
   height: 30px;
   width: 300px;
   background: white;
   border-radius: 40px;
   padding: 10px;
   border : 1px solid black;
   margin-left: 50%;
}
.movie-search-txt{
   border: none;
   background: #ffffff;
   
   outline: none;
   float: left;
   padding-left: 10px;
   color: black;
   font-size: 16px;
   line-height: 30px;
   width: 200px;
}
.movie-search-btn {
   color: #E56D29;
   width: 30px;
   height: 30px;
   border-radius: 30%;
   background: white;
   border: none;
   font-size: 25px;
   display: flex;
   justify-content: center;
   align-items: center;
   padding-left: 50px;
}
   fa-user-circle{
       margin: 0;
       padding: 0;  
   }
   .fa-btn{
      margin-left: 510%;
   }
   .logout{
      color: red;
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
</head>
<body>
<header>
   <h1 class="logo-bar con-min-width">
      <div class="text-align-center con">
         <a href="./" class="logo-bar__logo">
            <span class="ico-1"><i class="fa fa-video-camera"></i></span>
            <span style="color: #90AFFF;">
             <span>DuDBox</span><span class="small-text">ung</span>
            </span>
         </a>

         <c:choose>
            <c:when test="${loginState==true }">
              <li class="login-bar"><a href="#"><span class="glyphicon glyphicon-user"><strong style="color: green;">
              ${member.name}</strong>님 안녕하세요.</span></a>
              <span class="logout">
              <a href="logout">로그아웃</a></span></li>
            </c:when>
            <c:otherwise>
              <li class="login-bar"><a href="login">회원가입 및 로그인</a></li>
            </c:otherwise>
         </c:choose>
      </div>
   </h1>
   
   <h2 class="menu-bar con-min-width">
      <div class="con">
         <nav class="menu-bar__menu-box-1">
            <ul class="inline-grid">
               <li>
                  <a href="#">영화</a>
                    <ul>
                      <li><a href="usermovie">전체영화</a></li>
                    </ul>         
               </li>
                <li>
                  <a href="#">예매하기</a>
                     <ul>
                        <li><a href="step1in">예매하기</a></li>
                        <li><a href="myticket">예매내역</a></li>
                     </ul>
               </li>
               <li>
                  <a href="boardgo">공지사항</a>
               </li>
               <li>
                 <form class="movie-search-box" action="searchsave" method="post" onsubmit="return validateSearch();">
                  <div>
                     <input type="hidden" name="key" value="movietitle">
                     <input type="hidden" name="key" value="moviegenre">
                  </div>
                  <div>
                     <input class="movie-search-txt" type="text" name="svalue" placeholder="검색어를 입력하세요">
                  </div>
                  <div>
                     <button class="movie-search-btn" type="submit">
                          <i class="fa-solid fa-magnifying-glass"></i>
                       </button>   
                  </div>   
               </form>
               </li>
               <li>
                  <a href="mypage" class="fa-btn">
                  <i class="fa fa-user-circle"></i>
                  </a>
               </li>
            </ul>
         </nav>
      </div>
   </h2>
</header>
</body>
</html>