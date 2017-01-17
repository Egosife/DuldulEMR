/* 2016-11-24 이관우  개발  
		12-05 ajax 추가 
		   07 ajax 수정 
		   08 ajax 추가
		   13  개발완료 */

//환자 상세조회

$(document).ready(function(){
	var papajohns = "${papajohns.pizza}";
	patient_Details_list(papajohns);
	
	$("body").on("click", "[name='data']", function(){ //진단기록 표를 눌렀을시
		$("#Dpt").attr('value', $(this).attr('value'));
		//console.log($("#sss").attr('value'));
		patient_Details_list2();
	});
	
	$("#b_back_Btn").on("click", function(){ //이전 버튼
		//location.href = "Patient_page";
		var tab = {tab:"Patient_page*환자조회*Patient_page"};
		
		Close_Tab(this);
		ReOpen_Tab(tab);
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
			$("#pat_num").attr('value', result.Det_info.PAT_NUM); /* 환자번호 */
			$("#pat_name1").attr('value', result.Det_info.PATIENT_NAME); /* 이름 */
			$("#pat_sex").attr('value', result.Det_info.SEX_CODE); /* 성별 */
			$("#pat_address").attr('value', result.Det_info.ADDRESS); /* 주소 */
			$("#pat_phone1").attr('value', result.Det_info.PHONE1); /* 연락처1 */
			$("#pat_phone2").attr('value', result.Det_info.PHONE2); /* 연락처2 */
			$("#pat_blood").attr('value', result.Det_info.BLOOD); /* 혈액형 */
			$("#pat_wei").attr('value', result.Det_info.WEI); /* 몸무게 */
			$("#pat_hei").attr('value', result.Det_info.HEI); /* 신장 */
			$("#pat_handicap").attr('value', result.Det_info.HANDICAP); /* 장애여부 */
			if(result.Det_info.PHOTO == null){
				$("#Pat_imgbox").attr('src', "resources/upload/sample.gif"); /* 이미지 */
				$("#Pat_imgbox").attr('alt', "NoImage"); /* 이미지 */
			}else{
				$("#Pat_imgbox").attr('src', "resources/upload/" + result.Det_info.PHOTO); /* 이미지 */
				$("#Pat_imgbox").attr('alt', result.Det_info.PHOTO); /* 이미지 */
			}
			
			var DL = "";
			
			for(var i = 0; i < result.list.length; i++) {
				DL += "<tr class='Det_table_tr' name='data' value='" + result.list[i].TREAT_NUM + "'>";
				DL += "<td>" + result.list[i].NO + "</td>"; /* 번호 */
				DL += "<td>" + result.list[i].SYM + "</td>"; /* 증상 */
				DL += "<td>" + result.list[i].SPECIAL_NOTE + "</td>"; /* 특이사항 */
				DL += "<td>" + result.list[i].DIAGNOSIS + "</td>"; /* 진단명 */
				DL += "<td>" + result.list[i].EMP_NUM2 + "</td>"; /* 담당의 */
				DL += "<td style='text-align: left;'>" + result.list[i].OPINION + "</td>"; /* 의사소견 */
				DL += "<td>" + result.list[i].POSTING_DATE + "</td>"; /* 작성일 */
				DL += "</tr>";
			}
			$("#D").html(DL);
		},
		error : function(result){
			alert("Error - Patient_details_7040");
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
			alert("Error - Patient_details_7041");
		}
	});
};