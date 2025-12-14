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
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

	String sql = "SELECT LecturerID, LecturerName FROM Lecturers GROUP BY LecturerID, LecturerName";
	Statement stmt = conn.createStatement();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<section>
		<h2 class="title">교과목 신규 등록</h2>
		
		<form action="RegiConfirm.jsp" name="form" style="max-width: 700px; margin: 0 auto;">
			<table style="border: none; box-shadow: none;">
                <colgroup>
                    <col style="width: 25%; background: #f8f9fa;">
                    <col style="width: 75%;">
                </colgroup>
				<tr>
					<th>과목코드</th>
					<td style="text-align: left;"><input type="text" name="CourseID" placeholder="예: C001"></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td style="text-align: left;"><input type="text" name="CourseName" placeholder="과목명을 입력하세요"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td style="text-align: left;"><input type="text" name="Credits" placeholder="숫자만 입력"></td>
				</tr>
				<tr>
					<th>담당 교수</th>
					<td style="text-align: left;">
						<%
						ResultSet rs = stmt.executeQuery(sql);
						%> 
                        <select name="LecturerID">
						    <option value="">담당 교수 선택</option>
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
					<td style="text-align: left;">
						<label><input type="radio" name="DayOfWeek" value="1" checked> 월</label>
						<label><input type="radio" name="DayOfWeek" value="2"> 화</label>
						<label><input type="radio" name="DayOfWeek" value="3"> 수</label>
						<label><input type="radio" name="DayOfWeek" value="4"> 목</label>
						<label><input type="radio" name="DayOfWeek" value="5"> 금</label>
					</td>
				</tr>
				<tr>
					<th>시작 시간</th>
					<td style="text-align: left;"><input type="text" name="StartTime" placeholder="예: 0900"></td>
				</tr>

				<tr>
					<th>종료 시간</th>
					<td style="text-align: left;"><input type="text" name="EndTime" placeholder="예: 1300"></td>
				</tr>
			</table>
            
            <div class="btn-group">
                <input type="submit" value="등록하기" onclick="fn_submit(); return false;">
                <input type="button" value="목록으로" class="secondary" onclick="fn_home();">
            </div>
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

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>