<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/EMR/manager_opt.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/opt/manager_opt.js"></script><!--  자바 스크립트  -->
<title>매니저 옵션</title>
</head>
<body>
<form action="" id="ManagerForm" method="post">
<c:choose>
	<c:when test="${empty param.page}">
		<input type="hidden" name="page" value="1"/>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="page" value="${param.page}"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
<input type="hidden" id="man_Hospital" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 --> 
<input type="hidden" name="LV_CODE" value="${sLv_Code}"/> <!-- 병원 코드 가져오기 -->
<input type="hidden" name="MAN_RESET" id="MAN_RESET"/>
</form>

<div class="man_main">
	<div class="man_top">
		<div class="man_top_jinryo"><b>병원 옵션</b></div>
		<div class="man_top_hos">
		<form action='' id='Man_opt_Form' method='post' style="width: 100%; height: 100%;">
			<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 --> 
			<table class="man_table">
				<colgroup>
					<col style="width: 16%;">
					<col style="width: 15%;">
					<col style="width: 15%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 30%;">
					<col style="width: 10%;">
				</colgroup>
				<tr>
					<th>평일 및 주말 진료 시작</th>
					<th>평일 진료 종료</th>
					<th>주말 진료 종료</th>
					<th>토요일 진료</th>
					<th>일요일 진료</th>
					<th>점심 시간</th>
					<th>예약 간격</th>
				</tr>
				<tbody id="manager_opt_tb"></tbody>
			</table>
			</form>
		</div>
		<div class="man_top_btn_lay">
			<div class="man_top_btn">
				<input type="button" value="수정" id="man_update_btn" class=man_top_btn_size>
			</div>
		</div>
	</div><hr/>
	<div class="man_bottom_lay">
		<div class="man_bottom_doc_nur"><b>의사 및 간호사 계정 관리</b></div>
		<div class="man_bottom_all_emp">
			<table class="man_table">
				<colgroup>
					<col style="width: 8%;">
					<col style="width: 8%;">
					<col style="width: 10%;">
					<col style="width: 8%;">
					<col style="width: 10%;">
					<col style="width: 21%;">
					<col style="width: 21%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
				</colgroup>
				<tr>
					<th>직원 번호</th>
					<th>직책</th>
					<th>진료과</th>
					<th>등급</th>
					<th>직원명</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>사용여부</th>
					<th>비밀번호</th>
				</tr>
				<tbody id="man_tt"></tbody>
			</table>
		</div>
		<div class="man_bottom_btn_lay">
			<div class="man_bottom_paging_lay">
				<div class="man_bottom_paging" id="manager_paging"></div>
			</div>
			<div class="man_bottom_btn">
				<input type="button" value="계정 등록" class="man_bot_btn_size" id="rok_popup">
			</div>
		</div>
	</div>
</div>
</body>
</html>