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
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/rest_apply_confirm.css" />
 
 
 <!-- script 영역 -->

<script type="text/javascript">

</script>
</head>
<body>



<div class="wrap">
   <div class="header">
   		<b>상세보기</b>
   </div>

   <div class="writter">
		작성자  <input type="text" id="WritterText" readonly/>  
	</div>

   <div class="date">
   	신청일 <input type="text" id="start_DateText" readonly/>  
   	~
   	 <input type="text" id="end_DateText" readonly/>  
   </div>
   
   <div class="title" >
   		신청사유
   </div>
   
   <div class="content">
   <textarea rows="30" cols="125" name="contents" readonly></textarea>
	</div>
	

   	
   	<div class="button" style="text-align:center">
   		<input type="button" value="승인 확인" id="changeBtn"/>
   		<input type="button" value="승인 거부" id="deleteBtn"/>
   	</div>
 
</div>

</body>
</html>