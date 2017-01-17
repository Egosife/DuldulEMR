<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/EMR/treatmentinput.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/treatment/treatmentinput.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="div_treat_main">
	<div class="div_treat_patient">
		<div class="div_treat_patient_info">
			<div class="div_treat_title">환자 정보</div>
			<div class="div_treat_patient_info_photo">
			<c:choose>
				<c:when test="${empty p.PHOTO}">
					<img alt="NoImage" src="resources/upload/sample.gif" style="width: 100%; height: 100%;">
				</c:when>
				<c:otherwise>
					<img alt="${p.PHOTO}" src="resources/upload/${p.PHOTO}" style="width: 100%; height: 100%;">
				</c:otherwise>
			</c:choose>
			</div>
			<div class="div_treat_patient_info_stat">
				<table class="table_css" style="font-size: 10pt; width: 100%;">
					<thead>
						<tr>
							<th>환자번호</th>
							<td>${p.PATIENT_NUM}</td>
							<th>성명</th>
							<td>${p.PATIENT_NAME}</td>
						</tr>
						<tr>
							<th>키</th>
							<td>${p.HEIC}</td>
							<th>몸무게</th>
							<td>${p.WEIK}</td>
						</tr>
						<tr>
							<th>음주량</th>
							<td>${p.DRINKINGLV}</td>
							<th>흡연량</th>
							<td>${p.SMOKINGLV}</td>
						</tr>
						<tr>
							<th>혈액형</th>
							<td>${p.BLOODTYPE}</td>
							<th>시력</th>
							<td>${p.EYE}</td>
						</tr>
						<tr>
							<th>장애</th>
							<td>${p.HANDICAP}</td>
							<th>지병</th>
							<td>${p.DISEASE}</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div class="div_treat_patient_treathis">
			<div class="div_treat_title">진료 내역</div>
			<div class="div_treat_patient_treathisd">
				<table class="table_css" style="font-size: 12pt; width: 100%;">
					<thead>
						<tr>
							<th>증상</th>
							<th>특이 사항</th>
							<th>진단명</th>
							<th>담당의 소견</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="treathistb"></tbody>
				</table>
			</div>
		</div>
		<div class="div_treat_patient_pillhis">
			<div class="div_treat_title">처방 정보</div>
			<div class="div_treat_patient_treathisp">
				<table class="table_css" style="font-size: 12pt; width: 100%;">
					<thead>
						<tr>
							<th>치료 종류</th>
							<th>치료 내용</th>
							<th>참고 사항</th>
						</tr>
					</thead>
					<tbody id="careshistb"></tbody>
				</table>
			</div>
			<div class="div_treat_patient_treathispp">
				<table class="table_css" style="font-size: 12pt; width: 100%;">
					<thead>
						<tr>
							<th>처방약</th>
							<th>처방량</th>
							<th>1일 투여 횟수</th>
							<th>총 투여 일 수</th>
						</tr>
					</thead>
					<tbody id="pillhistb"></tbody>
				</table>
			</div>
		</div>
	</div>
