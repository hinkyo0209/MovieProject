<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th {
 background-color: #DDDDDD;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="schedulesave" method="post">
<table border="1" width="600px" align="center">
<tr>
	<th>영화번호</th>
     <td>
        <select name="movienum">
        <option value="1">[1]베테랑2</option>
        <option value="2">[2]대도시의 사랑법</option>
        <option value="3">[3]비긴어게인</option>
        <option value="4">[4]사랑의 하츄핑</option>
        <option value="5">[5]소년시절의 너</option>
        <option value="6">[6]인사이드 아웃2</option>
        <option value="7">[7]안녕,할부지</option>
        <option value="8">[8]파일럿</option>
        <option value="9">[9]빅토리</option>
        <option value="10">[10]더 커버넌트</option>
        <option value="11">[11]트랜스포머ONE</option>
        <option value="12">[12]조커:폴리 아 되</option>
        <option value="13">[13]럭키,아파트</option>
        <option value="14">[14]최소한의 선의</option>
        <option value="15">[15]사흘</option>
        <option value="16">[16]창설</option>
        <option value="17">[17]호두까기 인형과 마술피리</option>
        <option value="18">[18]날씨의 아이</option>
        <option value="19">[19]노트북</option>
        <option value="20">[20]스즈메의 문단속</option>
        </select>   
     </td>
</tr>
<tr>
   <th>스케쥴번호</th>
   <td><input type="text" name="schedule_num"></td>
</tr>
<tr>
   <th>상영날짜</th>
   <td><input type="date" name="screening_date"></td>
</tr>
<tr>
   <th>상영시간</th>
   <td><input type="time" name="screening_time"></td>
</tr>
<tr>
   <th>상영관</th>
   <td>
      <select name="screening_theater">
      <option value="1관">1관</option>
      <option value="2관">2관</option>
      <option value="3관">3관</option>
      <option value="4관">4관</option>
      <option value="5관">5관</option>
      <option value="6관">6관</option>
      <option value="7관">7관</option>
      <option value="8관">8관</option>
      <option value="9관">9관</option>
      </select>
</tr>
<tr style="text-align: center">
   <td colspan="2">
   <input type="submit" value="스케쥴등록">
   <input type="button" value="메인" onclick="location.href='./'">
   </td>
</tr>
</table>
</form>
</body>
</html>