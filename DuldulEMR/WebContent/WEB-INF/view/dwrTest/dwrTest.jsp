<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DWR</title>
<!-- jQuery Script -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.11.0.min.js"></script>
		
<script type='text/javascript' src="dwr/engine.js"></script>
<script type='text/javascript' src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/IDwrTestService.js"></script>
<script type="text/javascript">
function test(){
	IDwrTestService.test(callBack);
}

function callBack(result) {
	alert(result);
}
</script>
</head>
<body>
	<input type="button" value="click" onclick="test();">
</body>
</html>