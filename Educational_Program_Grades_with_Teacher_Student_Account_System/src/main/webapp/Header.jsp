<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학사 관리 시스템</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style type="text/css">
    :root {
        --primary-color: #21618C; /* Academic Blue */
        --secondary-color: #117A65; /* Deep Green */
        --accent-color: #F1C40F; /* Gold for highlights */
        --bg-color: #ecf0f1;
        --white: #ffffff;
        --text-color: #2c3e50;
        --border-radius: 8px;
        --shadow: 0 4px 15px rgba(0,0,0,0.08);
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    /* Header Styling */
    header {
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        padding: 20px 0;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        text-align: center;
    }

    header h1 {
        color: var(--white);
        font-size: 1.6rem;
        font-weight: 700;
        letter-spacing: 1px;
    }

    /* Navigation */
    nav {
        background-color: #fff;
        border-bottom: 1px solid #ddd;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0 20px;
        height: 60px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }

    nav a.HeadA {
        color: var(--text-color);
        text-decoration: none;
        padding: 0 20px;
        font-weight: 500;
        font-size: 1rem;
        height: 60px;
        line-height: 60px;
        transition: all 0.3s;
        border-bottom: 3px solid transparent;
    }

    nav a.HeadA:hover {
        color: var(--primary-color);
        border-bottom: 3px solid var(--primary-color);
        background-color: #f8f9fa;
    }

    #userRole {
        margin-left: auto; /* Push to right */
        font-weight: bold;
        color: var(--secondary-color);
        font-size: 0.9rem;
        margin-right: 15px;
        padding: 5px 10px;
        background: rgba(17, 122, 101, 0.1);
        border-radius: 20px;
    }

    #logoutButton {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 6px 15px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.9rem;
        transition: background 0.3s;
    }

    #logoutButton:hover { background-color: #c0392b; }

    /* Main Container */
    section, .login-container, .signup-container {
        width: 100%;
        max-width: 1000px;
        margin: 40px auto;
        padding: 30px;
        background: var(--white);
        border-radius: var(--border-radius);
        box-shadow: var(--shadow);
    }

    h2 {
        color: var(--primary-color);
        text-align: center;
        margin-bottom: 30px;
        font-size: 1.8rem;
        position: relative;
    }
    
    h2::after {
        content: '';
        display: block;
        width: 60px;
        height: 3px;
        background: var(--secondary-color);
        margin: 10px auto 0;
    }

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th {
        background-color: var(--primary-color);
        color: white;
        padding: 12px;
        font-weight: 500;
        text-align: center;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #eee;
        text-align: center;
        color: #555;
    }
    
    tr:hover td { background-color: #f1f9f9; }

    /* Form Inputs */
    input[type="text"], input[type="password"], select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        outline: none;
        transition: border 0.3s;
    }

    input[type="text"]:focus, input[type="password"]:focus {
        border-color: var(--primary-color);
    }

    /* Buttons */
    input[type="submit"], button, .signup-btn {
        background-color: var(--secondary-color);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1rem;
        font-weight: 500;
        transition: 0.3s;
        margin-top: 15px;
    }

    input[type="submit"]:hover, button:hover, .signup-btn:hover {
        background-color: #0e6655;
        transform: translateY(-2px);
    }

    footer {
        background-color: #34495e;
        color: #bdc3c7;
        padding: 20px 0;
        text-align: center;
        margin-top: auto;
    }
    footer h2 { font-size: 0.9rem; margin: 0; color: inherit; font-weight: 300; }
    footer h2::after { display: none; }
</style>
<script>
    function logout() {
        if (confirm("로그아웃 하시겠습니까?")) {
            location.href = "logout.jsp";
        }
    }
</script>
</head>
<body>
<header>
    <h1>학사 관리</h1>
</header>

<nav>
    <%
        String role = (String) session.getAttribute("role");
        if (role == null) {
    %>
        <a href="login.jsp" class="HeadA">로그인</a>
    <%
        }
    %>
    <a href="List.jsp" class="HeadA">학생조회</a>
    <a href="regi.jsp" class="HeadA">학생성적입력</a>
    <a href="Result.jsp" class="HeadA">학생성적조회</a>
    <a href="Index.jsp" class="HeadA">홈으로</a>
    <%
        if (role != null) {
            String roleDisplay = "학생";
            if ("teacher".equals(role)) {
                roleDisplay = "교사";
            }
    %>
        <span id="userRole">사용자: <%= roleDisplay %></span>
        <button id="logoutButton" onclick="logout()">로그아웃</button>
    <%
        }
    %>
</nav>