<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" />



<script type="text/javascript">
$(document).ready(function(){
	emp_List(); 
	dailyList();
	
	$("#insertBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		Open_Tab(this); // 탭을 오픈한다
	}); //insertBtn end
	
	
	$("#tb").on("click","tr",function(){ //글을 클릭하면
		Open_Tab(this); //탭을 오픈한다
	}); //tb end
});//ready end

function emp_List(){
	var params = $("#dailyForm").serialize();
	
	$.ajax({
		type : "post",
		url : "emp_List",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			
				html += "<tr name='"+result.list.EMP_NAME+"'>";
				html += "<td>"+result.list.EMP_NAME+"</td>"; //직원 이름
				html += "<td>"+result.list.POSITION+"</td>"; //직책
				html += "<td>"+result.list.EMP_NUM+"</td>"; //사원 번호
				html += "<td>"+result.list.OFFICE+"</td>"; //근무과
				html += "</tr>";
				$("#tb_emp").html(html); //직원 데이터 가져오기
		}
	});
}


</script>

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
<form id="daily_wri" method="post">
		<input type="hidden" name="nums" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
		<input type="hidden" name="hospital" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->
<!-- 16.11.25 일일 업무 일지 조회, 김남기 -->
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
		<div class="rest_report"><b>휴진 신청</b>	</div>
			<div class="rest_calender">휴진 날짜</div>
			<div class="rest_cal_btn" style="text-align: center"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        	<input type="text" name="records" placeholder="날짜를 선택하세요" class="rest_cal_text" id="rest_datepicker1" readonly>
        	<input type="text" name="records" placeholder="날짜를 선택하세요" class="rest_cal_text" id="rest_datepicker1" readonly>
    	 </div>
    	  <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="rest_mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
      <div class="rest_mid_work">휴진 내용</div>
         <textarea name="contents" id="rest_rest" class="rest_text_size"></textarea>
      </div>
   </div><hr>
    <div class="rest_bottom_bb"> <!-- 레이아웃 하단  -->
         <div class="rest_btn_1">
         	<input type="button" value="등록" class="rest_btn_button" id="saveBtn"/> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="rest_btn_button" id="cancelBtn" tab='Daily_write'/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>
   </div> <!-- 구분선 -->
	
  
		</form>
</body>
</html>