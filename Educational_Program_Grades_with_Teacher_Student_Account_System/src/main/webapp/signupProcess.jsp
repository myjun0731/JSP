<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 처리</title>
</head>
<body>
<%
    String userId = request.getParameter("user_id");
    String userName = request.getParameter("user_name");
    String userPassword = request.getParameter("user_password");
    String teacherNumber = request.getParameter("teacher_number");
    String studentNumber = request.getParameter("student_number");
    String userRole = request.getParameter("user_role");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

    String sql = "INSERT INTO student_tbl (user_id, user_name, user_password, user_role, student_number, teacher_number) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, userId);
    pstmt.setString(2, userName);
    pstmt.setString(3, userPassword);
    pstmt.setString(4, userRole != null ? userRole : "student");  // 교사 또는 학생 선택
    pstmt.setString(5, studentNumber);  // 학번 저장
    pstmt.setString(6, teacherNumber);  // 교사 고유번호 저장

    int result = pstmt.executeUpdate();
    
    if(result > 0) {
        out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='login.jsp';</script>");
    } else {
        out.println("<script>alert('회원가입 실패! 다시 시도해주세요.'); history.back();</script>");
    }

    pstmt.close();
    conn.close();
%>
</body>
</html>

