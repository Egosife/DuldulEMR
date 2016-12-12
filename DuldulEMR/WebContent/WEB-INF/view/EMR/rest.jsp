<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" />



<script>
$(document).ready(function(){
	
	
	
	$("#rest_date1").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	$("#rest_date2").datepicker({
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
   		<p>시작 <input type="text" id="rest_date1" readonly></p> 
   		<p>종료 <input type="text" id="rest_date2" readonly></p> 
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