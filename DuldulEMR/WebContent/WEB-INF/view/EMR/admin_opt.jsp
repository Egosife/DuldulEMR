<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 2016-11-28 이동건 제작 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script> <!-- J쿼리 -->
<style type="text/css">
body {
	margin: 0px;
	font-size: 0pt;
}

div {
	vertical-align: top;
	overflow: hidden;
}

.admin_opt_main{
	width: 100%;
	height: 900px;
}
.admin_opt_maintitle{
	width: 100%;
	height: 50px;
	background-color: yellow;
	font-size: 16pt;
	font-weight: bold;
}
.admin_opt_title{
	width: 100%;
	height: 30px;
	background-color: orange;
	font-size: 14pt;
	font-weight: bold;
}
.admin_opt_top{
	width: 100%;
	height: 40%;
	background-color: gray;
}
.admin_opt_mid{
	width: 100%;
	height: 20%;
	background-color: lime;
}
.admin_opt_midcontent{
	width: 100%;
	height: calc(100% - 55px);
	font-size: 12pt;
	background-color: red;
}
.admin_opt_bot{
	width: 100%;
	height: 40%;
	background-color: green;
}
.admin_opt_botcontent{
	width: 100%;
	height: calc(100% - 55px);
	font-size: 12pt;
	background-color: red;
}
.admin_opt_tablediv{
	width: 50%;
	height: calc(100% - 80px);
	display: inline-block;
	font-size: 12pt;
	overflow: auto;
	background-color: olive;
}
.admin_opt_table{
	width: 100%;
	border-collapse: collapse;
	border-bottom: 1px black solid;
}
.admin_opt_tabletr{
}
.admin_opt_buttons{
	width: 100%;
	height: 25px;
	font-size: 12pt;
	background-color: blue;
}

</style>
<title>Admin Option</title>
</head>
<body>
<div class="admin_opt_main">
<!-- 상단 -->
	<div class="admin_opt_top">
		<div class="admin_opt_maintitle">관리자 옵션</div>
		<div class="admin_opt_title">병원현황</div>
		<div class="admin_opt_tablediv">
			<table class="admin_opt_table">
				<thead>
					<tr class="admin_opt_tabletr">
						<th>병원코드</th>
						<th>병원이름</th>
					</tr>
				</thead>
				<tbody>
					<tr class="admin_opt_tabletr">
						<td>asd</td>
						<td>aaaaa</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="admin_opt_tablediv">
			<table class="admin_opt_table">
				<thead>
					<tr>
						<th>계정등급</th>
						<th>직원번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>직책</th>
						<th>진료과</th>
						<th>성별</th>
						<th>활성화여부</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
<!-- 중단 -->
	<div class="admin_opt_mid">
		<div class="admin_opt_title">병원등록</div>
		<div class="admin_opt_midcontent">
			병원이름<input type="text">
		</div>
		<div class="admin_opt_buttons">
			<input type="button" value="취소">
			<input type="button" value="등록">
		</div>
	</div>
<!-- 하단 -->
	<div class="admin_opt_bot">
		<div class="admin_opt_title">매니저 계정 등록</div>
		<div class="admin_opt_botcontent">
			병원 선택<select></select>
			계정번호<input type="text"><input type="button" value="중복검사">
			비밀번호<input type="password">
			비밀번호확인<input type="password">
		</div>
		<div class="admin_opt_buttons">
			<input type="button" value="취소">
			<input type="button" value="등록">
		</div>
	</div>
</div>
</body>
</html>