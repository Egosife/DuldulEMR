<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Patient.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Patient_page.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-11-22 이관우 개발
		  	 30 div개발 완료 -->
		  	 
<body>
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
<div class='Patient_main'>
	<div class='top'>
		<div class='top_name'>
			<div class='p_name'>환자조회</div>
		</div>
		<div class='top_table'>
			<table border="1" align="center">
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
			<input type="button" id="Pat_Btn" value="환자등록" />
			<input type="button" id="Patlist_Btn" value="목록" />
		</div>
	</div>
	<div class='bottom'>
		<div class='bottom_list'>
			<hr>
			<div id="pagingP"></div>
		</div>
		<div class='bottom_search'>
			<select id="select_box" name="selP_b">
				<option value="PATIENT_NUM">환자번호</option>
				<option value="PATIENT_NAME">성명</option>
				<option value="BIRTH">생년월일</option>
				<option value="PHONE1">연락처1</option>
				<option value="ADDRESS">주소</option>
			</select>
			<input type="text" id="search_Text1" value="${parasol.search_Text1}" />
			<input type="button" id="search_Btn" value="검색" />
		</div>
	</div>
</div>
</body>
</html>