<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/EMR/rest_apply.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/Rest/rest_apply.js"></script> <!-- 자바 스크립트 -->
<title>휴진 현황</title>
</head>
<body>
<form action="" id="RestApplyForm" method="post">
<c:choose>
	<c:when test="${empty param.page}">
		<input type="hidden" name="page" value="1"/>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="page" value="${param.page}"/>
	</c:otherwise>
</c:choose>
<input type="hidden" id="rest_sea" name="rest_sea"/>
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 --> 
</form>

<div class="rest_apply_main">
	<div class="rest_apply_top">
		<div class="rest_apply_request"><b>나의 신청 현황 및 기록</b></div>
		<div class="rest_apply_top_table">
			<div class="rest_apply_lay_table">
				<table class="rest_apply_set_table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 25%;">
						<col style="width: 45%;">
						<col style="width: 15%;">
					</colgroup>
					<thead >
					<tr >
	  					<th >휴진 신청일</th>
        			    <th >휴진 기간</th>
         			    <th >휴진 신청 사유</th>
						<th >승인 여부</th>
					</tr>
				</thead>
					<tbody id="rest_app_tv"></tbody>
				</table>
			</div><hr/>
		</div>
		<div class="rest_apply_btn_lay">
			<div class="rest_apply_btn_btn">
				<input type="button" value="신청" class="rest_apply_btn_btn_civa" id="rest_app_insertBtn" tab='rest*휴진신청*rest'>
			</div>
		</div>
		<div class="rest_apply_top_pag">
			<div class="rest_apply_paging" id="rest_app_pagingArea_top"></div>
		</div><hr/>
	</div>
	<div class="rest_apply_bottom">
		<div class="rest_apply_rest"><b>휴진 현황</b></div>
		<div class="rest_apply_text">
				<div class="rest_apply_ilsi">
					일 시 <input type="text" class="rest_apply_box" name="records" id="rest_app_datepickersss" placeholder="날짜 선택" readonly="readonly">
				</div>
				<div class="rest_apply_iBtn">
					<input type="button" value="검색" id="rest_app_cal" class="rest_apply_btn_btn_civa">
					<input type="button" value="목록" id="rest_app_mokrok_Btn" class="rest_apply_btn_btn_civa" tab="rest_apply*휴진현황*rest_apply">
				</div>
		</div>
		<div class="rest_apply_btm_table">
			<div class="rest_apply_btm_t">
				<table class="rest_apply_table_table">
					<colgroup>
						<col style="width: 12%;">
						<col style="width: 13%;">
						<col style="width: 12%;">
						<col style="width: 13%;">
						<col style="width: 25%;">
						<col style="width: 35%;">
					</colgroup>
					<thead >
					<tr>
						<th>직원 번호</th>
        			    <th>성 명</th>
         			    <th>직 책</th>
						<th>진료과</th>
						<th>휴진 날짜</th>
						<th>휴진 사유</th>
					</tr>
					</thead>
				
				
					<tbody id="rest_app_tt"></tbody>
				</table>
			</div>
		</div>
		<div class="rest_apply_btm_pag">
			<div class="rest_apply_bt_paging" id="rest_app_paging_Area"></div>
		</div>
	</div>
</div>
</body>
</html>