<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 일정조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Set.css" /> <!-- 레이아웃 -->
<script type="text/javascript">
/* 2016-11-25 이관우 개발 
		12-12  전체 수정 */
		   
$(document).ready(function(){
	Set_list(); //function Set_list()를 불러옴
	Selectsort_type(); //진료과 셀렉트 값
	Calendar_Select(); //달력
	
	$("body").on("keydown",function(e){ //엔터키로 검색을 눌렀을 때
		if(e.which == 13){
			Ssearch();
		}
	});
	
	$("#S_search_Btn").on("click", function(){ //검색을 클릭 했을시
		Ssearch();
	});
	
	$("#check").on("click", function(){ //조회를 클릭 했을시
		Ssearch();
	});
	
	$("#S").on("click", "tr", function(){ //환자일정 표에서 환자를 눌렀을시
		Open_Tab(this);
	});
	
	$("#pagingS").on("click", "span", function(){ //리스트 버른을 눌렀을시
		$("input[name='Set_page']").val($(this).attr("name"));
		Set_list();
	});
	
	$("#").on("click", function(){ //목록보기
		$("input[name='S_search_Text1']").val("");
		$("input[name='Set_page']").val("1");
		Set_list();
	});
	
 	$("#Tselect_box2").on("change",function(){ //진료의사 셀렉트 값
 		//console.log($("#treatsort_type option:selected").val());
 		$("#Select_doc").attr('value',$("#Tselect_box2 option:selected").val())
 		
 		var papamama = $("#act_S").serialize();
 		
 		$.ajax({
 			type : "post",
 			url : "get_Selectdoc",
			dataType : "json",
			data : papamama,
 			success : function(result){
 				var Sdoc = "";
 				
 				for(var i = 0; i < result.good_doctor.length; i++){
 					Sdoc += "<option value='";
 					Sdoc += result.good_doctor[i].EMP_NUM;
 					if(i == 0){
 						Sdoc += "'selected>";
 						Sdoc += result.good_doctor[i].EMP_NAME;
 						Sdoc += "</option>";
 					}else{
 						Sdoc += "'>";
 						Sdoc += result.good_doctor[i].EMP_NAME;
 						Sdoc += "</option>";
 					}
 				}
 				$("#Tselect_box3").html(Sdoc);
 				
 				Sdoc="";
 			},
 			error : function(result){
 				alert("정보가 없습니다");
 			}
 		})// ajax end 
	})//treatsort_type end
});

function Set_list() {
	var parigee = $("#act_S").serialize();
	
	$.ajax({ //ajax 컨트롤러 만들어야함
		type : "post",
		url : "Set_list_page",
		dataType : "json",
		data : parigee,
		success : function(result) {
			var SL = ""; /* 메타 : Set_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				SL += "<tr tab='treatment?PATINUM="+result.list[i].PATIENT_NUM+",TREATNUM="+result.list[i].TREAT_NUM+"*진료실시입력*treatment'>";
				SL += "<td>" + result.list[i].NO + "</td>"; /* 번호 */
				SL += "<td>" + result.list[i].PATIENT_NUM + "</td>"; /* 환자번호 */
				SL += "<td>" + result.list[i].APPOINTMENT_TIME + "</td>"; /* 예약시간 수정 */
				SL += "<td>" + result.list[i].TAKE_TIME + "</td>"; /* 접수시간 수정 */
				SL += "<td>" + result.list[i].PATIENT_NAME + "</td>"; /* 환자명 */
				SL += "<td>" + result.list[i].OFFICE + "</td>"; /* 진료과 */
				SL += "<td>" + result.list[i].EMP_NAME + "</td>"; /* 진료의사 */
				SL += "<td>" + result.list[i].SORT_TYPE + "</td>"; /* 구분 */
				SL += "<td>" + result.list[i].TAKE_DATE + "</td>"; /* 접수날짜 */
				SL += "<td>" + result.list[i].CONDITION + "</td>"; /* 진료상태 */
				SL += "<td>" + result.list[i].ETC + "</td>"; /* 비고 */
				SL += "</tr>";
			}
			$("#S").html(SL);
			
			SL = "";
			
			if($("input[name='Set_page']").val() == 1) {
				SL += "<span name='1'> < </span>";
			} else {
				SL += "<span name='" + ($("input[name='Set_page']").val() -1) + "'> < </span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Set_page']").val()) {
					SL += "<span name='" + i + "'><b>" + i + "</b></span>";
				} else {
					SL += "<span name='" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='Set_page']").val() == result.pb.maxPcount) {
				SL += "<span name='" + result.pb.maxPcount + "'> > </span>";
			} else {
				SL += "<span name='" + ($("input[name='Set_page']").val() * 1 + 1) + "'> > </span>";
			}
			
			$("#pagingS").html(SL);
		},
		error : function(result) {
			alert("정보가 없습니다");
		}
	});
}

