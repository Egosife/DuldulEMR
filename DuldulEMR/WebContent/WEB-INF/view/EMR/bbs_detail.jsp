<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/bbs_detail.css" />
 <!-- script 영역 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>

</head>
<body>


<!-- 다시 만들어야하는  -->


<div class="wrap">
   <div class="header">
   		<h1>상세보기</h1>
   </div>

   <div class="writter">
		작성자  <input type="text" id="WritterText" readonly/>  
	</div>

   <div class="date">
   	등록일 <input type="text" id="DateText" readonly/>  
   </div>
   <div class="title" >
   		제목 <input type="text" id="TitleText" /> 
   </div>
   
   <div class="content">
   <textarea rows="30" cols="125" name="contents"></textarea>
	</div>
	
	  <div class="title" >
   		첨부파일 <input type="text" id="FileText"/> 
   	</div>
   	
   	<div class="button" style="text-align:right">
   		<input type="button" value="수정" id="changeBtn"/>
   		<input type="button" value="삭제" id="deleteBtn"/>
   		<input type="button" value="목록" id="listBtn"/>
   	</div>
 
</div>

</body>
</html>