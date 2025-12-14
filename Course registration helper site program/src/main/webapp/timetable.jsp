<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<style>
    table {
        border-collapse: collapse;
        width: 80%;  /* 표 전체 너비를 80%로 줄임 */
        margin: auto;  /* 표가 가운데 오도록 설정 */
    }
    th, td {
        border: 1px solid black;
        padding: 5px;  /* padding을 5px로 줄여서 셀 간의 여백을 줄임 */
        text-align: center;
        font-size: 14px;  /* 글자 크기를 줄여서 전체 크기를 줄임 */
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>
<h2 style="text-align: center;">시간표</h2>

<%
    // Oracle DB 연결
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

    // 시간표 조회 쿼리 (교수님 이름도 함께 가져오기 위해 JOIN 추가)
    String sql = "SELECT c.CourseName, l.LecturerName, c.Weekday, c.StartTime, c.EndTime " +
                 "FROM Courses c " +
                 "JOIN Lecturers l ON c.LecturerID = l.LecturerID";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    
    // 요일 배열 (토요일, 일요일 제외)
    String[] days = {"월", "화", "수", "목", "금"};
    
    // 2차원 배열로 시간표 초기화 (시간별로 9~18시를 기준으로)
    String[][] timetable = new String[5][10];  // 5일 (월~금), 10시간 (9시~18시)
    
    // 초기화: 빈 값으로
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 10; j++) {
            timetable[i][j] = "";
        }
    }

    // 데이터베이스 결과를 시간표에 넣기
    while (rs.next()) {
        String courseName = rs.getString("CourseName");
        String lecturerName = rs.getString("LecturerName");  // 교수님 이름
        int weekday = rs.getInt("Weekday") - 1; // DB에서는 1:월, 2:화... 따라서 인덱스로 맞추기 위해 -1

        // 월~금만 처리 (1~5)
        if (weekday < 5) {
            int startHour = Integer.parseInt(rs.getString("StartTime").substring(0, 2)) - 9;  // 9시를 기준으로 시간대 계산
            int endHour = Integer.parseInt(rs.getString("EndTime").substring(0, 2)) - 9;

            for (int i = startHour; i <= endHour; i++) {
                timetable[weekday][i] = courseName + "<br>(" + lecturerName + ")";  // 시간대에 과목명과 교수명 배치
            }
        }
    }
%>

<!-- 시간표 출력 -->
<table>
    <thead>
        <tr>
            <th>시간</th>
            <% for (String day : days) { %>
                <th><%= day %></th>
            <% } %>
        </tr>
    </thead>
    <tbody>
        <% 
        // 9시부터 18시까지 시간 출력
        for (int hour = 9; hour <= 18; hour++) { 
        %>
        <tr>
            <td><%= hour %>시</td>
            <% 
            for (int day = 0; day < 5; day++) {  // 월~금까지만 출력
                String course = timetable[day][hour - 9];  // 9시를 기준으로 배열 인덱스 계산
            %>
            <td><%= course.equals("") ? " " : course %></td>
            <% } %>
        </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
