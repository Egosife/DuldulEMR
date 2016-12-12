<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<!-- script 영역 -->
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<title>업무 일지 글쓰기</title>
</head>
<!-- 16.11.25 일일 업무 일지 글쓰기, 김남기 -->
<body>
<form action="" id="" method="post">
	<input type="hidden" name="page" value="${param.page}"/> <!-- 페이지 가져오기 -->
</form>
		<form id="daily_wri" method="post">
		<input type="hidden" name="nums" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
		<input type="hidden" name="hospital" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->
<div class="Daily_main_mm"> <!-- 메인 레이아웃 -->
   <div class="Daily_top_tt"> <!-- 레이아웃 상단 -->
      <div class="Daily_daily"><b>업무 일지</b></div> <!-- 레이아웃 상단 - 업무 일지 -->
      <div class="Daily_calender">업무 날짜</div> <!-- 레이아웃 상단 - 업무 날짜  -->
     	 <div class="Daily_cal_btn" style="text-align: center"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	<input type="text" name="records" placeholder="날짜를 선택하세요" class="Daily_cal_text" id="datepicker1" readonly>
    	 </div>
   </div><hr> <!-- 구분선 -->
   <div class="Daily_middle_mm"> <!-- 레이아웃 중단 -->
	<div class="Daily_mid_work">업무 내용</div> <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="Daily_mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
         <textarea name="contents" id="naeyoung" class="Daily_text_size"></textarea>
      </div>
   </div><hr/>
   <div class="Daily_bottom_bb"> <!-- 레이아웃 하단  -->
         <div class="Daily_btn_1">
         	<input type="button" value="등록" class="Daily_btn_button" id="saveBtn"/> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="Daily_btn_button" id="cancelBtn" tab='Daily_write'/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>
</div>
		</form>
</body>
</html>