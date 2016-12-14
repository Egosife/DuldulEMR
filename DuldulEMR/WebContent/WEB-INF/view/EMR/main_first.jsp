<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/main_first.css" />
 
 

<script type="text/javascript">

$(document).ready(function(){
	top_notice();
 	 middle_bbs();  
 	bottom_rest_apply(); 
	
	$("#top_notice").on("click","tr",function(){
		Open_Tab(this);
	});
	$("#middle_bbs").on("click","tr",function(){
		Open_Tab(this);
	});
	
	
	
	$("#top_moreBtn").on("click", function(){
		Open_Tab(this);
	});
	$("#middle_moreBtn").on("click", function(){
		Open_Tab(this);
	});
	$("#bottom_moreBtn").on("click", function(){
		Open_Tab(this);
	});
	


});


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
				
				//페이지 그리는 단계
				
			
	         },
	         error : function(result) {
	            alert("뭘봐!!");
	         }
	      });

	
}
	

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
				
				//페이지 그리는 단계
				
				html = "";
				
				html += "<span name = '1'> << </span>"; //
				
	            if($("input[name='page']").val() == 1){ //페이지가 1번일경우 
	                  html += "<span name='1'> < </span>"; //1번 일때 이전버튼을 누르면 반응 하지말아라
	            } else {
	                  html += "<span name='" + ($("input[name='page']").val() - 1) + "'> < </span>"; //나머지는 그 값의 -1을 해라 
	            }
	            
	            for(var k = result.pb.startPcount; k <= result.pb.endPcount; k++){ //시작페이지 부터 끝페이지까지 반복문으로 계속도는데
	               if(k == $("input[name='page']").val()){  //보여질값이 i랑 같다면 
	                  html += "<span name='" + k + "'><b>" + k + "</b></span>"; //그 번호를 굵게보여주라
	               } else {
	                  html += "<span name='" + k + "'>" + k + "</span>"; //아니면 굵게 보여주지 마라
	               }
	            }
	            
	            if($("input[name='page']").val() == result.pb.maxPcount){ //마지막 페이지를 클릭했을경우
	               html += "<span name='" + result.pb.maxPcount + "'> > </span>"; //그냥 마지막 페이지가 보여주어라 ,다음눌러도 반응 ㄴㄴ해
	            } else {
	               html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'> > </span>"; //마지막 페이지가 아니면 그 페이지 값에 +1
	            }
	            
	            html += "<span name='" + result.pb.maxPcount + "'> >> </span>"; 
	            
	            $("#first_middle_paging").html(html); // <div id="page_num"></div> 이페이지에서 돌아가게
	         },
	         error : function(result) {
	            alert("즐!!");
	         }
	      });
	   
	}   
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
				alert("error!!");
			}
		}); //ajax 끝
	} 
	</script>
</head>
<body>
<form action="" method="post" id="main_top_notice">
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

<form action="" method="post" id="main_middle_bbs">
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

<form action="" id="main_bottom_rest" method="post">
<c:choose>
	<c:when test="${empty param.page}">
		<input type="hidden" name="page" value="1"/>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="page" value="${param.page}"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 --> 
</form>

<div class="first_main">
   <div class="first_top">
   		<div class="first_top_information"><b>공지사항</b>  
   		<input type="button" value="더보기" class="more_Btn" 
				   id="top_moreBtn" tab="notice*공지사항*notice" /></div>
				
   		<table border="1" align="center" class="first_top_table" >
   		
   					<colgroup>
						<col style="width: 10%;">
						<col style="width: 35%;">
						<col style="width: 20%;">
						<col style="width: 25%;">
						<col style="width: 10%;">
						
					</colgroup>
				
					<tr>
	  					<td>번호</td>
        			    <td>제목</td>
         			    <td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
				
			<tbody id="top_notice"></tbody>
				</table>
				

				
   </div>

   <div class="first_middle">
   		<div class="first_middle_information"><b>사내게시판</b>
   		<input type="button" value="더보기" class="more_Btn" 
				   id="middle_moreBtn" tab="bbs*사내게시판*bbs" /></div>
				   
   		
   		   		  
   		<table border="1" align="center" class="first_middle_table" >
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 35%;">
						<col style="width: 20%;">
						<col style="width: 25%;">
						<col style="width: 10%;">
						
					</colgroup>
				
					<tr >
	  					<td>번호</td>
        			    <td>제목</td>
         			    <td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
			<tbody id="middle_bbs"></tbody>
				</table>
 </div>
   		
   	
   		
   

   <div class="first_bottom">
   		<div class="first_bottom_information"><b>휴진현황</b>
   		<input type="button" value="더보기" class="more_Btn" 
				   id="bottom_moreBtn" tab="rest_apply*휴진현황*rest_apply" /></div>
				    

   		<table border="1" align="center" class="first_bottom_table" >
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 15%;">
						<col style="width: 10%;">
						<col style="width: 15%;">
						<col style="width: 15%;">
						<col style="width: 35%;">
					</colgroup>
					<tr>
						<td>직원 번호</td>
						<td>성 명</td>
						<td>직 책</td>
						<td>진료과</td>
						<td>휴진 날짜</td>
						<td>휴진 사유</td>
					</tr>
			<tbody id="bottom_rest_apply"></tbody>
				</table>

	</div>
</div>

</body>
</html>