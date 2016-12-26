<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Chart.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/EMR/Patient_LGW/Hospital_chart.js"></script> <!-- 자바 스크립트 -->
<title>병원현황</title>

<!-- 2016-12-22 - 이관우 개발시작
 		   26 - 개발완료 -->

</head>
<body class='Hos_chart_body'>
	<input type="hidden" id="Ho_Name" value="${sHospital_Name}" />
	<div class='Hos_chart_div'>
		<div class='Hos_chart_main'>
			<div class='Hos_chart_top'>
				<div class='Hos_chart_name'>병원현황</div>
			</div>
			<div class='Hos_chart_middle'>
				<div id="container" style="min-width: 310px; height: 100%; margin: 0 auto"></div>
			</div>
			<div class='Hos_chart_bottom'>
				<input class='Hos_chart_Btn' type="button" value="환자방문" id="sun" name="typeBtn" />
				<input class='Hos_chart_Btn' type="button" value="환자구분" id="won" name="typeBtn" />
				<input class='Hos_chart_Btn' type="button" value="진료과" id="bar" name="typeBtn" />
			</div>
		</div>
	</div>
</body>
</html>