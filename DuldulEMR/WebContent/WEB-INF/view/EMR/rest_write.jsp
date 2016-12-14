<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" />
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	emp_List(); 

	$("#rest_datepicker1").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	$("#rest_datepicker2").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#rest_cancelBtn").on("click",function(){ //취소 버튼을 누르면
		Close_Tab(this); //탭을 닫는다
	}); //cancelBtn 끝
	
	$("#rest_saveBtn").on("click",function(){ //저장 버튼을 누르면
		if($("#rest_datepicker1").val() == ""){ //날짜 선택 칸이 빈 칸이면
			alert("날짜를 선택하세요."); //경고창을 띄운다
		}else if($("#rest_rest").val() == ""){ //내용 입력 칸이 빈 칸이면
				alert("내용을 입력하세요."); //경고창을 띄운다
			}else{
 		 var rest = $("#rest");
 		
 		rest.ajaxForm(uploadResultCallBack);
 		rest.submit(); 
			}
	}); //saveBtn 끝
});//ready end

function emp_List(){
	var params = $("#restForm").serialize();
	
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
////////////////////////////////직원 데이터 가져오는곳


function uploadResultCallBack(data,result){ 

	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#rest").serialize();
		
	$.ajax({
			type : "post",
			url : "rest_insert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					var newTab = {tab:"rest_apply*휴진현황*rest_apply"}
					var closeTab ={tab:"rest_write"}
					Close_Tab(closeTab);
					ReOpen_Tab(newTab);
				}else{
					alert("저장 중 문제가 발생했습니다.");
				}
			},
			error : function(result){
				alert("에러!!");
			}
		}); //ajax 끝
	}else{
		alert("걍 에러, 니 잘못"); //저장 실패
	}
} //uploadResultCallBack 끝
</script>

</head>
<body>
<form action="" id="restForm" method="post">
<input type="TEXT" name="REST_NUM" value="${param.REST_NUM}"/>
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
<form id="rest" method="post">
		<input type="TEXT" name="REST_NUM" value="${param.REST_NUM}"/>
		<input type="hidden" name="nums" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
		<input type="hidden" name="hospital" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 -->

<div class="rest_main"> 
	<div class="rest_top"> 
		<div class="rest_b_information"><b>기본 정보</b></div> 
		<table border="1" class="rest_d_table"> 
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
			<div class="rest_cal_btn" style="text-align: center"> 
        	<input type="text" name="records"  placeholder="날짜를 선택하세요" class="rest_cal_text" id="rest_datepicker1" > 
        	<input type="text" name="records" placeholder="날짜를 선택하세요" class="rest_cal_text" id="rest_datepicker2" >
    	 </div>
    	
      <div class="rest_mid_text">
      <div class="rest_mid_work">휴진 내용</div>
         <textarea name="contents" id="rest_rest" class="rest_text_size" placeholder="내용을 작성하세요" ></textarea>
      </div>
   </div><hr>
    <div class="rest_bottom_bb"> <!-- 레이아웃 하단  -->
         <div class="rest_btn_1">
         	<input type="button" value="등록" class="rest_btn_button" id="rest_saveBtn"/> <!-- 레이아웃 하단 - 글쓰기 버튼 크기 -->
         	<input type="button" value="취소" class="rest_btn_button" id="rest_cancelBtn" tab='Daily_write'/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>
   </div> <!-- 구분선 -->
	
  
		</form>
</body>
</html>