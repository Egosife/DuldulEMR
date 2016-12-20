<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 2016-11-28 이동건 제작 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script> <!-- J쿼리 -->
<style type="text/css">
.admin_opt_main{
	width: 100%;
	height: 890px;
	background-color: silver;
}
.admin_opt_maintitle{
	width: 100%;
	height: calc(50px - 12px);
	font-size: 16pt;
	font-weight: bold;
	padding-top: 12px;
}
.admin_opt_title{
	width: 100%;
	height: 30px;
	font-size: 14pt;
	font-weight: bold;
	background-color: gray;
}
.admin_opt_top{
	width: 100%;
	height: 60%;
}
.admin_opt_mid{
	width: 100%;
	height: 20%;
}
.admin_opt_midcontent{
	width: 100%;
	height: calc(100% - 55px);
	font-size: 12pt;
}
.admin_opt_bot{
	width: 100%;
	height: 20%;
}
.admin_opt_botcontent{
	width: 100%;
	height: calc(100% - 55px);
	font-size: 12pt;
}
.admin_opt_tablediv{
	width: 50%;
	height: calc(100% - 80px);
	display: inline-block;
	font-size: 12pt;
	overflow-y: scroll;
}
.admin_opt_table{
	width: 100%;
	border-collapse: collapse;
	background-color: white;
}
.admin_opt_tabletr{
	border-bottom: 1px solid black;
	background-color: white;
}
.admin_opt_buttons{
	width: calc(100% - 20px);
	height: 25px;
	font-size: 12pt;
	text-align: right;
	padding-right: 20px;
}

.admin_form{
	width: 100%;
	height: 100%;
}

</style>
<title>Admin Option</title>
</head>
<body>
<div class="admin_opt_main">
<!-- 상단 -->
	<div class="admin_opt_top">
		<div class="admin_opt_maintitle">관리자 옵션</div>
		<div class="admin_opt_title">병원과 계정정보</div>
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
						<td>999999</td>
						<td>테스트병원1</td>
					</tr>
					<tr class="admin_opt_tabletr">
						<td>999998</td>
						<td>테스트병원2</td>
					</tr>
					<tr class="admin_opt_tabletr">
						<td>999997</td>
						<td>테스트병원3</td>
					</tr>
					<tr class="admin_opt_tabletr">
						<td>999996</td>
						<td>테스트병원4</td>
					</tr>
					<tr class="admin_opt_tabletr">
						<td>999995</td>
						<td>테스트병원5</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="admin_opt_tablediv">
			<table class="admin_opt_table">
				<thead>
					<tr class="admin_opt_tabletr">
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
				<tbody>
					<tr class="admin_opt_tabletr">
						<td>매니저</td>
						<td>9999980001</td>
						<td>테스트매니저2</td>
						<td>01000000000</td>
						<td>TEST@TEST.COM</td>
						<td>직책0</td>
						<td>진료과0</td>
						<td>남자</td>
						<td>활성화</td>
					</tr>
					<tr class="admin_opt_tabletr">
						<td>의사</td>
						<td>9999980002</td>
						<td>테스트의사2</td>
						<td>01000000000</td>
						<td>TEST@TEST.COM</td>
						<td>직책0</td>
						<td>진료과0</td>
						<td>남자</td>
						<td>활성화</td>
					</tr>
					<tr class="admin_opt_tabletr">
						<td>간호사</td>
						<td>9999980003</td>
						<td>테스트간호사2</td>
						<td>01000000000</td>
						<td>TEST@TEST.COM</td>
						<td>직책0</td>
						<td>진료과0</td>
						<td>남자</td>
						<td>활성화</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<!-- 중단 -->
	<div class="admin_opt_mid">
		<div class="admin_opt_title">병원등록</div>
		<div class="admin_opt_midcontent">
			<form class="admin_form" action="#" method="post" id="adminopt_hos_register">
			병원이름<input type="text">
			주소<input type="text">
			연락처<input type="text" size="3" maxlength="3">-<input type="text" size="3" maxlength="4">-<input type="text" size="3" maxlength="4">
			</form>
		</div>
		<div class="admin_opt_buttons">
			<input type="button" value="다시쓰기">
			<input type="button" value="등록">
		</div>
	</div>
<!-- 하단 -->
	<div class="admin_opt_bot">
		<div class="admin_opt_title">계정 등록</div>
		<div class="admin_opt_botcontent">
			<form class="admin_form" action="#" method="post" id="adminopt_acc_register">
				<table>
					<tr>
						<td>*병원 선택</td>
						<td><input type="text" disabled="disabled"></td>
						<td><input type="button" value="검색"></td>
						<td colspan="3" style="color: red;">' * ' 모양이 있는 부분은 필수 입력 부분입니다.</td>
					</tr>
					<tr>
						<td>
							*계정번호
						</td>
						<td>
							<input type="text">
						</td>
						<td>
							<input type="button" value="중복검사">
						</td>
						<td>
							*비밀번호
						</td>
						<td>
							<input type="password">
						</td>
						<td>
							*비밀번호확인
						</td>
						<td>
							<input type="password">
						</td>
					</tr>
					<tr>
						<td>
							*이름
						</td>
						<td>
							<input type="text">
						</td>
						<td></td>
						<td>
							*연락처
						</td>
						<td>
							<input type="text" size="3" maxlength="3">-<input type="text" size="3" maxlength="4">-<input type="text" size="3" maxlength="4">
						</td>
						<td>
							이메일
						</td>
						<td>
							<input type="text">
						</td>
					</tr>
					<tr>
						<td>
							성별
						</td>
						<td>
							<select>
								<option value="0">남성</option>
							</select>
						</td>
						<td></td>
						<td>
							*직책
						</td>
						<td>
							<select>
								<option value="0">직책0</option>
							</select>
						</td>
						<td>
							*진료과
						</td>
						<td>
							<select>
								<option value="0">진료과0</option>
							</select>
						</td>
						<td>
							*등급
						</td>
						<td>
							<select>
								<option value="0">매니저</option>
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="admin_opt_buttons">
			<input type="button" value="다시쓰기">
			<input type="button" value="등록" disabled="disabled">
		</div>
	</div>
</div>
</body>
</html>