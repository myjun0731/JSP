<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// Oracle 드라이버 로드 및 연결
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	int result = 0;
	
	// Courses 테이블에서 CourseID를 기준으로 삭제하는 쿼리로 수정
	String sql = "delete from Courses where CourseID = ?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// request에서 CourseID 값을 받아와서 쿼리 실행
	pstmt.setString(1, request.getParameter("CourseID"));
	
	result = pstmt.executeUpdate();
	
	if(result == 1) {
%>

	<script>
	alert("삭제되었습니다.");
	location = "List.jsp";
	</script>
	<%
		}
	%>
