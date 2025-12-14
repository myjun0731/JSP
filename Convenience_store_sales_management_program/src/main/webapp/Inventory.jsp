<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 현황</title>
</head>
<body>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    String sql = "SELECT product_id, product_name, stock_quantity, price FROM products ORDER BY product_id";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    DecimalFormat df = new DecimalFormat("###,###");
%>

<jsp:include page="Header.jsp"></jsp:include>

<section>
    <h2>현재 재고 현황 및 입고</h2>
    
    <form action="UpdateStock.jsp" method="post">
        <table>
            <thead>
                <tr>
                    <th width="15%">상품 코드</th>
                    <th width="25%">상품명</th>
                    <th width="20%">현재 재고</th>
                    <th width="20%">단가</th>
                    <th width="20%">재고 추가</th>
                </tr>
            </thead>
            <tbody>
                <%
                while (rs.next()) {
                    String productId = rs.getString("product_id");
                    String productName = rs.getString("product_name");
                    int stockQuantity = rs.getInt("stock_quantity");
                    int price = rs.getInt("price");
                %>
                <tr>
                    <td style="text-align: center;"><%= productId %></td>
                    <td style="text-align: center; font-weight: 500;"><%= productName %></td>
                    <td style="text-align: center;"><%= df.format(stockQuantity) %>개</td>
                    <td style="text-align: right; padding-right: 30px;"><%= df.format(price) %>원</td>
                    <td style="text-align: center;">
                        <input type="hidden" name="product_id" value="<%= productId %>">
                        <input type="number" name="add_stock" min="1" placeholder="수량" style="width: 80px; text-align: center;">
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        
        <div style="text-align: center; margin-top: 30px;">
             <input type="submit" value="재고 일괄 반영" style="padding: 12px 30px; font-size: 1.1rem;">
        </div>
    </form>
</section>

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>