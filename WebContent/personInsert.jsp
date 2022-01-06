<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
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
<%
	int no=0;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select person_seq.nextval from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1);
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("sequence 조회 실패");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="personInsert_Process.jsp">
<h1>인사관리 사원 등록 화면</h1>
<table border=1 id="tab2">
	<tr>
		<th id="th1">성명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">사원번호</th>
		<td><input type="text" name="id" value=<%=no %> id="in1"></td>
	</tr>
	<tr>
		<th id="th1">소속부서</th>
		<td>
			<select name="dept" id="s1">
				<option value="인사부">인사부</option>
				<option value="기획부">기획부</option>
				<option value="홍보부">홍보부</option>
				<option value="영업부">영업부</option>
				<option value="경리부">경리부</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">직급</th>
		<td>
			<select name="position" id="s1">
				<option value="1">1급</option>
				<option value="2">2급</option>
				<option value="3">3급</option>
				<option value="4">4급</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">직책</th>
		<td><input type="text" name="duty" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등 록" onclick="check()">
			<input type="reset" value="취 소">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.id.value==""){
			alert("사번이 입력되지 않았습니다.");
			document.form.id.focus();
		}else if(document.form.duty.value==""){
			alert("직책이 입력되지 않았습니다.");
			document.form.duty.focus();
		}else if(document.form.phone.value==""){
			alert("연락처가 입력되지 않았습니다.");
			document.form.phone.focus();
		}else{
			document.form.submit();
			alert("등록이 완료되었습니다.");
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>