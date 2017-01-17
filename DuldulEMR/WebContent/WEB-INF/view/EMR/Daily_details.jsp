<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일일 업무 일지 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/Daily/Daily_details.js"></script> <!-- 자바 스크립트 -->
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
</head>
<body>
<form action="" id="details_del" method="post">
	<input type="hidden" name="TURN" value="${param.TURN}"/>
</form>
<form action="" id="details_up" method="post">
	<input type="hidden" name="TURN" value="${param.TURN}"/>
<div class="Daily_main_mm"> <!-- 메인 레이아웃 -->
   <div class="Daily_top_tt"> <!-- 레이아웃 상단 -->
      <div class="Daily_daily"><b>업무 일지</b></div><hr/> <!-- 레이아웃 상단 - 업무 일지 -->
      <div class="Daily_calender">업무 날짜</div> <!-- 레이아웃 상단 - 업무 날짜  -->
     	 <div class="Daily_cal_btn"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	<input type="text" placeholder="날짜를 선택하세요" name="records" class="Daily_cal_text" id="details_calendar" readonly="readonly" value="${cond.RDATE}">
    	  </div>
   </div><hr> <!-- 구분선 -->
   <div class="Daily_middle_mm"> <!-- 레이아웃 중단 -->
	<div class="Daily_mid_work">업무 내용</div> <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="Daily_mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
         <%-- <input type="text" placeholder="내용을 입력하세요" name="contents" class="text_size"value="${cond.CONTENT}"/> --%>
         <textarea name="contents" class="Daily_text_size" id="details_text" readonly="readonly">${cond.CONTENT}</textarea>
      </div>
   </div><hr/>
   <div class="Daily_bottom_bb"> <!-- 레이아웃 하단  -->
         <div class="Daily_btn_1">
         	<input type="button" value="수정" class="Daily_btn_button" id="details_updateBtn"/>
         	<input type="button" value="취소" class="Daily_btn_button" id="details_listBtn" tab='Daily_details'/>
         	<input type="button" value="삭제" class="Daily_btn_button" id="details_delete"/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>
</div>
</form>
</body>
</html>