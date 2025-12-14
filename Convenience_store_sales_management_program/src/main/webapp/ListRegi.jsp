<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 등록</title>
</head>
<body>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    String sql = "select max(product_id)+1, sysdate from products";
    ResultSet rs = conn.prepareStatement(sql).executeQuery();
    rs.next();
%>
<jsp:include page="Header.jsp"></jsp:include>

<section>
	<h2>신규 상품 등록</h2>
    
    <div style="max-width: 600px; margin: 0 auto;">
		<form action="ListRegiConfirm.jsp" name="form">
			<table style="border: none;">
                <colgroup>
                    <col style="width: 30%; background-color: #f8f9fa;">
                    <col style="width: 70%;">
                </colgroup>
				<tr>
					<th>상품코드</th>
					<td style="text-align: left;"><input type="text" readonly name="product_id" value="<%=rs.getString(1)%>" style="color: var(--primary-color); font-weight: bold;"></td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td style="text-align: left;"><input type="text" name="product_name" placeholder="상품명 입력"></td>
				</tr>
				
				<tr>
					<th>단가</th>
					<td style="text-align: left;"><input type="text" name="price" placeholder="판매 가격 (숫자)"></td>
				</tr>
				
				<tr>
					<th>원가</th>
					<td style="text-align: left;"><input type="text" name="cost" placeholder="매입 가격 (숫자)"></td>
				</tr>
				
				<tr>
					<th>입고날짜</th>
					<td style="text-align: left;"><input type="text" readonly name="entry_date" value="<%=rs.getString(2).substring(0, 10)%>"></td>
				</tr>
			</table>
            
            <div style="text-align: center; margin-top: 30px;">
                <input type="submit" value="상품 등록" onclick="fn_submit(); return false;">
                <input type="button" value="상품 목록으로" onclick="fn_but();" style="background-color: #7f8c8d;">
            </div>
		</form>
    </div>
</section>

<script type="text/javascript">
function fn_submit() {
	var f = document.form;
	if(f.product_name.value == "") { alert("상품명이 입력되지 않았습니다!"); f.product_name.focus(); return false; }
	if(f.price.value == "") { alert("단가가 입력되지 않았습니다!"); f.price.focus(); return false; }
	if(f.cost.value == "") { alert("원가가 입력되지 않았습니다!"); f.cost.focus(); return false; }
	f.submit();
}
function fn_but() {
	location = "List.jsp";
}
</script>

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>