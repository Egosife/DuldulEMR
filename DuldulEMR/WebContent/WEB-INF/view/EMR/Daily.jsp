<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/Daily/Daily.js"></script> <!-- 자바 스크립트 -->

<title>일일 업무 일지</title>
</head>
<body>
<form action="" id="dailyForm" method="post">
<c:choose>
	<c:when test="${empty param.page}">
		<input type="hidden" name="page" value="1"/>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="page" value="${param.page}"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->

</form>
<!-- 16.11.25 일일 업무 일지 조회, 김남기 -->
<div class="Dai_main_knk"> <!-- 메인 레이아웃 -->
	<div class="Dai_top_knk"> <!-- 레이아웃 상단 -->
		<div class="Dai_b_information"><b>기본 정보</b></div> <!-- 레이아웃 - 기본 정보 -->
		<table class="Dai_d_table"> <!-- 기본 정보 테이블 -->
			<tr>
				<th>성 명</th>
				<th>직 책</th>
				<th>사원 번호</th>
				<th>근무과</th>
			</tr>
			<tbody id="tb_emp"></tbody> <!-- 직원 데이터 가져오기 -->
		</table>
	</div>
	<div class="Dai_middle_knk"> <!-- 레이아웃 중단 -->
		<div class="Dai_report"><b>업무 일지</b></div><!-- 레이아웃 중단 - 업무 일지 -->
		<div class="Dai_layoutt_table">
		<table class="Dai_db_table" style="table-layout: fixed;"> <!-- 업무 일지 테이블 -->
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 10%;">
				<col style="width: 85%;">
			</colgroup>
			<tr>
				<th>일 차</th>
				<th>업무 일자</th>
				<th>업무 내용</th>
			</tr>
			<tbody id="tb"></tbody> <!-- 내용 데이터 가져오기 -->
		</table>
		</div>
	</div><hr>
	<div class="Dai_bottom_knk"> <!-- 레이아웃 하단 -->
		<div class="Dai_bottom_top"> <!-- 레이아웃 하단 - 상단 -->
			<div class="Dai_btn_knk">
				<input type="button" value="글쓰기" class="Dai_btn_btn" id="insertBtn" tab='Daily_write*일지작성*Daily_write'> <!-- 레이아웃 하단 - 글쓰기 버튼 크기  -->
			</div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
		</div>
		<div class="Dai_bottom_bt"> <!-- 레이아웃 하단 - 하단 -->
			<div class="Dai_paging" id="pagingArea"></div> <!-- 레이아웃 하단 - 페이징 -->
		</div>
	</div>
</div>
</body>
</html>