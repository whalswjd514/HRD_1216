<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	try{
		String sql="select id,name from person1216 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String ID_1=rs.getString("id");
			String NAME_1=rs.getString("name");
			if(name.equals(NAME_1)){
				sql="delete from person1216 where name=? and id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				System.out.println("데이터 삭제 성공");
%>
				<script>
					alert("삭제를 성공했습니다.");
					location.href="personSelect.jsp";
				</script>
<%
			}else{
				%>
				<script>
					alert("이름이 다릅니다.");
				</script>
				<%
			}
		}else{
			%>
			<script>
				alert("사번이 다릅니다.");
			</script>
			<%
		}
%>
<%
	}catch(SQLException e){
		System.out.println("데이터 삭제 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("삭제를 실패했습니다.");
			history.back(-1);
		</script>
</body>
</html>