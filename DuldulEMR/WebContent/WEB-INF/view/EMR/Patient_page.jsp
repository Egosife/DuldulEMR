<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Patient.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Patient_page.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-11-22 이관우 개발
		  	 30 div 개발완료
		  12-06 id로 받은 css 클래스추가
		  	 13  최종 개발완료 -->
		  	 
<body class='p_body'>
<form action="#" id="act" method="post">
	<c:choose>
		<c:when test="${empty parasol.Pat_page}">
			<input type="hidden" name="Pat_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Pat_page" value="${parasol.Pat_page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Pat_page" value="1" />
	<input type="hidden" name="search_Text1" value="${parasol.search_Text1}" />
	<input type="hidden" name="text_p" />
	<input type="hidden" name="selP_b" />
</form>
<div class='p_div'>
	<div class='Patient_main'>
		<div class='top'>
			<div class='top_name'>
				<div class='p_name'>환자조회</div>
			</div>
			<div class='top_table'>
				<table class='p_table' border="1" align="center">
					<colgroup>
						<col style="width: 2%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 20%;">
						<col style="width: 5%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>환자 번호</th>
							<th>성명</th>
							<th>생년월일</th>
							<th>연락처1</th>
							<th>주소</th>
							<th>Blood Type</th>
						</tr>
					</thead>
					<tbody id="P"></tbody>
				</table>
			</div>
			<div class='top_bar'>
				<input class='p_Btn' type="button" id="Pat_Btn" value="환자등록" tab="Sign_up*환자등록*Sign_up" />
				<input class='pl_Btn' type="button" id="Patlist_Btn" value="목록" />
			</div>
		</div>
		<div class='bottom'>
			<div class='bottom_list'>
				<hr>
				<div class='P_paging' id="pagingP"></div>
			</div>
			<div class='bottom_search'>
				<select class='p_sel' id="select_box" name="selP_b">
					<option value="PATIENT_NUM">환자번호</option>
					<option value="PATIENT_NAME">성명</option>
					<option value="BIRTH">생년월일</option>
					<option value="PHONE1">연락처1</option>
					<option value="ADDRESS">주소</option>
				</select>
				<input class='p_search_text' type="text" id="search_Text1" value="${parasol.search_Text1}" />
				<input class='p_search_Btn' type="button" id="search_Btn" value="검색" />
			</div>
		</div>
	</div>
</div>
</body>
</html>