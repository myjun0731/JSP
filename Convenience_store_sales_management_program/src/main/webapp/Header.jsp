<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>편의점 매출 관리 시스템</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style type="text/css">
    :root {
        --primary-color: #ff7f00; /* Retail Orange */
        --secondary-color: #2c3e50; /* Dark Navy */
        --bg-color: #f5f6fa;
        --card-bg: #ffffff;
        --text-color: #2d3436;
        --border-color: #dfe6e9;
        --shadow: 0 4px 6px rgba(0,0,0,0.05);
        --radius: 8px;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        line-height: 1.6;
    }

    /* Header Styling */
    header {
        background-color: var(--card-bg);
        border-bottom: 3px solid var(--primary-color);
        padding: 15px 0;
        box-shadow: var(--shadow);
    }
    
    header h1 {
        text-align: center;
        color: var(--secondary-color);
        font-size: 1.5rem;
        font-weight: 700;
    }

    /* Navigation */
    nav {
        background-color: var(--secondary-color);
        display: flex;
        justify-content: center;
        padding: 0;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    nav a.HeadA {
        color: #ecf0f1;
        padding: 15px 25px;
        text-decoration: none;
        font-size: 1rem;
        font-weight: 500;
        transition: background 0.3s, color 0.3s;
        border-bottom: 3px solid transparent;
    }

    nav a.HeadA:hover {
        background-color: #34495e;
        color: var(--primary-color);
        border-bottom-color: var(--primary-color);
    }

    /* Content Layout */
    section {
        width: 100%;
        max-width: 1100px;
        margin: 30px auto;
        padding: 20px;
        background: var(--card-bg);
        border-radius: var(--radius);
        box-shadow: var(--shadow);
        flex: 1;
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: var(--secondary-color);
        font-size: 1.6rem;
        position: relative;
    }
    
    h2::after {
        content: '';
        display: block;
        width: 50px;
        height: 3px;
        background-color: var(--primary-color);
        margin: 10px auto 0;
    }

    /* Tables */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th {
        background-color: var(--secondary-color);
        color: white;
        padding: 12px;
        font-weight: 500;
        text-align: center;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid var(--border-color);
        color: #555;
    }

    tr:hover td { background-color: #fffaf0; } /* Light orange tint on hover */

    /* Forms & Inputs */
    input[type="text"], input[type="number"], select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
        outline: none;
    }
    
    input[type="text"]:focus, input[type="number"]:focus, select:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 2px rgba(255, 127, 0, 0.1);
    }
    
    input[type="text"][readonly] {
        background-color: #f1f2f6;
        color: #7f8c8d;
        cursor: not-allowed;
    }

    /* Buttons */
    input[type="button"], input[type="submit"], button {
        background-color: var(--primary-color);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: 0.3s;
        margin: 0 5px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    input[type="button"]:hover, input[type="submit"]:hover, button:hover {
        background-color: #e67e22;
        transform: translateY(-2px);
    }

    /* Footer */
    footer {
        background-color: #dfe6e9;
        color: #636e72;
        padding: 20px 0;
        text-align: center;
        margin-top: auto;
        font-size: 0.85rem;
    }
    footer h2 {
        font-size: 0.9rem;
        font-weight: 400;
        color: inherit;
        margin: 0;
    }
    footer h2::after { display: none; }
</style>
</head>
<body>
<header>
    <h1>편의점 매출 관리</h1>
</header>

<nav>
    <a href="Regi.jsp" class="HeadA">매출등록</a>
    <a href="Inventory.jsp" class="HeadA">재고관리</a>
    <a href="List.jsp" class="HeadA">상품관리</a>
    <a href="Result.jsp" class="HeadA">매출현황</a>
    <a href="Index.jsp" class="HeadA">홈으로</a>
</nav>