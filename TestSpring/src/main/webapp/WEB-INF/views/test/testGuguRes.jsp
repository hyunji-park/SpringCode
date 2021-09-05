<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#backBtn").on("click", function() {
		history.back();
	});
});
</script>
</head>
<body>
${param.dan}단<br>
${gugu}<br>
<input type="button" value="돌아가기" id="backBtn" />
</body>
</html>