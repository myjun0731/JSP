<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String teacherNumber = request.getParameter("teacher_number");

    // 데이터베이스 연결
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

    // 교사 고유번호가 있는지 확인하는 쿼리
    String sql = "SELECT COUNT(*) FROM teacher_tbl WHERE teacher_number = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, teacherNumber);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next() && rs.getInt(1) > 0) {
        // 유효한 교사 고유번호
        out.print("valid");
    } else {
        // 유효하지 않은 교사 고유번호
        out.print("invalid");
    }

    rs.close();
    pstmt.close();
    conn.close();
%>
