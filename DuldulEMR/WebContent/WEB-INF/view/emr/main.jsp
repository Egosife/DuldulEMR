<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script> <!-- J쿼리 -->
<script type="text/javascript" src="resources/script/main/main.js"></script>

<title>DuldulEMR</title>
</head>
<body>
<div class='main_layout_LDG'>
<!-- 계정정보 영역 -->
	<div class="main_topbar_LDG">
		<div class="main_topbar_title_LDG">
			테스트병원1 (999999)
		</div>
		<div class="main_topbar_account_LDG">
			테스트계정1 (9999990000)
			<div class="main_topbar_account_opt"></div>
			<div class="main_topbar_account_logout">LOGOUT</div>
		</div>
	</div>
<!-- 시간과 탭영역 -->
	<div class="main_midbar_LDG">
		<div class="main_midbar_time_LDG">
			2016년 11월 22일 화요일<br/>
			00 : 00
		</div>
		<div class="main_midbar_tabs_LDG">
		</div>
	</div>
<!-- 메뉴와 컨텐츠 영역 -->
	<div class="main_content_LDG">
		<div class="main_content_menu_LDG">
			작업 선택
			<div class="main_menu_btn" id="menu0_btn">게 시 판</div>
				<div class="menu_btnlist" id="menu0">
					<div class="btnlist_btns" id="menu0_0">공지사항</div>
					<div class="btnlist_btns" id="menu0_1">사내게시판</div>
					<div class="btnlist_btns" id="menu0_2">통합게시판</div>
				</div>
			<div class="main_menu_btn" id="menu1_btn">정 보 조 회</div>
				<div class="menu_btnlist" id="menu1">
					<div class="btnlist_btns" id="menu1_0">환자조회</div>
					<div class="btnlist_btns" id="menu1_1">직원조회</div>
				</div>
			<div class="main_menu_btn" id="menu2_btn">일 정 관 리</div>
				<div class="menu_btnlist" id="menu2">
					<div class="btnlist_btns" id="menu2_0">환자일정</div>
					<div class="btnlist_btns" id="menu2_1">휴진현황</div>
				</div>
			<div class="main_menu_btn" id="menu3_btn">업 무 메 뉴</div>
				<div class="menu_btnlist" id="menu3">
					<div class="btnlist_btns" id="menu3_0">진료실시입력</div>
					<div class="btnlist_btns" id="menu3_1">환자접수</div>
				</div>
			<div class="main_menu_btn" id="menu4_btn">의 무 기 록</div>
				<div class="menu_btnlist" id="menu4">
					<div class="btnlist_btns" id="menu4_0">업무일지</div>
					<div class="btnlist_btns" id="menu4_1">환자의무기록</div>
				</div>
		</div>
		<div class="main_content_page_LDG">
		</div>
	</div>
</div>
</body>
</html>