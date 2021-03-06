<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/notice.css" />
<script type="text/javascript" src="resources/script/bbs/notice.js"></script>


</head>
<body>
<form action="" method="post" id="actionForm99">
	<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/>
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
   			<table  class="notice_table" >
   			<colgroup>
   			<col style="width:10%; ">
   			<col style="width:30%;">
   			<col style="width:20%; ">
   			<col style="width:20%; ">
   			<col style="width:20%; ">
   			</colgroup>
   				<thead >
					<tr >
	  					<th scope="cols">번호</th>
        			    <th scope="cols">제목</th>
         			    <th scope="cols">작성자</th>
						<th scope="cols">작성일</th>
						<th scope="cols">조회수</th>
					</tr>
				</thead>
			<tbody id="notice_notice"></tbody>
		</table>
	</div>
		<div class="notice_bar">
		<!-- (0:관리자 , 1:매니저) 권한이 있는 계정들만 글쓰기라는 버튼이 보이게하려  -->
			<c:choose>
				<c:when test="${sLv_Code == 0 || sLv_Code == 1}">
				
					<input type="button" value="글 쓰기" class="insert_Btn" 
						   id="notice_insertBtn" tab="bbs_write*글쓰기*bbs_write" style="cursor:pointer" />
						   
				</c:when>
			</c:choose>
		</div>
   </div>
	<div class="notice_bottom">
  		 <div class="notice_bottom_list">
			<hr>
			<div class="notice_page_num" id="notice_page_num" style="cursor:pointer"></div>
		</div>
		<div class="notice_bottom_search">
			 <select name="keyField" id="keyField">
    	            <option value="title">제목</option>
    	     </select>
				<input type="text" id="notice_searchText" value="${param.searchText}"/>
				<input type="button" value="검색" id="notice_searchBtn" style="cursor:pointer"/>
		</div>
	</div>
</div>
</body>
</html>