/** 2016-12-14 김남기 
휴진 신청 화면 완료 **/
$(document).ready(function(){
	emp_List(); 
	
	$("#jajangBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		if($("#datepicker1s").val() == ""){ //날짜 선택 칸이 빈 칸이면
			alert("날짜를 선택하세요."); //경고창을 띄운다
		}else if($("#datepicker2s").val() == ""){ //내용 입력 칸이 빈 칸이면
				alert("날짜를 선택하세요."); //경고창을 띄운다
			}else if($("#ybbybb").val()==""){
				alert("내용을 입력하세요.");
			}else{
 		 var rest_wri = $("#rest_wri");
 		
 		rest_wri.ajaxForm(uploadResultCallBack);
 		rest_wri.submit(); 
			}
	}); //insertBtn end
	$("#tb").on("click","tr",function(){ //글을 클릭하면
		Open_Tab(this); //탭을 오픈한다
	}); //tb end
	$("#sunsilBtn").on("click",function(){ //취소 버튼을 누르면
		var tab = {tab:"rest_apply*휴진현황*rest_apply"};
		
		Close_Tab(this); //탭을 닫는다
		ReOpen_Tab(tab);
	}); //cancelBtn 끝
});//ready end

function emp_List(){
	var params = $("#restEmp_Form").serialize();
	
	$.ajax({
		type : "post",
		url : "emp_List",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			
				html += "<tr name='"+result.list.EMP_NAME+"'>";
				html += "<td>"+result.list.EMP_NAME+"</td>"; //직원 이름
				html += "<td>"+result.list.POSITION+"</td>"; //직책
				html += "<td>"+result.list.EMP_NUM+"</td>"; //사원 번호
				html += "<td>"+result.list.OFFICE+"</td>"; //근무과
				html += "</tr>";
				$("#tb_emp").html(html); //직원 데이터 가져오기
		}
	});
}
function uploadResultCallBack(data,result){ 
	var rest_apply_open = {tab:"rest_apply*휴진현황*rest_apply"}; //업무일지 탭과 페이지를 연다
	var rest_close = {tab:"rest"}; //글 읽기 탭과 페이지를 닫는다
	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#rest_wri").serialize();
		
	$.ajax({
			type : "post",
			url : "restInsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					ReOpen_Tab(rest_apply_open); //업무일지 탭과 페이지를 연다
					Close_Tab(rest_close); //글 읽기 탭과 페이지를 닫는다
				}else{
					alert("Error - rest_0000");
				}
			},
			error : function(result){
				alert("Error - rest_1994");
			}
		}); //ajax 끝
	}else{
		alert("Error - rest_0425"); //저장 실패
	}
} //uploadResultCallBack 끝
$("#datepicker1s").datepicker({
	dateFormat : 'yy-mm-dd',
	duration: 200,
	onSelect:function(dateText, inst){
	}
});
$("#datepicker2s").datepicker({
	dateFormat : 'yy-mm-dd',
	duration: 200,
	onSelect:function(dateText, inst){
	}
});