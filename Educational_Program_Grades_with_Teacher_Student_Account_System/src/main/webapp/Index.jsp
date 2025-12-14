<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<section>
    <h2>학사 관리 시스템 안내</h2>
    
    <div style="background: #f8f9fa; padding: 40px; border-radius: 8px; text-align: center;">
        <p style="font-size: 1.1rem; margin-bottom: 20px; color: #555;">
            본 시스템은 <strong>학생 정보</strong>와 <strong>성적 데이터</strong>를<br>
            체계적으로 관리하기 위한 웹 애플리케이션입니다.
        </p>
        
        <div style="display: flex; justify-content: center; gap: 20px; margin-top: 40px; text-align: left;">
            <div style="flex: 1; background: white; padding: 20px; border: 1px solid #eee; border-radius: 8px;">
                <h3 style="color: #21618C; margin-bottom: 10px;">STEP 1</h3>
                <p>시스템 사용을 위해 로그인하거나 회원가입을 진행합니다.</p>
            </div>
            <div style="flex: 1; background: white; padding: 20px; border: 1px solid #eee; border-radius: 8px;">
                <h3 style="color: #21618C; margin-bottom: 10px;">STEP 2</h3>
                <p>교사는 학생 성적을 입력하고, 학생은 자신의 성적을 조회할 수 있습니다.</p>
            </div>
            <div style="flex: 1; background: white; padding: 20px; border: 1px solid #eee; border-radius: 8px;">
                <h3 style="color: #21618C; margin-bottom: 10px;">STEP 3</h3>
                <p>전체 학생 조회 및 성적 통계 데이터를 확인합니다.</p>
            </div>
        </div>
    </div>
</section>

<footer>
    <h2 style="text-align: center;">Copyright @ 2018 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>