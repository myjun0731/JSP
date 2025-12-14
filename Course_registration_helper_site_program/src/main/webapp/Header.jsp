<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학사 관리 시스템</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style type="text/css">
    /* Global Reset & Variables */
    :root {
        --primary-color: #2c3e50; /* Deep Blue */
        --accent-color: #3498db;  /* Bright Blue */
        --bg-color: #f4f6f9;      /* Light Gray */
        --text-color: #333333;
        --white: #ffffff;
        --border-radius: 8px;
        --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        line-height: 1.6;
    }

    a { text-decoration: none; color: inherit; }
    ul { list-style: none; }

    /* Header & Nav */
    header {
        background: var(--white);
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        padding: 0;
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .header-top {
        background-color: var(--primary-color);
        padding: 15px 0;
        text-align: center;
    }

    .header-top h1 {
        color: var(--white);
        font-size: 1.5rem;
        font-weight: 700;
        margin: 0;
    }

    nav {
        background-color: var(--white);
        border-bottom: 1px solid #e1e4e8;
        display: flex;
        justify-content: center;
    }

    nav a {
        display: block;
        padding: 15px 30px;
        color: var(--text-color);
        font-weight: 500;
        font-size: 1rem;
        transition: all 0.3s ease;
        border-bottom: 3px solid transparent;
    }

    nav a:hover, nav a.active {
        color: var(--accent-color);
        background-color: #f8f9fa;
        border-bottom: 3px solid var(--accent-color);
    }

    /* Main Container */
    section {
        flex: 1;
        width: 100%;
        max-width: 1200px;
        margin: 30px auto;
        padding: 20px;
        background: var(--white);
        border-radius: var(--border-radius);
        box-shadow: var(--shadow);
    }

    h2.title {
        text-align: center;
        margin-bottom: 30px;
        font-size: 1.8rem;
        color: var(--primary-color);
        position: relative;
        padding-bottom: 10px;
    }
    
    h2.title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 50px;
        height: 3px;
        background-color: var(--accent-color);
    }

    /* Tables */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        overflow: hidden;
        border-radius: var(--border-radius);
    }

    th {
        background-color: var(--primary-color);
        color: var(--white);
        padding: 15px;
        font-weight: 500;
        text-align: center;
    }

    td {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
        color: #555;
        text-align: center;
    }

    tr:last-child td { border-bottom: none; }
    tr:hover td { background-color: #f1f7fc; }

    /* Forms */
    input[type="text"], select {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus, select:focus {
        border-color: var(--accent-color);
        outline: none;
    }

    input[type="radio"] { margin-right: 5px; transform: translateY(1px); }
    label { margin-right: 15px; cursor: pointer; }

    /* Buttons */
    .btn-group { text-align: center; margin-top: 20px; }
    
    input[type="submit"], input[type="button"], button {
        background-color: var(--accent-color);
        color: white;
        border: none;
        padding: 10px 25px;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s;
        margin: 0 5px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    input[type="submit"]:hover, input[type="button"]:hover, button:hover {
        background-color: #2980b9;
        transform: translateY(-1px);
    }

    input[type="button"].secondary {
        background-color: #95a5a6;
    }
    input[type="button"].secondary:hover {
        background-color: #7f8c8d;
    }

    /* Footer */
    footer {
        background-color: var(--primary-color);
        color: #ecf0f1;
        text-align: center;
        padding: 20px 0;
        margin-top: auto;
    }
    footer h2 { font-size: 0.9rem; font-weight: 300; margin: 0; opacity: 0.8; }
</style>
</head>
<body>
<header>
    <div class="header-top">
        <h1>수강 신청</h1>
    </div>
    <nav>
        <a href="List.jsp">교과목록 조회/수정</a>
        <a href="Regi.jsp">교과목추가</a>
        <a href="timetable.jsp">시간표조회</a>
        <a href="Index.jsp">홈으로</a>
    </nav>
</header>