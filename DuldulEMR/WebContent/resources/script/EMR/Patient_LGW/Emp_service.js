/* 2016-12-20 이관우 개발
			  div, 회원정보수정
		12-21  개발완료 
			    비밀번호 변경 */

$(document).ready(function(){
	var power = "${sEmp_Num}";
	Emp_Service_Data(power);
	
	$("body").on("click",".Es_btn_ok",function(){
		Emp_Password();
	})
	
	$("#EMPchange_Btn").on("click",function(){
		if($("#EMPchange_Btn").val() == "완료"){
			var Fire = $("#update_Form").serialize();
			
			$.ajax({
				type : "post",
				url : "update_Service",
				dataType : "json",
				data : Fire,
				success : function(result) {
					if(result.res > 0){
						$("#EMPchange_Btn").attr("value","수정");
						alert("수정했습니다.")
						
						$("#Phone").attr("readonly", "readonly");
						$("#Email").attr("readonly", "readonly");
						$("#Address").attr("readonly", "readonly");
						
						var newTab = {tab:"Service_page*회원옵션*Service_page"}
						ReOpen_Tab(newTab);
						
					}else{
						alert("수정 중 문제가 발생했습니다.")
					}
		         },
		         error : function(result) {
		          	alert("Error - Emp_service_7040");
		         }
			});
		}else{
			$("#EMPchange_Btn").attr("value","완료");
			$("#Phone").removeAttr("readonly");
			$("#Email").removeAttr("readonly");
			$("#Address").removeAttr("readonly");
			alert("연락처, 주소, E-mail 수정이 가능합니다.");
		}
	});
	
	$("#EMPpassword_Btn").on("click",function(){
		var html = "";
		
		html += "<form action='#' id='Password_update_Form' method='post' style='display: inline-block; width: 100%; height: 100%;'>";
			html += "<input type='hidden' name='Hospital_Code' value='" + $("#Hospi_Code").val() + "'>";
			html += "<table class='Es_popup_table'>";
				html += "<tr>";
					html += "<td class='Es_pop_td'>";
						html += "아이디";
					html += "</td>";
					html += "<td class='Es_pop_td'>";
						html += "<input class='Es_pop_text' type='text' id='Emp_Num' name='Emp_Num' readonly='readonly' value='" + $("#sEmp_Num").val() + "'>";
					html += "</td>";
				html += "</tr>";
				html += "<tr>";
					html += "<td class='Es_pop_td'>";
						html += "현재 비밀번호";
					html += "</td>";
					html += "<td class='Es_pop_td'>";
						html += "<input class='Es_pop_text' type='password' id='Emp_Password' name='Emp_Password'>";
					html += "</td>";
				html += "</tr>";
				html += "<tr>";
					html += "<td class='Es_pop_td'>";
						html += "새 비밀번호";
					html += "</td>";
					html += "<td class='Es_pop_td'>";
						html += "<input class='Es_pop_text' type='password' id='Emp_New_Password' name='Emp_New_Password'>";
					html += "</td>";
				html += "</tr>";
				html += "<tr>";
					html += "<td class='Es_pop_td'>";
						html += "새 비밀번호 확인";
					html += "</td>";
					html += "<td class='Es_pop_td'>";
						html += "<input class='Es_pop_text' type='password' id='Emp_New_Password_check' name='Emp_New_Password_check'>";
					html += "</td>";
				html += "</tr>";
			html += "</table>";
		html += "</form>";
		
		Es_makePopup2("비밀번호 변경", html);
	});
});

function Emp_Service_Data(power){
	var paring = $("#act_Es").serialize();
	
	$.ajax({ //회원정보를 불러옴
		type : "post",
		url : "Service_data",
		dataType : "json",
		data : paring,
		success : function(restart) {
			$("#Phone").attr('value', restart.Es_info.PHONE); /* 연락처 */
			$("#Lv_Code").attr('value', restart.Es_info.LV_CODE); /* 회원등급 */
			$("#Position_Code").attr('value', restart.Es_info.POSITION_CODE); /* 직책 */
			$("#Office_Code").attr('value', restart.Es_info.OFFICE_CODE); /* 진료과 */
			$("#Birth").attr('value', restart.Es_info.BIRTH); /* 생년월일 */
			$("#Email").attr('value', restart.Es_info.EMAIL); /* E-mail */
			$("#Address").attr('value', restart.Es_info.ADDRESS); /* 주소 */
		},
		error : function(restart) {
			alert("Error - Emp_service_7041");
		}
	});
};

function Emp_Password(){ //비밀번호 변경(ajax)
	var Mambo = $("#Password_update_Form").serialize();
	
	if($("#Emp_Password").val() == ""){
		alert("현재 비밀번호를 입력해주세요.");
	}else if($("#Emp_New_Password").val() == ""){
			alert("새 비밀번호를 입력해주세요.");
		}else if($("#Emp_New_Password_check").val() == ""){
				alert("새 비밀번호 확인을 입력해주세요.");
			}else{
				
			$.ajax({
				type : "post",
				url : "Emp_Password_Service",
				dataType : "json",
				data : Mambo,
				success : function(result) {
					switch (result.res) {
					case 1:
						alert("변경 했습니다.");
						Es_closePopup2();
						break;
					case "2":
						alert("새 비밀번호를 확인이 틀림니다.");
						break;
					case "3":
						alert("현재 비밀번호가 틀림니다.");
						break;
					}				
				},
				error : function(result) {
					alert("Error - Emp_service_7042");//비밀번호를 변경할 때 문제가 생길 시 출력되는 에러,Emp_service.js,Emp_Password(),해결방법 = 재 로그인을 해본다, 페이지를 닫았다가 다시 열어본다, 인터넷 브라우저의 사용기록을 지워본다, 서버를 재가동 해본다, 이래도 안되ㅕㄴ 문의전화
				}
			});//ajax
		}//if
	}//end