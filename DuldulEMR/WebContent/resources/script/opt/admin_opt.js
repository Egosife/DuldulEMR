$(document).ready(function(){
	adminopt_Show_hospital_info(false,"admin_opt_hospital_tb","admin_opt_tabletr");
	Adminopt_Position_Select();
	Adminopt_Office_Select();
	Adminopt_level_Select();
	//병원 생성
	$("#admin_opt_creathos").on("click",function(){
		$("#admin_cre_phone").val($("#cre_phone1").val()+$("#cre_phone2").val()+$("#cre_phone3").val());
		var params = $("#adminopt_hos_register").serialize();
		if($("#cre_hodname").val() == ""){
			alert("병원이름을 입력해야 합니다.");
		}else{
			if($("#admin_insert_addr_text").val() == ""){
				alert("주소를 입력해야 합니다.");
			}else{
				if($("#cre_phone1").val().length == 3 
				&& $("#cre_phone2").val().length == 4
				&& $("#cre_phone3").val().length == 4){
					
					$.ajax({
						type: "post",
						url: "admin_opt_crehosin",
						dataType: "json",
						data: params,
						success: function(result){
							alert("등록되었습니다.");
							var tab = {tab :"adminopt*관리자옵션*adminopt"};
							var tab2 = {tab : "adminopt"};
							Close_Tab(tab2);
							ReOpen_Tab(tab);
						},error: function(result){
							alert("Error - admin_opt_crehosin_9911");
						}
					})//ajax
					
				}else{
					alert("전화번호를 정확히 입력해 주세요.");
				}
				
			}
		}
		
	});
////////////////////////////////테스트
	//다시쓰기
	$("#RegiAccCrear").on("click",function(){
		RegiAccCrear();
	});
	
	//병원 정보 수정 버튼 클릭
	$("#admin_opt_updhos").on("click",function(){
		
		if($("#admin_opt_hoscod_updname").val() == ""){
			alert("편집할 병원을 선택해 주세요.");
		}else{
			if($("#admin_opt_hos_updname").val() == ""){
				alert("병원 이름을 입력해야 합니다.");
			}else{
				$("#admin_upd_phone").val($("#upd_phone1").val()+$("#upd_phone2").val()+$("#upd_phone3").val());
				var params = $("#adminopt_hos_update").serialize();
				$.ajax({
					type: "post",
					url: "admin_opt_updhosinfo",
					dataType: "json",
					data: params,
					success: function(result){
						if(result.rs == 1){
							alert("정상적으로 수정 되었습니다.");
							var tab = {tab :"adminopt*관리자옵션*adminopt"};
							var tab2 = {tab : "adminopt"};
							Close_Tab(tab2);
							ReOpen_Tab(tab);
						}else{
							alert("수정 중 문제가 일어났습니다.");
						}
						//Close_Tab();
						//ReOpen_Tab();
					},error: function(result){
						alert("Error - admin_opt_hoscod_updname_1199")
					}
				}); //ajax
				
			}
		}
	});
	
	//병원 검색 - 편집 - 검색버튼
	//$("body").on("click","#updasarch_btn",function(){
	//	$("#admin_search_hos_hidden").val($("#searchText").val());
	//	adminopt_Show_hospital_info(false,"tbhos","admin_opt_tabletr");
	//});
	
	//병원 계정 등록 - 병원 검색
	$("body").on("click","#accregi_hosbtn",function(){
		$("#admin_search_hos_hidden").val($("#searchText").val());
		adminopt_Show_hospital_info(false,"tbhos","admin_opt_tabletrd");
	});
	
	//병원 편집 병원 선택
	$("body").on("click",".admin_opt_tabletrd",function(){
		
		var params = "onclickinfo="+$(this).attr("name");
		
		$.ajax({
			type: "post",
			url : "adminopt_updinfo",
			dataType: "json",
			data: params,
			success: function(result){
				$("#regiacchostext").val(result.obj.HOSPITAL_NAME+"("+result.obj.HOSPITAL_CODE+")");
				$("#admin_searchresult_hos").val(result.obj.HOSPITAL_CODE);
				closePopup();
			},error: function(result){
				alert("Error - adminoptregi_error_6574")
			}
		});//ajax
	});
	
	$("#admin_opt_hoscod_updname").on("click",function(){
		$("#alerthoscode").css("display", "block");
	});
	
	//병원 검색 - 편집
	//$("#admin_opt_updasarch").on("click",function(){
	//	Admin_Create_Popup("updasarch_btn");
	//});
	
	//병원 검색 - 상단
	$("#admin_search_hosbtn").on("click",function(){
		$("#admin_search_hos_hidden").val($("#admin_search_hos").val());
		adminopt_Show_hospital_info(true,"admin_opt_hospital_tb","admin_opt_tabletr");
	});
	
	//주소검색 클릭
	$("#amdin_update_addr_search").on("click",function(){
		daum_search_addr("admin_opt_upd_addr");
	})
	$("#amdin_insert_addr_search").on("click",function(){
		daum_search_addr("admin_insert_addr_text");
	});
	
	//병원 정보 클릭
	$("#admin_opt_hospital_tb").on("click",".admin_opt_tabletr",function(){
		$("#admin_opt_hosclick").val($(this).attr('name'));
		
		var params = $("#admin_opt_hosclick").serialize();
		
		$.ajax({
			type: "post",
			url: "adminopt_Show_emp_info",
			dataType: "json",
			data: params,
			success: function(result){
				var html = "";
				for(var i = 0 ; i < result.list.length; i++){
					html += "<tr class='admin_opt_tabletr' name='"+result.list[i].EMP_NUM+"'>";
						html += "<td>"+result.list[i].LV+"</td>";
						html += "<td>"+result.list[i].EMP_NUM+"</td>";
						html += "<td>"+result.list[i].EMP_NAME+"</td>";
						html += "<td>"+result.list[i].PHONE+"</td>";
						html += "<td>"+result.list[i].EMAIL+"</td>";
						html += "<td>"+result.list[i].POSITION+"</td>";
						html += "<td>"+result.list[i].OFFICE+"</td>";
						html += "<td>"+result.list[i].SEX+"</td>";
						html += "<td>"+result.list[i].ACTI+"</td>";
					html += "</tr>";
				}
				$("#admin_opt_emp_tb").html(html);
			},error: function(result){
				alert("Error - adminopt_Show_emp_info_1121");
			}
		});//ajax
	});
	
	//계정등록 병원등록
	$("#admin_acc_serachhos").on("click",function(){
		Admin_Create_Popup("accregi_hosbtn");
	});
	
	//병원 편집 병원 선택
	$("body").on("click",".admin_opt_tabletr",function(){
		
		var params = "onclickinfo="+$(this).attr("name");
		
		$.ajax({
			type: "post",
			url : "adminopt_updinfo",
			dataType: "json",
			data: params,
			success: function(result){
				$("#admin_opt_hoscod_updname").val(result.obj.HOSPITAL_CODE);
				$("#admin_opt_hos_updname").val(result.obj.HOSPITAL_NAME);
				$("#admin_opt_upd_addr").val(result.obj.HOSPITAL_ADDRESS);
				$("#upd_phone1").val(result.obj.P1);
				$("#upd_phone2").val(result.obj.P2);
				$("#upd_phone3").val(result.obj.P3);
				closePopup();
			},error: function(result){
				alert("Error - adminopt_error_6574")
			}
		});//ajax
		
	});
	
});

