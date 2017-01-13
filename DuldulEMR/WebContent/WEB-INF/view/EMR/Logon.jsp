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
<div class="login-page" style="margin-top: 10%;">
<div style="font-size: 44pt; text-align: center; color: white; font-weight: bold; margin-bottom: 20px;">
	Duldul CareTech
</div>
  <div class="form">
    <form class="register-form">
		- 서비스 이용 안내 - <br/>
 		본 EMR 서비스는 DuldulEMR에서 <br/>
 		신청 후 사용 가능합니다.<br/>
		문의 번호 : 1555 - 5555 <br/>
		이메일 : duldul@emrservice.com <br/>
      <p class="message"><a href="#">돌아가기</a></p>
    </form>
    <form action="" class="login-form" id="loginForm" method="post">
	    <input type="hidden" name="re_hos">
	    <input type="hidden" name="re_id">
		<input type="text" id="hos_Code" name="hos_Code" placeholder="병원 코드"/>
		<input type="text" id="emp_id"  name="emp_id" placeholder="아이디"/>
		<input type="password" id="passwd" name="passwd" placeholder="비밀번호"/>
      <div class="logon_idsave">
	      <input type="checkbox" id="re_hos" checked="checked" style="width: 15px; margin: 0px;"/>병원 코드 저장
	      <input type="checkbox" id="re_id" checked="checked" style="width: 15px; margin: 0px 0px 0px 50px;"/>아이디 저장
      </div>
      <button id="loginbtn">login</button>
      <p class="message"> 계정이 필요하신가요? <a href="#">이용안내</a></p>
    </form>
  </div>
</div>
</body>
</html>