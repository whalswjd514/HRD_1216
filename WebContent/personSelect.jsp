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
<h1>직원 정보 조회</h1><br>
<table border=1 id="tab1">
	<tr>
		<th>no</th>
		<th>성명</th>
		<th>사번</th>
		<th>직급</th>
		<th>직책</th>
		<th>연락처</th>
		<th>소속부서</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select * from person1216";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String name=rs.getString("name");
			int id=rs.getInt("id");
			String position=rs.getString("position");
			String duty=rs.getString("duty");
			String phone=rs.getString("phone");
			String dept=rs.getString("dept");
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=no %></td>
		<td><%=name %></td>
		<td><a href="personUpdate.jsp?id=<%=id %>"><%=id %></a></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=dept %></td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>