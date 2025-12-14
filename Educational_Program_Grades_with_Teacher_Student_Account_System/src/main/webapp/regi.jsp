<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 등록</title>
<script type="text/javascript">
    function validateForm() {
        var id = document.forms["studentForm"]["id"].value;
        var korean = document.forms["studentForm"]["korean"].value;
        var english = document.forms["studentForm"]["english"].value;
        var math = document.forms["studentForm"]["math"].value;
        var history = document.forms["studentForm"]["history"].value;
        if (id == "") { alert("학번을 입력해주세요."); document.forms["studentForm"]["id"].focus(); return false; }
        if (korean == "") { alert("국어 점수를 입력해주세요."); document.forms["studentForm"]["korean"].focus(); return false; }
        if (english == "") { alert("영어 점수를 입력해주세요."); document.forms["studentForm"]["english"].focus(); return false; }
        if (math == "") { alert("수학 점수를 입력해주세요."); document.forms["studentForm"]["math"].focus(); return false; }
        if (history == "") { alert("역사 점수를 입력해주세요."); document.forms["studentForm"]["history"].focus(); return false; }
        return true;
    }
</script>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>
    <%
        String role = (String) session.getAttribute("role");
        if ("student".equals(role)) {
            out.println("<script>alert('교사만 이 페이지에 접근할 수 있습니다.'); location.href='Index.jsp';</script>");
        } else if (role == null) {
            out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        }
    %>
    
    <section>
        <h2>학생 성적 등록</h2>
        <form name="studentForm" action="RegiConfirm.jsp" onsubmit="return validateForm()" style="max-width: 600px; margin: 0 auto;">
            <table style="border: none;">
                <colgroup>
                    <col style="width: 30%; background-color: #f4f6f6;">
                    <col style="width: 70%;">
                </colgroup>
                <tr>
                    <th>학번</th>
                    <td style="text-align: left;"><input type="text" name="id" placeholder="예: 20230101"></td>
                </tr>
                <tr>
                    <th>국어</th>
                    <td style="text-align: left;"><input type="text" name="korean" placeholder="0 ~ 100"></td>
                </tr>
                <tr>
                    <th>영어</th>
                    <td style="text-align: left;"><input type="text" name="english" placeholder="0 ~ 100"></td>
                </tr>
                <tr>
                    <th>수학</th>
                    <td style="text-align: left;"><input type="text" name="math" placeholder="0 ~ 100"></td>
                </tr>
                <tr>
                    <th>역사</th>
                    <td style="text-align: left;"><input type="text" name="history" placeholder="0 ~ 100"></td>
                </tr>
            </table>
            
            <div style="text-align: center; margin-top: 20px;">
                <input type="submit" value="성적 등록" style="width: 100%; max-width: 200px;">
            </div>
        </form>
    </section>

<footer>
    <h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>