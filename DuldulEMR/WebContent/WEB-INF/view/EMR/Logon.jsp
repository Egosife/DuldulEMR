<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Logon/Logon.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/logon/logon.js"></script>

<title>Login</title>
</head>
<body>
<div class="main"> <!-- 메인 레이아웃 -->
	<div class="logo">이미지 공간</div> <!-- 레이아웃 상단 -->
	<div class="middle"> <!-- 레이아웃 중단 -->
		<div class="login"> <!-- 레이아웃 중단 - 가운데 정렬 -->
			<form action="#" id="loginForm" method="post">
				<input type="hidden" name="re_hos">
				<input type="hidden" name="re_id">
				<div class="text"> <!-- 레이아웃 중단 - 텍스트 -->
					<input type="text" id="hos_Code" name="hos_Code" placeholder="병원 코드 입력"/><br/>
					<input type="text" id="emp_id" name="emp_id" placeholder="아이디 입력"/><br/>
					<input type="password" id="passwd" name="passwd" placeholder="비밀번호 입력"/>
					</div>
					<div class="btn" id="loginbtn">로그인</div> <!-- 레이아웃 중단 - 로그인 버튼 -->
					<div class="check"> <!-- 레이아웃 중단 - 체크박스 -->
						<input type="checkbox" id="re_hos" checked="checked"/> 병원 코드 저장
						<input type="checkbox" id="re_id" checked="checked"/> 아이디 저장
				</div>
			</form>
		</div>
	</div>
	<div class="bottom"> <!-- 레이아웃 하단 -->
		<div class="guide"> <!-- 레이아웃 하단 - 가운데 정렬 -->
		- 서비스 이용 안내 - <br/>
 		본 EMR 서비스는 DuldulEMR에서 <br/>
 		신청 후 사용 가능합니다.<br/>
		문의 번호 : 1555 - 5555 <br/>
		이메일 : duldul@emrservice.com <br/>
		</div>
	</div>	
</div>
</body>
</html>