<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Chart.css" /> <!-- 레이아웃 -->
<title>병원현황</title>
<script type="text/javascript">

/* 2016-12-22 이관우 개발시작 */

$(document).ready(function(){
	Hospital_Data();
});

function Hospital_Data() {
	console.log("a");
	$.ajax({
		type : "post",
		url : "Hospital_chart_Data",
		dataType : "json",
		success : function(result){
	console.log("b");
			Hospital_chart(result.data);
		},
		error : function(result){
			alert("Error - Hospital_chart_7040");
		}
	});
}

function Hospital_chart(data) {
	console.log(data);
	$("#container").highcharts({
        title: {
            text: '환자방문현황',
            x: -20 //center
        },
        subtitle: {
            text: '${sHospital_Name}',
            x: -20
        },
        xAxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월']
        },
        yAxis: {
            title: {
                text: '방문자 수'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '명'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: data
    });
}
</script>
</head>
<body class='Hos_chart_body'>
	<div class='Hos_chart_div'>
		<div class='Hos_chart_main'>
			<div class='Hos_chart_top'>
				<div class='Hos_chart_name'>병원현황</div>
			</div>
			<div class='Hos_chart_middle'>
				<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			</div>
			<div class='Hos_chart_bottom'>
				<input class='Hos_chart_Btn' type="button" value="환자방문" id="sun" name="typeBtn" />
				<input class='Hos_chart_Btn' type="button" value="환자구분" id="won" name="typeBtn" />
				<input class='Hos_chart_Btn' type="button" value="환자비교" id="bar" name="typeBtn" />
			</div>
		</div>
	</div>
</body>
</html>