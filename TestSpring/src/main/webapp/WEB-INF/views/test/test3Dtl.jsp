<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#listen").on("click", function() {
		location.href = "test3";
	});
});
</script>
</head>
<body>
번호 : ${data.no}<br>
제목 : ${data.title}<br>
작성자 : ${data.writer}<br>
내용 : ${data.con}<br>
<input type="button" value="목록" id="listBtn" />
</body>
</html>