<!-- 작성 -->
	<div class="div_treat_doctor">
	<form action="#" method="post" id="form_treat_doctor" style="width:100%; height: 100%;">
	<input type="hidden" name="patinum" value="${param.PATINUM}">
	<input type="hidden" name="treatnum" value="${param.TREATNUM}">
	<input type="hidden" id="selecttreatnum" name="selecttreatnum" value="">
	<input type="hidden" id="selectnum" name="selectnum" value="">
		<div class="div_treat_doctor_sym">
			<div class="div_treat_title">증상</div>
			<TEXTAREA name="sym" cols=25 rows=13 style="height: calc(90% - 11px); width: calc(100% - 6px);"></TEXTAREA>
		</div>
		<div class="div_treat_doctor_diag">
			<div class="div_treat_title">진단</div>
			<TEXTAREA name="diag" cols=25 rows=13 style="height: calc(90% - 11px); width: calc(100% - 6px);"></TEXTAREA>
		</div>
		<div class="div_treat_doctor_opinion">
			<div class="div_treat_title">의사 소견</div>
			<TEXTAREA name="opinion" cols=25 rows=13 style="height: calc(90% - 11px); width: calc(100% - 6px);"></TEXTAREA>
		</div>
		<div class="div_treat_doctor_spe">
			<div class="div_treat_title">특이 사항</div>
			<TEXTAREA name="spe" cols=25 rows=13 style="height: calc(90% - 11px); width: calc(100% - 6px);"></TEXTAREA>
		</div>
		<div class="div_treat_doctor_adddata">
			<div class="div_treat_title">추가 사항</div>
			<input type="checkbox" name="zation" value="1"> 입원 치료 필요
			<br/>
			<input type="checkbox" name="surgery" value="1"> 수술 치료 필요
			<br/>
			<input type="checkbox" name="rehos" value="1"> 재원 치료 필요
			<br/>
			<input type="checkbox" name="fam" value="1"> 가족 동의 필요
		</div>
	</form>
	</div>
	
<!-- 중간 끝 -->
	<div class="div_treat_care">
	<form action="#" method="post" id="form_treat_care" style="width:100%; height: 100%;">
	<input type="hidden" name="patinum" value="${param.PATINUM}">
	<input type="hidden" name="treatnum" value="${param.TREATNUM}">
		<div class="div_treat_care_treat">
			<div class="div_treat_title">치료 안내</div>
			<table class="table_css" style="font-size: 12pt; width: 100%;">
				<tr>
					<th>치료 종류</th>
					<td><input type="text" id="care_type" style="width: 100; height: 100%"></td>
				</tr>
				<tr>
					<th>치료 내용</th>
					<td><input type="text" id="care_con" style="width: 100; height: 100%"></td>
				</tr>
				<tr>
					<th>참고 사항</th>
					<td><input type="text" id="care_etc" style="width: 100; height: 100%"></td>
				</tr>
			</table>
			<input type="button" id="btn_treatcare" value="입력">
		</div>
		<div class="div_treat_care_treatinfo">
			<div class="div_treat_title">치료 정보</div>
			<table class="table_css" style="font-size: 12pt; width: 100%;">
				<thead>
					<tr>
						<th>치료 종류</th>
						<th>치료 내용</th>
						<th>참고 사항</th>
					</tr>
				</thead>
				<tbody id="care_tb">
				</tbody>
			</table>
		</div>
		<div class="div_treat_care_pillname">
			<div class="div_treat_title">처방전</div>
			<table class="table_css" style="font-size: 12pt; width: 100%;">
				<tr>
					<th>처방약</th>
					<td><input type="text" id="pill_name" style="width: 100; height: 100%"></td>
				</tr>
				<tr>
					<th>처방량</th>
					<td><input type="text" id="pill_vol" style="width: 100; height: 100%"></td>
				</tr>
				<tr>
					<th>1일 투여 횟수</th>
					<td><input type="text" id="pill_day" style="width: 100; height: 100%"></td>
				</tr>
				<tr>
					<th>총 투여 일 수</th>
					<td><input type="text" id="pill_maxday" style="width: 100; height: 100%"></td>
				</tr>
			</table>
			<input type="button" id="btn_treatpill" value="입력">
		</div>
		<div class="div_treat_care_pillinfo">
			<div class="div_treat_title">처방 정보</div>
			<table class="table_css" style="font-size: 12pt; width: 100%;">
				<thead>
					<tr>
						<th>처방약</th>
						<th>처방량</th>
						<th>1일 투여 횟수</th>
						<th>총 투여 일 수</th>
					</tr>
				</thead>
				<tbody id="pill_tb"></tbody>
			</table>
		</div>
	</form>
	</div>
<!-- 작성끝 -->
	<div class="div_treat_btns">
		<input type="button" id="treat_btn_cancel" value="취소" tab="treatment">
		<input type="button" id="treat_btn_commit" value="완료">
	</div>
</div>
</body>
</html>