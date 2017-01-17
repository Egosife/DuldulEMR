$(document).ready(function(){
	Man_emplist();
	Man_jinryo_list();
	
	/* 팝업 부분 */
	/* 중복 체크 */
	$("body").on("keyup","#man_popup_jun",function(){
		if($("#man_popup_jun").val().indexOf('0')=="0"){
			alert("맨 앞자리에는 '0'을 입력할 수 없습니다.");
			$("#man_popup_jun").attr("class","man_idcheck");
			$("#man_popup_jun").val("");
		}else{
			if($("#man_popup_jun").val()==""|| isNaN($("#man_popup_jun").val()) || $("#man_popup_jun").val().length < 4){
				$("#man_popup_jun").attr("class","man_class_nob");
			}else{
				var params = $("#man_doctorpop").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "Manager_popup_check",
					dataType : "json",
					data : params,
					success : function(result){
						if(result.res == 0){
							$("#man_popup_jun").attr("class","man_class_yes");
						}else{
							$("#man_popup_jun").attr("class","man_class_nob");
						}
					},
					error : function(result){
						alert("Error - man_popup_003");
					}
				}); //ajax 끝
			}
		}
	}); //function 끝
	//계정 등록 버튼
	$("body").on("click","#jujakBtn",function(){
		var all_check = true;
		
		//필터 걸어주기
		if($("#man_popup_jun").val()=="" && all_check){
			alert("직원 번호를 입력해주세요");
			all_check = false;
		}
		if(($("#man_popup_jun").attr("class") == "man_class_nob" ||
			$("#man_popup_jun").attr("class") == "man_idcheck") && all_check){
			alert("해당 번호는 사용할 수 없습니다.");
			all_check = false;
		}
 		if($("#man_popup_jun").val().length < 4  && all_check){
			alert("최소 4글자 이상이여야 합니다.");
			all_check = false;
		} 
		if(isNaN($("#man_popup_jun").val()) && all_check){
			alert("문자를 입력할 수 없습니다.");
			all_check = false;
		}
		if($("#man_popup_jik").val() == "-1"  && all_check){
			alert("직책을 제대로 선택해주세요.");
			all_check = false;
		}
		if($("#man_popup_lv").val() == "-1" && all_check){
			alert("등급을 제대로 선택해주세요.");
			all_check = false;
		}
		if($("#man_popup_name").val() == "" && all_check){
			alert("성명을 제대로 입력해주세요.");
			all_check = false;
		}
		if($("#man_popup_jinryo").val() == "-1" && all_check){
			alert("진료과를 제대로 선택해주세요.");
			all_check = false;
		}
		if($("#man_popup_pw1").val() == "" && all_check){
			alert("비밀번호를 입력해주세요.")
			all_check = false;
		}
		if($("#man_popup_pw2").val() == "" && all_check){
			alert("비밀번호를 입력해주세요.")
			all_check = false;
		}
		if(($("#man_popup_pw1").val()!=$("#man_popup_pw2").val()) && all_check){
			alert("비밀번호를 확인해 주세요.");
			all_check = false;
		}
		if(($("#man_phone1").val().length == 3 && $("#man_phone2").val().length == 4 && $("#man_phone3").val().length == 4)){
			if((isNaN($("#man_phone1").val()) || isNaN($("#man_phone2").val()) || isNaN($("#man_phone3").val())) && all_check){
				alert("숫자만 입력해주세요.");
				all_check = false;
			}else{
				$("#man_cellphone_num").val($("#man_phone1").val()+""+$("#man_phone2").val()+""+$("#man_phone3").val());
			}
		}else if(all_check){
			alert("연락처를 입력해주세요");
			all_check = false;
		}
		if(($("#man_popup_email").val().indexOf('@') == -1 || $("#man_popup_email").val().indexOf('.') == -1) && all_check){
			alert("이메일 형식이 올바르지 않습니다.");
			all_check = false;
		}
	//계정등록
	if(all_check){
		var params = $("#man_doctorpop").serialize();
		
		$.ajax({
			type : "post",
			url : "man_admin_opt",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					alert("등록되었습니다.");
					var tab = {tab : "manager_opt*매니저옵션*manager_opt"};
					var tab2 = {tab : "manager_opt"};
					
					closePopup();
					Close_Tab(tab2);
					ReOpen_Tab(tab);
				}else{
					alert("등록에 실패했습니다.");
				}
			},
			error : function(result){
				alert("Error - man_opt_0004");
			}
		}); //ajax 끝
		}
	}); //rok_popup 끝
}); //document 끝
	$("#manager_paging").on("click","span",function(){ //페이징을 클릭하면
		$("input[name='page']").val($(this).attr("name"));
		Man_emplist();
	}); //pagingArea end
	
 	  $("#man_update_btn").on("click",function(){
	      
	       if($("#man_update_btn").val() == "수정"){
				Man_jinryo_list2();
	         $("#man_update_btn").val("완료");
	      }else{
	    	  var params = $("#Man_opt_Form").serialize();
		    	  $.ajax({
		    		 type: "post",
		    		 url: "Manopt_sujeong",
		    		 dataType: "json",
		    		 data: params,
		    		 success : function(result){ 
		    			if(result.res>0){
		    				alert("수정되었습니다.");
							var tab = {tab : "manager_opt*매니저옵션*manager_opt"};
							ReOpen_Tab(tab);
		    			}else{
		    			alert("수정을 실패하였습니다.");
		    			}
		    		 },
		    		 error : function(result){
		    			alert("Error - man_opt_0003"); 
		    		 }
		    	 }); //ajax 끝
	      }
	});
		//초기화 버튼을 누를 떄
	$("body").on("click",".man_reset",function(){
	   	 $("#MAN_RESET").val($(this).attr("name"));
 	      if(confirm("특정 상황이 아닌 이상 본인의 동의 없이 비밀번호를 초기화 하지 마십시오.비밀번호를 초기화 하겠습니까?")){
	    	 var params = $("#ManagerForm").serialize();
	    	 
	    	 $.ajax({
	    		 type: "post",
	    		 url: "Man_Reset",
	    		 dataType: "json",
	    		 data: params,
	    		 success : function(result){ 
	    			if(result.res==1){
	         		alert("비밀번호가 0000으로 초기화 됐습니다.");
	    			}else{
	    			alert("초기화가 실패하였습니다.");
	    			}
	    		 },
	    		 error : function(result){
	    			alert("Error - man_opt_0003"); 
	    		 }
	    	 }); //ajax 끝
	      }; 
	   });
	
	   //체크박스를 누를 때
	   $("body").on("change","[name='ACTIVATED']",function(){
		   
		   var params = $("#ManagerForm").serialize();
		   
			params += "&man_use=";
			if($(this).is(":checked")) {
				params += "1";
			} else {
				params += "0";
			}
			params += "&num=" + $(this).parent().parent().attr("name");
			
			$.ajax({
				type : "post",
				url : "Man_sayoung",
				dataType : "json",
				data : params,
				success : function(result){
			      if(result.rs.ACTIVATED == 1){
			         alert("계정이 활성화 되었습니다.");
			      }else{
		            alert("계정이 비활성화 되었습니다.");
			      };
				}
			}); //ajax 끝
	   });
			/* 주소 검색 */
			$("body").on("click","#Manager_address_btn", function(){
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
		                $("#Manager_address_text").val(fullAddr);
			        }
			    }).open();
			}); //Manager_address 끝
	$("#rok_popup").on("click",function(){
		var html = "";
		
		html+="<div class='man_mainpop'>";
			html+="<div class='man_toppop'>";
				html+="<form action='' id='man_doctorpop' method='post'>";
				html+="<input type='hidden' id='man_Hospital_Code' name='HOSPITAL_CODE'>"
				html+="<input type='hidden' id='man_cellphone_num' name='man_cellphone_num'>"
					html+="<table class='man_popup_table' width='100%'>";
							html+="<tr>";
								html+="<td style='font-weight: bold;'> *직원 번호 </td>";
								html+="<td><input type='text' class='man_idcheck' name='man_popup_jun' id='man_popup_jun'></td>";
								html+="<td colspan='2' style='color: red;'>* 는 필수 입력 항목입니다.</td>"
							html+="</tr>";
							html+="<tr>";
								html+="<td style='font-weight: bold;'> *직 책 </td>";
								html+="<td><select id='man_popup_jik' name='man_book'><option value='-1' selected='selected'>선택</option><option value='0'>직책 0</option><option value='1'>직책 1</option><option value='2'>직책 2</option></select></td>";
								html+="<td style='font-weight: bold;'> *등 급 </td>";
								html+="<td><select id='man_popup_lv' name='man_level'><option value='-1' selected='selected'>선택</option><option value='1'>매니저</option><option value='2'>의사</option><option value='3'>간호사</option></select></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td style='font-weight: bold;'> *성 명 </td>";
								html+="<td><input type='text' id='man_popup_name' name='man_name' maxlength='10'></td>";
								html+="<td style='font-weight: bold;'> *진료과 </td>";
								html+="<td><select id='man_popup_jinryo' name='man_jinryo'><option value='-1' selected='selected'>선택</option><option value='0'>진료과 0</option><option value='1'>진료과 1</option><option value='2'>진료과 2</option></select></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td style='font-weight: bold;'> *비밀번호</td>";
								html+="<td><input type='password' name='man_popup_pw' id='man_popup_pw1'></td>";
								html+="<td style='font-weight: bold;'> *비밀번호 확인</td>";
								html+="<td><input type='password' id='man_popup_pw2'></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td style='font-weight: bold;'> *연락처 </td>";
								html+="<td><input type='text' id='man_phone1' name='man_cellphone_num' maxlength='3' class='man_rakchu'>-<input type='text' id='man_phone2' name='man_cellphone_num' maxlength='4' class='man_rakchu'>-<input type='text' id='man_phone3' name='man_cellphone_num' maxlength='4' class='man_rakchu'></td>";
								html+="<td> 생년월일 </td>";
								html+="<td><input type='text'maxlength='8' readonly='readonly' id='man_date'></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> 성 별</td>";
								html+="<td><input type='radio' name='a'>남<input type='radio' name='a'>여</td>";
								html+="<td> 이메일  </td>";
								html+="<td><input type='text' id='man_popup_email' name='man_email'></td>";
							html+="</tr>";
							html+="<tr>";
								html+="<td> 주 소</td>";
								html+="<td colspan='2'><input type='text' id='Manager_address_text' class='man_box' readonly='readonly'><input type='button' id='Manager_address_btn' value='검색' style='height: 21px; vertical-align: top;'></td>";
								html+="<td><input type='button' value='등록' id='jujakBtn' class='man_popup_Btn' style='margin-left: 103px;'></td>";
							html+="</tr>";
					html+="</table>";
				html+="</form>";
			html+="</div>";
		html+="</div>";
				
		makePopup("계정 등록",html);
		$("#man_Hospital_Code").val($("#man_Hospital").val());
		man_birthday();
		html="";
	});

