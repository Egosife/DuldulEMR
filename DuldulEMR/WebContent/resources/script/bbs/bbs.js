
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
					html += "<tr class='bbs_table_tr' name='" + result.list[i].SERIAL_NUM + "' tab='bbs_detail2?POST_NUM="+result.list[i].SERIAL_NUM+"*글보기*bbs_detail2'>";
					html += "<td>" + result.list[i].POST_NUM + "</td>";
					html += "<td style='text-align: left;'>" + result.list[i].TITLE + "</td>";
					html += "<td>" + result.list[i].WRITER + "</td>";
					html += "<td>" + result.list[i].REPORTING + "</td>";
					html += "<td>" + result.list[i].VIEWS + "</td>";
					html += "</tr>";
				}
				$("#bbs_bbs").html(html);
				
				//페이지 그리는 단계
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
		         $("#bbs_page_num").html(html);
		      },
		      error : function(result){
		         alert("error!!");
		      }
		   }); //ajax 끝
		} 