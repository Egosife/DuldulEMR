<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<title>업무 일지 글쓰기</title>
</head>
<!-- 16.11.25 일일 업무 일지 글쓰기, 김남기 -->
<body>
<div class="main"> <!-- 메인 레이아웃 -->
   <div class="top"> <!-- 레이아웃 상단 -->
      <div class="daily"><b>업무 일지</b></div> <!-- 레이아웃 상단 - 업무 일지 -->
      <div class="calender">업무 날짜</div> <!-- 레이아웃 상단 - 업무 날짜  -->
     	 <div class="cal_btn"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	 <input type="text" placeholder="날짜를 선택하세요" id="cal_text">
    	  </div>
   </div><hr> <!-- 구분선 -->
   <div class="middle"> <!-- 레이아웃 중단 -->
	<div class="mid_work">업무 내용</div> <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
         <input type="text" placeholder="내용을 입력하세요" id="text_size">
      </div>
   </div><hr/>
   <div class="bottom"> <!-- 레이아웃 하단  -->
      <div class="bottom_top"> <!-- 레이아웃 하단 - 상단 -->
         <div class="btn">
         	<input type="button" value="글쓰기" id="btn_btn"> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
      </div>
      <div class="bottom_bt"> <!-- 레이아웃 하단 - 하단 -->
         <div class="paging">이전 1 2 3 4 5 다음</div> <!-- 레이아웃 하단 - 페이징 -->
      </div>
   </div>
</div>
</body>
</html>