function Admin_Create_Popup(id){
	var html = "";
	html+= "<div class='pop_div_main'>";
	html+= "<div class='pop_div_top'>";
	html+= "<form action='#' id='pop_action' method='post'>";
	html+="<table><tr>";
	html+= "<td><input type='text' name='pop_serachText' style='width: 100%; height: 100%;' id='searchText'></td>";
	html+= "<td><input type='button' id='"+id+"' value='검색'><td>";
	html+= "<td id='serachresult'>병원정보를 입력하여 검색 할 수 있습니다.</td>";
	html+="</tr></table>";
	html+= "</form>";
	html+="<hr></div>";
	html+="<div class='pop_div_bot'>";
	html+= "<table class='popup_table' border='1' align='center' width='100%' >";
	html+= "<thead>";
	html+= "<tr>";
	html+= "<th>병원코드</th>";
	html+= "<th>병원이름</th>";
	html+= "<th>연락처</th>";
	html+= "<th>주소</th>";
	html+= "<th>등록일</th>";
	html+= "</tr>";
	html+= "</thead>";
	html+= "<tbody id='tbhos'></tbody>";
	html+= "</table>";
	html+="</div>";
	html+= "</div>";
	makePopup("병원 검색",html);
	html="";
}

function daum_search_addr(id){
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
            $("#"+id).val(fullAddr);
        }
    }).open();
}

