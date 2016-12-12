<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환자 상세조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/EMR_css/Details.css" /> <!-- 레이아웃 -->
<script type="text/javascript">

/* 2016-11-24 이관우  개발  
		12-05 ajax 추가 
		   07 ajax 수정 
		   08 ajax 추가 */

$(document).ready(function(){
	var papajohns = "${papajohns.pizza}";
	patient_Details_list(papajohns);
	
	$("body").on("click", "[name='data']", function(){ //진단기록 표를 눌렀을시
		$("#Dpt").attr('value', $(this).attr('value'));
		//console.log($("#sss").attr('value'));
		patient_Details_list2();
	});
});

function patient_Details_list(papajohns){
	//console.log(papajohns);
	
	//var padar = "patinum=" + papajohns + "&";
	var padar = $("#act_D").serialize();
	//console.log(padar);
	
	$.ajax({ //환자 상세정보, 진단기록
		type : "post",
		url : "Details_data",
		dataType : "json",
		data : padar,
		success : function(result) {
			$("#pat_num").attr('value',result.Det_info.PAT_NUM); /* 환자번호 */
			$("#pat_name").attr('value',result.Det_info.PATIENT_NAME); /* 이름 */
			$("#pat_sex").attr('value',result.Det_info.SEX_CODE); /* 성별 */
			$("#pat_address").attr('value',result.Det_info.ADDRESS); /* 주소 */
			$("#pat_phone1").attr('value',result.Det_info.PHONE1); /* 연락처1 */
			$("#pat_phone2").attr('value',result.Det_info.PHONE2); /* 연락처2 */
			$("#pat_blood").attr('value',result.Det_info.BLOOD); /* 혈액형 */
			$("#pat_wei").attr('value',result.Det_info.WEI); /* 몸무게 */
			$("#pat_hei").attr('value',result.Det_info.HEI); /* 신장 */
			$("#pat_handicap").attr('value',result.Det_info.HANDICAP); /* 장애여부 */
			
			var DL = "";
			
			for(var i = 0; i < result.list.length; i++) {
				DL += "<tr name='data' value='" + result.list[i].TREAT_NUM + "'>";
				DL += "<td>" + result.list[i].NO + "</td>"; /* 번호 */
				DL += "<td>" + result.list[i].SYM + "</td>"; /* 증상 */
				DL += "<td>" + result.list[i].SPECIAL_NOTE + "</td>"; /* 특이사항 */
				DL += "<td>" + result.list[i].DIAGNOSIS + "</td>"; /* 진단명 */
				DL += "<td>" + result.list[i].EMP_NUM2 + "</td>"; /* 담당의 */
				DL += "<td>" + result.list[i].OPINION + "</td>"; /* 의사소견 */
				DL += "<td>" + result.list[i].POSTING_DATE + "</td>"; /* 작성일 */
				DL += "</tr>";
			}
			$("#D").html(DL);
		},
		error : function(result){
			alert("정보가 없습니다");
		}
	});
};

function patient_Details_list2(){
	var padar_padar_padar = $("#act_D").serialize();
	
	$.ajax({ //처방기록
		type : "post",
		url : "Details_data2",
		dataType : "json",
		data : padar_padar_padar,
		success : function(result) {
			
			var DEL = "";
			
			for(var i = 0; i < result.list2.length; i++) {
				DEL += "<tr>";
				DEL += "<td>" + result.list2[i].NO + "</td>"; /* 번호 */
				DEL += "<td>" + result.list2[i].PILL_NAME + "</td>"; /* 처방약 */
				DEL += "<td>" + result.list2[i].PRESCRIPTION_AMOUNT + "</td>"; /* 처방량 */
				DEL += "<td>" + result.list2[i].DAY_DRUGTIME + "</td>"; /* 1일 투여 횟수 */
				DEL += "<td>" + result.list2[i].ALL_DRUGTIME + "</td>"; /* 총 투여 일 수 */
				DEL += "<td>" + result.list2[i].EMP_NUM2 + "</td>"; /* 담당의 */
				DEL += "<td>" + result.list2[i].POSTING_DATE + "</td>"; /* 작성일 */
				DEL += "</tr>";
			}
			$("#DE").html(DEL);
		},
		error : function(result){
			alert("정보가 없습니다");
		}
	});
};

</script>
</head>

<body class='D_body'>
<form action="#" id="act_D" method="post">
	<c:choose>
		<c:when test="${empty padar.Det_page}">
			<input type="hidden" name="Det_page" value="1">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="Det_page" value="${padar.Det_page}" />
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="Det_page" value="1" />
	<input type="hidden" name="patinum" value="${papajohns.pizza}" />
	<input type="hidden" name="treat_num" value="" id="Dpt" />
</form>
<div class='D_div'>
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
						<table class='D_table'>
							<tr>
								<td class='DD_td'>
									환자번호
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_num" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									이름
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_name" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									성별
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_sex" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									주소
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_address" readonly="readonly">
								</td>
							</tr>
						</table>
					</div>
					<div class='Det_center'>
						<table class='D_table'>
							<tr>
								<td class='D_td'>
									연락처1
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_phone1" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='D_td'>
									연락처2
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_phone2" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='D_td'>
									혈액형
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_blood" readonly="readonly">
								</td>
							</tr>
						</table>
					</div>
					<div class='Det_right'>
						<table class='D_table'>
							<tr>
								<td class='DD_td'>
									몸무게
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_wei" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									신장
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_hei" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class='DD_td'>
									장애여부
								</td>
								<td>
									<input class="textbox_d" type="text" id="pat_handicap" readonly="readonly">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class='Det_top_b'>
				<input class='D_jin' type="button" id="jin" value="진료" />
			</div>
		</div>
		<div class='Det_middle'>
			<div class='Det_mid_name'>
				<div class='D_name1'>진단기록</div>
			</div>
			<div class='Det_mid_bot'>
				<table class='Det_table' border="1" align="center">
					<colgroup>
						<col style="width: 2%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 20%;">
						<col style="width: 5%;">
					</colgroup>
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
					<tbody id="D"></tbody>
				</table>
			</div>
		</div>
		<div class='Det_bottom'>
			<div class='Det_bot_name'>
				<div class='D_name2'>처방기록</div>
			</div>
			<div class='Det_bot_bot'>
				<table class='Det_table' border="1" align="center">
					<colgroup>
						<col style="width: 2%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 20%;">
						<col style="width: 5%;">
					</colgroup>
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
					<tbody id="DE"></tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>