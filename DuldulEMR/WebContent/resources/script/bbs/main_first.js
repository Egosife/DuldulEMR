
$(document).ready(function(){
	top_notice();
 	 middle_bbs();  
 	bottom_rest_apply(); 
	
	$("#top_notice").on("click","tr",function(){
		Open_Tab(this);
	});//초기화면에서 공지사항 테이블 글 클릭시 새로운 탭에서 글을 본다
	$("#middle_bbs").on("click","tr",function(){
		Open_Tab(this);
	});//초기화면에서 사내게시판 테이블 글 클릭시 새로운 탭에서 글을 본다
	
	
	
	$("#top_moreBtn").on("click", function(){
		Open_Tab(this);
	});//초기화면에서 공지사항 더보기 버튼 클릭시 새로운 공지사항 게시판 탭 으로 이동
	$("#middle_moreBtn").on("click", function(){
		Open_Tab(this);
	});//초기화면에서 사내게시판 더보기 버튼 클릭시 새로운 사내게시판 게시판 탭 으로 이동
	$("#bottom_moreBtn").on("click", function(){
		Open_Tab(this);
	});//초기화면에서 휴진현황 더보기 버튼 클릭시 새로운 휴진현황게시판 탭 으로 이동
	


});

//초기화면에서 공지사항
function top_notice(){

	var params = $("#main_top_notice").serialize();
	
		$.ajax({
			type : "post",
			url : "refreshTest3",
			dataType : "json",
			data : params,
			success : function(result){
				var html ="";
				
				for(var i = 0; i < result.list.length; i++){
					html += "<tr name='" + result.list[i].SERIAL_NUM + "' tab='bbs_detail?POST_NUM="+result.list[i].SERIAL_NUM+"*글보기*bbs_detail'>";
					html += "<td>" + result.list[i].POST_NUM + "</td>";
					html += "<td>" + result.list[i].TITLE + "</td>";
					html += "<td>" + result.list[i].WRITER + "</td>";
					html += "<td>" + result.list[i].REPORTING + "</td>";
					html += "<td>" + result.list[i].VIEWS + "</td>";
					html += "</tr>";
				}
				$("#top_notice").html(html);

	         },
	         error : function(result) {
	            alert("Error - Main_first_0001");//메인페이지에서 공지사항 부분 글을 못불러올때 나오는 에러, 해결방법 = 세션을 확인한다, 페이지를 닫았다가 열어본다, 데이터베이스를 재가동 해본다, 인터넷 브라우저 사용기록을 지워본다, 이래도 안되면 문의전화 주세요
	         }
	      });

	
}
	
//초기화면에서 사내게시판
 function middle_bbs(){
	var params = $("#main_middle_bbs").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshTest4",
			dataType : "json",
			data : params,
			success : function(result){
				var html ="";
				
				for(var k = 0; k < result.list.length; k++){
					html += "<tr name='" + result.list[k].SERIAL_NUM + "' tab='bbs_detail2?POST_NUM="+result.list[k].SERIAL_NUM+"*글보기*bbs_detail2'>";
					html += "<td>" + result.list[k].POST_NUM + "</td>";
					html += "<td>" + result.list[k].TITLE + "</td>";
					html += "<td>" + result.list[k].WRITER + "</td>";
					html += "<td>" + result.list[k].REPORTING + "</td>";
					html += "<td>" + result.list[k].VIEWS + "</td>";
					html += "</tr>";
				}
				$("#middle_bbs").html(html);
	         },
	         error : function(result) {
		            alert("Error - Main_first_0002");//메인페이지에서 사내게시판 부분 글을 못불러올때 나오는 에러, 해결방법 = 세션을 확인한다, 페이지를 닫았다가 열어본다, 데이터베이스를 재가동 해본다, 인터넷 브라우저 사용기록을 지워본다, 이래도 안되면 문의전화 주세요
	         }
	      });
	   
	}   
//초기화면에서 휴진현황
 function bottom_rest_apply(){
		var params = $("#main_bottom_rest").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshTest5",
			dataType : "json",
			data : params,
			success : function(result){
				var html="";
				for(var i=0; i<result.list.length; i++){
					html += "<tr name='"+result.list[i].EMP_NUM+"'>";
					html += "<td>"+result.list[i].ENU+"</td>"; //
					html += "<td>"+result.list[i].ENA+"</td>"; //일차
					html += "<td>"+result.list[i].POTION+"</td>"; //날짜
					html += "<td>"+result.list[i].OFFS+"</td>"; //내용
					html += "<td>"+result.list[i].TERM+"</td>"; //내용
					html += "<td>"+result.list[i].R_REASON+"</td>"; //내용
					html += "</tr>";
				}
				$("#bottom_rest_apply").html(html); //내용 데이터 가져오기
			},
			error : function(result){
	            alert("Error - Main_first_0003");//메인페이지에서 휴진현황 부분 글을 못불러올때 나오는 에러, 해결방법 = 세션을 확인한다, 페이지를 닫았다가 열어본다, 데이터베이스를 재가동 해본다, 인터넷 브라우저 사용기록을 지워본다, 이래도 안되면 문의전화 주세요
			}
		}); //ajax 끝
	} 