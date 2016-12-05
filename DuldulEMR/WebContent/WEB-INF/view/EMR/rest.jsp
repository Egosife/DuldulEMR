<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui-1.10.4.custom.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/calendar.css" />
 <!-- script 영역 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-ui-1.10.4.custom.min.js"></script>
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
});
</script>

</head>
<body>
<div class="wrap">
   <div class="header">
   		<b>기본정보</b>
   </div>

   <div class="content">
		<table border="1">
         <tr>
            <td>성명</td>
            <td>직책 </td>
            <td>담당과</td>
            <td>전화번호</td>
            <td>직원번호</td>
           <td>E-Mail</td>
         </tr>
       
      </table>
	</div>

   <div class="rest_header">
   		<b>휴진신청</b>
   </div>
   <div class="rest_page" >
   		<p>시작 <input type="text" id="datepicker1" readonly></p> 
   		<p>종료 <input type="text" id="datepicker2" readonly></p> 
   </div>
   
   <div class="rest_reason" >
   		신청내용 	<textarea rows="20" cols="125" name="contents"></textarea>
   </div>
   	
   	<div class="button" style="text-align:right">
   		<input type="button" value="등록" id="saveBtn"/>
   		<input type="button" value="이전" id="backBtn"/>
   	</div>
 
</div>

</body>
</html>