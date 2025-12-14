<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 결과</title>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>
    <%
    String role = (String) session.getAttribute("role");
    if (role == null || (!"student".equals(role) && !"teacher".equals(role))) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
    } else {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        String sql1 = "select mt.id, mt.name, substr(mt.id, 1, 1), substr(mt.id, 2, 2), substr(mt.id, 4, 2), mt.gender, "
                + "st.korean, st.math, st.english, st.history, "
                + "st.korean + st.math + st.english + st.history as total, "
                + "(st.korean + st.math + st.english + st.history) / 4 as av, "
                + "rank() over(order by st.korean + st.math + st.english + st.history desc) as ran "
                + "from member_tbl_01 mt, score_tbl_01 st "
                + "where mt.id = st.id "
                + "order by st.id desc";

        String sql2 = "select sum(korean) as sk, sum(math) as sm, sum(english) as se, sum(history) as sh, "
                + "sum(korean) + sum(math) + sum(english) + sum(history) as total, "
                + "avg(korean + math + english + history) as ag "
                + "from score_tbl_01";
        Statement stmt = conn.createStatement();
    %>
    
    <section>
        <h2>학생 성적 현황</h2>
        
        <div style="overflow-x: auto;">
            <table>
                <thead>
                    <tr>
                        <th colspan="6" style="background: #34495e;">학생 정보</th>
                        <th colspan="4" style="background: #21618C;">과목 점수</th>
                        <th colspan="3" style="background: #117A65;">종합 결과</th>
                    </tr>
                    <tr>
                        <th>학번</th>
                        <th>이름</th>
                        <th>학년</th>
                        <th>반</th>
                        <th>번호</th>
                        <th>성별</th>
                        <th>국어</th>
                        <th>수학</th>
                        <th>영어</th>
                        <th>역사</th>
                        <th>합계</th>
                        <th>평균</th>
                        <th>석차</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    ResultSet rs = stmt.executeQuery(sql1);
                    while(rs.next()) { %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td style="font-weight: bold;"><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(7) %></td>
                        <td><%= rs.getString(8) %></td>
                        <td><%= rs.getString(9) %></td>
                        <td><%= rs.getString(10) %></td>
                        <td style="color: #21618C; font-weight: bold;"><%= rs.getString(11) %></td>
                        <td style="color: #117A65; font-weight: bold;"><%= String.format("%.1f", rs.getDouble(12)) %></td>
                        <td><span style="background: #F1C40F; color: white; padding: 2px 8px; border-radius: 10px; font-size: 0.8rem;"><%= rs.getString(13) %>위</span></td>
                    </tr>
                    <%
                    } 
                    %>
                    
                    <%
                    rs = stmt.executeQuery(sql2);
                    rs.next();
                    %>
                    <tr style="background-color: #f2f3f4; border-top: 2px solid #bdc3c7;">
                        <td colspan="6" style="text-align: right; padding-right: 20px; font-weight: bold;">과목별 총점 및 평균</td>
                        <td style="font-weight: bold;"><%= rs.getString(1) %></td>
                        <td style="font-weight: bold;"><%= rs.getString(2) %></td>
                        <td style="font-weight: bold;"><%= rs.getString(3) %></td>
                        <td style="font-weight: bold;"><%= rs.getString(4) %></td>
                        <td style="font-weight: bold; color: #c0392b;"><%= rs.getString(5) %></td>
                        <td style="font-weight: bold; color: #c0392b;"><%= String.format("%.1f", rs.getDouble(6)) %></td>
                        <td>-</td>
                    </tr>
                    <%
                    rs.close();
                    %>
                </tbody>
            </table>
        </div>
    </section>
    
    <% 
    }
    %>

<footer>
    <h2 style="text-align: center;">Copyright @ 2018 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>