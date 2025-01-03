<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
   margin: 0 10%;
}
.table-hover{
   width: 100%;
}
th{
text-align:center;
background-color: #eee;
}
td{
   border-top: 1px solid black;
}
.wri{
   width: 200px;
}
.re{
   width: 100px;
}
.date{
   width: 100px;
}
.bun{
   width: 100px;
}
</style>
</head>
<body>
<div class="container">
   <h2>게시판</h2>
      <table class="table table-hover">
         <tr>
            <th class="bun">번호</th>
            <th class="title">제목</th>
            <th class="wri">작성자</th>
            <th class="re">조회수</th>
            <th class="date">등록일</th>
         </tr>
<c:forEach items="${list }" var="board">
         <tr>
            <td>${board.boardnum }</td>
            <td><a href="detail?num=${board.boardnum}">${board.boardtitle }</a></td>
            <td>${board.boardwriter }</td>
            <td>${board.boardcnt }</td>
            <td class="board-date" data-boarddate="${board.boarddate}"></td>
         </tr>
</c:forEach>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="boardgo?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="boardgo?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="boardgo?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   
   </td>
</tr>
<!-- 페이징처리 4444444444-->
      </table>
</div>
</body>
<script>
    function timeAgo(date) {
        const now = new Date();
        const seconds = Math.floor((now - date) / 1000);
        let interval = Math.floor(seconds / 31536000); // 1 year
        if (interval > 1) return interval + "년 전";
        interval = Math.floor(seconds / 2592000); // 1 month
        if (interval > 1) return interval + "개월 전";
        interval = Math.floor(seconds / 86400); // 1 day
        if (interval > 1) return interval + "일 전";
        interval = Math.floor(seconds / 3600); // 1 hour
        if (interval > 1) return interval + "시간 전";
        interval = Math.floor(seconds / 60); // 1 minute
        if (interval > 1) return interval + "분 전";
        return "방금 전";
    }

    document.addEventListener("DOMContentLoaded", function() {
        const boardDates = document.querySelectorAll('.board-date');
        boardDates.forEach(function(element) {
            const boardDate = new Date(element.getAttribute('data-boarddate'));
            element.innerText = timeAgo(boardDate);
        });
    });
</script>
</html>