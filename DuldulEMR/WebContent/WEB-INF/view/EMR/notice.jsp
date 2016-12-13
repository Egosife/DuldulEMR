<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/notice.css" />


<script type="text/javascript">

$(document).ready(function(){
	refreshListA();
	$("#notice_searchBtn").on("click",function(){
		$("input[name='searchText']").val($("#notice_searchText").val()); //searchText가 히든인데 집어넣는이유가 $("#searchText")가 폼밖에있는거가 보여지고  'searchText'는 폼안에있는건 히든이여서 안보임
																	//그래서 폼밖에있는게 폼안에있는거에 집어넣는거임 ..보여주려고
		$("input[name='page']").val("1"); //내가 무엇을 검색하던 1페이지로 넘어가게 하는 기능
		refreshListA();
	});
	
	
	$("#notice_insertBtn").on("click", function(){
		//$("#s").attr("value","${s}");
		//$("#actionForm").attr("action","bbs_write");
		//$("#actionForm").submit();
		//$("#insertBtn").attr('tab','bbs_write?asd='+${s}+'*글쓰기');
		Open_Tab(this);
	});

	$("#page_num").on("click","span",function(){
		$("input[name='page']").val($(this).attr("name"));
		refreshListA();
	});
	
	$("#tb").on("click","tr",function(){
		//$("input[name='POST_NUM']").val($(this).attr("name"));
		//$("#actionForm").attr("action","bbs_detail");
		//$("#actionForm").submit();
		Open_Tab(this);
	});
	
});



function refreshListA(){
	var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshTest",
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
				$("#tb").html(html);
				
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
	            
	            $("#page_num").html(html); // <div id="page_num"></div> 이페이지에서 돌아가게
	         },
	         error : function(result) {
	            alert("error!!");
	         }
	      });
	   
	}

</script> 
</head>
<body>
<form action="#" method="post" id="actionForm">
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	<input type="hidden" name="gbn" value="${gbn}"/>
	<c:choose>
		<c:when test="${empty param.page}"> <!-- 넘어오는값중에 empty면 페이지를 1로 세팅-->
			<input type="hidden" name="page" value="1"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/> <!-- empty가 아니면 이부분으로 페이지를 보여지는세팅 -->
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="searchText" value="${param.searchText}"/> 
</form>
<div class="notice_main">
   <div class="notice_top">
   		<div class="notice_header">
   			<div class="notice_name">공지사항</div>
   		</div>
   		<div class="notice_top_table">
   			<table border="1" align="center" class="notice_table" >
   				<thead >
					<tr >
	  					<th>번호</th>
        			    <th>제목</th>
         			    <th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
			<tbody id="tb"></tbody>
		</table>
	</div>
		<div class="notice_bar">
			<input type="button" value="글 쓰기" class="insert_Btn" 
				   id="notice_insertBtn" tab="bbs_write*글쓰기*bbs_write" />
		</div>
   </div>
	<div class="notice_bottom">
  		 <div class="notice_bottom_list">
			<hr>
			<div class="page_num" id="page_num"></div>
		</div>
		<div class="notice_bottom_search">
			 <select name="keyField" id="keyField">
    	            <option value="title">제목</option>
    	     </select>
				<input type="text" id="notice_searchText" value="${param.searchText}"/>
				<input type="button" value="검색" id="notice_searchBtn"/>
		</div>
	</div>
</div>
</body>
</html>