<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 상세조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Details.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript">
/* 2016-11-24 이관우 개발  */

</script>
</head>

<body>
<form action="#" id="actionBit">
	<input type="hidden" name="Pat_page" value="${param.Pat_page}" />
	<input type="hidden" name="searchText_p" value="${searchText_p}" />
	<input type="hidden" name="Text_NO" value="${param.Text_NO}" />
</form>
<div class='Det_main'>
	<div class='Det_name'>
		<div class='D_name'>환자 상세조회</div>
	</div>
	<div class='Det_top'>
		<div class='Det_top_t'>
			<div class='Det_top_l'>
				<div class='Det_top_img'></div>
			</div>
			<div class='Det_top_r'>
				<div class='Det_left'>
					<table>
						<tr>
							<td>
								환자번호
							</td>
							<td>
								<input class="textbox_d" type="text" id="">
							</td>
						</tr>
						<tr>
							<td>
								이름
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
						<tr>
							<td>
								성별
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
						<tr>
							<td>
								주소
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
					</table>
				</div>
				<div class='Det_center'>
					<table>
						<tr>
							<td>
								연락처1
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
						<tr>
							<td>
								연락처2
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
						<tr>
							<td>
								혈액형
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
					</table>
				</div>
				<div class='Det_right'>
									<table>
						<tr>
							<td>
								몸무게
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
						<tr>
							<td>
								신장
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
						<tr>
							<td>
								장애여부
							</td>
							<td>
								<input class="textbox_d" type="text">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class='Det_top_b'>
			<input type="button" id="jin" value="진료" />
		</div>
	</div>
	<div class='Det_middle'>
		<div class='Det_mid_name'>
			<div class='D_name1'>진단기록</div>
		</div>
		<div class='Det_mid_bot'>
			<table border="1" align="center">
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
			</table>
		</div>
	</div>
	<div class='Det_bottom'>
		<div class='Det_bot_name'>
			<div class='D_name2'>처방기록</div>
		</div>
		<div class='Det_bot_bot'>
			<table border="1" align="center">
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
			</table>
		</div>
	</div>
</div>
</body>
</html>