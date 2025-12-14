<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "select id, name, substr(id, 1, 1), substr(id, 2, 2), substr(id, 4, 2), gender from member_tbl_01";
	ResultSet rs = conn.prepareStatement(sql).executeQuery();
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<section>
		<h2>전체 학생 조회</h2>
		
		<div style="overflow-x: auto;">
    		<table>
    			<thead>
        			<tr>
        				<th width="20%">학번</th>
        				<th width="20%">이름</th>
        				<th width="15%">학년</th>
        				<th width="15%">반</th>
        				<th width="15%">번호</th>
        				<th width="15%">성별</th>
        			</tr>
    			</thead>
    			<tbody>
        			<%
        			while(rs.next()) {
        			%>
        			<tr>
        				<td style="font-weight: bold; color: #21618C;"><%=rs.getString(1)%></td>
        				<td><%=rs.getString(2)%></td>
        				<td><%=rs.getString(3)%>학년</td>
        				<td><%=rs.getString(4)%>반</td>
        				<td><%=rs.getString(5)%>번</td>
        				<td>
                            <% String g = rs.getString(6); %>
                            <span style="color: <%= "M".equals(g) ? "#2980b9" : "#c0392b" %>; font-weight: bold;">
                                <%= "M".equals(g) ? "남" : "여" %>
                            </span>
                        </td>
        			</tr>
        			<%
        			}
        			%>
    			</tbody>
    		</table>
		</div>
	</section>

<footer>
    <h2 style="text-align: center;">Copyright @ 2018 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>