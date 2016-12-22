/* 2016-11-23 이관우 개발
		12-06 id로 받은 css 클래스추가
		   13  개발완료 */

//환자등록

function filter(obj){ //연락처 필터링
	if(obj.val().length == 11){
		return true;
	}else{
		alert("연락처를 확인해 주세요.");
		return false;
	}
}

$(document).ready(function(){
	$("#sign_Btn").on("click", function(){ //등록 버튼
		
		var a = filter($("#pho_num"));
		if($("#pho_num2").val().length > 0){
		var b = filter($("#pho_num2"));
		}
		
		var paprika = $("#img_insertForm").serialize();
		console.log(paprika);
		$.ajax({
			type : "post",
			url : "patient_insert",
			dataType : "json",
			data : paprika,
			success : function(result) {
				if(result.pm_insert == "true") {
					var aaa = {tab:"Patient_page*환자조회*Patient_page"}
					var ddd = {tab:"Sign_up"}
					Close_Tab(ddd);
					ReOpen_Tab(aaa);
					//location.href = "Patient_page";
				} else {
					alert("저장 중 문제가 발생했습니다.");
				}
			},
			error : function(result) {
				alert("Error - Patient_sign_up_7040");
			}
		});
	});
	
	$("#img_Btn").on("change", function(){ //이미지 버튼
		
		var insertForm = $("#img_insertForm");
		
		insertForm.ajaxForm(Upload_Result_CallBack); //바꿀때 마다 ajaxForm을 타고 저장
		console.log(Upload_Result_CallBack);
		insertForm.submit();
	});
	
	$("#bback_Btn").on("click", function(){ //이전 버튼
		//location.href = "Patient_page";
		Close_Tab(this);
	});
	
	$("#address_Btn").on("click", function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                $("#add_ress").val(fullAddr);
	        }
	    }).open();
	});
});

function Upload_Result_CallBack(data, result) {
	console.log(result);
	if(result == "success"){
		var result_Data = eval("(" + removePre(data) + ")");
		console.log(result_Data);
		$("#textFile").val(result_Data.fileName[0]);
		console.log(result_Data.fileName[0]);
		
		var img_box = ""; //환자등록 이미지
		
		img_box += "<div class='Sign_img'>";
			img_box += "<img alt='" + result_Data.fileName[0] + "' src='resources/upload/" + result_Data.fileName[0] + "' style='width: 100%; height: 100%;'/>";
		img_box += "</div>";
		
		setTimeout(function(){ //이미지가 몇초 뒤에 나타날 것인가
			$("#img_leftTop").html(img_box);
		}, 5000); //5초뒤
		
	} else {
		alert("저장실패");
	}
}

function removePre(data) {
	if(data.indexOf("<pre>") > -1) {
		var st = data.indexOf(">");
		var ed = data.indexOf("<", st);
		
		return data.substring(st + 1, ed);
	} else {
		return data;
	}
}