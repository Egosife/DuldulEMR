<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 161122 이동건 - 페이지 제작 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/calendar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/calendar/calendar.css" />

<!-- jQuery Script -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>

<!-- Daum address api -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<!-- highcharts Script -->
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>

<!-- Script -->
<script type="text/javascript" src="resources/script/main/main.js"></script>
<script type="text/javascript" src="resources/script/calendar/calendar.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	showCalendar(d.getFullYear(),(d.getMonth() + 1));
	
	var startEMR = {tab : "main_first*초기화면*main_first"}
	Open_Tab(startEMR);
});
</script>

<!-- calendar select script -->
<script type="text/javascript">
$(document).ready(function() {
	$.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		showOn: 'button',
		closeText: '닫기',
		buttonImage: 'resources/images/calender.png',
		buttonImageOnly: true,
		dateFormat: 'yy/mm/dd'    
	}); 
	
	$("#optbtn").on("click",function(){
		var acctype = ${sLv_Code}
		
		switch (acctype) {
		case 0:
			var tab2 = {tab : "Service_page*계정옵션*Service_page"};
			var tab = {tab : "adminopt*관리자메뉴*adminopt"};
			ReOpen_Tab(tab2);
			ReOpen_Tab(tab);
			break;
		case 1:
			var tab2 = {tab : "Service_page*계정옵션*Service_page"};
			var tab = {tab : "manager_opt*병원옵션*manager_opt"};
			ReOpen_Tab(tab2);
			ReOpen_Tab(tab);
			break;
		case 2:
		case 3:
			var tab = {tab : "Service_page*계정옵션*Service_page"};
			ReOpen_Tab(tab);
			break;
		}
		
	});
	
});
</script>
<title>DuldulEMR</title>
</head>
<body>
<div class='main_layout'>
<!-- 계정정보 영역 -->
<%-- 
	<div class="main_topbar">
		<div class="main_topbar_title">
			${sHospital_Name} (${sHospital_Code})
		</div>
		<div class="main_topbar_account">
			${sEmp_Name} (${sEmp_Num})
			<div class="main_topbar_account_opt" id="optbtn2"></div>
			<div class="main_topbar_account_logout" id="logoff2"></div>
		</div>
	</div>
--%>
<!-- 시간과 탭영역 -->
	<div class="main_midbar">
		<div class="main_midbar_time" id="nowtime"></div>
		<div class="main_midbar_tabs" id="tab_bar"></div>
	</div>
<!-- 메뉴와 컨텐츠 영역 -->
	<div class="main_content">
		<div class="main_content_menu" id="main_content_menu">
			${sHospital_Name}
			<div style="background-color: #DA70D6;">
			<div class="main_menu_btn" id="menu99_btn">
			<img alt="img1" width="80px" height="80px" style="margin-left: 10px;" src="resources/images/icons/user_b.png">
			<br/>${sEmp_Name}
			</div>
				<div class="menu_btnlist" id="menu99">
					<div class="btnlist_btnsNT" id="optbtn">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/settings.png">
					정보설정</div>
					<div class="btnlist_btnsNT" id="logoff">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/logout.png">
					로그아웃</div>
				</div>
			<div class="main_menu_btn" id="menu0_btn">
			<img alt="img1" width="80px" height="80px" style="margin-left: 10px;" src="resources/images/icons/board_b.png">
			<br/>게 시 판
			</div>
				<div class="menu_btnlist" id="menu0">
					<div class="btnlist_btns" id="menu_0_0" name="menu_btn" tab="notice*공지사항*notice">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/notice.png">
					공지사항</div>
					<div class="btnlist_btns" id="menu_0_1" name="menu_btn" tab="bbs*사내게시판*bbs">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/bbs.png">
					사내게시판</div>
<!-- 					<div class="btnlist_btns" id="menu_0_2" name="menu_btn" tab="none*통합게시판*none">통합게시판</div> -->
				</div>
			<div class="main_menu_btn" id="menu1_btn">
			<img alt="img1" width="80px" height="80px" style="margin-left: 10px;" src="resources/images/icons/info_b.png">
			<br/>정 보 조 회</div>
				<div class="menu_btnlist" id="menu1">
					<div class="btnlist_btns" id="menu_1_0" name="menu_btn" tab="Patient_page*환자조회*Patient_page">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/apa.png">
					환자조회</div>
					<div class="btnlist_btns" id="menu_1_1" name="menu_btn" tab="Emp_page*직원조회*Emp_page">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/emp.png">
					직원조회</div>
					<div class="btnlist_btns" id="menu_1_2" name="menu_btn" tab="Hospital_chart*병원현황*Hospital_chart">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/chat.png">
					병원현황</div>
				</div>
			<div class="main_menu_btn" id="menu2_btn">
			<img alt="img1" width="80px" height="80px" style="margin-left: 10px;" src="resources/images/icons/cal_b.png">
			<br/>일 정 관 리</div>
				<div class="menu_btnlist" id="menu2">
					<div class="btnlist_btns" id="menu_2_0" name="menu_btn" tab="set*환자일정*set">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/apacal.png">
					환자일정</div>
					<div class="btnlist_btns" id="menu_2_1" name="menu_btn" tab="rest_apply*휴진현황*rest_apply">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/rast.png">
					휴진현황</div>
				</div>
			<div class="main_menu_btn" id="menu3_btn">
			<img alt="img1" width="80px" height="80px" style="margin-left: 10px;" src="resources/images/icons/work_b.png">
			<br/>업 무 메 뉴</div>
				<div class="menu_btnlist" id="menu3">
					<div class="btnlist_btns" id="menu_3_1" name="menu_btn" tab="reception*환자접수*reception">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/check.png">
					환자접수</div>
				</div>
			<div class="main_menu_btn" id="menu4_btn">
			<img alt="img1" width="80px" height="80px" style="margin-left: 10px;" src="resources/images/icons/record_b.png">
			<br/>의 무 기 록</div>
				<div class="menu_btnlist" id="menu4">
					<div class="btnlist_btns" id="menu_4_0" name="menu_btn" tab="Daily*업무일지*Daily">
					<img alt="img1" width="50px" height="50px" style="vertical-align:-15px;" src="resources/images/icons/daily.png">
					업무일지</div>
<!-- 					<div class="btnlist_btns" id="menu_4_1" name="menu_btn" tab="none*환자의무기록*k">환자의무기록</div> -->
				</div>
			</div>
		</div>
		<div class="main_content_page" id="main_content_page">
		</div>
	</div>
</div>
</body>
</html>