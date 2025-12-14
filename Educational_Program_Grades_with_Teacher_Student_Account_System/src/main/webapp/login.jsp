<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

    <div class="login-container" style="max-width: 400px;">
        <h2>로그인</h2>
        <form method="POST" action="loginProcess.jsp">
            <div style="margin-bottom: 15px;">
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">아이디</label>
                <input type="text" name="userId" placeholder="아이디를 입력하세요" required>
            </div>
            <div style="margin-bottom: 20px;">
                <label style="display: block; margin-bottom: 5px; font-weight: bold;">비밀번호</label>
                <input type="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            
            <input type="submit" value="로그인" style="width: 100%; margin-top: 0;">
        </form>
        
        <div style="margin-top: 15px; border-top: 1px solid #eee; padding-top: 15px;">
             <form action="signup.jsp">
                <input type="submit" class="signup-btn" value="회원가입" style="width: 100%; background-color: #95a5a6;">
            </form>
        </div>
    </div>
    
<footer>
    <h2 style="text-align: center;">Copyright @ 2018 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>