<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포별 매출 현황</title>
</head>
<body>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    DecimalFormat fo = new DecimalFormat("###,###");
    String sql1 = "select st.store_name as 점포명, "
                + "sum(case when sa.payment_type = '01' then sa.sale_quantity * go.price ELSE 0 END) as 현금매출, "
                + "sum(case when sa.payment_type = '02' then sa.sale_quantity * go.price ELSE 0 END) as 카드매출, "
                + "sum(sa.sale_quantity * go.price) as 총매출 "
                + "from sales sa, stores st, products go "
                + "where go.product_id = sa.product_id and sa.store_id = st.store_id "
                + "group by st.store_name "
                + "order by SUM(sa.sale_quantity * go.price) desc";
    Statement stmt = conn.createStatement();
%>
<jsp:include page="Header.jsp"></jsp:include>

<section>
	<h2>점포별 매출 통계</h2>
	
    <div style="overflow-x: auto;">
		<table>
            <thead>
    			<tr>
    				<th width="20%">점포명</th>
    				<th width="25%">현금매출</th>
    				<th width="25%">카드매출</th>
    				<th width="30%">총매출</th>
    			</tr>
            </thead>
			<tbody>
    			<%
    			ResultSet rs = stmt.executeQuery(sql1);
    			while (rs.next()) {
    				
    				int cashSales = rs.getInt(2);
    				String cashSalesFormatted = fo.format(cashSales);
    				
    				int cardSales = rs.getInt(3);
    				String cardSalesFormatted = fo.format(cardSales);
    				int totalSales = rs.getInt(4);
    				String totalSalesFormatted = fo.format(totalSales);
    			%>
    			<tr>
    				<td style="text-align: center;">
                        <a href="ResultConfirm.jsp?store_name=<%=rs.getString(1)%>" style="color: var(--secondary-color); font-weight: bold; text-decoration: none;">
                            <%=rs.getString(1)%>
                        </a>
                    </td>
    				<td style="text-align: right; padding-right: 40px;"><%=cashSalesFormatted%>원</td>
    				<td style="text-align: right; padding-right: 40px;"><%=cardSalesFormatted%>원</td>
    				<td style="text-align: right; padding-right: 40px; font-weight: bold; color: var(--primary-color);"><%=totalSalesFormatted%>원</td>
    			</tr>
    			<%
    			}
    			%>
            </tbody>
		</table>
    </div>
</section>

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>