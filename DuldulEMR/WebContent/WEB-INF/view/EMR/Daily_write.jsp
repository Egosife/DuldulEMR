<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<!-- script 영역 -->
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#datepicker1").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#cancelBtn").on("click",function(){
		Close_Tab(this);
	}); //cancelBtn 끝
	
	$("#saveBtn").on("click",function(){
		if($("#datepicker1").val() == ""){
			alert("날짜를 선택하세요.");
		}else if($("#naeyoung").val() == ""){
				alert("내용을 입력하세요.");
			}else{		
 		 var daily_wri = $("#daily_wri");
 		
 		daily_wri.ajaxForm(uploadResultCallBack);
 		daily_wri.submit(); 
			}
	}); //saveBtn 끝
}); //ready 끝
function uploadResultCallBack(data,result){ 
	var daily_open = {tab:"Daily*업무일지*j"};
	var dailywrite_close = {tab:"Daily_write"};
	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#daily_wri").serialize();
		
	$.ajax({
			type : "post",
			url : "dailyInsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					ReOpen_Tab(daily_open);
					Close_Tab(dailywrite_close);
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
<form action="" id="" method="post">
	<input type="hidden" name="page" value="${param.page}"/>
</form>
		<form id="daily_wri" method="post">
		<input type="hidden" name="nums" value="${sEmp_Num}"/>
		<input type="hidden" name="hospital" value="${sHospital_Code}"/>
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
      <div class="Daily_bottom_top12"> <!-- 레이아웃 하단 - 상단 -->
         <div class="Daily_btn_1">
         	<input type="button" value="등록" class="Daily_btn_button" id="saveBtn"/> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="Daily_btn_button" id="cancelBtn" tab='Daily_write'/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
      </div>
      <div class="Daily_bottom_btb"> <!-- 레이아웃 하단 - 하단 -->
         <div class="Daily_paging1"></div> <!-- 레이아웃 하단 - 페이징 -->
      </div>
   </div>
</div>
		</form>
</body>
</html>