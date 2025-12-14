<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 확인</title>
</head>
<body>
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

	// 새로운 상품을 등록하는 SQL 쿼리
	String sql = "insert into products (product_id, product_name, price, cost, entry_date) values(?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1, request.getParameter("product_id"));
	pstmt.setString(2, request.getParameter("product_name"));
	pstmt.setString(3, request.getParameter("price"));
	pstmt.setString(4, request.getParameter("cost"));
	pstmt.setString(5, request.getParameter("entry_date"));
	
	pstmt.executeUpdate();

	// 등록 후 상품 목록 페이지로 리다이렉트
	response.sendRedirect("List.jsp");
%>

</body>
</html>
