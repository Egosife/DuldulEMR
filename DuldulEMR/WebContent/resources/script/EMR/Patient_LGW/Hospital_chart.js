/* 2016-12-22 - 이관우 개발시작
 		   26 - 개발완료 */

$(document).ready(function(){
	Hospital_Data();
	
	$("#sun").on("click", function(){ //환자방문을 클릭 했을시
		Hospital_Data();
	});
	
	$("#won").on("click", function(){ //환자구분을 클릭 했을시
		Hospital_Data2();
	});
	
	$("#bar").on("click", function(){ //진료과를 클릭 했을시
		Hospital_Data3();
	});
});

function Hospital_Data() { //환자방문 데이터
	//console.log("a");
	$.ajax({
		type : "post",
		url : "Hospital_chart_Data",
		dataType : "json",
		success : function(result){
			//console.log("zzzzz" + result);
			Hospital_chart(result.data);
			//console.log("zaaa" + result.data);
		},
		error : function(result){
			alert("Error - Hospital_chart_7040");
		}
	});
}

function Hospital_chart(data) { //환자방문 현황 차트
	//console.log("bbbbbb" + data);
	$("#container").highcharts({
        title: {
            text: '환자방문 현황',
            x: -20 //center
        },
        subtitle: {
            text: $("#Ho_Name").val(),
            x: -20
        },
        xAxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월']
        },
        yAxis: {
            title: {
                text: '환자 수'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
            //,min: 0
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
        plotOptions: {
            series: {
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            //alert('Category: ' + this.category + ', value: ' + this.y + ', value2: ' + this.x+ ', 구분: ' + this.series.name);
                        }
                    }
                }
            }
        },
        series: data
    });
}

function Hospital_Data2() { //환자구분 데이터
	//console.log("a");
	$.ajax({
		type : "post",
		url : "Hospital_chart_Data2",
		dataType : "json",
		success : function(result){
			//console.log("zzzzz" + result);
			Hospital_chart2(result.data);
			//console.log(result.data);
		},
		error : function(result){
			alert("Error - Hospital_chart_7041");
		}
	});
}

function Hospital_chart2(data) { //환자구분 현황 차트

    // Make monochrome colors and set them as default for all pies
    /* Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());
 */
    // Build the chart
    $("#container").highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '환자구분 현황'
        },
        
        colors: ['#5CB3FF', '#D462FF', '#FBB917', '#00B3A2', '#FB558A', 
            '#2870E3', '#FF8F00', '#B5BF07', '#3F9D00', '#CE3C92'],
            
        subtitle: {
            text: $("#Ho_Name").val(),
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}% ({point.y}명)</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f}% ({point.y}명)',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
        	name:"환자",
        	data:data
        }]
    });
}

function Hospital_Data3() { //진료과별 남녀비율 데이터
	//console.log("a");
	$.ajax({
		type : "post",
		url : "Hospital_chart_Data3",
		dataType : "json",
		success : function(result){
			//console.log("zzzzz" + result);
			Hospital_chart3(result.data, result.category);
			//console.log(result.data);
		},
		error : function(result){
			alert("Error - Hospital_chart_7042");
		}
	});
}

function Hospital_chart3(data, cate) { //진료과별 남녀비율 차트
	$("#container").highcharts({
		chart: {
            type: 'column'
        },
        title: {
            text: '진료과별 남/여 현황'
        },
        subtitle: {
            text: $("#Ho_Name").val(),
        },
        
        colors: ['#5CB3FF', '#D462FF', '#FBB917', '#00B3A2', '#FB558A', 
            '#2870E3', '#FF8F00', '#B5BF07', '#3F9D00', '#CE3C92'],
            
        xAxis: {
        	categories: cate
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '환자 수'
            }
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + ': ' + this.point.y + '명';
            }
        },
        series: data
    });
};