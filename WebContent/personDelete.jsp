<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<form name="form" method="post" action="personDelete_Process.jsp">
<h1>인사관리 퇴사처리 화면</h1>
<table border=1 id="tab2">
	<tr>
		<th id="th1">성명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">사원번호</th>
		<td><input type="text" name="id" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="삭 제" onclick="check1()">
			<input type="reset" value="취 소">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>