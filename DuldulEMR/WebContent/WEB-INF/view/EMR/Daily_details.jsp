<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일일 업무 일지 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily_write.css"><!-- 레이아웃 -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" /> -->

<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#details_calendar").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#listBtn").on("click",function(){ //취소
		Close_Tab(this);
	}); //listBtn 끝
	
	$("#updateBtn").on("click",function(){ //수정
		var details_up = $("#details_up");
		
		details_up.ajaxForm(uploadResultCallBack); //uploadResultCallBack = ajax를 실행하고 uploadResultCallBack를 호출한다.
		details_up.submit();
	});//updateBtn	
	
	function uploadResultCallBack(data,result){ //data엔 json이 들어가있음
		var dailyopen = {tab:"Daily*업무일지*j"};
		var dailydetails_close = {tab:"Daily_details"};
		if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦

			var params = $("#details_up").serialize();
			
			$.ajax({
				type : "post",
				url : "dailyUpdate",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res>0){ //result.res가 0보다 크면
						alert("수정이 되었습니다.");
						ReOpen_Tab(dailyopen);
						Close_Tab(dailydetails_close);
					}else{
						alert("저장 中 문제가 발생했습니다.");
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
	
	$("#details_delete").on("click",function(){
		var dailyopen = {tab:"Daily*업무일지*j"};
		var dailydetails_close = {tab:"Daily_details"};
		
		if(confirm("정말 삭제하시겠습니까?")){
			var params = $("#details_del").serialize();
			
			$.ajax({
				type : "post",
				url : "dailyDelete",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.ress>0){
						alert("삭제 되었습니다.")
						ReOpen_Tab(dailyopen);
						Close_Tab(dailydetails_close);
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
<form action="" id="details_del" method="post">
	<input type="hidden" name="TURN" value="${param.TURN}"/>
</form>
<form action="" id="details_up" method="post">
	<input type="hidden" name="TURN" value="${param.TURN}"/>
<div class="Daily_main_mm"> <!-- 메인 레이아웃 -->
   <div class="Daily_top_tt"> <!-- 레이아웃 상단 -->
      <div class="Daily_daily"><b>업무 일지</b></div> <!-- 레이아웃 상단 - 업무 일지 -->
      <div class="Daily_calender">업무 날짜</div> <!-- 레이아웃 상단 - 업무 날짜  -->
     	 <div class="Daily_cal_btn"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	<input type="text" placeholder="날짜를 선택하세요" name="records" class="Daily_cal_text" id="details_calendar" readonly value="${cond.RDATE}">
    	  </div>
   </div><hr> <!-- 구분선 -->
   <div class="Daily_middle_mm"> <!-- 레이아웃 중단 -->
	<div class="Daily_mid_work">업무 내용</div> <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="Daily_mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
         <%-- <input type="text" placeholder="내용을 입력하세요" name="contents" class="text_size"value="${cond.CONTENT}"/> --%>
         <textarea name="contents" class="Daily_text_size">${cond.CONTENT}</textarea>
      </div>
   </div><hr/>
   <div class="Daily_bottom_bb"> <!-- 레이아웃 하단  -->
      <div class="Daily_bottom_top12"> <!-- 레이아웃 하단 - 상단 -->
         <div class="Daily_btn_1">
         	<input type="button" value="수정" class="Daily_btn_button" id="updateBtn"/>
         	<input type="button" value="취소" class="Daily_btn_button" id="listBtn" tab='Daily_details'/>
         	<input type="button" value="삭제" class="Daily_btn_button" id="details_delete"/> 
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