<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Sample</title>
<!-- jQuery Script -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#loginBtn").on("click", function(){
		/*
		 * Ajax로 화면 로딩시 or 조회 버튼 클릭시 목록 조회
		*/
		var params =  $("#loginForm").serialize();
		
		$.ajax({
			type : "post",
			url : "loginResult",
			dataType : "json",
			data : params,
			success : function(result) {
				alert(result.message);
			},
			error : function(result) {
				alert(result.errorMessage);
			}
		});
	});
});
</script>
</head>
<body>
	<form method="post" id="loginForm">
		<table>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="userId" />
				</td>
				<td rowspan="2">
					<input type="button" value="Login" id="loginBtn"/>
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input type="password" name="userPw" />
				</td>
			</tr>
			<c:if test="${not empty msg}">
				<tr>
					<td colspan="2">${msg}</td>
				</tr>
			</c:if>
		</table>
	</form>
</body>
</html>