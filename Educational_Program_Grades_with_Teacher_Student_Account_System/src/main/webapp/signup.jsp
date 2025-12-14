<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script>
        // 기존 로직 100% 유지
        function checkTeacherNumber() {
            var teacherNumber = document.getElementById('teacher_number').value;
            var studentRadio = document.getElementById('studentRadio');
            var teacherRadio = document.getElementById('teacherRadio');
            var teacherRadioRow = document.getElementById('teacherRadioRow');
            var studentNumberRow = document.getElementById('studentNumberRow');
            if (teacherNumber.length === 8) {
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'checkTeacherNumber.jsp', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.responseText.trim() === 'valid') {
                        teacherRadioRow.style.display = 'table-row';
                        teacherRadio.checked = true;
                        studentNumberRow.style.display = 'none';
                    } else {
                        teacherRadioRow.style.display = 'none';
                        studentRadio.checked = true;
                        studentNumberRow.style.display = 'table-row';
                        alert('유효하지 않은 교사 고유번호입니다.');
                    }
                };
                xhr.send('teacher_number=' + teacherNumber);
            } else {
                teacherRadioRow.style.display = 'none';
                studentRadio.checked = true;
                studentNumberRow.style.display = 'table-row';
            }
        }
    </script>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
    <div class="signup-container" style="max-width: 500px;">
        <h2>회원가입</h2>
        <form method="POST" action="signupProcess.jsp">
            <table style="border: none;">
                <colgroup>
                    <col style="width: 30%; text-align: left; font-weight: bold;">
                    <col style="width: 70%;">
                </colgroup>
                <tr>
                    <td style="text-align: left; padding-bottom: 15px;">아이디</td>
                    <td style="text-align: left; padding-bottom: 15px;"><input type="text" name="user_id" placeholder="사용할 아이디" required></td>
                </tr>
                <tr>
                    <td style="text-align: left; padding-bottom: 15px;">이름</td>
                    <td style="text-align: left; padding-bottom: 15px;"><input type="text" name="user_name" placeholder="본명 입력" required></td>
                </tr>
                <tr>
                    <td style="text-align: left; padding-bottom: 15px;">비밀번호</td>
                    <td style="text-align: left; padding-bottom: 15px;"><input type="password" name="user_password" placeholder="비밀번호 설정" required></td>
                </tr>
                <tr>
                    <td style="text-align: left; padding-bottom: 15px;">교사 고유번호</td>
                    <td style="text-align: left; padding-bottom: 15px;">
                        <input type="text" id="teacher_number" name="teacher_number" onkeyup="checkTeacherNumber()" placeholder="교사인 경우 8자리 입력">
                    </td>
                </tr>
                <tr id="studentNumberRow">
                    <td style="text-align: left; padding-bottom: 15px;">학번</td>
                    <td style="text-align: left; padding-bottom: 15px;"><input type="text" name="student_number" placeholder="학생인 경우 입력"></td>
                </tr>
                <tr id="roleRow">
                    <td style="text-align: left;">역할 구분</td>
                    <td style="text-align: left;">
                         <label><input type="radio" id="studentRadio" name="user_role" value="student" checked style="width: auto;"> 학생</label>
                    </td>
                </tr>
                <tr id="teacherRadioRow" style="display: none;">
                    <td></td>
                    <td style="text-align: left;">
                        <label><input type="radio" id="teacherRadio" name="user_role" value="teacher" style="width: auto;"> 교사</label>
                    </td>
                </tr>
            </table>
            
            <input type="submit" value="가입완료" style="width: 100%; margin-top: 20px;">
        </form>
    </div>

<footer>
    <h2 style="text-align: center;">Copyright @ 2018 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>