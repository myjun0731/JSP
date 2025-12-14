<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 변경</title>
</head>
<body>
<%
String product_id = request.getParameter("product_id");
String product_name = request.getParameter("product_name");
String price = request.getParameter("price");
String cost = request.getParameter("cost");
String entry_date = request.getParameter("entry_date");
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">상품정보 변경</h2>
<br>
<section style="display: flex; justify-content: center;">

		<form action="ListEditConfirm.jsp" name="form">
			<table border="1" style="border-spacing: 0px;">
				<tr>
					<th>상품코드(변경불가)</th>
					<td><input type="text" readonly name="product_id" value="<%=product_id%>"></td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td><input type="text" name="product_name" value="<%=product_name%>"></td>
				</tr>
				
				<tr>
					<th>단가</th>
					<td><input type="text" name="price" value="<%=price%>"></td>
				</tr>
				
				<tr>
					<th>원가</th>
					<td><input type="text" name="cost" value="<%=cost%>"></td>
				</tr>
				
				<tr>
					<th>입고날짜(변경불가)</th>
					<td><input type="text" readonly name="entry_date" value="<%=entry_date.substring(0, 10)%>"></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
					<input type="submit" value="저장" onclick="fn_submit(); return false;">
					<input type="button" value="상품목록" onclick="fn_but();">
					</td>
				</tr>
			</table>
		</form>
</section>
<script type="text/javascript">
function fn_submit() {
	var f = document.form;
	
	if(f.product_name.value == "") {
		alert("상품명을 입력해주세요!");
		f.product_name.focus(); return false;
	}
	if(f.price.value == "") {
		alert("단가를 입력해주세요!");
		f.price.focus(); return false;
	}
	if(f.cost.value == "") {
		alert("원가를 입력해주세요!");
		f.cost.focus(); return false;
	}
	f.submit();
}
function fn_but() {
	location = "List.jsp";
}
</script>
</body>
</html>
