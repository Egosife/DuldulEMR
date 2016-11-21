<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 입장</title>
<!-- jQuery Script -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#joinBtn").on("click", function(){
		if($.trim($("#userNick").val()) == null) {
			alert("사용자 별칭을 입력해 주세요.");
		} else {
			$("#joinForm").submit();
		}
	});
});
</script>
</head>
<body>
	<form action="joinChat" method="post" id="joinForm">
		<table>
			<tr>
				<td>Nick</td>
				<td>
					<input type="text" id="userNick" name="userNick" />
				</td>
				<td rowspan="2">
					<input type="button" value="입장" id="joinBtn"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>