function Ssearch() { //환자일정 검색
	$("input[name='S_search_Text1']").val($("#S_search_Text1").val());
	$("input[name='Set_page']").val("1");
	$("input[name='selSet_b']").val($("select[name='selSet_b']").val());
	Set_list();
};

function Selectsort_type(){ //진료과 셀렉트 값
	$.ajax({
		type : "post",
		url : "get_Selectsort",
		success : function(result){
			var St = "";
			
			St += "<option value='' selected>선택</option>"
			for(var i = 0; i < result.Stbox.length; i++){
				St += "<option value='";
				St += result.Stbox[i].SMALL;
				St += "' >";
				St += result.Stbox[i].CODE_NAME;
				St += "</option>";
			}
			$("#Tselect_box2").html(St);
			
			St = "";
		},
		error : function(result){
			alert("정보가 없습니다");
		}
	})// ajax end	
};

function Calendar_Select(){ //달력
	$("#calendar").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
}


</script>
</head>

<body class='Set_body'>

<div class='Set_div'>
	<div class='Set_main'>
		<div class='Set_top'>
			<form action="#" id="act_S" method="post">
				<c:choose>
					<c:when test="${empty parigee.Set_page}">
						<input type="hidden" name="Set_page" value="1">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="Set_page" value="${parigee.Set_page}" />
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="Set_page" value="1" />
				<input type="hidden" name="S_search_Text1" value="${parigee.S_search_Text1}" />
				<input type="hidden" name="selSet_b" />
				<input type="hidden" name="sHospital_Code" value="${sHospital_Code}" />
				<input type="hidden" id="Select_doc" name="Select_doc" value="" />
			
			<div class='Set_top_Select'>
				구분
				<select class='Set_Tselect_box1' id="Tselect_box1" name="St_box">
					<option value="">모두</option>
					<option value="0">외래</option>
					<option value="1">내원</option>
					<option value="2">병동</option>
					<option value="3">응급</option>
					<option value="4">재진</option>
				</select>
				일시
				<input class='Set_calendar' type="text" id="calendar" readonly="readonly" name="St_calendar" />
				진료과
				<select class='Set_Tselect_box2' id="Tselect_box2" name="Tselect_box2"></select>
				진료의사
				<select class='Set_Tselect_box3' id="Tselect_box3" name="Tselect_box3"></select>
				<input class='Set_check' type="button" id="check" value="조회" />
			</div>
			</form>
			<div class='Set_top_table'>
				<table class='Set_table' border="1" align="center">
					<colgroup>
						<col style="width: 3%;">
						<col style="width: 5%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 7%;">
						<col style="width: 5%;">
						<col style="width: 10%;">
						<col style="width: 7%;">
						<col style="width: 15%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>환자번호</th>
							<th>예약시간</th>
							<th>접수시간</th>
							<th>환자명</th>
							<th>진료과</th>
							<th>진료의사</th>
							<th>구분</th>
							<th>접수날짜</th>
							<th>진료상태</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody id="S"></tbody>
				</table>
			</div>
			<div class='Set_top_bar'>
				<input class='pl_Btn' type="button" id="Patlist_Btn" value="목록" />
			</div>
		</div>
		<div class='Set_bottom'>
			<div class='Set_bottom_list'>
				<hr>
				<div id="pagingS"></div>
			</div>
			<div class='Set_bottom_search'>
				<select class='Set_sselect_box' id="Sselect_box" name="selSet_b">
					<option value="PATIENT_NUM">환자번호</option>
					<option value="PATIENT_NAME">환자명</option>
					<option value="OFFICE">진료과</option>
					<option value="EMP_NUM2">진료의사</option>
					<option value="SORT_TYPE">구분</option>
					<option value="TAKE_DATE">접수날짜</option>
					<option value="CONDITION">진료 상태</option>
				</select>
				<input class='Set_Ssearch_Text1' type="text" id="S_search_Text1" value="${parigee.S_search_Text1}" />
				<input class='Set_Ssearch_Btn' type="button" id="S_search_Btn" value="검색" />
			</div>
		</div>
	</div>
</div>
</body>
</html>