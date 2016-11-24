<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <!-- script 영역 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script>
$(function() {
$( "#datepicker1" ).datepicker({
dateFormat: 'yy-mm-dd'
});
});
$(function() {
	$( "#datepicker2" ).datepicker({
	dateFormat: 'yy-mm-dd'
	});
	});
</script>

</head>
<body>
<div class="wrap">
   <div class="header">
   		<h1>기본정보</h1>
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
   		<h1>휴진신청</h1>
   </div>
   <div class="rest_page" >
   		<p>시작 <input type="text" id="datepicker1"></p> 
   		<p>종료 <input type="text" id="datepicker2"></p> 
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