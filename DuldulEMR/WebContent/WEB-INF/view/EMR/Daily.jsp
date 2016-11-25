<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<title>일일 업무 일지</title>
</head>
<body>
<!-- 16.11.25 일일 업무 일지 조회, 김남기 -->
<div class="main"> <!-- 메인 레이아웃 -->
	<div class="top"> <!-- 레이아웃 상단 -->
		<div class="b_information"><b>기본 정보</b></div> <!-- 레이아웃 - 기본 정보 -->
		<table border="1"> <!-- 기본 정보 테이블 -->
			<tr>
				<td>성 명</td>
				<td>직 책</td>
				<td>사원 번호</td>
				<td>근무과</td>
			</tr>
		</table>
	</div>
	<div class="middle"> <!-- 레이아웃 중단 -->
		<div class="report"><b>업무 일지</b></div> <!-- 레이아웃 중단 - 업무 일지 -->
		<table border="1"> <!-- 업무 일지 테이블 -->
			<tr>
				<td>일 차</td>
				<td>업무 일자</td>
				<td>업무 내용</td>
			</tr>
		</table>
	</div><hr>
	<div class="bottom"> <!-- 레이아웃 하단 -->
		<div class="bottom_top"> <!-- 레이아웃 하단 - 상단 -->
			<div class="btn">글쓰기</div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
		</div>
		<div class="bottom_bt"> <!-- 레이아웃 하단 - 하단 -->
			<div class="paging">이전 1 2 3 4 5 다음</div> <!-- 레이아웃 하단 - 페이징 -->
		</div>
	</div>
</div>
</body>
</html>