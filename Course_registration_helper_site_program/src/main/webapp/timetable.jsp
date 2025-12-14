<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 시간표</title>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>
    
    <%
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

        String sql = "SELECT c.CourseName, l.LecturerName, c.Weekday, c.StartTime, c.EndTime " +
                     "FROM Courses c " +
                     "JOIN Lecturers l ON c.LecturerID = l.LecturerID";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        
        String[] days = {"월", "화", "수", "목", "금"};
        String[][] timetable = new String[5][10];
        
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 10; j++) {
                timetable[i][j] = "";
            }
        }

        while (rs.next()) {
            String courseName = rs.getString("CourseName");
            String lecturerName = rs.getString("LecturerName");
            int weekday = rs.getInt("Weekday") - 1;

            if (weekday < 5) {
                int startHour = Integer.parseInt(rs.getString("StartTime").substring(0, 2)) - 9;
                int endHour = Integer.parseInt(rs.getString("EndTime").substring(0, 2)) - 9;
                for (int i = startHour; i <= endHour; i++) {
                    timetable[weekday][i] = "<strong>" + courseName + "</strong><br><span style='font-size:0.9em; color:#666;'>(" + lecturerName + ")</span>";
                }
            }
        }
    %>

    <section>
        <h2 class="title">강의 시간표</h2>
        
        <table style="table-layout: fixed;">
            <thead>
                <tr>
                    <th style="width: 10%;">시간</th>
                    <% for (String day : days) { %>
                        <th style="width: 18%;"><%= day %></th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <% 
                for (int hour = 9; hour <= 18; hour++) { 
                %>
                <tr>
                    <td style="background: #fdfdfd; font-weight: bold; color: #555;"><%= hour %>:00</td>
                    <% 
                    for (int day = 0; day < 5; day++) {
                        String course = timetable[day][hour - 9];
                        // 강의가 있는 셀은 배경색을 다르게 표시
                        String bgStyle = course.equals("") ? "" : "background-color: #eaf2f8; border: 1px solid #d6eaf8;";
                    %>
                    <td style="<%= bgStyle %>; vertical-align: middle;">
                        <%= course.equals("") ? " " : course %>
                    </td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
        </table>
    </section>

    <footer>
    <h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
    </footer>
</body>
</html>