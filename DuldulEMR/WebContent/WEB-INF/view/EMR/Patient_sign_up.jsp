<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자등록</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Sign_up.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript">
/* 2016-11-23 이관우 개발 */

$(document).ready(function(){ //이전 버튼
	$("#bback_Btn").on("click", function(){
		location.href = "Patient_page";
	});
});

</script>
</head>

<body>
<div class='Sign_main'>
	<div class='Sign_top'>
		<div class='S_name'>환자등록</div>
	</div>
	<div class='Sign_middle'>
		<div class='Sign_mitop'>
			<div class='Sign_mileft'>
				<div class='Sign_leftTop'>
					<div class='Sign_img'></div>
				</div>
				<div class='Sign_leftbottom'>
					<input type="button" id="img_Btn" value="이미지 등록" />
				</div>
			</div>
			<div class='Sign_miright'>
				<div class='Sign_mitop2'>
					<div class='Sign_miban'>
						<table>
							<tr>
								<td>
									이름
								</td>
								<td>
									<input class="textbox_s" type="text" id="patient_name"/>
								</td>
							</tr>
							<tr>
								<td>
									생년월일
								</td>
								<td>
									<input class="textbox_s" type="text" id="patient_bir"/>
								</td>
							</tr>
							<tr>
								<td>
									연락처1
								</td>
								<td>
									<input class="textbox_s" type="text" id="pho_num"/>
								</td>
							</tr>
						</table>
					</div>
					<div class='Sign_miban2'>
						<table>
							<tr>
								<td>
									연락처2
								</td>
								<td>
									<input class="textbox_s" type="text" id="pho_num2"/>
								</td>
							</tr>
							<tr>
								<td>
									성별
								</td>
								<td>
									<input type="radio" name="pat_sex" value="man" /> 남
									<input type="radio" name="pat_sex" value="woman" /> 여
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
					<table>
						<tr>
							<td>
								주소
							</td>
							<td>
								<input class="textbox_s" type="text" id="address"/>
							</td>
						</tr>
						<tr>
							<td>
								비고
							</td>
							<td>	
								<input class="textbox_s" type="text" id="ETC"/>
							</td>
						</tr>
						<tr>
							<td>
								Blood type
							</td>
							<td>
								<input type="radio" name="Blood" value="A" /> A
								<input type="radio" name="Blood" value="B" /> B
								<input type="radio" name="Blood" value="O" /> O
								<input type="radio" name="Blood" value="AB" /> AB
								<input type="radio" name="Blood" value="RH" /> RH
								<input type="radio" name="Blood" value="+" /> +
								<input type="radio" name="Blood" value="-" /> -
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
					<table>
						<tr>
							<td>
								키
							</td>
							<td>
								<input class="textbox_s" type="text" id="hei"/>
							</td>
						</tr>
						<tr>
							<td>
								몸무게
							</td>
							<td>
								<input class="textbox_s" type="text" id="wei"/>
							</td>
						</tr>
						<tr>
							<td>
								장애여부
							</td>
							<td>
								<input class="textbox_s" type="text" id="handicap"/>
							</td>
						</tr>
						<tr>
							<td>
								결혼여부
							</td>
							<td>
								<input type="radio" name="marri" value="mi" /> 미혼
								<input type="radio" name="marri" value="gi" /> 기혼
							</td>
						</tr>
					</table>
				</div>
				<div class='Sign_banright'>
					<table>
						<tr>
							<td>
								주량
							</td>
							<td>
								<select class="textbox_s" id="soju" style="font-size: 20pt;">
									<option>없음</option>
									<option>1병</option>
									<option>1병~2병</option>
									<option>2병</option>
									<option>2병이상</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								시력-좌
							</td>
							<td>
								<input class="textbox_s" type="text" id="left_eye"/>
							</td>
						</tr>
						<tr>
							<td>
								시력-우
							</td>
							<td>
								<input class="textbox_s" type="text" id="right_eye"/>
							</td>
						</tr>
						<tr>
							<td>
								질환여부
							</td>
							<td>
								<input class="textbox_s" type="text" id="disease"/>
							</td>
						</tr>
						<tr>
							<td>
								흡연여부
							</td>
							<td>
								<input type="radio" name="smoking" value="hip" /> 흡연
								<input type="radio" name="smoking" value="bihip" /> 비흡연
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class='Sign_bottom'>
		<hr>
		<input type="button" id="sign_Btn" value="등록" />
		<input type="button" id="bback_Btn" value="이전" />
	</div>
</div>
</body>
</html>