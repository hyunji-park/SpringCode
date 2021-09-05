<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<!-- el tag 활용 시 : param.~~ => 이전 화면(다른 주소)에서 넘어오는 데이터
					~~~(키이름만 있는거) => controller에서 넘어오는 거 -->
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
