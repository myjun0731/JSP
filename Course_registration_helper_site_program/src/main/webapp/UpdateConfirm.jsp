<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
request.setCharacterEncoding("UTF-8");
int result = 0;

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	
	// 수정된 테이블에 맞는 SQL 업데이트 쿼리
	String sql = "update Courses set CourseName = ?, Credits = ?, LecturerID = ?, Weekday = ?, StartTime = ?, EndTime = ? where CourseID = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	// 파라미터 설정
	pstmt.setString(1, request.getParameter("CourseName"));
	pstmt.setString(2, request.getParameter("Credits"));
	pstmt.setString(3, request.getParameter("LecturerID"));
	pstmt.setString(4, request.getParameter("Weekday"));
	pstmt.setString(5, request.getParameter("StartTime"));
	pstmt.setString(6, request.getParameter("EndTime"));
	pstmt.setString(7, request.getParameter("CourseID"));

	result = pstmt.executeUpdate();
	
	if(result == 1){
		%>
			<script>
			alert("과목이 수정되었습니다.");
			location = "Index.jsp";
			</script>
		<%
		}
	%>
