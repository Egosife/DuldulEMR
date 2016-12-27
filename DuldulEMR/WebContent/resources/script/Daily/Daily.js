/** 2016-12-12 김남기 
		기능	개발 완료 **/
$(document).ready(function(){
	emp_List(); 
	dailyList();
	
	$("#insertBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		Open_Tab(this); // 탭을 오픈한다
	}); //insertBtn end
	
	$("#pagingArea").on("click","span",function(){ //페이징을 클릭하면
		$("input[name='page']").val($(this).attr("name"));
		dailyList();
	}); //pagingArea end
	
	$("#tb").on("click","tr",function(){ //글을 클릭하면
		Open_Tab(this); //탭을 오픈한다
	}); //tb end
});//ready end

function emp_List(){
	var params = $("#dailyForm").serialize();
	
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

function dailyList(){
	var params = $("#dailyForm").serialize();
	
	$.ajax({
		type : "post",
		url : "dailyList",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr class='Dai_db_table_tr' name='"+result.list[i].DAILY_NUM+"' value='"+result.list[i].DAILY_NUM+"' tab='Daily_details?TURN="+result.list[i].DAILY_NUM+"*글 읽기*Daily_details'>";
				html += "<td>"+result.list[i].ROWNO+"</td>"; //일차
				html += "<td>"+result.list[i].RECODE_DATE+"</td>"; //날짜
				html += "<td>"+result.list[i].CONTENT+"</td>"; //내용
				html += "</tr>";
			}
			$("#tb").html(html); //내용 데이터 가져오기
			
			//페이징 처리 단계
			html="";
			html += "<span name='1'>  <<  </span>";
			
			if($("input[name='page']").val()==1){
				html += "<span name='1'> < </span>"; 
			}else{
				html += "<span name='" + ($("input[name='page']").val()-1) + "'>  <  </span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++){
				if(i == $("input[name='page']").val()){
					html += "<span name='" + i + "'>  <b> " + i + " </b>  </span>";
				}else{
					html += "<span name='" + i + "'> " + i + " </span>";
				}
			}
			if($("input[name='page']").val() == result.pb.maxPcount){
				html += "<span name='" + result.pb.maxPcount + "'>  >  </span>";
			}else{
				html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'>  >  </span>";
			}
			html += "<span name='" + result.pb.maxPcount + "'>  >>  </span>";
			$("#pagingArea").html(html);
		},
		error : function(result){
			alert("error!!");
		}
	}); //ajax 끝
}