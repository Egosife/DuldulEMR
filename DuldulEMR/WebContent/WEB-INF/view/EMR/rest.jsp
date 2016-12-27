<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" />
<script type="text/javascript" src="resources/script/Rest/rest.js"></script> <!-- 자바 스크립트 -->

</head>
<body>
	<input type="hidden" id="SDATE" name="SDATE" value="${conn.SDATE}" />
	<input type="hidden" id="EDATE" name="EDATE" value="${conn.EDATE}" />
	<input type="hidden" id="TDATE" name="TDATE"/>
<!-- 직원 데이터 가져오기 -->
<form action="" id="restEmp_Form" method="post">
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->
</form>

<!-- 글 쓰기 저장 하기 -->
<form id="rest_wri" method="post">
		<input type="hidden" name="nums" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
		<input type="hidden" name="hospital" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->
		
<div class="rest_main"> <!-- 메인 레이아웃 -->
	<div class="rest_top"> <!-- 레이아웃 상단 -->
		<div class="rest_b_information"><b>기본 정보</b></div> <!-- 레이아웃 - 기본 정보 -->
		<table border="1" class="rest_d_table"> <!-- 기본 정보 테이블 -->
			<tr>
				<td>성 명</td>
				<td>직 책</td>
				<td>사원 번호</td>
				<td>근무과</td>
			</tr>
			<tbody id="tb_emp"></tbody> <!-- 직원 데이터 가져오기 -->
		</table>
	</div>
	<div class="rest_middle"> <!-- 레이아웃 중단 -->
		<div class="rest_report"><b>휴진 신청</b></div>
			<div class="rest_mid_top">
				<div class="rest_calender">휴진 날짜</div>
				<div class="rest_cal_btn"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
	        		<input type="text" name="sdate" placeholder="날짜를 선택하세요" class="rest_cal_le" id="r_datepicker1s" readonly="readonly"> ~ 
	        		<input type="text" name="edate" placeholder="날짜를 선택하세요" class="rest_cal_text" id="r_datepicker2s" readonly="readonly">
        		</div>
    	 	</div>
    	  <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="rest_mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
      <div class="rest_mid_work">휴진 내용</div>
         <textarea name="reason" id="rest_text" class="rest_text_size"></textarea>
      </div>
   </div><hr>
    <div class="rest_bottom_bb"> <!-- 레이아웃 하단  -->
         <div class="rest_btn_1">
         	<input type="button" value="등록" class="rest_btn_button" id="jajangBtn"/> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="rest_btn_button" id="sunsilBtn" tab='rest'/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>
   </div> <!-- 구분선 -->
		</form>
</body>
</html>