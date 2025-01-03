<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type=submit]{
text-align:right;
}
textarea {
	width : 99%;
	outline: none;
}
th{
background-color: #eee;
}
.table-bordered{
}
.container{
	margin: 0 20%;
}
.wri, .tit{
	border: 1px solid black;
}
.writer, .title{
	width: 99%;
	height: 40px;
	border: none;
	outline: none;
}
</style>
</head>
<body>
<div class="container">
	<h2>글 작성</h2>
		<div>
			<form action="boardsave" method="post">
				<table class="table table-bordered table table-hover">
					<tr>
						<th>작성자</th>
						<td class="wri"><input type="text" name="boardwriter" class="writer"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td class="tit"><input type="text" name="boardtitle" class="title"></td>
					</tr>
					<tr>
						<th colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2">
						<textarea rows="10" cols="150" name="boardcontent" class="con"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록">
						</td>
					</tr>
				</table>
			</form>
			<button type="button" value="목록으로" onclick="location.href='boardgo'">목록으로</button>
		</div>
</div>
</body>
</html>