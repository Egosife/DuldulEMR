/**
 * 161202 이동건 - 진료 소스 생성
 */
//진료 접수 정보 저장용 변수
var treat_data = ["","","","",""];

$(document).ready(function(){
	SetTreatType();
	Settreatsort_type();
	
	$("body").on("click","[name='pati-selectBtn']",function(){
		var pati_num = $(this).attr("id").split('_');
//		console.log($(this).attr("id"));
//		console.log(ids);
		var params = "patinum="+pati_num[1];
		$.ajax({
			type : "post",
			url : "treat_patientselect",
			dataType : "json",
			data : params,
			success : function(result){
				$("#recinput_pati_num").attr('value',result.pati_info.PATIENT_NUM);
				$("#recinput_pati_name").attr('value',result.pati_info.PATIENT_NAME);
				$("#recinput_pati_birth").attr('value',result.pati_info.BIRTH);
				$("#recinput_pati_phone11").attr('value',result.pati_info.PHONE11);
				$("#recinput_pati_phone12").attr('value',result.pati_info.PHONE12);
				$("#recinput_pati_phone13").attr('value',result.pati_info.PHONE13);
				$("#recinput_pati_phone21").attr('value',result.pati_info.PHONE21);
				$("#recinput_pati_phone22").attr('value',result.pati_info.PHONE22);
				$("#recinput_pati_phone23").attr('value',result.pati_info.PHONE23);
				$("#recinput_pati_address").attr('value',result.pati_info.ADDRESS);
				$("#recinput_pati_hei").attr('value',result.pati_info.HEI);
				$("#recinput_pati_wei").attr('value',result.pati_info.WEI);
				$("#recinput_pati_handi").attr('value',result.pati_info.HANDICAP);
				$("#recinput_pati_mar_"+result.pati_info.MARRI).attr('CHECKED','CHECKED');
				$("#recinput_pati_blood").attr('value',result.pati_info.BLOOD);
				$("#recinput_pati_eye").attr('value',result.pati_info.EYE);
				$("#recinput_pati_dise").attr('value',result.pati_info.DISEASE);
				$("#recinput_pati_smo").attr('value',result.pati_info.SMORK);
				$("#pati_num").attr('value',result.pati_info.PATIENT_NUM);
				$(".rep_date_content1").attr('disabled',false)
				closePopup();
				
			},
			error : function(result){
				alert("ERROR - Patient_select");
			}
		})// ajax end

	})
	
	//팝업창 환자 검색 버튼
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
				if(result.serach.length > 0){
					$("#serachresult").html(result.serach.length+" 건이 검색되었습니다.")
				}else{
					$("#serachresult").html("검색 결과가 없습니다.")
				}
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
						html+= "<td id='serachresult'>환자번호 또는 환자명을 입력해주세요.</td>";
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
	
	$("#rep_date_content1_btn").on("click",function(){
		treat_data[1] = $("#treat_form").serialize();
		//console.log(treat_data);
		
		//console.log($("input[name='rep_radio']:checked").val());
		
		if($("input[name='rep_radio']:checked").val() == 0){
			var date = new Date();
			var minutes = "";
			//분 필터링
			if(date.getMinutes() < 10){
				Minutes = "0"+date.getMinutes();
			}else{
				Minutes = date.getMinutes();
			}
			var nowdate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
			var nowhours = date.getHours()
			var nowmin = Minutes;
			
			var html ="";
			html += "<input type='text' class='rep_date_content2' id='select_hour' name='select_hour' readonly='readonly' style='width: 25%;' disabled='disabled'>";
			html += "<input type='text' class='rep_date_content2' id='select_min' name='select_min' readonly='readonly' style='width: 25%;' disabled='disabled'>";
			$("#rep_time_td").html(html);
			html="";
			
			$("#date_start").attr('value',nowdate);
			$("#select_hour").attr('value',nowhours);
			$("#select_min").attr('value',nowmin);
			
			
			
			treat_data[2] = $("#treat_form").serialize();
			$(".rep_date_content1").attr('disabled',true);
			$(".rep_date_content3").attr('disabled',false);
		}else{
			$(".rep_date_content1").attr('disabled',true);
			$(".rep_date_content2").attr('disabled',false);
			Date_Select_Start();
			SetTimeSelecter();
		}
		
	})
	$("#rep_date_content2_btn").on("click",function(){
		treat_data[2] = $("#treat_form").serialize();
		//console.log(treat_data);
		$("#date_start").attr('id','date_start_off');
		$(".rep_date_content2").attr('disabled',true);
		$(".rep_date_content3").attr('disabled',false);
	})
	$("#rep_date_content3_btn").on("click",function(){
		
		if($("#doctor_name").val() == null){
			alert("담당의를 선택하셔야 합니다.");
		}else{
			treat_data[3] = $("#treat_form").serialize();
			//console.log(treat_data);
			$(".rep_date_content3").attr('disabled',true);
			$(".rep_date_content4").attr('disabled',false);
		}
		
		
	})
	$("#treatment_commit").on("click",function(){
		treat_data[0] = $("#treat_form_s").serialize();
		treat_data[4] = $("#treat_form").serialize();

		var params = "";
		for(var i = 0 ; i < treat_data.length ; i++){
			if(i < treat_data.length - 1){
				params += treat_data[i]+"&";
			}else{
				params += treat_data[i];
			}
		}
		//console.log(treat_data);
		//console.log(params);
		
		$.ajax({
			type : "post",
			url : "Treatment_commit",
			dataType : "json",
			data : params,
			success : function(result){
				alert(result.res)
			},
			error : function(result){
				alert("ERROR - Treatment");
			}
		})// ajax end
		
	})
	
})//ready end
