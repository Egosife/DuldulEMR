/** 2016-12-14 김남기 
휴진 현황 메인 완료 **/
$(document).ready(function(){
	my_rest_List();
	Emp_rest();
	Rest_Select();
	
	$("#insertBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		Open_Tab(this); // 탭을 오픈한다
	}); //insertBtn end
	
	$("#pagingArea_top").on("click","span",function(){ //페이징을 클릭하면
		$("input[name='page']").val($(this).attr("name"));
		my_rest_List();
	}); //pagingArea end
	$("#paging_Area").on("click","span",function(){ //페이징을 클릭하면
		$("input[name='page']").val($(this).attr("name"));
		Emp_rest();
	}); //pagingArea end
	
	$("#tv").on("click","tr",function(){ //글을 클릭하면
		Open_Tab(this); //탭을 오픈한다
	}); //tb end
	
	$("#rest_cal").on("click", function(){ //조회를 클릭 했을시
		rest_search();
	});
	$("#mokrok_Btn").on("click", function(){ //목록보기
		ReOpen_Tab(this);
	});
});//ready end
function my_rest_List(){
	var params = $("#RestApplyForm").serialize();
	
	$.ajax({
		type : "post",
		url : "my_rest_List",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr class='rest_apply_set_table_tr' name='"+result.list[i].SERIAL_NUM+"' value='"+result.list[i].SERIAL_NUM+"' tab='rest_detail?SNUM="+result.list[i].SERIAL_NUM+"*휴진 신청기록*rest_detail'>";
				html += "<td>"+result.list[i].REPORTING+"</td>"; //
				html += "<td>"+result.list[i].TERM+"</td>"; //
				html += "<td>"+result.list[i].R_REASON+"</td>"; //
				html += "<td>"+result.list[i].R_CHECK+"</td>"; //
				html += "</tr>";
			}
			$("#tv").html(html); //내용 데이터 가져오기
			
			//페이징 처리 단계
			html="";
			html += "<span name='1'> <<  </span>";
			
			if($("input[name='page']").val()==1){
				html += "<span name='1'> < </span>"; 
			}else{
				html += "<span name='"+($("input[name='page']").val()-1)+"'> <  </span>";
			}
			
			for(var i=result.pb.startPcount; i<=result.pb.endPcount; i++){
				if(i==$("input[name='page']").val()){
					html += "<span name='"+ i +"'> <b> "+ i +" </b> </span>";
				}else{
					html += "<span name='"+ i +"'> "+ i +" </span>";
				}
			}
			if($("input[name='page']").val()==result.pb.maxPcount){
				html += "<span name='"+result.pb.maxPcount+"'> > </span>";
			}else{
				html += "<span name='"+($("input[name='page']").val() * 1 + 1)+"'> > </span>";
			}
			html +="<span name='"+result.pb.maxPcount+"'> >> </span>";
			$("#pagingArea_top").html(html);
		},
		error : function(result){
			alert("error!!");
		}
	}); //ajax 끝
}
function Emp_rest(){
	var params = $("#RestApplyForm").serialize();
	console.log(params);
	
	$.ajax({
		type : "post",
		url : "Emp_rest",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr name='"+result.list[i].EMP_NUM+"'>";
				html += "<td>"+result.list[i].ENU+"</td>"; //직원 번호
				html += "<td>"+result.list[i].ENA+"</td>"; //성명
				html += "<td>"+result.list[i].POTION+"</td>"; //직책
				html += "<td>"+result.list[i].OFFS+"</td>"; //진료과
				html += "<td>"+result.list[i].TERM+"</td>"; //휴진 날짜
				html += "<td>"+result.list[i].R_REASON+"</td>"; //휴진 사유
				html += "</tr>";
			}
			$("#tt").html(html); //내용 데이터 가져오기
			
			//페이징 처리 단계
			html="";
			html += "<span name='1'> <<  </span>";
			
			if($("input[name='page']").val()==1){
				html += "<span name='1'> < </span>"; 
			}else{
				html += "<span name='"+($("input[name='page']").val()-1)+"'> <  </span>";
			}
			
			for(var i=result.pb.startPcount; i<=result.pb.endPcount; i++){
				if(i==$("input[name='page']").val()){
					html += "<span name='"+ i +"'> <b> "+ i +" </b> </span>";
				}else{
					html += "<span name='"+ i +"'> "+ i +" </span>";
				}
			}
			if($("input[name='page']").val()==result.pb.maxPcount){
				html += "<span name='"+result.pb.maxPcount+"'> > </span>";
			}else{
				html += "<span name='"+($("input[name='page']").val() * 1 + 1)+"'> > </span>";
			}
			html +="<span name='"+result.pb.maxPcount+"'> >> </span>";
			$("#paging_Area").html(html);
		},
		error : function(result){
			alert("error!!");
		}
	}); //ajax 끝
} 
function rest_search() { 
	$("#rest_sea").val($("#datepickersss").val());
	$("input[name='page']").val("1");
	Emp_rest();
};
function Rest_Select(){ //달력
	$("#datepickersss").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
}