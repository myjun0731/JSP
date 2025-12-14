<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<% 
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	int result = 0;
	
	String sql = "update products set product_name = ?, price = ?, cost = ?, entry_date = ? where product_id = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);  
	
	pstmt.setString(1, request.getParameter("product_name"));
	pstmt.setString(2, request.getParameter("price"));
	pstmt.setString(3, request.getParameter("cost"));
	pstmt.setString(4, request.getParameter("entry_date"));
	pstmt.setString(5, request.getParameter("product_id"));

	result = pstmt.executeUpdate();

	response.sendRedirect("List.jsp");
%>
