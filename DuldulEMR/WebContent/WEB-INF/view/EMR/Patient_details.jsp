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
	<div class='Det_name'>환자 상세조회</div>
	<div class='Det_top'>
		<div class='Det_top_t'>
			<div class='Det_top_l'>
				<div class='Det_top_img'></div>
			</div>
			<div class='Det_top_r'>
				<div class='Det_left'></div>
				<div class='Det_center'></div>
				<div class='Det_right'></div>
			</div>
		</div>
		<div class='Det_top_b'>
			<input type="button" id="jin" value="진료" />
		</div>
	</div>
	<div class='Det_middle'>
		<div class='Det_mid_name'>진단기록</div>
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
		<div class='Det_bot_name'>처방기록</div>
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