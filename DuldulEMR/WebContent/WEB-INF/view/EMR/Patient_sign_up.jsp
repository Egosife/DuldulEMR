<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자등록</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Sign_up.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Patient_sign_up.js"></script> <!-- 자바 스크립트 -->
</head>

<!-- 2016-11-23 이관우 개발
		12-06 id로 받은 css 클래스추가
		   13  최종 개발완료 -->

<body class='S_body'>
<form action="#" id="action_S" method="post">
	<input type="hidden" name="sign_page" value="${paprika.sign_page}" />
	<input type="hidden" name="S_searchText" value="${paprika.S_searchText}" />
</form>
<div class='S_div'>
	<div class='Sign_main'>
		<div class='Sign_top'>
			<div class='S_name'>환자등록</div>
		</div>
			<div class='Sign_middle'>
				<form action="fileUploadAjax" id="img_insertForm" method="post" enctype="multipart/form-data" style="display: inline-block; height: 100%;">
					<div class='Sign_mitop'>
						<div class='Sign_mileft'>
							<div class='Sign_leftTop'>
								<div class='Sign_img_S' id="img_leftTop"></div>
							</div>
							<div class='Sign_leftbottom'>
								<input class='S_imgBtn' type="file" id="img_Btn" name="imgfile_Btn" value="이미지 등록" />
								<input type="hidden" name="textFile" id="textFile" />
							</div>
						</div>
						<div class='Sign_miright'>
							<div class='Sign_mitop2'>
								<div class='Sign_miban'>
									<table class='S_table'>
										<tr>
											<td>
												이름
											</td>
											<td>
												<input class="textbox_s" type="text" id="pat_name" name="PATIENT_NAME" />
											</td>
										</tr>
										<tr>
											<td>
												생년월일
											</td>
											<td>
												<input class="textbox_s" type="text" id="patient_bir" name="BIRTH" />
											</td>
										</tr>
										<tr>
											<td>
												연락처1
											</td>
											<td>
												<input class="textbox_s" type="text" id="pho_num" name="PHONE1" />
											</td>
										</tr>
									</table>
								</div>
								<div class='Sign_miban2'>
									<table class='S_table'>
										<tr>
											<td>
												연락처2
											</td>
											<td>
												<input class="textbox_s" type="text" id="pho_num2" name="PHONE2" />
											</td>
										</tr>
										<tr>
											<td>
												성별
											</td>
											<td>
												<input type="radio" name="pat_sex" value="1" /> 남
												<input type="radio" name="pat_sex" value="0" /> 여
											</td>
										</tr>
										<tr style="height: 34%;">
											<td>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class='Sign_mibottom2'>
								<table class='S_table'>
									<tr>
										<td>
											주소
										</td>
										<td>
											<input class="textbox_s" type="text" id="add_ress" name="ADDRESS" />
										</td>
									</tr>
									<tr>
										<td>
											E-mail
										</td>
										<td>	
											<input class="textbox_s" type="text" id="e_mail" name="EMAIL" />
										</td>
									</tr>
									<tr>
										<td>
											Blood type
										</td>
										<td>
											<select class="textbox_s" name="B_type">
												<option value="0">A-</option>
												<option value="1">A+</option>
												<option value="2">B-</option>
												<option value="3">B+</option>
												<option value="4">O-</option>
												<option value="5">O+</option>
												<option value="6">AB-</option>
												<option value="7">AB+</option>
											</select>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class='Sign_mibottom'>
						<div class='Sign_botTop'>
							<hr>
							<div class='name_S'>추가정보입력</div>
						</div>
						<div class='Sign_botbottom'>
							<div class='Sign_banleft'>
								<table class='S_table'>
									<tr>
										<td>
											키
										</td>
										<td>
											<input class="textbox_s" type="text" id="Pat_hei" name="HEI" />
										</td>
									</tr>
									<tr>
										<td>
											몸무게
										</td>
										<td>
											<input class="textbox_s" type="text" id="Pat_wei" name="WEI" />
										</td>
									</tr>
									<tr>
										<td>
											장애여부
										</td>
										<td>
											<input class="textbox_s" type="text" id="Pat_handicap" name="HANDICAP" />
										</td>
									</tr>
									<tr>
										<td>
											결혼여부
										</td>
										<td>
											<input type="radio" name="marri" value="0" /> 미혼
											<input type="radio" name="marri" value="1" /> 기혼
											<input type="radio" name="marri" value="2" /> 재혼
										</td>
									</tr>
								</table>
							</div>
							<div class='Sign_banright'>
								<table class='S_table'>
									<tr>
										<td>
											주량
										</td>
										<td>
											<select class="textbox_s" name="chm" id="soju" style="font-size: 20pt;">
												<option value="0">없음</option>
												<option value="1">1병 이내</option>
												<option value="2">1병~2병</option>
												<option value="3">2병~3병</option>
												<option value="4">3병이상</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											시력-좌
										</td>
										<td>
											<input class="textbox_s" type="text" id="Pat_left_eye" name="LEFT_EYE" />
										</td>
									</tr>
									<tr>
										<td>
											시력-우
										</td>
										<td>
											<input class="textbox_s" type="text" id="Pat_right_eye" name="RIGHT_EYE" />
										</td>
									</tr>
									<tr>
										<td>
											질환여부
										</td>
										<td>
											<input class="textbox_s" type="text" id="Pat_disease" name="DISEASE" />
										</td>
									</tr>
									<tr>
										<td>
											흡연여부
										</td>
										<td>
											<select class="textbox_s" name="hip">
												<option value="0">없음</option>
												<option value="1">1갑 이하</option>
												<option value="2">1갑 이상</option>
												<option value="3">2갑 이상</option>
											</select>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		<div class='Sign_bottom'>
			<hr>
			<input class='S_sign_Btn' type="button" id="sign_Btn" value="등록" />
			<input class='S_bback_Btn' type="button" id="bback_Btn" value="이전" tab="Sign_up" />
		</div>
	</div>
</div>
</body>
</html>