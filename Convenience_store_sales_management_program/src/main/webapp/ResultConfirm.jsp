<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 상세 내역</title>
<style type="text/css">
td {
text-align: center;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String store_name = request.getParameter("store_name");

DecimalFormat fo = new DecimalFormat("###,###");

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select st.store_name, "
			+ "sa.sale_type, sa.sale_id, sa.sale_date, go.product_name, sa.sale_quantity, "
			+ "SUM(sa.sale_quantity * go.price), "
			+ "sa.payment_type "
			+ "from sales sa, stores st, products go "
			+ "where go.product_id = sa.product_id and sa.store_id = st.store_id "
			+ "group by st.store_name, sa.sale_type, sa.sale_id, sa.sale_date, go.product_name, sa.sale_quantity, sa.payment_type "
			+ "order by sa.sale_id";


ResultSet rs = conn.prepareStatement(sql).executeQuery();

%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<br>
<section style="display: flex; justify-content: center;">
<table border="1" style="border-spacing: 0px;">
<tr>
<th style="padding: 0 10px;">판매구분</th>
<th style="padding: 0 10px;">판매번호</th>
<th style="padding: 0 18px;">판매일자</th>
<th style="padding: 0 10px;">상품명</th>
<th style="padding: 0 10px;">판매수량</th>
<th style="padding: 0 10px;">판매금액</th>
<th style="padding: 0 10px;">수취구분</th>
</tr>
<%
while(rs.next()) {
	if(store_name.equals(rs.getString(1))) {
		
		int totalAmount = rs.getInt(7);
		String totalAmountFormatted = fo.format(totalAmount);
%>
<tr>
<td><%= rs.getString(2).equalsIgnoreCase("1") ? "판매" : (rs.getString(2).equalsIgnoreCase("2") ? "판매 취소" :  "") %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4).substring(0, 10) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= totalAmountFormatted %>원</td>
<td><%= rs.getString(8).equalsIgnoreCase("01") ? "현금" : (rs.getString(8).equalsIgnoreCase("02") ? "카드" :  "") %></td>
</tr>
<%
	}
}
%>
</table>
</section>
</body>
</html>