//병원 검색
function adminopt_Show_hospital_info(btn,id,cla){
	var params = $("#admin_search_hos_hidden").serialize();
	$.ajax({
		type : "post",
		url : "adminopt_Show_hospital_info",
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length; i++){
				html += "<tr class='"+cla+"' name='"+result.list[i].HOSPITAL_CODE+"'>";
					html += "<td>"+result.list[i].HOSPITAL_CODE+"</td>";
					html += "<td>"+result.list[i].HOSPITAL_NAME+"</td>";
					html += "<td>"+result.list[i].HOSPITAL_PHONE+"</td>";
					html += "<td>"+result.list[i].HOSPITAL_ADDRESS+"</td>";
					html += "<td>"+result.list[i].INPUT_DATE+"</td>";
				html += "</tr>";
			}
			
			$("#"+id).html(html);
			
			if(btn){
				html = result.list.length + "건이 검색 되었습니다."
				$("#admin_hos_searchinfo").html(html);
			}else{
				html = result.list.length + "건이 검색 되었습니다."
				$("#serachresult").html(html);
			}
			
		},error : function(result){
			alert("Error - adminopt_Show_hospital_info_9382");
			//관리자 옵션에서 병원 정보를 못 불러올 때 출력되는 에러다.
		}
	});//ajax end
}

//직책 셀렉터
function Adminopt_Position_Select(){
	$.ajax({
		url:"adminopt_position_select",
		success:function(result){
			var html = "<option value='-1' selected='selected'>선택</option>";
			for(var i = 0 ; i < result.list.length; i++){
				html += "<option value='"+result.list[i].SMALL+"'>"
				html += result.list[i].CODE_NAME
				html += "</option>"
			}
			$("#adm_pos_sel").html(html);
			
		},error:function(result){
			alert("Error - Adminopt_Position_Select_9991")
		}
	});//ajax end
}
//지료과 셀렉터
function Adminopt_Office_Select(){
	$.ajax({
		url:"adminopt_office_select",
		success:function(result){
			var html = "<option value='-1' selected='selected'>선택</option>";
			for(var i = 0 ; i < result.list.length; i++){
				html += "<option value='"+result.list[i].SMALL+"'>"
				html += result.list[i].CODE_NAME
				html += "</option>"
			}
			$("#adm_off_sel").html(html);
			
		},error:function(result){
			alert("Error - Adminopt_Office_Select_9992")
		}
	});//ajax end
}
//등급 셀렉터
function Adminopt_level_Select(){
	$.ajax({
		url:"adminopt_level_select",
		success:function(result){
			var html = "<option value='-1' selected='selected'>선택</option>";
			for(var i = 0 ; i < result.list.length; i++){
				html += "<option value='"+result.list[i].SMALL+"'>"
				html += result.list[i].CODE_NAME
				html += "</option>"
			}
			$("#adm_lev_sel").html(html);
			
		},error:function(result){
			alert("Error - Adminopt_level_Select_9993")
		}
	});//ajax end
}

function RegiAccCrear(){
	$(".admin_opt_creatacc_table input[type='text']").each(function(){
		$(this).val("");
	});
	$(".admin_opt_creatacc_table input[type='password']").each(function(){
		$(this).val("");
	});
}
/*

	$("body").on("click","[name='hos-selectBtn']",function(){
		$("#select_hoscode").val("테스트병원1 (999999)");
		CheckCreateAcc();
		closePopup();
	});
	
	$(".admin_opt_creatacc_table").on("keydown","input",function(){
		CheckCreateAcc();
	});



function CheckCreateAcc() {
	var check = true;
	
	//(".admin_opt_creatacc_table input[type='text']")
	//한놈만 찾는다 => each로 한놈씩 살핌
	$(".admin_opt_creatacc_table input[type='text']").each(function() {
		if($(this).val() == "") {
			check = false;
		}
	});
	$(".admin_opt_creatacc_table input[type='password']").each(function() {
		if($(this).val() == "") {
			check = false;
		}
	});
	
	if(check){
		$("#admin_create_acc_commit").prop("disabled","");
	}else{
		$("#admin_create_acc_commit").prop("disabled","disabled");
	}
	
}
*/