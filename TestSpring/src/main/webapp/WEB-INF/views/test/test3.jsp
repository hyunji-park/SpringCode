<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src="resources/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
window.onload = function(){
	
};

$(document).ready(function() {
	$("tbody").on("click","tr", function(){
		$("#no").val($(this).attr("no")); //인자가 한 개일 경우 값 할당
		
		/* console.log($("#no").val()); //인자가 없을 경우 값 취득
		
		alert($(this).attr("no")); //여기서 this는 tr
		$(this).attr("no", "click"); */
		
		$("#goForm").submit();
	});
});
</script>
</head>
<body>
<!-- 폼을 통해서 갈 때 네임이 키, 밸류가 값 -->
<form action="test3Dtl" method="post" id="goForm">
	<input type="hidden" id="no" name="no" value="" />
</form>
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
		</tr>
	</thead>
	<tbody>
	<!-- 컨트롤러에서 리스트를 받아오고 리스트를 jsp에 있는 data 변수에 저장을 하고
	컨트롤러에서 해시맵에 저장한 키를 매칭해주면 그 키에 할당되어있는 값을 가져온다-->
		<c:forEach var="data" items="${list}">
			<tr no="${data.no}">
				<td>${data.no}</td>
				<td>${data.title}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>