<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<section>
    <h2>시스템 이용 가이드</h2>
    
    <div style="text-align: center; max-width: 800px; margin: 0 auto;">
        <p style="font-size: 1.1rem; color: #555; margin-bottom: 40px;">
            본 시스템은 <strong>편의점 매출 데이터</strong>와 <strong>상품 정보</strong>를 효율적으로 관리하기 위한 통합 솔루션입니다.
        </p>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
            <div style="background: #fff; padding: 20px; border: 1px solid #eee; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
                <div style="font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;">01</div>
                <h3 style="font-size: 1rem; margin-bottom: 10px;">기초 데이터 구축</h3>
                <p style="font-size: 0.9rem; color: #777;">상품/매출/점포 테이블 생성 및 기초 데이터 설정</p>
            </div>
            
            <div style="background: #fff; padding: 20px; border: 1px solid #eee; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
                <div style="font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;">02</div>
                <h3 style="font-size: 1rem; margin-bottom: 10px;">상품 및 매출 관리</h3>
                <p style="font-size: 0.9rem; color: #777;">신규 상품 등록 및 일별 매출 내역 등록 프로그램 작성</p>
            </div>
            
            <div style="background: #fff; padding: 20px; border: 1px solid #eee; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
                <div style="font-size: 2rem; color: var(--primary-color); margin-bottom: 10px;">03</div>
                <h3 style="font-size: 1rem; margin-bottom: 10px;">현황 분석</h3>
                <p style="font-size: 0.9rem; color: #777;">점포별 매출 통계 및 재고 현황 조회 기능 구현</p>
            </div>
        </div>
    </div>
</section>

<footer>
    <h2 style="text-align: center;">Copyright @ 2025 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>