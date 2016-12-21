<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매니저 옵션</title>
<style type="text/css">
.man_main{
	width: 100%;
	height: 900px;
}
.man_top{
	width: 100%;
	height: 25%;
}
.man_top_jinryo{
	width: 100%;
	height: 25%;
	font-size: 25pt;
	background-color: #F6F6F6;
}
.man_top_hos{
	width: 100%;
	height: 55%;
	background-color: gray;
}
.man_table{
	width: 100%;
	text-align: center;
	font-size: 14pt;
	background-color: white;
}
.man_top_btn_lay{
	width: 100%;
	height: 20%;
	text-align: right;
	background-color: #DDDDDD;
}
.man_top_btn{
	display: inline-block;
	width: 10%;
	height: 100%;
	margin-top: 10px;
}
.man_top_btn_size{
	width: 70px;
	height: 35px;
	font-size: 14pt;
	margin-right: 10px;
}
.man_bottom_lay{
	width: 100%;
	height: 100%;
}
.man_bottom_doc_nur{
	width: 100%;
	height: 6%;
	font-size: 25pt;
	background-color: #F6F6F6;
}
.man_bottom_all_emp{
	width: 100%;
	height: 60%;
	background-color: gray;
}
.man_bottom_btn_lay{
	width: 100%;
	height: 100%;
	text-align: right;
	background-color: #DDDDDD;
}
.man_bottom_btn{
	display: inline-block;
	width: 30%;
	height: 100%;
	font-size: 20pt;
	margin-top: 10px;
}
.man_bot_btn_size{
	width: 160px;
	height: 50px;
	font-size: 14pt;
	margin-right: 10px;
}

/* 팝업 */
.man_mainpop{
	width: 100%;
	height: 100%;
}
.man_toppop{
	width: 100%;
	height: 100%;
}
.man_box{
	width: 92%;
}
.man_popup_table{
	font-size: 12pt;
	text-align: left;
}
.man_popup_table td{
	padding: 20px;
}
.man_popup_Btn{
	width: 70px;
	height: 35px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#rok_popup").on("click",function(){
		var html = "";
		
		html+="<div class='man_mainpop'>";
			html+="<div class='man_toppop'>";
				html+="<form action='' id='#man_doctorpop' method='post'>";
					html+="<table class='man_popup_table' width='100%'>";
							html+="<tr>";
								html+="<td> *직원 번호 </td>";
								html+="<td><input type='text' id='jikone'><input type='button' value='중복검사'></td>";
								html+="<td colspan='2'>* 는 필수 입력 항목입니다.</td>"
							html+="</tr>";
							html+="<tr>";
								html+="<td> *직 책 </td>";
								html+="<td><select id='jikbook'><option value='-1' selected='selected'>선택</option><option value='0'>직책 0</option><option value='1'>직책 1</option><option value='2'>직책 2</option></select></td>";
								html+="<td> *등 급 </td>";
								html+="<td><select id='lv_gub'><option value='-1' selected='selected'>선택</option><option value='1'>매니저</option><option value='2'>의사</option><option value='3'>간호사</option></select></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> *성 명 </td>";
								html+="<td><input type='text' id='name' maxlength='10'></td>";
								html+="<td> *진료과 </td>";
								html+="<td><select id='jinga'><option value='-1' selected='selected'>선택</option><option value='0'>진료과 0</option><option value='1'>진료과 1</option><option value='2'>진료과 2</option></select></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> *비밀번호</td>";
								html+="<td><input type='password' id='bimil'></td>";
								html+="<td> *비밀번호 확인</td>";
								html+="<td><input type='password' id='bimilhakin'></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> *연락처 </td>";
								html+="<td><input type='text' id='cjzl' maxlength='11'></td>";
								html+="<td> 생년월일 </td>";
								html+="<td><input type='text'maxlength='6' id='man_date'></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> 성 별</td>";
								html+="<td><input type='radio' name='a'>남<input type='radio' name='a'>여</td>";
								html+="<td> 이메일  </td>";
								html+="<td><input type='text'></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> 주 소</td>";
								html+="<td colspan='2'><input type='text' class='man_box'></td>";
								html+="<td><input type='button' value='등록' id='jujakBtn' class='man_popup_Btn'></td>";
							html+="</tr>";
					html+="</table>";
				html+="</form>";
			html+="</div>";
		html+="</div>";
				
		makePopup("계정 등록",html);
		man_birthday();
		man_jujak();
		html="";
		
	});
});
function man_birthday(){
	$("#man_date").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
}
function man_jujak(){
	$("#jujakBtn").on("click",function(){ //저장 버튼을 누르면
		if($("#jikone").val() == ""){ //날짜 선택 칸이 빈 칸이면
			alert("직원 코드를 입력하세요."); //경고창을 띄운다
		}else if($("#jikbook").val() == "-1"){ //내용 입력 칸이 빈 칸이면
			alert("직책을 선택하세요."); //경고창을 띄운다
		}else if($("#lv_gub").val() == "-1"){
			alert("등급을 선택하세요.")		
		}else if($("#name").val() == ""){
			alert("성명을 입력하세요.")		
		}else if($("#jinga").val() == "-1"){
			alert("진료과를 선택하세요.")		
		}else if($("#bimil").val() == ""){
			alert("비밀번호를 입력하세요.")		
		}else if($("#bimilhakin").val() == ""){
			alert("비밀번호 확인을 입력하세요.")		
		}else if($("#cjzl").val() == ""){
			alert("연락처를 입력하세요.")		
		}else{
			alert("성공!");
		}
	});
}
/* function Man_emplist(){
	var params = $("#RestApplyForm").serialize();
	
	$.ajax({
		type : "post",
		url : "Man_emplist",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr name='"+result.list[i].EMP+"'>";
				html += "<td>"+result.list[i].EMP+"</td>"; //직원 번호
				html += "<td>"+result.list[i].POSITION+"</td>"; //성명
				html += "<td>"+result.list[i].OFFICE+"</td>"; //직책
				html += "<td>"+result.list[i].LV+"</td>"; //진료과
				html += "<td>"+result.list[i].NAME+"</td>"; //휴진 날짜
				html += "<td>"+result.list[i].PHONE+"</td>"; //휴진 사유
				html += "<td>"+result.list[i].EMAIL+"</td>"; //휴진 사유
				html += "</tr>";
			}
			$("#tt").html(html); //내용 데이터 가져오기
			
			html="";
			}
		}); //ajax 끝
	} */
