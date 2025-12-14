<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
a {
text-decoration: none;
color: black;
}
td {
text-align: center;
}
th {
padding: 0 20px;
background: silver;
}
</style>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

// 새롭게 정의된 테이블명 및 컬럼명에 맞게 SQL 쿼리 수정
String sql = "select CourseID, CourseName, Credits, LecturerID, Weekday, substr(StartTime, 1, 2), substr(StartTime, 3, 2), substr(EndTime, 1, 2), substr(EndTime, 3, 2) "
			+ "from Courses";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
boolean hasResults = false;  // 데이터가 있는지 확인

%>
<jsp:include page="Header.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">교과 목록</h2>
<br>
<section style="display: flex; justify-content: center;">
    <table border="1" style="border-spacing: 0px;">
        <tr>
            <th>과목코드</th>
            <th>과목명</th>
            <th>학점</th>
            <th>교수명</th>
            <th>요일</th>
            <th>시작시간</th>
            <th>종료시간</th>
            <th>비고</th>         
        </tr>

        <%
        while (rs.next()) {
            hasResults = true; // 데이터가 있음을 확인
        %>
        <tr>
            <td><a href="Update.jsp?CourseID=<%=rs.getString(1)%>&CourseName=<%=rs.getString(2)%>&Credits=<%=rs.getString(3)%>&LecturerID=<%=rs.getString(4)%>&Weekday=<%=rs.getString(5)%>&StartTime=<%=rs.getString(6)%><%= rs.getString(7) %>&EndTime=<%=rs.getString(8)%><%=rs.getString(9)%>"><%=rs.getString(1)%></a></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4).equalsIgnoreCase("1") ? "김교수" : rs.getString(4).equalsIgnoreCase("2") ? "이교수" : rs.getString(4).equalsIgnoreCase("3") ? "박교수" : rs.getString(4).equalsIgnoreCase("4") ? "최교수" : rs.getString(4).equalsIgnoreCase("5") ? "피교수" : (rs.getString(4).equalsIgnoreCase("6") ? "깡교수" : "")%></td>
            <td><%=rs.getString(5).equalsIgnoreCase("1") ? "월" : rs.getString(5).equalsIgnoreCase("2") ? "화" : rs.getString(5).equalsIgnoreCase("3") ? "수" : rs.getString(5).equalsIgnoreCase("4") ? "목" : rs.getString(5).equalsIgnoreCase("5") ? "금" : (rs.getString(5).equalsIgnoreCase("6") ? "토" : "")%></td>
            <td><%= rs.getString(6) %>시<%= rs.getString(7) %>분</td>
            <td><%=rs.getString(8)%>시<%=rs.getString(9)%>분</td>
            <td><a href="delpro2.jsp?CourseID=<%=rs.getString(1)%>">삭제</a></td>
        </tr>
        <%
        }

        if (!hasResults) {
        %>
        <tr>
            <td colspan="8">교과 목록이 없습니다.</td>
        </tr>
        <%
        }
        %>
    </table>
</section>
</body>
</html>
