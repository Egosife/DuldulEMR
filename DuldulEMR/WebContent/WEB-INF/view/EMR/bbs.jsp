<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/bbs.css" />
<script type="text/javascript" src="resources/script/bbs/bbs.js"></script>




</head>
<body>
<form action="" method="post" id="actionForm11">
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
<div class="bbs_main">
   <div class="bbs_top">
   		<div class="bbs_header">
   			<div class="bbs_name">사내게시판</div>
   		</div>
   		<div class="bbs_top_table">
   			<table border="1" align="center" class="bbs_table" >
   				<thead >
					<tr >
	  					<th>번호</th>
        			    <th>제목</th>
         			    <th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
			<tbody id="bbs_bbs"></tbody>
		</table>
	</div>
		<div class="bbs_bar">
			<input type="button" value="글 쓰기" class="insert_Btn" 
				   id="bbs_insertBtn" tab="bbs_write2*글쓰기*bbs_write2" />
		</div>
   </div>
	<div class="bbs_bottom">
  		 <div class="bbs_bottom_list">
			<hr>
			<div class="bbs_page_num" id="bbs_page_num"></div>
		</div>
		<div class="bbs_bottom_search">
			 <select name="keyField" id="bbs_keyField">
    	            <option value="title">제목</option>
    	     </select>
				<input type="text" id="bbs_searchText" value="${param.searchText}"/>
				<input type="button" value="검색" id="bbs_searchBtn"/>
		</div>
	</div>
</div>
</body>
</html>