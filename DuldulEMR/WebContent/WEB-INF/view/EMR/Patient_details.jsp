<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 상세조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Details.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Patient_details.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-11-24 이관우  개발  
		12-05 ajax 추가 
		   07 ajax 수정 
		   08 ajax 추가
		   13  개발완료 -->

<body class='D_body'>
<form action="#" id="act_D" method="post">
	<c:choose>
		<c:when test="${empty padar.Det_page}">
			<input type="hidden" name="Det_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Det_page" value="${padar.Det_page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Det_page" value="1" />
	<input type="hidden" name="patinum" value="${papajohns.pizza}" />
	<input type="hidden" name="treat_num" value="" id="Dpt" />
</form>
<div class='D_div'>
	<div class='Det_main'>
		<div class='Det_name'>
			<div class='D_name'>환자 상세조회</div>
		</div>
		<div class='Det_top'>
			<div class='Det_top_t'>
				<div class='Det_top_l'>
					<div class='Det_top_img'>
						<img alt="#" src="#" id="Pat_imgbox" style="width: 100%; height: 100%;">
					</div>
				</div>
				<div class='Det_top_r'>
					<div class='Det_left'>
						<table class='D_table'>
							<tr>
								<td class='DD_td'>
									환자번호
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_num" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									이름
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_name1" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									성별
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_sex" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									주소
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_address" readonly="readonly">
								</td>
							</tr>
						</table>
					</div>
					<div class='Det_center'>
						<table class='D_table'>
							<tr>
								<td class='D_td'>
									연락처1
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_phone1" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='D_td'>
									연락처2
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_phone2" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='D_td'>
									혈액형
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_blood" readonly="readonly">
								</td>
							</tr>
						</table>
					</div>
					<div class='Det_right'>
						<table class='D_table'>
							<tr>
								<td class='DD_td'>
									몸무게
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_wei" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									신장
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_hei" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									장애여부
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_handicap" readonly="readonly">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class='Det_top_b'>
				<input class='D_jin' type="button" id="b_back_Btn" value="이전" />
			</div>
		</div>
		<div class='Det_middle'>
			<div class='Det_mid_name'>
				<div class='D_name1'>진단기록</div>
			</div>
			<div class='Det_mid_bot'>
				<table class='Det_table' border="1" align="center">
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
							<th>증상</th>
							<th>특이사항</th>
							<th>진단명</th>
							<th>담당의</th>
							<th>의사소견</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="D"></tbody>
				</table>
			</div>
		</div>
		<div class='Det_bottom'>
			<div class='Det_bot_name'>
				<div class='D_name2'>처방기록</div>
			</div>
			<div class='Det_bot_bot'>
				<table class='Det_table' border="1" align="center">
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
							<th>처방약</th>
							<th>처방량</th>
							<th>1일 투여 횟수</th>
							<th>총 투여 일 수</th>
							<th>담당의</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="DE"></tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>