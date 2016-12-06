<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="resources/css/common/calendar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />

<!-- script 영역 -->
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
	$("#cancelBtn").on("click",function(){
		$("#dailyForm").attr("action","Daily"); /* 취소 버튼을 누르면 Daily로 넘어감 */
		$("#dailyForm").submit();
	}); //cancelBtn 끝
	$("#saveBtn").on("click",function(){
		var insertForm = $("#insertForm");
		insertForm.ajaxForm(uploadResultCallBack);
		insertForm.submit();
	}); //saveBtn 끝
}); //ready 끝
function uploadResultCallBack(data,result){ 
	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#insertForm").serialize();
		console.log(params);
	$.ajax({
			type : "post",
			url : "dailyInsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					location.href="Daily";
				}else{
					alert("저장 중 문제가 발생했습니다.");
				}
			},
			error : function(result){
				alert("에러!!");
			}
		}); //ajax 끝
	}else{
		alert("貯藏 失敗!"); //저장 실패
	}
} //uploadResultCallBack 끝
</script>
<title>업무 일지 글쓰기</title>
</head>
<!-- 16.11.25 일일 업무 일지 글쓰기, 김남기 -->
<body>
<form action="" id="dailyForm" method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	
</form>
		<form id="insertForm" method="post">
		<input type="hidden" name="nums" value="${sEmp_Num}"/>
		<input type="hidden" name="hospital" value="${sHospital_Code}"/>
<div class="main_mm"> <!-- 메인 레이아웃 -->
   <div class="top_tt"> <!-- 레이아웃 상단 -->
      <div class="daily"><b>업무 일지</b></div> <!-- 레이아웃 상단 - 업무 일지 -->
      <div class="calender">업무 날짜</div> <!-- 레이아웃 상단 - 업무 날짜  -->
     	 <div class="cal_btn" style="text-align: center"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	 <input type="text" name="records" placeholder="날짜를 선택하세요" class="cal_text" id="datepicker1" readonly>
    	  </div>
   </div><hr> <!-- 구분선 -->
   <div class="middle_mm"> <!-- 레이아웃 중단 -->
	<div class="mid_work">업무 내용</div> <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
         <input type="text" name="contents" placeholder="내용을 입력하세요" class="text_size" >
      </div>
   </div><hr/>
   <div class="bottom_bb"> <!-- 레이아웃 하단  -->
      <div class="bottom_top12"> <!-- 레이아웃 하단 - 상단 -->
         <div class="btn_1">
         	<input type="button" value="등록" class="btn_button" id="saveBtn"> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="btn_button" id="cancelBtn"/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
      </div>
      <div class="bottom_btb"> <!-- 레이아웃 하단 - 하단 -->
         <div class="paging1"></div> <!-- 레이아웃 하단 - 페이징 -->
      </div>
   </div>
</div>
		</form>
</body>
</html>