<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 등록</title>
</head>
<body>
<%
    // DB 로직 유지
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
    String sql = "select max(sale_id)+1, sysdate from sales group by sysdate";
    ResultSet rs = conn.prepareStatement(sql).executeQuery();
    rs.next();
%>
<jsp:include page="Header.jsp"></jsp:include>

<section>
	<h2>신규 매출 등록</h2>
    
	<div style="max-width: 600px; margin: 0 auto;">
		<form action="RegiConfirm.jsp" name="form">
			<table style="border: none;">
                <colgroup>
                    <col style="width: 30%; background-color: #f8f9fa;">
                    <col style="width: 70%;">
                </colgroup>
				<tr>
					<th>판매번호</th>
					<td style="text-align: left;"><input type="text" readonly name="sale_id" value="00<%=rs.getString(1)%>" style="font-weight: bold; color: var(--primary-color);"></td>
				</tr>
				
				<tr>
					<th>판매일자</th>
					<td style="text-align: left;"><input type="text" readonly name="sale_date" value="<%= rs.getString(2).substring(0, 10) %>"></td>
				</tr>
				
				<tr>
					<th>판매구분</th>
					<td style="text-align: left;">
						<select name="sale_type">
							<option value="">판매 구분 선택</option>
							<option value="1">판매</option>
							<option value="2">취소</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>판매점포</th>
					<td style="text-align: left;">
						<select name="store_id">
							<option value="">점포 선택</option>
							<option value="A001">이태원점</option>
							<option value="A002">한남점</option>
							<option value="A003">도원점</option>
							<option value="B001">혜화점</option>
							<option value="C001">방배점</option>
							<option value="D001">사당점</option>
							<option value="D002">흑석점</option>
							<option value="E001">금호점</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>판매상품</th>
					<td style="text-align: left;">
						<select name="product_id">
							<option value="">상품 선택</option>
							<option value="110001">라면</option>
							<option value="110002">빵</option>
							<option value="110003">과자</option>
							<option value="110004">탄산음료</option>
							<option value="110005">삼각김밥</option>
							<option value="110006">초콜릿</option>
							<option value="110007">우유</option>
						</select>		
					</td>
				</tr>
				
				<tr>
					<th>판매수량</th>
					<td style="text-align: left;"><input type="number" name="sale_quantity" min="1" placeholder="수량을 입력하세요"></td>
				</tr>		
				
				<tr>
					<th>수취구분</th>
					<td style="text-align: left;">
						<select name="payment_type">
							<option value="">결제 수단 선택</option>
							<option value="01">현금</option>
							<option value="02">카드</option>
						</select>		
					</td>
				</tr>	
			</table>
            
            <div style="text-align: center; margin-top: 30px;">
                <input type="button" value="매출 등록" onclick="fn_submit();">
                <input type="button" value="매출 현황 조회" onclick="fn_but();" style="background-color: #7f8c8d;">
            </div>
		</form>
	</div>
</section>

<script type="text/javascript">
function fn_submit() {
	var f = document.form;
	if (f.sale_type.value == "") { alert("판매구분을 선택해주세요!"); f.sale_type.focus(); return false; }
	if (f.store_id.value == "") { alert("판매점포를 선택해주세요!"); f.store_id.focus(); return false; }
	if (f.product_id.value == "") { alert("판매상품을 선택해주세요!"); f.product_id.focus(); return false; }
	if (f.sale_quantity.value == "" || f.sale_quantity.value <= 0) { alert("판매수량을 입력해주세요! (1 이상)"); f.sale_quantity.focus(); return false; }
	if (f.payment_type.value == "") { alert("수취구분을 선택해주세요!"); f.payment_type.focus(); return false; }
	f.submit();
}
function fn_but() {
	location = "Result.jsp";
}
</script>

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>