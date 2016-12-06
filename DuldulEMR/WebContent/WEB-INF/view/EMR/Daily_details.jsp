<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일일 업무 일지 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="resources/css/common/calendar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />

<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	$("#datepicker1").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#listBtn").on("click",function(){ //목록
		$("#dailyForm").attr("action","Daily"); 
		$("#dailyForm").submit();
	}); //listBtn 끝
	
	$("#updateBtn").on("click",function(){ //수정
		$("#dailyForm").attr("action","Daily");
		$("#dailyForm").submit();
	});//updateBtn	
	$("#deleteBtn").on("click",function(){
		if(confirm("정말 삭제하시겠습니까?")){
			var params = $("#dailyForm").serialize();
			
			$.ajax({
				type : "post",
				url : "dailyDelete",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res>0){
						location.href="Daily";
					}else{
						alert("삭제 中에 문제가 발생하였습니다.")
					}
				},
				error : function(result){
					alert("error!");
				}
			}); //ajax 끝
		} //if 끝
	}); //delete 끝
}); //ready 끝

</script>
</head>
<body>
<form action="" id="dailyForm" method="post">
	<input type="hidden" name="numbers" value="${cond.numbers}"/>
</form>
<div class="main_mm"> <!-- 메인 레이아웃 -->
   <div class="top_tt"> <!-- 레이아웃 상단 -->
      <div class="daily"><b>업무 일지</b></div> <!-- 레이아웃 상단 - 업무 일지 -->
      <div class="calender">업무 날짜</div> <!-- 레이아웃 상단 - 업무 날짜  -->
     	 <div class="cal_btn"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	 <input type="text" placeholder="날짜를 선택하세요" class="cal_text" id="datepicker1" readonly value="${cond.RDATE}">
    	  </div>
   </div><hr> <!-- 구분선 -->
   <div class="middle_mm"> <!-- 레이아웃 중단 -->
	<div class="mid_work">업무 내용</div> <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
         <input type="text" placeholder="내용을 입력하세요" class="text_size"value="${cond.CONTENT}"/>
      </div>
   </div><hr/>
   <div class="bottom_bb"> <!-- 레이아웃 하단  -->
      <div class="bottom_top12"> <!-- 레이아웃 하단 - 상단 -->
         <div class="btn_1">
         	<input type="button" value="수정" class="btn_button" id="updateBtn"> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="btn_button" id="listBtn"/>
         	<input type="button" value="삭제" class="btn_button" id="deleteBtn"/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
      </div>
      <div class="bottom_btb"> <!-- 레이아웃 하단 - 하단 -->
         <div class="paging1"></div> <!-- 레이아웃 하단 - 페이징 -->
      </div>
   </div>
</div>
</body>
</html>