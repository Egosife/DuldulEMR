<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main/reception.css" /> <!-- 레이아웃 -->
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" type="text/css" href="resources/css/calendar/calendar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/calendar.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script> <!-- J쿼리 -->
<script type="text/javascript" src="resources/script/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script type="text/javascript" src="resources/script/treatment/treatment.js"></script>
<script type="text/javascript" src="resources/script/calendar/calendar.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	showCalendar(d.getFullYear(),(d.getMonth() + 1));
});
</script>

<!-- calendar select script -->
<script type="text/javascript">
$(document).ready(function() {
	$.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		showOn: 'button',
		closeText: '닫기',
		buttonImage: 'resources/images/calender.png',
		buttonImageOnly: true,
		dateFormat: 'yy/mm/dd'    
	}); 
	
	$("#date_start").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
			var startDate = parseInt($("#date_end").val().replace("-", '').replace("-", ''));
			var endDate = parseInt(dateText.replace(/-/g,''));
			
            if (endDate > startDate) {
            	alert("조회 기간은 과거로 설정하세요.");
            	//달력에 종료 날짜 넣어주기
        		$("#date_start").val($("#stdt").val());
			} else {
				$("#stdt").val($("#date_start").val());
			}
		}
	});
});
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
									<input type="text" id="recinput_pati_num" disabled="disabled" >
								</td>
							</tr>
							<tr>
								<td>
									이름
								</td>
								<td>
									<input type="text" id="recinput_pati_name" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									생년월일
								</td>
								<td>
									<input type="text" id="recinput_pati_birth" disabled="disabled">
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
									<input type="text" size="3" maxlength="3" id="recinput_pati_phone11" disabled="disabled">-<input type="text" size="3" maxlength="4" id="recinput_pati_phone12" disabled="disabled">-<input type="text" size="3" maxlength="4" id="recinput_pati_phone13" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									연락처 2
								</td>
								<td>
									<input type="text" size="3" maxlength="3" id="recinput_pati_phone21" disabled="disabled">-<input type="text" size="3" maxlength="4" id="recinput_pati_phone22" disabled="disabled">-<input type="text" size="3" maxlength="4" id="recinput_pati_phone23" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									주소
								</td>
								<td>
									<input type="text" id="recinput_pati_address" disabled="disabled">
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
									<input type="text" id="recinput_pati_hei" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									몸무게
								</td>
								<td>
									<input type="text" id="recinput_pati_wei" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									장애
								</td>
								<td>
									<input type="text" id="recinput_pati_handi" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									결혼
								</td>
								<td>
									<input type="radio" name="marry" id="recinput_pati_mar_0" disabled="disabled">미혼
									<input type="radio" name="marry" id="recinput_pati_mar_1" disabled="disabled">기혼
									<input type="radio" name="marry" id="recinput_pati_mar_2" disabled="disabled">재혼
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
									<input type="text" id="recinput_pati_blood" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									시력
								</td>
								<td>
									<input type="text" id="recinput_pati_eye" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									지병
								</td>
								<td>
									<input type="text" id="recinput_pati_dise" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									흡연
								</td>
								<td>
									<input type="text" id="recinput_pati_smo" disabled="disabled">
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
<!-- 접수 종류 -->
<form action="#" id="treat_form_s" methos="post">
<input type="hidden" name="hos_code" value="${sHospital_Code}">
<input type="hidden" name="emp_num" value="${sEmp_Num}">
<input type="hidden" id="pati_num" name="pati_num" value="">
</form>
<form action="#" id="treat_form" method="post">
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
									<input type="radio" class="rep_date_content1" name="rep_radio" value="0" checked="checked" disabled="disabled"> 일반 접수
								</td>
							</tr>
							<tr>
								<td>
									<input type="radio" class="rep_date_content1" name="rep_radio" value="1" disabled="disabled"> 예약 접수
								</td>
							</tr>
						</table>
						<br/>
						<hr>
						구분
						<br/>
						<select name="treat_type" size="1" class="rep_date_content1" disabled="disabled">
					        <option value=0 selected>외래</option>
					        <option value=1>내원</option>
					        <option value=2>병동</option>
					        <option value=3>응급</option>
					        <option value=4>재진</option>
					        <option value=5>여기 DB로 불러와라!</option>
					    </select>

					</div>
					<div class="rep_boxbtn">
						<input type="button" value="선택완료" class="rep_date_content1" id="rep_date_content1_btn" disabled="disabled">
					</div>
				</div>
<!-- 일정선택 -->
				<div class="rep_block"></div>
				<div class="rep_date">
					<div class="rep_boxtitle">
						일정 선택
					</div>
					<div class="rep_boxcontent">
						<hr>
						날짜 선택
						<input type="text" class="rep_date_content2" id="date_start" name="treat_date">
						<br/>
						시간 선택
						<input type="text" class="rep_date_content2" name="trest_time">
					</div>
					<div class="rep_boxbtn">
						<input type="button" value="금일" class="rep_date_content2" disabled="disabled">
						<input type="button" value="선택완료" class="rep_date_content2" id="rep_date_content2_btn" disabled="disabled">
					</div>
				</div>
<!-- 진료정보 -->
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
									<input type="text" class="rep_date_content3" name="treatsort_type" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td>
									담당의
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" class="rep_date_content3" name="doctor_name" disabled="disabled">
								</td>
							</tr>
						</table>
						<br/>
					</div>
					<div class="rep_boxbtn">
						<input type="button" value="선택완료" class="rep_date_content3" id="rep_date_content3_btn" disabled="disabled">
					</div>
				</div>
<!-- 추가정보 -->
				<div class="rep_block"></div>
				<div class="rep_more">
					<div class="rep_boxtitle">
						추가정보
					</div>
					<div class="rep_boxcontent">
						<hr>
						<TEXTAREA name="etcdata" cols=25 rows=13 class="rep_date_content4" style="height: 100%; width: 90%;" disabled="disabled"></TEXTAREA>
					</div>
					<div class="rep_boxbtn"></div>
				</div>
			</div>
			<div class="rep_buttons">
				<hr>
				<input type="button" value="다시쓰기">
				<input type="button" value="완료" class="rep_date_content4" id="treatment_commit" disabled="disabled">
			</div>
</form>
		</div>
	</div>
</div>
</body>
</html>