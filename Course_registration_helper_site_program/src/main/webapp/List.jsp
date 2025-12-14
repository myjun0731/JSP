<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과 목록</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

String sql = "select CourseID, CourseName, Credits, LecturerID, Weekday, substr(StartTime, 1, 2), substr(StartTime, 3, 2), substr(EndTime, 1, 2), substr(EndTime, 3, 2) "
			+ "from Courses";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
boolean hasResults = false;
%>

<jsp:include page="Header.jsp"></jsp:include>

<section>
    <h2 class="title">개설 교과 목록</h2>
    
    <table>
        <thead>
            <tr>
                <th width="10%">과목코드</th>
                <th width="25%">과목명</th>
                <th width="8%">학점</th>
                <th width="12%">교수명</th>
                <th width="8%">요일</th>
                <th width="15%">시작시간</th>
                <th width="15%">종료시간</th>
                <th width="7%">관리</th>         
            </tr>
        </thead>
        <tbody>
        <%
        while (rs.next()) {
            hasResults = true;
        %>
        <tr>
            <td><a href="Update.jsp?CourseID=<%=rs.getString(1)%>&CourseName=<%=rs.getString(2)%>&Credits=<%=rs.getString(3)%>&LecturerID=<%=rs.getString(4)%>&Weekday=<%=rs.getString(5)%>&StartTime=<%=rs.getString(6)%><%= rs.getString(7) %>&EndTime=<%=rs.getString(8)%><%=rs.getString(9)%>" style="font-weight:bold; color:#3498db; text-decoration:underline;"><%=rs.getString(1)%></a></td>
            <td style="text-align:left; padding-left:20px;"><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4).equalsIgnoreCase("1") ? "김교수" : rs.getString(4).equalsIgnoreCase("2") ? "이교수" : rs.getString(4).equalsIgnoreCase("3") ? "박교수" : rs.getString(4).equalsIgnoreCase("4") ? "최교수" : rs.getString(4).equalsIgnoreCase("5") ? "피교수" : (rs.getString(4).equalsIgnoreCase("6") ? "깡교수" : "")%></td>
            <td><%=rs.getString(5).equalsIgnoreCase("1") ? "월" : rs.getString(5).equalsIgnoreCase("2") ? "화" : rs.getString(5).equalsIgnoreCase("3") ? "수" : rs.getString(5).equalsIgnoreCase("4") ? "목" : rs.getString(5).equalsIgnoreCase("5") ? "금" : (rs.getString(5).equalsIgnoreCase("6") ? "토" : "")%></td>
            <td><%= rs.getString(6) %>시 <%= rs.getString(7) %>분</td>
            <td><%=rs.getString(8)%>시 <%=rs.getString(9)%>분</td>
            <td>
                <a href="delpro2.jsp?CourseID=<%=rs.getString(1)%>" style="color: #e74c3c; font-weight: bold;" onclick="return confirm('정말 삭제하시겠습니까?');">
                    <span style="border: 1px solid #e74c3c; padding: 2px 6px; border-radius: 4px; font-size: 12px;">삭제</span>
                </a>
            </td>
        </tr>
        <%
        }

        if (!hasResults) {
        %>
        <tr>
             <td colspan="8" style="padding: 30px;">등록된 교과 목록이 없습니다.</td>
        </tr>
        <%
        }
        %>
        </tbody>
    </table>
</section>

<footer>
<h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>