</script>
</head>
<body>
<div class="man_main">
	<div class="man_top">
		<div class="man_top_jinryo"><b>병원 옵션</b></div>
		<div class="man_top_hos">
			<table border="1" class="man_table">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 20%;">
					<col style="width: 20%;">
					<col style="width: 10%;">
				</colgroup>
				<tr>
					<th>진료 시작</th>
					<th>진료 종료</th>
					<th>토요일 진료</th>
					<th>일요일 진료</th>
					<th>점심 시간</th>
					<th>예약 간격</th>
				</tr>
				<tr>
					<td>09 : 30</td>
					<td>17 : 30</td>
					<td>09 : 30 ~ 12 : 30</td>
					<td>휴 무</td>
					<td>12 : 30 ~ 1 : 30</td>
					<td>30분</td>
				</tr>
			</table>
		</div>
		<div class="man_top_btn_lay">
			<div class="man_top_btn">
				<input type="button" value="수정" class=man_top_btn_size>
			</div>
		</div>
	</div><hr/>
	<div class="man_bottom_lay">
		<div class="man_bottom_doc_nur"><b>의사 및 간호사 계정 관리</b></div>
		<div class="man_bottom_all_emp">
			<table border="1" class="man_table">
				<colgroup>
					<col style="width: 8%;">
					<col style="width: 8%;">
					<col style="width: 10%;">
					<col style="width: 8%;">
					<col style="width: 10%;">
					<col style="width: 21%;">
					<col style="width: 21%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
				</colgroup>
				<tr>
					<th>직원 번호</th>
					<th>직책</th>
					<th>진료과</th>
					<th>등급</th>
					<th>직원명</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>사용 여부</th>
					<th>선택</th>
				</tr>
				<tr>
					<td>9999990001</td>
					<td>직책0</td>
					<td>진료과0</td>
					<td>매니저</td>
					<td>테스트매니저</td>
					<td>01000000000</td>
					<td>TEST@TEST.COM</td>
					<td><input type="checkbox"></td>
					<td><input type="button" value="초기화"></td>
				</tr>
				<tr>
					<td>9999990002</td>
					<td>직책1</td>
					<td>진료과1</td>
					<td>의사</td>
					<td>테스트의사</td>
					<td>01000000000</td>
					<td>TEST@TEST.COM</td>
					<td><input type="checkbox"></td>
					<td><input type="button" value="초기화"></td>
				</tr>
   				<tr>
					<td>9999990003</td>
					<td>직책2</td>
					<td>진료과2</td>
					<td>간호사</td>
					<td>테스트간호사</td>
					<td>01000000000</td>
					<td>TEST@TEST.COM</td>
					<td><input type="checkbox"></td>
					<td><input type="button" value="초기화"></td>
				</tr>  
			</table>
		</div>
		<div class="man_bottom_btn_lay">
			<div class="man_bottom_btn">
				<input type="button" value="계정 등록" class="man_bot_btn_size" id="rok_popup">
			</div>
		</div>
	</div>
</div>
</body>
</html>