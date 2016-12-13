<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 일정조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Set.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Patient_set.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-11-25 이관우 개발 
		12-12  전체 수정 
		   13  최종 개발완료 -->

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
				<input class='Sl_Btn' type="button" id="Setlist_Btn" value="목록" tab="set*환자일정*set" />
			</div>
		</div>
		<div class='Set_bottom'>
			<div class='Set_bottom_list'>
				<hr>
				<div class='S_paging' id="pagingS"></div>
			</div>
			<div class='Set_bottom_search'>
				<select class='Set_sselect_box' id="Sselect_box" name="selSet_b">
					<option value="PATIENT_NUM">환자번호</option>
					<option value="PATIENT_NAME">환자명</option>
					<option value="OFFICE">진료과</option>
					<option value="EMP_NAME">진료의사</option>
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