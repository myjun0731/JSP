<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 추가</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String productId = request.getParameter("product_id");
int addStock = Integer.parseInt(request.getParameter("add_stock"));

// 재고 업데이트 쿼리
String sql = "UPDATE products SET stock_quantity = stock_quantity + ? WHERE product_id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, addStock);
pstmt.setString(2, productId);

int result = pstmt.executeUpdate();

if (result > 0) {
%>
    <script type="text/javascript">
        alert("재고가 정상적으로 추가되었습니다.");
        location.href = "Inventory.jsp";  // 재고 현황 페이지로 돌아가기
    </script>
<%
} else {
%>
    <script type="text/javascript">
        alert("재고 추가에 실패했습니다.");
        history.back();  // 이전 페이지로 돌아가기
    </script>
<%
}
%>
</body>
</html>
