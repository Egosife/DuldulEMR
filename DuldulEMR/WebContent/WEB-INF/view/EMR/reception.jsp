<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main/reception.css" /> <!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script> <!-- J쿼리 -->
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />
<!-- Popup CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>
		
<script type="text/javascript">

$(document).ready(function(){
	$("body").on("click","[name='pati-selectBtn']",function(){
		console.log($(this).attr("id"));
	})
	
	$("body").on("click","#pop_serachBtn",function(){
		var params = $("#pop_action").serialize();
		$.ajax({
			type : "post",
			url : "treat_patientserach",
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				for(var i = 0 ; i < result.serach.length ; i++){
					html += "<tr>";
					html += "<td>" + result.serach[i].NO + "</td>";
					html += "<td>" + result.serach[i].PATIENT_NUM + "</td>";
					html += "<td>" + result.serach[i].PATIENT_NAME + "</td>";
					html += "<td>" + result.serach[i].PHONE1 + "</td>";
					html += "<td>" + result.serach[i].PHONE2 + "</td>";
					html += "<td>" + result.serach[i].ADDRESS + "</td>";
					html += "<td>" + result.serach[i].BLOOD + "</td>";
					html += "<td><input type='button' id='btn_"+result.serach[i].PATIENT_NUM+"' name='pati-selectBtn' value='선택'></td>";
					html += "</tr>";
				}
				$("#tb").html(html);
				$("#serachresult").html(result.serach.length+" 건이 검색되었습니다.")
			},
			error : function(result){
				alert("ERROR - Patient_Search");
			}
		})// ajax end
	})//pop_serachBtn end
	
	//팝업 페이지 출력
	$("#serach_btn").on("click", function(){
		var html = "";
		
		html+= "<div class='pop_div_main'>";
		
			html+= "<div class='pop_div_top'>";
				html+= "<form action='#' id='pop_action' method='post'>";
					html+="<table><tr>";
						html+= "<td><input type='text' name='pop_serachText' style='width: 100%; height: 100%;'></td>";
						html+= "<td><input type='button' id='pop_serachBtn' value='검색'><td>";
						html+= "<td id='serachresult'>0 건이 검색되었습니다.</td>";
					html+="</tr></table>";
				html+= "</form>";
			html+="<hr></div>";
			
			html+="<div class='pop_div_bot'>";
					html+= "<table border='1' align='center' width='100%' >";
						html+= "<thead>";
							html+= "<tr>";
								html+= "<th>번호</th>";
								html+= "<th>환자 번호</th>";
								html+= "<th>성명</th>";
								html+= "<th>연락처1</th>";
								html+= "<th>연락처2</th>";
								html+= "<th>주소</th>";
								html+= "<th>혈액형</th>";
								html+= "<th>선택</th>";
							html+= "</tr>";
						html+= "</thead>";
						html+= "<tbody id='tb'></tbody>";
					html+= "</table>";
			html+="</div>";
			
		html+= "</div>";
		
		makePopup("환자 검색", html);
		
		html="";
	});
})//ready end

</script>

