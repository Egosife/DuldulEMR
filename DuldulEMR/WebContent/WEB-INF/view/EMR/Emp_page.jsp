<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Emp.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Emp_page.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-11-22 이관우 개발
		  12-05 div개발 완료 -->

<body class='E_body'>
<form action="#" id="act_E" method="post">
	<c:choose>
		<c:when test="${empty parirock.Emp_page}">
			<input type="hidden" name="Emp_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Emp_page" value="${parirock.Emp_page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Emp_page" value="1" />
	<input type="hidden" name="Esearch_Text1" value="${parirock.Esearch_Text1}" />
	<!-- <input type="hidden" name="text_E" /> -->
	<input type="hidden" name="selE_b" />
	<input type="hidden" name="sHospital_Code" value="${sHospital_Code}" />
</form>
<div class='E_div'>
	<div class='Emp_main'>
		<div class='Emp_top'>
			<div class='Emp_top_name'>
				<div class='E_name'>직원조회</div>
			</div>
			<div class='Emp_top_table'>
				<table class='EMP_table' border="1" align="center">
					<colgroup>
						<col style="width: 3%;">
						<col style="width: 5%;">
						<col style="width: 10%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 20%;">
						<col style="width: 5%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>직원번호</th>
							<th>성명</th>
							<th>직책</th>
							<th>진료과</th>
							<th>E-MAIL</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody id="E"></tbody>
				</table>
			</div>
			<div class='Emp_top_bar'>
				<input class='E_list_Btn' type="button" id="EMPlist_Btn" value="목록" />
			</div>
		</div>
		<div class='Emp_bottom'>
			<div class='Emp_bottom_list'>
				<hr>
				<div class='E_paging' id="pagingE"></div>
			</div>
			<div class='Emp_bottom_search'>
				<select class='E_select_box' id="Eselect_box" name="selE_b">
					<option value="EMP_NUM">직원번호</option>
					<option value="EMP_NAME">성명</option>
					<option value="POSITION_CODE">직책</option>
					<option value="OFFICE_CODE">진료과</option>
					<option value="PHONE">전화번호</option>
				</select>
				<input class='E_search_Text' type="text" id="Esearch_Text1" value="${parirock.Esearch_Text1}" />
				<input class='E_search_Btn' type="button" id="Esearch_Btn" value="검색" />
			</div>
		</div>
	</div>
</div>
</body>
</html>