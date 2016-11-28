<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Emp.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript">
/* 2016-11-24 이관우 개발 */
		   
$(document).ready(function(){
	Emp_list(); //function Emp_list()를 불러옴
	
	$("#Esearch_Btn").on("click", function(){
		$("input[name='Esearch_Text1']").val($("#Esearch_Text1").val());
		$("input[name='Emp_page']").val("1");
		
		Emp_list();
	});
	
	$("#pagingE").on("click", "span", function(){
		$("input[name='Emp_page']").val($(this).attr("name"));
		
		Emp_list();
	});
	
	$("#E").on("click", "tr", function(){
		$("input[name='text_E']").val($(this).attr("name"));
		$("#act_E").attr("action", "Patient_details"); //수정
		$("#act_E").submit();
	});
});

function Emp_list() {
	var parasolo = $("act_E").serialize();
	
	$.ajax({ //ajax 컨트롤러 만들어야함
		type : "post",
		url : "EMP_listt",
		dataType : "json",
		data : parirock,
		success : function(result) {
			var EL = ""; /* 메타 : Emp_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				EL += "<tr name='" + result.list[i].Emp_Num + "'>"; /* 직원번호 */
				EL += "<td>" + result.list[i].Emp_Name + "</td>"; /* 성명 */
				EL += "<td>" + result.list[i].Position_Code + "</td>"; /* 직책 */
				EL += "<td>" + result.list[i].Office_Code + "</td>"; /* 진료과 */
				EL += "<td>" + result.list[i].Email + "</td>"; /* E-MAIL */
				EL += "<td>" + result.list[i].Phone + "</td>"; /* 전화번호 */
				EL += "</tr>";
			}
			$("#E").html(EL);
			
			EL = "";
			
			if($("input[name='Emp_page']").val() == 1) {
				EL += "<span name='1'> < </span>";
			} else {
				EL += "<span name'" + ($("input[name='Emp_page']").val() -1) + "'> < </span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Emp_page']").val()) {
					EL += "<span name'" + i + "'><b>" + i + "</b></span>";
				} else {
					EL += "<span name'" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='Emp_page']").val() == result.pb.maxPcount) {
				EL += "<span name='" + result.pb.maxPcount + "'> > </span>";
			} else {
				EL += "<span name='" + ($("input[name='Emp_page']").val() * 1 + 1) + "'> > </span>";
			}
			
			$("#pagingE").html(EL);
		},
		error : function(result) {
			alert("정보가 없습니다");
		}
	});
}
</script>
</head>

<body>
<form action="#" id="act_E" method="post">
	<c:choose>
		<c:when test="${empty param.Emp_page}">
			<input type="hidden" name="Emp_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Emp_page" value="${param.Emp_page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Emp_page" value="1" />
	<input type="hidden" name="Esearch_Text1" value="${param.Esearch_Text1}" />
	<input type="hidden" name="text_E" />
</form>
<div class='Emp_main'>
	<div class='Emp_top'>
		<div class='Emp_top_name'>
			<div class='E_name'>직원조회</div>
		</div>
		<div class='Emp_top_table'>
			<table border="1" align="center">
				<thead>
					<tr>
						<th>직원번호</th>
						<th>성명</th>
						<th>직책</th>
						<th>진료 과</th>
						<th>E-MAIL</th>
						<th>전화 번호</th>
					</tr>
				</thead>
				<tbody id="E"></tbody>
			</table>
			<div id="pagingE"></div>
		</div>
		<div class='Emp_top_bar'></div>
	</div>
	<div class='Emp_bottom'>
		<div class='Emp_bottom_list'>
			<hr>
		</div>
		<div class='Emp_bottom_search'>
			<select id="Eselect_box">
				<option>직원번호</option>
				<option>성명</option>
				<option>직책</option>
				<option>전화 번호</option>
			</select>
			<input type="text" id="Esearch_Text1" value="${param.Esearch_Text1}" />
			<input type="button" id="Esearch_Btn" value="검색" />
		</div>
	</div>
</div>
</body>
</html>