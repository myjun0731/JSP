<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

    // 학생 또는 교사인지 확인
    String userSql = "SELECT user_role FROM student_tbl WHERE user_id=? AND user_password=?";
    PreparedStatement pstmt = conn.prepareStatement(userSql);
    pstmt.setString(1, userId);
    pstmt.setString(2, password);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        String role = rs.getString("user_role");
        session.setAttribute("userId", userId);
        session.setAttribute("role", role);

        if ("student".equals(role)) {
            out.println("<script>alert('학생으로 로그인되었습니다.'); location.href='Index.jsp';</script>");
        } else if ("teacher".equals(role)) {
            out.println("<script>alert('교사로 로그인되었습니다.'); location.href='Index.jsp';</script>");
        } else {
            out.println("<script>alert('로그인 실패: 알 수 없는 역할입니다.'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('로그인 실패: 아이디 또는 비밀번호가 잘못되었습니다.');history.back();</script>");
    }

    rs.close();
    pstmt.close();
    conn.close();
%>
