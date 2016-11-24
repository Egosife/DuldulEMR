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
	<div class='Sign_top'>환자등록</div>
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
						이름<input type="text" id="patient_name"/>
						<br/>
						생년월일<input type="text" id="patient_bir"/>
						<br/>
						연락처1<input type="text" id="pho_num"/>
					</div>
					<div class='Sign_miban2'>
						성별
						<input type="radio" name="pat_sex" value="man" /> 남
						<input type="radio" name="pat_sex" value="woman" /> 여
						<br/>
						연락처2<input type="text" id="pho_num2"/>
					</div>
				</div>
				<div class='Sign_mibottom2'>
					Blood type
					<input type="radio" name="Blood" value="A" /> A
					<input type="radio" name="Blood" value="B" /> B
					<input type="radio" name="Blood" value="O" /> O
					<input type="radio" name="Blood" value="AB" /> AB
					<input type="radio" name="Blood" value="RH" /> RH
					<input type="radio" name="Blood" value="+" /> +
					<input type="radio" name="Blood" value="-" /> -
					<br/>
					주소<input type="text" id="address"/>
					<br/>
					비고<input type="text" id="ETC"/>
				</div>
			</div>
		</div>
		<div class='Sign_mibottom'>
			<div class='Sign_botTop'>추가정보입력</div>
			<div class='Sign_botbottom'>
				<div class='Sign_banleft'>
					키<input type="text" id="hei"/>
					<br/>
					몸무게<input type="text" id="wei"/>
					<br/>
					장애여부<input type="text" id="handicap"/>
					<br/>
					결혼여부
					<input type="radio" name="marri" value="mi" /> 미혼
					<input type="radio" name="marri" value="gi" /> 기혼
				</div>
				<div class='Sign_banright'>
					주량
					<select>
						<option>없음</option>
						<option>1병</option>
						<option>1병~2병</option>
						<option>2병</option>
						<option>2병이상</option>
					</select>
					<br/>
					시력-좌<input type="text" id="left_eye"/>
					<br/>
					시력-우<input type="text" id="right_eye"/>
					<br/>
					질환여부<input type="text" id="disease"/>
					<br/>
					흡연여부
					<input type="radio" name="smoking" value="hip" /> 흡연
					<input type="radio" name="smoking" value="bihip" /> 비흡연
				</div>
			</div>
		</div>
	</div>
	<div class='Sign_bottom'>
		<input type="button" id="sign_Btn" value="등록" />
		<input type="button" id="bback_Btn" value="이전" />
	</div>
</div>
</body>
</html>