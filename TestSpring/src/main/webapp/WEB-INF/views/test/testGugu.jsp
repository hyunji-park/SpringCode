<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#guguBtn").on("click","tr", function(){
		// $.trim(값) : 값 앞 뒤 공백 제거
		if($.trim($("#dan").val()) == "") {
			alert("비었음");	
		}else if(isNaN($("#dan").val() * 1)) { // Javascript에서 문자 * 숫자 = NaN
			alert("숫자넣기");
			$("#dan").val("");
			$("#dan").focus();
		} else {
			$("#goForm").submit();
		}
	});
});
</script>
</head>
<body>
<form action="testGuguRes" method="post" id="goForm">
	<input type="text" name="dan" id="dan" />
	<input type="button" value="구구단" id="guguBtn"/>
</form>
</body>
</html>