<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
textarea {
border: none;
outline: none;
width: 99%;
}
th{
background-color: #eee;
}
.container{
	margin: 0 20%;
}
.bde{
	width: 99%;
	height: 40px;
	border: none;
	outline: none;
}
</style>
</head>
<body>
<div class="container">
	<h2>게시글</h2>
		<div>
				<table border="1" class="table table-bordered table table-hover" width="100%" height="300px">
					<tr>
						<th>작성자</th>
						<td style="text-align:left"><input type="text" name="boardwriter" class="bde" value="${dto.boardwriter }" readonly></td>
						<th>작성날짜</th>
						  <td class="board-date" data-boarddate="${dto.boarddate}" class="bde" style="text-align: left;"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td style="text-align:left"><input type="text" name="boardtitle" class="bde" value="${dto.boardtitle }" readonly></td>
						<th>조회수</th>
						<td style="text-align:left"><input type="text" name="boardcnt" class="bde" value="${dto.boardcnt }" readonly></td>
					</tr>
					<tr>
						<th colspan="4">내용</th>
					</tr>
					<tr>
						<td colspan="4">
						<textarea rows="10" cols="150" name="boardcontent" readonly>${dto.boardcontent }</textarea>
						</td>
					</tr>
				</table>
			<input type="button" value="목록으로" onclick="location.href='boardgo'">
 		</div>
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