/* 생년월일 */
function man_birthday(){
	$("#man_date").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
}

/* 병원 진료 데이터 가져오기 */
function Man_jinryo_list(){
	var params = $("#ManagerForm").serialize();

	$.ajax({
		type : "post",
		url : "Man_jinryo_list",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr>"; 
				html += "<td>"+result.list[i].OPEN+"</td>";
				html += "<td>"+result.list[i].CLOSE+"</td>"; 
				html += "<td>"+result.list[i].WEEK+"</td>"; 
				if(result.list[i].SAT == '0'){
					html += "<td>휴무</td>";
				}else{
					html += "<td>진료</td>";
				}
				if(result.list[i].SUN == '0'){
					html += "<td>휴무</td>";
				}else{
					html += "<td>진료</td>";
				}
				html += "<td>"+result.list[i].LUNCH+"</td>"; 
				html += "<td>"+result.list[i].RESTIME+"</td>"; 
			}
			$("#manager_opt_tb").html(html); //내용 데이터 가져오기
		}
	});
}
/* 병원 진료 데이터 가져오기 */
function Man_jinryo_list2(){
	var params = $("#ManagerForm").serialize();

	$.ajax({
		type : "post",
		url : "Man_jinryo_list2",
		dataType : "json",
		data : params,
		success : function(result){
			
			var html="";
		
				html += "<tr>"; 
				html += "<td>시: <input type='number' min=0 max=23 value="+result.list.OPEN+" name='open1'> 분: <input type='number' min=0 max=59 value="+result.list.OPEN2+" name='open2'></td>"; //평일 및 주말 진료 시작
				html += "<td>시: <input type='number' min=0 max=23 value="+result.list.CLOSE+" name='close1'>   분: <input type='number' min=0 max=59 value="+result.list.CLOSE2+" name='close2'></td>"; //평일 진료 종료
				html += "<td>시: <input type='number' min=0 max=23 value="+result.list.WEEK+" name='week1'>   분: <input type='number' min=0 max=59 value="+result.list.WEEK2+" name='week2'></td>"; //주말 진료 종료
				if(result.list.SAT == '0'){
					html += "<td><select name='sat'><option value='1'>진료 <option selected='selected' value='0'>휴무 </select></td>";
				}else{
					html += "<td><select name='sat'><option selected='selected' value='1'>진료 <option value='0'>휴무 </select></td>";
				} 
				if(result.list.SUN == '0'){
					html += "<td><select name='sun'><option value='1'>진료 <option selected='selected' value='0'>휴무 </select></td>";
				}else{
					html += "<td><select name='sun'><option selected='selected' value='1'>진료 <option value='0'>휴무 </select></td>";
				}
				html += "<td>시: <input type='number' min=0 max=23 value="+result.list.LUNCH1+" name='lunch1'> 분: <input type='number' min=0 max=59 value="+result.list.LUNCH2+" name='lunch2'> ~ ";
				html += "시: <input type='number' min=0 max=23 value="+result.list.LUNCH3+" name='lunch3'> 분: <input type='number' min=0 max=59 value="+result.list.LUNCH4+" name='lunch4'>	</td>"; //점심 시간
				html += "<td>분: <input type='number' min=0 max=59 value="+result.list.RESTIME+" name='restime1'></td>"; //예약 시간
			$("#manager_opt_tb").append(html); //내용 데이터 가져오기
			
			
		},error : function(result){
			alert("aa");
		}
	});
}
function Man_emplist(){
	var params = $("#ManagerForm").serialize();

	$.ajax({
		type : "post",
		url : "Man_Emp_List",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr name='"+result.list[i].EMP+"'>";
				html += "<td>"+result.list[i].EMP+"</td>"; //직원 번호
				html += "<td>"+result.list[i].POSITION+"</td>"; //직책
				html += "<td>"+result.list[i].OFFICE+"</td>"; //진료과
				html += "<td>"+result.list[i].LV+"</td>"; //등급
				html += "<td>"+result.list[i].NAME+"</td>"; //직원명
				html += "<td>"+result.list[i].PHONE+"</td>"; //연락처
				html += "<td>"+result.list[i].EMAIL+"</td>"; //이메일
				if(result.list[i].ACTIVATED == 0){
					html += "<td>"+"<input type='checkbox' name='ACTIVATED' id='MAN_USE' value='0'>"+"</td>"; //사용 여부 & 비활성화
				}else{
					html += "<td>"+"<input type='checkbox' name='ACTIVATED' id='MAN_USE' value='1' checked='checked'>"+"</td>"; //사용 여부 & 활성화
				}
				html += "<td>"+"<input type='button' class='man_reset' name='" + result.list[i].EMP + "' value='초기화'>"+"</td>"; //선택 
				html += "</tr>";
			}
			$("#man_tt").html(html); //내용 데이터 가져오기
			
				html="";
				html += "<span class='page_btn_box' name='1'><<</span>";
				
				if($("input[name='page']").val()==1){
					html += "<span class='page_btn_box' name='1'><</span>"; 
				}else{
					html += "<span class='page_btn_box' name='"+($("input[name='page']").val()-1)+"'><</span>";
				}
				
				for(var i=result.pb.startPcount; i<=result.pb.endPcount; i++){
					if(i==$("input[name='page']").val()){
						html += "<span class='page_btn_box_now' name='"+ i +"'><b>"+ i +"</b></span>";
					}else{
						html += "<span class='page_btn_box' name='"+ i +"'>"+ i +"</span>";
					}
				}
				if($("input[name='page']").val()==result.pb.maxPcount){
					html += "<span class='page_btn_box' name='"+result.pb.maxPcount+"'>></span>";
				}else{
					html += "<span class='page_btn_box' name='"+($("input[name='page']").val() * 1 + 1)+"'>></span>";
				}
				html +="<span class='page_btn_box' name='"+result.pb.maxPcount+"'>>></span>";
				$("#manager_paging").html(html);
			},
			error : function(result){
				alert("error!!");
			} //페이징 끝
		}); //ajax 끝
	}