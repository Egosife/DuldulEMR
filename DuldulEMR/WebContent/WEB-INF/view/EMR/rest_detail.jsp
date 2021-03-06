<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴진 자세히 보기</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/Rest/rest_detail.js"></script> <!-- 자바 스크립트 -->

</head>
<body>
	<input type="hidden" id="rd_SDATE" name="SDATE" value="${conn.SDATE}" />
	<input type="hidden" id="rd_EDATE" name="EDATE" value="${conn.EDATE}" />
	<input type="hidden" id="DT_DATE" name="DT_DATE"/>
	<input type="hidden" id="rd_R_CHECK" name="R_CHECK" value="${conn.R_CHECK}"/>
<!-- 직원 데이터 가져오기 -->
<form action="" id="restEmp_Form" method="post">
	<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
	<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->
</form>
<!-- 삭제  -->
<form action="" id="tail_del"  method="post">
	<input type="hidden" name=SNUM value="${param.SNUM}"/>
</form>
<!-- 수정 -->
<form action="" id="tail_up" method="post">
	<input type="hidden" name="SNUM" value="${param.SNUM}"/>
<div class="rest_main"> 
	<div class="rest_top"> 
		<div class="rest_b_information"><b>기본 정보</b></div> 
		<table  class="rest_d_table"> 
				<colgroup>
						<col style="width: 15%;">
						<col style="width: 25%;">
						<col style="width: 45%;">
						<col style="width: 15%;">
					</colgroup>
			<thead >
					<tr>
				<th>성 명</th>
				<th>직 책</th>
				<th>사원 번호</th>
				<th>근무과</th>
			</tr>
					</thead>
			<tbody id="rd_tb_emp"></tbody> <!-- 직원 데이터 가져오기 -->
		</table>
	</div>
	<div class="rest_middle"> <!-- 레이아웃 중단 -->
		<div class="rest_report"><b>휴진 신청</b></div><hr/>
			<div class="rest_mid_top">
				<div class="rest_calender">휴진 날짜</div>
					<div class="rest_cal_btn"> 
		        		<input type="text" name="rd_datepicker1" placeholder="날짜를 선택하세요" class="rest_cal_text" id="restd_datepicker1" readonly="readonly" value="${conn.SDATE}"> ~ 
		        		<input type="text" name="rd_datepicker2" placeholder="날짜를 선택하세요" class="rest_cal_text" id="restd_datepicker2" readonly="readonly" value="${conn.EDATE}">
		    	 	</div>
    	 	</div>
    	<!-- 레이아웃  중단 - 업무 내용 -->
      <div class="rest_mid_text">
      <div class="rest_mid_work">휴진 내용</div>
         <textarea name="reason" id="rd_rest_rest" placeholder="내용을 입력하세요" class="rest_text_size" readonly="readonly">${conn.R_REASON}</textarea>
      </div>
   </div><hr>
    <div class="rest_bottom_bb"> <!-- 레이아웃 하단  -->
         <div class="rest_btn_1">
         	<input type="button" value="수정" class="rest_btn_button" id="rd_sujeongBtn"/> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="rest_btn_button" id="rd_chisoBtn" tab='rest_detail'/>
         	<input type="button" value="삭제" class="rest_btn_button" id="rd_sakjeBtn"/>
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>
   </div> <!-- 구분선 -->
</form>
</body>
</html>