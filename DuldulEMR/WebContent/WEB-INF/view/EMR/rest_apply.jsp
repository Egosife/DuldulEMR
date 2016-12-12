<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/calendar.css" />
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest_apply.css" />
 

<script type="text/javascript">

/*  */$(document).ready(function(){
	refreshList();
	$("#searchBtn").on("click",function(){
	
		$("input[name='searchText']").val($("#searchText").val()); //searchText가 히든인데 집어넣는이유가 $("#searchText")가 폼밖에있는거가 보여지고  'searchText'는 폼안에있는건 히든이여서 안보임
																	//그래서 폼밖에있는게 폼안에있는거에 집어넣는거임 ..보여주려고
		$("input[name='page']").val("1"); //내가 무엇을 검색하던 1페이지로 넘어가게 하는 기능
		refreshList();
	});
	
	//1107
	$("#insertBtn").on("click", function(){
		$("#actionForm").attr("action","test7");
		$("#actionForm").submit();		
	});
	//
	
	
	$("#page_num").on("click","span",function(){
		$("input[name='page']").val($(this).attr("name"));
		refreshList();
	});
	
	$("#tb").on("click","tr",function(){
		$("input[name='testNo']").val($(this).attr("name"));
		$("#actionForm").attr("action","test5");
		$("#actionForm").submit();
		
	});

	


//1101
function refreshList(){
	var params = $("#actionForm").serialize();//serialize는 전송하기쉽게 데이터를 정리해놓은것 
		
		$.ajax({
			type : "post",
			url : "refreshTest",
			dataType : "json",
			data : params,
			success : function(result){
				var html ="";
				
				for(var i = 0; i < result.list.length; i++){
					html += "<tr name='" + result.list[i].TEST_NO + "'>";
					html += "<td>" + result.list[i].TEST_NO + "</td>";
					html += "<td>" + result.list[i].TEST_CON + "</td>";
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

<script>
$(document).ready(function(){
	$.datepicker.setDefaults({
		monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear:true,
		showOn: 'button',
		closeText: '닫기',
		buttonImage: 'resources/images/calender.png',
		buttonImageOnly: true,
		dateFormat: 'yy/mm/dd'    
	}); 
	
	$("#datepicker1").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	$("#datepicker2").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
};
</script>
</head>
<body>
<form action="#" method="post" id="actionForm">
	<c:choose>
		<c:when test="${empty param.page}"> <!-- 넘어오는값중에 empty면 페이지를 1로 세팅-->
			<input type="hidden" name="page" value="1"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/> <!-- empty가 아니면 이부분으로 페이지를 보여지는세팅 -->
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="searchText" value="${param.searchText}"/> 
	<input type="hidden" name="testNo"/>
</form>

<div class="wrap">
   <div class="header">
   		<b>나의 신청현황 및 기록</b>
   </div>

   <div class="content">
		<table border="1" >
	<thead>
		<tr>
	        <th>휴진 신청일</th>
            <th>휴진 기간</th>
            <th>신청 사유</th>
            <th>승인여부</th>
		</tr>
	</thead>
	<tbody id="tb">
		
	</tbody>
</table>
	</div>

  
   <div class="page_num" id="page_num"></div>
    <div class="writter" >
   		<input type="button" value="신청" class="new_Btn" id="newBtn" />
   		<input type="button" value="삭제" class="delete_Btn" id="deleteBtn" />
   </div>
   
     <div class="header_1">
   		<b>휴진현황</b>
   </div>
   <div class="select">
   	<center>
   		일시 <input type="text" id="datepicker1">
   		     진료과 <select name="keyField">
   		     	<option value="0"> 전체</option>
                <option value="title_content">과1</option>
                <option value="title">과2</option>
                <option value="title">과3</option>
                <option value="title">과4</option>
                <option value="title">과5</option>
                <option value="title">과6</option>
            </select>
           
            직책 <select name="keyField">
   		     	<option value="0"> 전체</option>
                <option value="title_content">의사</option>
                <option value="title">간호사</option>
            </select>
	</center>
   </div>

   <div class="content_1">
		<table border="1" >
	<thead>
		<tr>
	        <th>직원 번호</th>
            <th>성명</th>
            <th>직책</th>
            <th>진료과</th>
            <th>휴진 날짜</th>
            <th>휴진 사유</th>
		</tr>
	</thead>
	<tbody id="tb">
		
	</tbody>
</table>
	</div>

  
   <div class="page_num_1" id="page_num_1"></div>

	
 
</div>

</body>
</html>