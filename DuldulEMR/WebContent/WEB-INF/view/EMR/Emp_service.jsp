<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Service.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Emp_service.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-12-20 이관우 개발
				div, 회원정보수정
		  12-21  개발완료 
		  		비밀번호 변경 -->

<body class='Es_body'>
<form action="#" id="act_Es" method="post">
	<c:choose>
		<c:when test="${empty paring.service_page}">
			<input type="hidden" name="service_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="service_page" value="${paring.service_page}">
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="service_page" value="1" />
	<input type="hidden" name="Emp_Num" value="${sEmp_Num}">
	<input type="hidden" name="Hospital_Code" value="${sHospital_Code}">
</form>
<input type="hidden" id="sEmp_Num" value="${sEmp_Num}" /> <!-- 비밀번호 변경 직원 아이디 값 -->
<input type="hidden" id="Hospi_Code" value="${sHospital_Code}" />
<div class='Es_div'>
	<div class='Service_main'>
		<div class='Es_top'>
			<div class='Es_name'>회원정보수정</div>
		</div>
		<div class='Es_middle'>
			<form action="#" id="update_Form" method="post" style="display: inline-block; width: 100%; height: 100%;">
				<input type="hidden" name="Emp_Num" value="${sEmp_Num}">
				<input type="hidden" name="Hospital_Code" value="${sHospital_Code}">
				<div class='Es_mi_left'>
					<table class='Es_table'>
						<tr>
							<td class='Es_td'>
								이름
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Emp_Name" readonly="readonly" value="${sEmp_Name}">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								직원번호
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Emp_Num" readonly="readonly" value="${sEmp_Num}">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								병원
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Hospital_Name" readonly="readonly" value="${sHospital_Name}">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								연락처
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Phone" name="Phone" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								회원등급
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Lv_Code" readonly="readonly">
							</td>
						</tr>
					</table>
				</div>
				<div class='Es_mi_right'>
					<table class='Es_table'>
						<tr>
							<td class='Es_td'>
								직책
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Position_Code" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								진료과
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Office_Code" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								생년월일
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Birth" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								E-mail
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Email" name="Email" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								주소
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Address" name="Address" readonly="readonly">
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div class='Es_bottom'>
			<input class='Es_change_Btn' type="button" id="EMPchange_Btn" value="수정" />
			<input class='Es_password_Btn' type="button" id="EMPpassword_Btn" value="비밀번호 변경" />
		</div>
	</div>
</div>
</body>
</html>