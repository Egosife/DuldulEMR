<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Service.css" /> <!-- 레이아웃 -->
<script type="text/javascript">



</script>
</head>
<body class='Es_body'>
	<div class='Es_div'>
		<div class='Service_main'>
			<div class='Es_top'>
				<div class='Es_name'>회원정보수정</div>
			</div>
			<div class='Es_middle'>
				<div class='Es_mi_left'>
					<table class='Es_table'>
						<tr>
							<td class='Es_td'>
								이름
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Emp_Name" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								직원번호
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Emp_Num" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								병원코드
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Hospital_Code" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								연락처
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Phone" readonly="readonly">
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
								<input class="textbox_Es" type="text" id="Email" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class='Es_td'>
								주소
							</td>
							<td>
								<input class="textbox_Es" type="text" id="Address" readonly="readonly">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class='Es_bottom'>
				<input class='Es_change_Btn' type="button" id="EMPchange_Btn" value="수정" />
			</div>
		</div>
	</div>
</body>
</html>