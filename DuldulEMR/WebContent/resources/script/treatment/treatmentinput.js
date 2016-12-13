/**
 * 161212 이동건 - 소스 생성
 */
//진료 접수 정보 저장용 변수
$(document).ready(function(){
	treat_his();
	
	$("#treat_btn_commit").on("click",function(){
		var params = $("#form_treat_doctor").serialize();
		
		$.ajax({
			type: "post",
			url: "inserttreathis",
			dataType: "json",
			data: params,
			success: function(result){
				if(result.res == "true"){
					alert("성공");
					
					var paramsArray = $("#form_treat_care").serializeArray();
					
					$.ajax({
						type: "post",
						url: "insertcares",
						dataType: "json",
						data: paramsArray,
						success: function(result){
							
						},error: function(result){
							
						}
					});
					
					
				}else{
					alert("실패");
				}
			},error : function(result){
				alert("ERROR - inserttreathis");
			}
		});
	});
	
	
	$("#treat_btn_cancel").on("click",function(){
		if(confirm("해당 페이지를 떠나시겠습니까?")){
			Close_Tab(this);
		}
	});
	
	
	$("#treathistb").on("click", "tr", function(){
		var text = $(this).attr('name').split('&');
		$("#selecttreatnum").val(text[0]);
		$("#selectnum").val(text[1]);
		
		var params = $("#form_treat_doctor").serialize();
		$.ajax({
			type : "post",
			url : "pill_his",
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				for(var i = 0 ; i < result.getpillinfo.length; i++){
					html += "<tr name="+result.getpillinfo[i].TREAT_NUM+'&'+result.getpillinfo[i].NUM+">"
					html += 	"<td>"+result.getpillinfo[i].PILL_NAME+"</td>"
					html += 	"<td>"+result.getpillinfo[i].PRESCRIPTION_AMOUNT+"</td>"
					html += 	"<td>"+result.getpillinfo[i].DAY_DRUGTIME+"</td>"
					html += 	"<td>"+result.getpillinfo[i].ALL_DRUGTIME+"</td>"
					html += "</tr>"
				}
				$("#pillhistb").html(html);
			},
			error : function(result){
				alert("ERROR - pill_his");
			}
		});

		$.ajax({
			type : "post",
			url : "care_his",
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				for(var i = 0 ; i < result.getcareinfo.length; i++){
					html += "<tr name="+result.getcareinfo[i].TREAT_NUM+'&'+result.getcareinfo[i].NUM+">"
					html += 	"<td>"+result.getcareinfo[i].CARE_TYPE+"</td>"
					html += 	"<td>"+result.getcareinfo[i].CARE_INFO+"</td>"
					html += 	"<td>"+result.getcareinfo[i].CARE_NOTE+"</td>"
					html += "</tr>"
				}
				$("#careshistb").html(html);
			},
			error : function(result){
				alert("ERROR - care_his");
			}
		});
		
	});
	
	
	$("#btn_treatcare").on("click",function(){
		
		if($("#care_type").val() != "" && $("#care_con").val() != "" && $("#care_etc").val() != ""){
			var caredata = $("#care_type").val() + "@" + $("#care_con").val() + "@" + $("#care_etc").val();
			var html = "";
			html += "<tr>";
			html += "<td>"+$("#care_type").val()+"</td>";
			html += "<td>"+$("#care_con").val()+"</td>";
			html += "<td>"+$("#care_etc").val()+"</td>";
			html += "</tr>";
			$("#care_tb").append(html);
			html = "";
			html += "<input type='hidden' name='treatcare' value='"+caredata+"'>";
			$("#form_treat_care").append(html);
			
			$("#care_type").val("");
			$("#care_con").val("");
			$("#care_etc").val("");
		}else{
			alert("값을 제대로 입력해 주세요.");
		}
		
	});

	$("#btn_treatpill").on("click",function(){
		
		if($("#pill_name").val() != "" && $("#pill_vol").val() != "" && $("#pill_day").val() != "" && $("#pill_maxday").val() != ""){
			var pilldata = $("#pill_name").val() + "@" + $("#pill_vol").val() + "@" + $("#pill_day").val()+ "@" + $("#pill_maxday").val();
			var html = "";
			html += "<tr>";
			html += "<td>"+$("#pill_name").val()+"</td>";
			html += "<td>"+$("#pill_vol").val()+"</td>";
			html += "<td>"+$("#pill_day").val()+"</td>";
			html += "<td>"+$("#pill_maxday").val()+"</td>";
			html += "</tr>";
			$("#pill_tb").append(html);
			html = "";
			html += "<input type='hidden' name='treatpill' value='"+pilldata+"'>";
			$("#form_treat_care").append(html);
			
			$("#pill_name").val("");
			$("#pill_vol").val("");
			$("#pill_day").val("");
			$("#pill_maxday").val("");
		}else{
			alert("값을 제대로 입력해 주세요.");
		}
		
	});
	
})//ready end
function treat_his(){
	var params = $("#form_treat_doctor").serialize();
	$.ajax({
		type : "post",
		url : "treat_his",
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			for(var i = 0 ; i < result.gettreatinfo.length; i++){
				html += "<tr name="+result.gettreatinfo[i].TREAT_NUM+'&'+result.gettreatinfo[i].NUM+">"
				html += 	"<td>"+result.gettreatinfo[i].SYM+"</td>"
				html += 	"<td>"+result.gettreatinfo[i].SPECIAL_NOTE+"</td>"
				html += 	"<td>"+result.gettreatinfo[i].DIAGNOSIS+"</td>"
				html += 	"<td>"+result.gettreatinfo[i].OPINION+"</td>"
				html += 	"<td>"+result.gettreatinfo[i].POSTING_DATE+"</td>"
				html += "</tr>"
			}
			$("#treathistb").html(html);
		},
		error : function(result){
			alert("ERROR - treat_his");
		}
	});	
}