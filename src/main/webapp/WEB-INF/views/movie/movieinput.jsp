<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
text-align: center;
}
td {
text-align: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="moviesave" method="post" enctype="multipart/form-data">
<table border="1" width="500px" height="30px" align="center">
<tr>
	<th colspan="2">영화등록</th>
</tr>
<tr>
	<th>영화제목</th>
	<td><input type="text" name="movietitle" placeholder="ex) 베테랑2"></td>
</tr>
<tr>
	<th>장르</th>
	<td><input type="text" name="moviegenre" placeholder="ex) 액션"></td>
</tr>
<tr>
	<th>나라</th>
	<td><input type="text" name="country" placeholder="ex) 대한민국"></td>
</tr>
<tr>
	<th>러닝타임</th>
	<td><input type="text" name="runningtime" placeholder="ex) 120"></td>
</tr>
<tr>
	<th>개봉여부</th>
	<td>
	<input type="radio" name="movieopen" value="현재상영영화">현재상영영화<br>
	<input type="radio" name="movieopen" value="개봉예정영화">개봉예정영화<br>
	<input type="radio" name="movieopen" value="재개봉">재개봉
	</td>
</tr>
<tr>
	<th>개봉일자</th>
	<td><input type="date" name="moviedate"></td>
</tr>
<tr>
	<th>줄거리</th>
	<td>
	<textarea rows="5" cols="10" name="moviecontent"></textarea>
	</td>
</tr>
<tr>
	<th>감독</th>
	<td><input type="text" name="moviedirector" placeholder="ex) 류승완"></td>
</tr>
<tr>
	<th>출연진</th>
	<td><input type="text" name="casting" placeholder="ex) 황정민, 정해인, 오달수, 오대환, 장윤주 등"></td>
</tr>
<tr>
	<th>등급</th>
	<td>
	<input type="radio" name="moviegrade" value="전체관람가">전체관람가
	<input type="radio" name="moviegrade" value="12세이상관람가">12세이상관람가
	<input type="radio" name="moviegrade" value="15세이상관람가">15세이상관람가
	<input type="radio" name="moviegrade" value="미정">미정
	</td>
</tr>
<tr>
	<th>등급이미지</th>
	<td><input type="file" name="gradeimage"></td>
</tr>
<tr>
	<th>표지</th>
	<td><input type="file" name="moviecover"></td>
</tr>
<tr>
	<th>예고편</th>
	<td><input type="file" name="trailer"></td>
</tr>

<tr style="text-align: center;">
	<td colspan="3">
		<input type="submit" value="영화등록">
		<input type="reset" value="취소">
		<input type="button" value="메인으로" onclick="location.href='main'">
	</td>
</tr>
</table>
</form>
</body>
</html>