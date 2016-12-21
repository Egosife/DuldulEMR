
$(document).ready(function(){
	refreshList_bbs();
	$("#bbs_searchBtn").on("click",function(){
		$("input[name='searchText']").val($("#bbs_searchText").val()); 							
		$("input[name='page']").val("1"); 
		refreshList_bbs();
	});
	
	
	$("#bbs_insertBtn").on("click", function(){
	
		Open_Tab(this);
	});

	$("#bbs_page_num").on("click","span",function(){
		$("input[name='page']").val($(this).attr("name"));
		refreshList_bbs();
	});
	
	$("#bbs_bbs").on("click","tr",function(){
		Open_Tab(this);
	});
	
});



function refreshList_bbs(){
	var params = $("#actionForm11").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshTest2",
			dataType : "json",
			data : params,
			success : function(result){
				var html ="";
				
				for(var i = 0; i < result.list.length; i++){
					html += "<tr name='" + result.list[i].SERIAL_NUM + "' tab='bbs_detail2?POST_NUM="+result.list[i].SERIAL_NUM+"*글보기*bbs_detail2'>";
					html += "<td>" + result.list[i].POST_NUM + "</td>";
					html += "<td>" + result.list[i].TITLE + "</td>";
					html += "<td>" + result.list[i].WRITER + "</td>";
					html += "<td>" + result.list[i].REPORTING + "</td>";
					html += "<td>" + result.list[i].VIEWS + "</td>";
					html += "</tr>";
				}
				$("#bbs_bbs").html(html);
				
				//페이지 그리는 단계
				
				html = "";
				
				html += "<span name = '1'> << </span>"; //
				
	            if($("input[name='page']").val() == 1){ //페이지가 1번일경우 
	                  html += "<span name='1'> < </span>"; //1번 일때 이전버튼을 누르면 반응 하지말아라
	            } else {
	                  html += "<span name='" + ($("input[name='page']").val() - 1) + "'> < </span>"; //나머지는 그 값의 -1을 해라 
	            }
	            
	            for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++){ //시작페이지 부터 끝페이지까지 반복문으로 계속도는데
	               if(i == $("input[name='page']").val()){  //보여질값이 i랑 같다면 
	                  html += "<span name='" + i + "'><b>" + i + "</b></span>"; //그 번호를 굵게보여주라
	               } else {
	                  html += "<span name='" + i + "'>" + i + "</span>"; //아니면 굵게 보여주지 마라
	               }
	            }
	            
	            if($("input[name='page']").val() == result.pb.maxPcount){ //마지막 페이지를 클릭했을경우
	               html += "<span name='" + result.pb.maxPcount + "'> > </span>"; //그냥 마지막 페이지가 보여주어라 ,다음눌러도 반응 ㄴㄴ해
	            } else {
	               html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'> > </span>"; //마지막 페이지가 아니면 그 페이지 값에 +1
	            }
	            
	            html += "<span name='" + result.pb.maxPcount + "'> >> </span>"; 
	            
	            $("#bbs_page_num").html(html); // <div id="page_num"></div> 이페이지에서 돌아가게
	         },
	         error : function(result) {
	        	 alert("Error - BBS_0001");
	         }
	      });
	   
	}