<title>reception</title>
</head>
<body>
<div class="rep_main">
	<div class="rep_petient">
		<div class="rep_petititle">
			현재 병원 일정
		</div>
		<div class="rep_petiopt">
			<input type="checkbox" name="Wating_patient" value="1">대기 환자만 조회
		</div>
		<div class="rep_petitable">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>환자번호</th>
					<th>예약시간</th>
					<th>접수시간</th>
					<th>환자명</th>
					<th>진료과</th>
					<th>진료의사</th>
					<th>구분</th>
					<th>접수일</th>
					<th>진료상태</th>
					<th>비고</th>
				</tr>
			</table>
		</div>
		<div class="rep_petipage">1 2 3 4 5</div>
	</div>
	<div class="rep_info">
		<div class="rep_title">접수 기록</div>
		<div class="reception">
			<div class="rep_petiinfo">
				<div class="rep_petiinfo_def">
					<div class="rep_petititleblock">
						환자 정보
						<input type="button" id="serach_btn" value="검색">
					</div>
					<div class="rep_peticontentblock">
						<hr>
						<table>
							<tr>
								<td>
									환자 번호
								</td>
								<td>
									<input type="text" disabled="disabled" >
								</td>
							</tr>
							<tr>
								<td>
									이름
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									생년월일
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
						</table>
					</div>
					<div class="rep_peticontentblock">
					<hr>
						<table>
							<tr>
								<td>
									연락처 1
								</td>
								<td>
									<input type="text" size="3" maxlength="3" disabled="disabled">-<input type="text" size="3" maxlength="4" disabled="disabled">-<input type="text" size="3" maxlength="4" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									연락처 2
								</td>
								<td>
									<input type="text" size="3" maxlength="3" disabled="disabled">-<input type="text" size="3" maxlength="4" disabled="disabled">-<input type="text" size="3" maxlength="4" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									주소
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
						</table>
						<br/>
					</div>
				</div>
				<div class="rep_petiinfo_more">
					<div class="rep_petititleblock">
						추가정보
					</div>
					<div class="rep_peticontentblock">
					<hr>
						<table>
							<tr>
								<td>
									키
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									몸무게
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									장애
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									결혼
								</td>
								<td>
									<input type="radio" name="marry" disabled="disabled">미혼
									<input type="radio" name="marry" disabled="disabled">기혼
									<input type="radio" name="marry" disabled="disabled">재혼
								</td>
							</tr>
						</table>
					</div>
					<div class="rep_peticontentblock">
					<hr>
						<table>
							<tr>
								<td>
									혈액형
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									시력
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									지병
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									흡연
								</td>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="rep_repdata">
				<div class="rep_sort">
					<div class="rep_boxtitle">
						접수 종류
					</div>
					<div class="rep_boxcontent">
						<hr>
						<table>
							<tr>
								<td>
									<input type="radio" name="rep_radio" disabled="disabled"> 예약 접수
								</td>
							</tr>
							<tr>
								<td>
									<input type="radio" name="rep_radio" disabled="disabled"> 일반 접수
								</td>
							</tr>
						</table>
						<br/>
						<hr>
						구분
						<br/>
						<SELECT NAME=sltSample SIZE=1 disabled="disabled">
					        <OPTION VALUE=0 SELECTED>외래</OPTION>
					        <OPTION VALUE=1>내원</OPTION>
					        <OPTION VALUE=2>병동</OPTION>
					        <OPTION VALUE=3>응급</OPTION>
					        <OPTION VALUE=4>재진</OPTION>
					    </SELECT>

					</div>
					<div class="rep_boxbtn">
						<input type="button" value="선택완료" disabled="disabled">
					</div>
				</div>
				<div class="rep_block"></div>
				<div class="rep_date">
					<div class="rep_boxtitle">
						일정 선택
					</div>
					<div class="rep_boxcontent">
						<hr>
						날짜 선택
						<input type="text" disabled="disabled">
						<br/>
						시간 선택
						<input type="text" disabled="disabled">
					</div>
					<div class="rep_boxbtn">
						<input type="button" value="금일" disabled="disabled">
						<input type="button" value="선택완료" disabled="disabled">
					</div>
				</div>
				<div class="rep_block"></div>
				<div class="rep_repinfo">
					<div class="rep_boxtitle">
						진료정보
					</div>
					<div class="rep_boxcontent">
						<hr>
						<table>
							<tr>
								<td>
									진료과목
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									담당의
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" disabled="disabled">
								</td>
							</tr>
						</table>
						<br/>
					</div>
					<div class="rep_boxbtn">
						<input type="button" value="선택완료" disabled="disabled">
					</div>
				</div>
				<div class="rep_block"></div>
				<div class="rep_more">
					<div class="rep_boxtitle">
						추가정보
					</div>
					<div class="rep_boxcontent">
						<hr>
						<TEXTAREA name=etcdata cols=25 rows=13 style="height: 100%; width: 90%;" disabled="disabled"></TEXTAREA>
					</div>
					<div class="rep_boxbtn"></div>
				</div>
			</div>
			<div class="rep_buttons">
				<hr>
				<input type="button" value="다시쓰기">
				<input type="button" value="완료" disabled="disabled">
			</div>
		</div>
	</div>
</div>
</body>
</html>