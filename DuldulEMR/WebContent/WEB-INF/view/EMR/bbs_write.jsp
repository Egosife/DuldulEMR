<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/bbs_write.css" />
 <!-- script 영역 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>

</head>
<body>


<!-- 다시 만들어야하는  -->


<div class="wrap">
   <div class="header">
   		<h1>글 쓰기</h1>
   </div>

   <div class="content">
		제목 <input type="text" id="TitleText" /> 
	</div>

   <div class="writter">
   	파일첨부<input type="button" value="불러오기" id="insertBtn"/>
   </div>
   <div class="page_num" >
   		
   		<textarea rows="30" cols="125" name="contents"></textarea>
   		
   </div>
   <div class="search">
  	 <center><input type="button" value="저장" id="saveBtn"/></center>
	</div>
 
</div>

</body>
</html>