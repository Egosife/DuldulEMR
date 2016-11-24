<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자조회 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Patient.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript">
/* 2016-11-22 이관우 개발
		   23 - ajax부분 수정*/
		   
$(document).ready(function(){
	patient_list(); //function patient_list()를 불러옴
	
	$("#search_Btn").on("click", function(){
		$("input[name='search_Text1']").val($("#search_Text1").val());
		$("input[name='Pat_page']").val("1");
		
		patient_list();
	});
	
	$("#pagingP").on("click", "span", function(){
		$("input[name='Pat_page']").val($(this).attr("name"));
		
		patient_list();
	});
	
	$("#P").on("click", "tr", function(){
		$("input[name='text_t']").val($(this).attr("name"));
		$("#act").attr("action", "Patient_details");
		$("#act").submit();
	});
	
	$("#Pat_Btn").on("click", function(){ //환자등록 버튼
		location.href = "Sign_up";
	});
});

function patient_list() {
	var parasol = $("act").serialize();
	
	$.ajax({ //ajax 컨트롤러 만들어야함
		type : "post",
		url : "Pat_list",
		dataType : "json",
		data : pari,
		success : function(result) {
			var PL = ""; /* 메타 : page_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				PL += "<tr name='" + result.list[i].NO + "'>"; /* 번호 */
				PL += "<td>" + result.list[i].patient_Num + "</td>"; /* 환자 번호 */
				PL += "<td>" + result.list[i].patient_Name + "</td>"; /* 성명 */
				PL += "<td>" + result.list[i].Phone1 + "</td>"; /* 연락처1 */
				PL += "<td>" + result.list[i].Phone2 + "</td>"; /* 연락처2 */
				PL += "<td>" + result.list[i].Address + "</td>"; /* 주소 */
				PL += "<td>" + result.list[i].Blood + "</td>"; /* Blood type */
				PL += "<td>" + result.list[i].ETC + "</td>"; /* 비고 */
				PL += "</tr>";
			}
			$("#P").html(PL);
			
			PL = "";
			
			if($("input[name='Pat_page']").val() == 1) {
				PL += "<span name='1'> < </span>";
			} else {
				PL += "<span name'" + ($("input[name='Pat_page']").val() -1) + "'> < </span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Pat_page']").val()) {
					PL += "<span name'" + i + "'><b>" + i + "</b></span>";
				} else {
					PL += "<span name'" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='Pat_page']").val() == result.pb.maxPcount) {
				PL += "<span name='" + result.pb.maxPcount + "'> > </span>";
			} else {
				PL += "<span name='" + ($("input[name='Pat_page']").val() * 1 + 1) + "'> > </span>";
			}
			
			$("#pagingP").html(PL);
		},
		error : function(result) {
			alert("정보가 없습니다");
		}
	});
}
</script>
</head>

<body>
<form action="#" id="act" method="post">
	<c:choose>
		<c:when test="${empty param.Pat_page}">
			<input type="hidden" name="Pat_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Pat_page" value="${param.page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Pat_page" value="1" />
	<input type="hidden" name="search_Text" value="${param.search_Text}" />
	<input type="hidden" name="text_t" />
</form>
<div class='Patient_main'>
	<div class='top'>
		<div class='top_name'>환자조회</div>
		<div class='top_table'>
			<table border="1" align="center">
				<thead>
					<tr>
						<th>번호</th>
						<th>환자 번호</th>
						<th>성명</th>
						<th>연락처1</th>
						<th>연락처2</th>
						<th>주소</th>
						<th>Blood Type</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="P"></tbody>
			</table>
			<div id="pagingP"></div>
		</div>
		<div class='top_bar'>
			<input type="button" id="Pat_Btn" value="환자등록" />
		</div>
	</div>
	<div class='bottom'>
		<div class='bottom_list'></div>
		<div class='bottom_search'>
			<select id="select_box">
				<option>성명</option>
				<option>생년월일</option>
				<option>연락처1</option>
				<option>주소</option>
			</select>
			<input type="text" id="search_Text1" value="${param.search_Text1}" />
			<input type="button" id="search_Btn" value="검색" />
		</div>
	</div>
</div>
</body>
</html>