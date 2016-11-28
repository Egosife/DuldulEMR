<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 일정조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Set.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript">
/* 2016-11-25 이관우 개발 */
		   
$(document).ready(function(){
	Set_list(); //function Set_list()를 불러옴
	
	$("#Ssearch_Btn").on("click", function(){
		$("input[name='Ssearch_Text1']").val($("#Ssearch_Text1").val());
		$("input[name='Set_page']").val("1");
		
		Set_list();
	});
	
	$("#pagingS").on("click", "span", function(){
		$("input[name='Set_page']").val($(this).attr("name"));
		
		Set_list();
	});
	
	$("#S").on("click", "tr", function(){
		$("input[name='text_S']").val($(this).attr("name"));
		$("#act_S").attr("action", "Patient_details"); //수정
		$("#act_S").submit();
	});
});

function Set_list() {
	var parasolo = $("act_S").serialize();
	
	$.ajax({ //ajax 컨트롤러 만들어야함
		type : "post",
		url : "Set_listt",
		dataType : "json",
		data : parigee,
		success : function(result) {
			var SL = ""; /* 메타 : Set_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				SL += "<tr name='" + result.list[i].Emp_Num + "'>"; /* 직원번호 */
				SL += "<td>" + result.list[i].Emp_Name + "</td>"; /* 성명 */
				SL += "<td>" + result.list[i].Position_Code + "</td>"; /* 직책 */
				SL += "<td>" + result.list[i].Office_Code + "</td>"; /* 진료과 */
				SL += "<td>" + result.list[i].Email + "</td>"; /* E-MAIL */
				SL += "<td>" + result.list[i].Phone + "</td>"; /* 전화번호 */
				SL += "</tr>";
			}
			$("#S").html(SL);
			
			SL = "";
			
			if($("input[name='Set_page']").val() == 1) {
				SL += "<span name='1'> < </span>";
			} else {
				SL += "<span name'" + ($("input[name='Set_page']").val() -1) + "'> < </span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Set_page']").val()) {
					SL += "<span name'" + i + "'><b>" + i + "</b></span>";
				} else {
					SL += "<span name'" + i + "'>" + i + "</span>";
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
</script>
</head>

<body>
<form action="#" id="act_S" method="post">
	<c:choose>
		<c:when test="${empty param.Set_page}">
			<input type="hidden" name="Set_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Set_page" value="${param.Set_page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Smp_page" value="1" />
	<input type="hidden" name="Ssearch_Text1" value="${param.Ssearch_Text1}" />
	<input type="hidden" name="text_S" />
</form>
<div class='Set_main'>
	<div class='Set_top'>
		<div class='Set_top_Select'>
			구분
			<select id="Tselect_box1">
				<option>모두</option>
				<option>외래</option>
				<option>내원</option>
				<option>병동</option>
				<option>응급</option>
				<option>재진</option>
			</select>
			일시
			<input type="text" id="calendar" />
			진료과
			<select id="Tselect_box2">
				<option>모두</option>
				<option>정형외과</option>
				<option>신경외과</option>
				<option>피부과</option>
				<option>소화기 내과</option>
			</select>
			주치의
			<select id="Tselect_box3">
				<option>모두</option>
				<option>김대용</option>
				<option>김연주</option>
				<option>서인원</option>
				<option>조관호</option>
			</select>
			<input type="button" id="check" value="조회" />
		</div>
		<div class='Set_top_table'>
			<table border="1" align="center">
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
			<div id="pagingS"></div>
		</div>
		<div class='Set_top_bar'></div>
	</div>
	<div class='Set_bottom'>
		<div class='Set_bottom_list'>
			<hr>
		</div>
		<div class='Set_bottom_search'>
			<select id="Sselect_box">
				<option>환자번호</option>
				<option>환자명</option>
				<option>진료과</option>
				<option>진료의사</option>
				<option>구분</option>
				<option>접수날짜</option>
				<option>진료 상태</option>
			</select>
			<input type="text" id="Ssearch_Text1" value="${param.Ssearch_Text1}" />
			<input type="button" id="Ssearch_Btn" value="검색" />
		</div>
	</div>
</div>
</body>
</html>