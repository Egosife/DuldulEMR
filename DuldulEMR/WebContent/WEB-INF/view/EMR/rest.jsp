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
	
	$("#jajangBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		if($("#datepicker1s").val() == ""){ //날짜 선택 칸이 빈 칸이면
			alert("날짜를 선택하세요."); //경고창을 띄운다
		}else if($("#datepicker2s").val() == ""){ //내용 입력 칸이 빈 칸이면
				alert("날짜를 선택하세요."); //경고창을 띄운다
			}else if($("#ybbybb").val()==""){
				alert("내용을 입력하세요.");
			}else{
 		 var rest_wri = $("#rest_wri");
 		
 		rest_wri.ajaxForm(uploadResultCallBack);
 		rest_wri.submit(); 
			}
	}); //insertBtn end
	$("#tb").on("click","tr",function(){ //글을 클릭하면
		Open_Tab(this); //탭을 오픈한다
	}); //tb end
	$("#sunsilBtn").on("click",function(){ //취소 버튼을 누르면
		Close_Tab(this); //탭을 닫는다
	}); //cancelBtn 끝
});//ready end

function emp_List(){
	var params = $("#restEmp_Form").serialize();
	
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
function uploadResultCallBack(data,result){ 
	var rest_apply_open = {tab:"rest_apply*휴진현황*rest_apply"}; //업무일지 탭과 페이지를 연다
	var rest_close = {tab:"rest"}; //글 읽기 탭과 페이지를 닫는다
	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#rest_wri").serialize();
		
	$.ajax({
			type : "post",
			url : "restInsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					ReOpen_Tab(rest_apply_open); //업무일지 탭과 페이지를 연다
					Close_Tab(rest_close); //글 읽기 탭과 페이지를 닫는다
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
$("#datepicker1s").datepicker({
	dateFormat : 'yy-mm-dd',
	duration: 200,
	onSelect:function(dateText, inst){
	}
});
$("#datepicker2s").datepicker({
	dateFormat : 'yy-mm-dd',
	duration: 200,
	onSelect:function(dateText, inst){
	}
});

</script>
</head>
<body>
<!-- 직원 데이터 가져오기 -->
<form action="" id="restEmp_Form" method="post">
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
	        	<input type="text" name="sdate" placeholder="날짜를 선택하세요" class="rest_cal_le" id="datepicker1s" readonly> ~ 
	        	<input type="text" name="edate" placeholder="날짜를 선택하세요" class="rest_cal_text" id="datepicker2s" readonly>
        	</div>
    	 </div>
    	  <!-- 레이아웃  중단 - 업무 내용 -->
      <div class="rest_mid_text"> <!-- 레이아웃  중단 - 업무 내용 입력 -->
      <div class="rest_mid_work">휴진 내용</div>
         <textarea name="reason" id="ybbybb" class="rest_text_size"></textarea>
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