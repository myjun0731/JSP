<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 등록 확인</title>
</head>
<body>
<% 
    // JDBC 설정
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    int result = 0;

    // 1. 판매 상품 코드와 판매 수량 가져오기
    String product_id = request.getParameter("product_id");
    int sale_quantity = Integer.parseInt(request.getParameter("sale_quantity"));

    // 2. 재고 확인 쿼리 (현재 재고 수량 조회)
    String checkStockSql = "SELECT stock_quantity FROM products WHERE product_id = ?";
    PreparedStatement stockPstmt = conn.prepareStatement(checkStockSql);
    stockPstmt.setString(1, product_id);
    ResultSet stockRs = stockPstmt.executeQuery();
    
    if (stockRs.next()) {
        int currentStock = stockRs.getInt(1);  // 현재 재고

        // 3. 재고가 충분한지 확인
        if (currentStock >= sale_quantity) {
            // 재고가 충분할 경우, 판매를 등록하고 재고를 차감함

            // 4. 재고 차감 쿼리 (판매된 수량만큼 재고 감소)
            String updateStockSql = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE product_id = ?";
            PreparedStatement updateStockPstmt = conn.prepareStatement(updateStockSql);
            updateStockPstmt.setInt(1, sale_quantity);  // 판매 수량만큼 차감
            updateStockPstmt.setString(2, product_id);
            updateStockPstmt.executeUpdate();

            // 5. 매출 등록 쿼리 (판매 정보 기록)
            String insertSaleSql = "INSERT INTO sales (sale_id, sale_date, sale_type, store_id, product_id, sale_quantity, payment_type) "
                                 + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertSaleSql);
            
            pstmt.setString(1, request.getParameter("sale_id"));
            pstmt.setString(2, request.getParameter("sale_date"));
            pstmt.setString(3, request.getParameter("sale_type"));
            pstmt.setString(4, request.getParameter("store_id"));
            pstmt.setString(5, product_id);
            pstmt.setInt(6, sale_quantity);  // 판매 수량 기록
            pstmt.setString(7, request.getParameter("payment_type"));
            
            result = pstmt.executeUpdate();

            if (result == 1) {
%>
                <script type="text/javascript">
                alert("매출이 정상적으로 등록되었으며 재고가 차감되었습니다.");
                location = "Index.jsp";
                </script>
<%
            }
        } else {
            // 재고가 부족할 경우 경고 메시지 출력
%>
            <script type="text/javascript">
            alert("재고가 부족하여 판매를 진행할 수 없습니다. 현재 재고: <%= currentStock %>");
            history.back();  // 이전 페이지로 돌아감
            </script>
<%
        }
    }
%>
</body>
</html>
