<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 수정</title>
</head>
<body>
<%
String courseID = request.getParameter("CourseID");
String courseName = request.getParameter("CourseName");
String credits = request.getParameter("Credits");
String lecturerID = request.getParameter("LecturerID");
String dayOfWeek = request.getParameter("Weekday");
String startTime = request.getParameter("StartTime");
String endTime = request.getParameter("EndTime");
%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

// 교수 목록을 조회
String sql = "select LecturerID, LecturerName from Lecturers";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
rs.next();
%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">과목 수정</h2>
<br>
<section style="display: flex; justify-content: center;">
<form action="UpdateConfirm.jsp" name="form">
<table border="1" style="border-spacing: 0px;">
	<tr>
		<th>과목코드</th>
		<td><input type="text" name="CourseID" value="<%=courseID%>"></td>
	</tr>
	<tr>
		<th>과목명</th>
		<td><input type="text" name="CourseName" value="<%=courseName%>"></td>
	</tr>
	<tr>
		<th>학점</th>
		<td><input type="text" name="Credits" value="<%=credits%>"></td>
	</tr>
	<tr>
		<th>교수</th>
		<td>
			<select name="LecturerID">
			<option value="<%= rs.getString(1)%>"><%= lecturerID.equalsIgnoreCase("1") ? "김교수" : lecturerID.equalsIgnoreCase("2") ? "이교수" : lecturerID.equalsIgnoreCase("3") ? "박교수" : lecturerID.equalsIgnoreCase("4") ? "최교수" : lecturerID.equalsIgnoreCase("5") ? "피교수" : (lecturerID.equalsIgnoreCase("6") ? "깡교수" : "") %></option>
			<option value="1">김교수</option>
			<option value="2">이교수</option>
			<option value="3">박교수</option>
			<option value="4">최교수</option>
			<option value="5">피교수</option>
			<option value="6">깡교수</option>
			</select>		
		</td>
	</tr>
	<tr>
		<th>요일</th>
			<td>
				<input type="radio" name="DayOfWeek" value="1" <%= dayOfWeek.equals("1") ? "checked" : "" %>><label>월</label>
				<input type="radio" name="DayOfWeek" value="2" <%= dayOfWeek.equals("2") ? "checked" : "" %>><label>화</label>
				<input type="radio" name="DayOfWeek" value="3" <%= dayOfWeek.equals("3") ? "checked" : "" %>><label>수</label>
				<input type="radio" name="DayOfWeek" value="4" <%= dayOfWeek.equals("4") ? "checked" : "" %>><label>목</label>
				<input type="radio" name="DayOfWeek" value="5" <%= dayOfWeek.equals("5") ? "checked" : "" %>><label>금</label>
			</td>
	</tr>
	<tr>
		<th>시작시간</th>
		<td><input type="text" name="StartTime" value="<%=startTime%>"></td>
	</tr>
	<tr>
		<th>종료시간</th>
		<td><input type="text" name="EndTime" value="<%=endTime%>"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="fn_home();">
		</td>
	</tr>
</table>
</form>
</section>
<script type="text/javascript">
function fn_home() {
	location = "List.jsp";
}
</script>
</body>
</html>
