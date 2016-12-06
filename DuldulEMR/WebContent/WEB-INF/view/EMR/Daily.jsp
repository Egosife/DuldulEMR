<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<title>일일 업무 일지</title>
<script type="text/javascript">
$(document).ready(function(){
	emp_List();
	dailyList();
	
	$("#insertBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		$("#dailyForm").attr("action","Daily_write"); /* Daily_write로 넘어감 */
		$("#dailyForm").submit();
	}); //insertBtn end
	
	$("#pagingArea").on("click","span",function(){
		$("input[name='page']").val($(this).attr("name"));
		dailyList();
	}); //pagingArea end
	
	$("#tb").on("click","tr",function(){
		$("input[name='TURN']").val($(this).attr("name"));
		$("#dailyForm").attr("action","Daily_details");
		$("#dailyForm").submit();
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
				html += "<td>"+result.list.EMP_NAME+"</td>";
				html += "<td>"+result.list.POSITION+"</td>";
				html += "<td>"+result.list.EMP_NUM+"</td>";
				html += "<td>"+result.list.OFFICE+"</td>";
				html += "</tr>";
			
			$("#tb_Top").html(html);
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
				html += "<tr name='"+result.list[i].DAILY_NUM+"' value='"+result.list[i].DAILY_NUM+"'>";
				html += "<td>"+result.list[i].ROWNO+"</td>";
				html += "<td>"+result.list[i].RECODE_DATE+"</td>";
				html += "<td>"+result.list[i].CONTENT+"</td>";
				html += "</tr>";
			}
			$("#tb").html(html);
			
			//페이지 단계
			html="";
			html += "<span name='1'> 처음  </span>";
			
			if($("input[name='page']").val()==1){
				html += "<span name='1'> 이전 </span>"; 
			}else{
				html += "<span name='"+($("input[name='page']").val()-1)+"'> 이전  </span>";
			}
			
			for(var i=result.pb.startPcount; i<=result.pb.endPcount; i++){
				if(i==$("input[name='page']").val()){
					html += "<span name='"+ i +"'><b>"+ i +"</b></span>";
				}else{
					html += "<span name='"+ i +"'>"+ i +"</span>";
				}
			}
			if($("input[name='page']").val()==result.pb.maxPcount){
				html += "<span name='"+result.pb.maxPcount+"'> 다음 </span>";
			}else{
				html += "<span name='"+($("input[name='page']").val() * 1 + 1)+"'> 다음 </span>";
			}
			html +="<span name='"+result.pb.maxPcount+"'> 마지막 </span>";
			$("#pagingArea").html(html);
		},
		error : function(result){
			alert("error!!");
		}
	}); //ajax 끝
}
</script>
</head>
<body>
<form action="" id="dailyForm" method="post">
<c:choose>
	<c:when test="${empty param.page}">
		<input type="hidden" name="page" value="1"/>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="page" value="${param.page}"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="TURN"/>
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/>

</form>
<!-- 16.11.25 일일 업무 일지 조회, 김남기 -->
<div class="main_knk"> <!-- 메인 레이아웃 -->
	<div class="top_knk"> <!-- 레이아웃 상단 -->
		<div class="b_information"><b>기본 정보</b></div> <!-- 레이아웃 - 기본 정보 -->
		<table border="1"> <!-- 기본 정보 테이블 -->
			<tr>
				<td>성 명</td>
				<td>직 책</td>
				<td>사원 번호</td>
				<td>근무과</td>
			</tr>
			<tbody id="tb_Top"></tbody>
		</table>
	</div>
	<div class="middle_knk"> <!-- 레이아웃 중단 -->
		<div class="report"><b>업무 일지</b></div> <!-- 레이아웃 중단 - 업무 일지 -->
		<table border="1"> <!-- 업무 일지 테이블 -->
			<tr>
				<td>일 차</td>
				<td>업무 일자</td>
				<td>업무 내용</td>
			</tr>
			<tbody id="tb">
			</tbody>
		</table>
	</div><hr>
	<div class="bottom_knk"> <!-- 레이아웃 하단 -->
		<div class="bottom_top"> <!-- 레이아웃 하단 - 상단 -->
			<div class="btn_knk">
				<input type="button" value="글쓰기" class="btn_btn" id="insertBtn"> <!-- 레이아웃 하단 - 글쓰기 버튼 크기  -->
			</div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
		</div>
		<div class="bottom_bt"> <!-- 레이아웃 하단 - 하단 -->
			<div class="paging" id="pagingArea" style="font-size: 12pt"></div> <!-- 레이아웃 하단 - 페이징 -->
		</div>
	</div>
</div>
</body>
</html>