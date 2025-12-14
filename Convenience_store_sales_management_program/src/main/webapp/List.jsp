<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
</head>
<body>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    String sql = "select product_id, product_name, price, cost, entry_date from products order by product_id";
    ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header.jsp"></jsp:include>

<section>
	<h2>전체 상품 목록</h2>
    
	<div style="overflow-x: auto;">
		<table>
            <thead>
    			<tr>
    				<th width="15%">상품코드</th>
    				<th width="25%">상품명</th>
    				<th width="20%">단가</th>
    				<th width="20%">원가</th>
    				<th width="20%">입고일자</th>
    			</tr>
            </thead>
			<tbody>
				<%
				while(rs.next()) {
				%>
				<tr>
					<td style="text-align: center;">
                        <a href="ListEdit.jsp?product_id=<%=rs.getString(1)%>&product_name=<%=rs.getString(2)%>&price=<%=rs.getString(3)%>&cost=<%=rs.getString(4)%>&entry_date=<%=rs.getString(5)%>&" 
                           style="color: var(--primary-color); font-weight: bold; text-decoration: underline;">
                           <%=rs.getString(1) %>
                        </a>
                    </td>
					<td style="text-align: center;"><%= rs.getString(2) %></td>
					<td style="text-align: right; padding-right: 30px;">￦<%= rs.getString(3) %></td>
					<td style="text-align: right; padding-right: 30px;">￦<%= rs.getString(4) %></td>
					<td style="text-align: center;"><%= rs.getString(5).substring(0, 10) %></td>
				</tr>
				<%
				}
				%>
            </tbody>
		</table>
    </div>
    
    <div style="text-align: right; margin-top: 20px;">
        <input type="button" value="신규 상품 등록" onclick="fn_but();">
    </div>
</section>

<script type="text/javascript">
function fn_but() {
	location = "ListRegi.jsp";
}
</script>

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>