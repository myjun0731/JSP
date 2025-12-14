<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
	int result = 0;

	// Oracle DB 연결
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	
	// 데이터 삽입 쿼리
	String sql = "insert into Courses values(?, ?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	// 파라미터 설정 (입력 받은 값)
	pstmt.setString(1, request.getParameter("CourseID"));
	pstmt.setString(2, request.getParameter("CourseName"));
	pstmt.setString(3, request.getParameter("Credits"));
	pstmt.setString(4, request.getParameter("LecturerID"));
	pstmt.setString(5, request.getParameter("DayOfWeek"));
	pstmt.setString(6, request.getParameter("StartTime"));
	pstmt.setString(7, request.getParameter("EndTime"));
	
	// SQL 실행
	result = pstmt.executeUpdate();

	if(result == 1){
		%>
			<script>
			alert("교과가 모두 입력되었습니다!");
			location = "List.jsp";
			</script>
		<%
		}
		%>
