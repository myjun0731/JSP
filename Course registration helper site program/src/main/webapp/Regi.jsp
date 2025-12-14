<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목 추가</title>
</head>
<body>
	<%
	// Oracle DB 연결
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

	// 강사 테이블에서 강사 목록 조회
	String sql = "SELECT LecturerID, LecturerName FROM Lecturers GROUP BY LecturerID, LecturerName";

	Statement stmt = conn.createStatement();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">교과목 추가</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<form action="RegiConfirm.jsp" name="form">
			<table border="1" style="border-spacing: 0px;">
				<tr>
					<th>과목코드</th>
					<td><input type="text" name="CourseID"></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="CourseName"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="Credits"></td>
				</tr>
				<tr>
					<th>교수</th>
					<td>
						<%
						// 강사 목록을 select 태그에 채움
						ResultSet rs = stmt.executeQuery(sql);
						%> <select name="LecturerID">
						<option value="">담당교수선택</option>
							<%
							while (rs.next()) {
							%>
							<option value="<%=rs.getString("LecturerID")%>"><%=rs.getString("LecturerName")%></option>
							<%
							}
							rs.close();
							%>
					</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" name="DayOfWeek" value="1" checked>
						<label>월</label> <input type="radio" name="DayOfWeek" value="2">
						<label>화</label> <input type="radio" name="DayOfWeek" value="3">
						<label>수</label> <input type="radio" name="DayOfWeek" value="4">
						<label>목</label> <input type="radio" name="DayOfWeek" value="5">
						<label>금</label>
					</td>
				</tr>
				<tr>
					<th>시작시간</th>
					<td><input type="text" name="StartTime"></td>
				</tr>

				<tr>
					<th>종료시간</th>
					<td><input type="text" name="EndTime"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input type="submit" value="추가" onclick="fn_submit(); return false;">
					<input type="button" value="목록" onclick="fn_home();">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script>
		function fn_submit() {
			var f = document.form;

			if (f.CourseID.value == "") {
				alert("과목코드가 입력되지 않았습니다");
				f.CourseID.focus();
				return false;
			}
			if (f.CourseName.value == "") {
				alert("과목명이 입력되지 않았습니다");
				f.CourseName.focus();
				return false;
			}
			if (f.Credits.value == "") {
				alert("학점이 입력되지 않았습니다");
				f.Credits.focus();
				return false;
			}
			if (f.LecturerID.value == "") {
				alert("교수가 선택되지 않았습니다");
				f.LecturerID.focus();
				return false;
			}
			if (f.StartTime.value == "") {
				alert("시작시간이 입력되지 않았습니다");
				f.StartTime.focus();
				return false;
			}
			if (f.EndTime.value == "") {
				alert("종료시간이 입력되지 않았습니다");
				f.EndTime.focus();
				return false;
			}
			f.submit();
		}
		function fn_home() {
			location = "List.jsp";
		}
	</script>
</body>
</html>
