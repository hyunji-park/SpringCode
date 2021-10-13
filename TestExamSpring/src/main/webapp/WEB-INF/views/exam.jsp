<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애플리케이션 테스트 수행용 Sample</title>
<style type="text/css">
#actionForm #updateBtn, #actionForm #cancelBtn {
	display: none;
} 

#actionForm div {
	display: none;
}

#loginArea {
	text-align: right;
}

#loginArea div {
	display: none;
}

.write_area, .list_area, .paging_area {
	width: 701px;
	margin: 0 auto;
}

.paging_area {
	text-align: center;
}

.write_area #writer {
	display: inline-block;
	width: 100px;
	text-align: center;
	font-weight: bold;
}

.write_area input[type='text'] {
	margin: 0px 10px;
	width: 516px;
}

table {
	border-collapse: collapse;
	margin: 10px 0px;
}

tr {
	border: 1px solid #444;
	vertical-align: middle;
	height: 30px;
}

thead tr {
	background-color: orange;
}

tr th:nth-child(1) {
	text-align: center;
	border-right: 1px solid #444;
}

tr td:nth-child(1) {
	text-align: center;
	border-right: 1px solid #444;
}

tr td:nth-child(2) {
	text-indent: 5px;
}

tr td:nth-child(3) {
	text-align: right;
}

tr [type=button] {
	visibility: hidden;
}

tr:hover [type=button] {
	visibility: visible;
}

tbody tr:hover {
	background-color: #FFE000;
}

#pagingWrap {
	margin: 10px 0px;
}

#pagingWrap span {
	display: inline-block;
	min-width: 30px;
	padding: 5px;
	border: 1px solid #444;
	margin: 0px 5px;
	cursor: pointer;
	border-radius: 2px;
	background-color: #DFDFDF;
}

#pagingWrap span:hover {
	background-color: #AFAFAF;
}

#pagingWrap .on {
	font-weight: bold;
	background-color: #AFAFAF;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	if("${sMNo}" != "") { // 로그인 상태
		$("#infoWrap, #writeInfo").show();
	} else { // 비 로그인 상태
		$("#loginWrap, #loginInfo").show();
	}
	
	reloadList();
	
	$("#writeLoginBtn").on("click", function() {
		$("#mId").focus();
	});
	
	$("#loginBtn").on("click", function() {
		if($.trim($("#mId").val()) == "") {
			alert("아이디를 입력해 주세요.");
			$("#mId").focus();
		} else if($.trim($("#mPw").val()) == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#mPw").focus();
		} else {
			var params = $("#loginForm").serialize();
			
			$.ajax({
				url: "examLoginAjax",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.resMsg == "success") {
						$("#mNo").val(res.mNo);
						$("#infoMsg").html(res.mNm + "님 어서오세요.");
						$("#writer").html(res.mNm);
						$("#mId").val("");
						$("#mPw").val("");
						
						$("#infoWrap, #writeInfo").show();
						$("#loginWrap, #loginInfo").hide();
						
						reloadList();
					} else {
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
	
	$("#logoutBtn").on("click", function() {
		$.ajax({
			url: "examLogoutAjax",
			type: "post",
			dataType: "json",
			success: function(res) {
					$("#mNo").val("");
					$("#infoMsg").html("");
					$("#writer").html("");
					
					$("#infoWrap, #writeInfo").hide();
					$("#loginWrap, #loginInfo").show();
					
					reloadList();
			},
			error: function(request, status, error) {
				console.log(error);
			}
		});
	});
	
	//작성버튼
	$("#writeBtn").on("click", function() {
		if($.trim($("#obCon").val()) == "") {
			alert("내용을 넣어주세요.");
			$("#obCon").focus();
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url : "examWriteAjax",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.msg == "success") {
						$("#obCon").val("");
						resetVal();
						reloadList();
					} else if(res.msg == "failed") {
						alert("작성에 실패하였습니다.");
					} else {
						alert("작성중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
	
	//검색버튼
	$("#searchBtn").on("click", function() {
		$("#page").val(1);
		$("#sg").val($("#searchGbn").val());
		$("#st").val($("#searchTxt").val());
		reloadList();
	});
	
	// 페이징 이벤트
	$("#pagingWrap").on("click", "span", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	// 목록의 수정버튼 클릭
	$("table").on("click", "#updateBtn", function() {
		$("#actionForm #writeBtn").hide();
		$("#actionForm #updateBtn, #actionForm #cancelBtn").show();
		$("#obNo").val($(this).parent().parent().attr("name"));
		$("#obCon").val($(this).parent().parent().children(":nth-child(2)").html());
	});
	
	// 취소버튼
	$("#cancelBtn").on("click", function() {
		$("#obCon").val("");
		$("#obNo").val("");
		
		$("#actionForm #writeBtn").show();
		$("#actionForm #updateBtn, #actionForm #cancelBtn").hide();
	});
	
	$("#actionForm #updateBtn").on("click", function() {
		if($.trim($("#obCon").val()) == "") {
			alert("내용을 넣어주세요.");
			$("#obCon").focus();
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url : "examUpdateAjax",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.msg == "success") {
						$("#cancelBtn").click();
						
						reloadList();
					} else if(res.msg == "failed") {
						alert("작성에 실패하였습니다.");
					} else {
						alert("작성중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
	
	// 목록의 삭제버튼 클릭
	$("table").on("click", "#deleteBtn", function() {
		if(confirm("삭제하시겠습니까?")) {
			$("#obNo").val($(this).parent().parent().attr("name"));
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url : "examDeleteAjax",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res) {
					if(res.msg == "success") {
						$("#obNo").val("");
						resetVal();
						reloadList();
					} else if(res.msg == "failed") {
						alert("작성에 실패하였습니다.");
					} else {
						alert("작성중 문제가 발생하였습니다.");
					}
				},
				error : function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
});

function resetVal() {
	$("#page").val(1);
	$("#sg").val("0");
	$("#st").val("");
	$("#searchGbn").val("0");
	$("#searchTxt").val("");
}

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "examListAjax",
		type : "post",
		dataType : "json",
		data : params,
		success : function(res) {
			redrawList(res.list);
			redrawPaging(res.pb);
		},
		error : function(request, status, error) {
			console.log(error);
		}
	});
}

function redrawList(list) {
	var html = "";
	
	for(var d of list) {
		html += "<tr name=\"" + d.OB_NO + "\">";
		html += "<td>" + d.M_NM + "</td>";
		html += "<td>" + d.OB_CON + "</td>";
		html += "<td>";
		if($("#mNo").val() == d.M_NO) {
			html += "<input type=\"button\" value=\"수정\" id=\"updateBtn\" />";
			html += "<input type=\"button\" value=\"삭제\" id=\"deleteBtn\" />";
		}
		html += "</td>";
		html += "</tr>";
	}
	
	$("tbody").html(html);
}

function redrawPaging(pb) {
	var html = "";
	
	html += "<span name=\"1\">|&lt;</span>";
	
	if($("#page").val() == "1") {
		html += "<span name=\"1\">&lt;</span>";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 - 1) + "\">&lt;</span>";
	}
	
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if($("#page").val() == i) {
			html += "<span class=\"on\" name=\"" + i + "\"><b>" + i + "</b></span>";
		} else {
			html += "<span name=\"" + i + "\">" + i + "</span>";
		}
	}
	
	if($("#page").val() == pb.maxPcount) {
		html += "<span name=\"" + pb.maxPcount + "\">&gt;</span>";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">&gt;</span>";
	}
	
	html += "<span name=\"" + pb.maxPcount + "\">&gt;|</span>";
	
	$("#pagingWrap").html(html);
}
</script>
</head>
<body>
<div id="loginArea">
	<div id="loginWrap">
		<form action="#" id="loginForm">
			아이디<input type="text" id="mId" name="mId" />
			비밀번호<input type="password" id="mPw" name="mPw" />
			<input type="button" value="로그인" id="loginBtn" />
		</form>
	</div>
	<div id="infoWrap">
		<span id="infoMsg">${sMNm}님 어서오세요.</span><input type="button" value="로그아웃" id="logoutBtn" />
	</div>
</div>
<div>
	<div class="write_area">
		<form action="#" id="actionForm" method="post">
			<!-- 기본값 : hidden -->
			<input type="hidden" id="sg" name="searchGbn" />
			<input type="hidden" id="st" name="searchTxt" />
			<input type="hidden" id="page" name="page" value="1" />
			
			<!-- 글작성,편집영역 -->
			<div id="loginInfo">
				로그인이 필요한 서비스 입니다.
				<input type="button" value="로그인" id="writeLoginBtn" />
			</div>
			<div id="writeInfo">
				<input type="hidden" name="mNo" id="mNo" value="${sMNo}" />
				<input type="hidden" name="obNo" id="obNo" />
				<span id="writer">${sMNm}</span><input type="text" name="obCon" id="obCon" />
				<input type="button" value="작성" id="writeBtn" />
				<input type="button" value="수정" id="updateBtn" />
				<input type="button" value="취소" id="cancelBtn" />
			</div>
		</form>
	</div>
	<div class="list_area">
		<table>
			<colgroup>
				<col width="100" />
				<col width="500" />
				<col width="100" />
			</colgroup>
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	<div class="paging_area">
		<!-- 검색 -->
		<select id="searchGbn">
			<option value="0">작성자</option>
			<option value="1">내용</option>
		</select>
		<input type="text" id="searchTxt" />
		<input type="button" value="검색" id="searchBtn" /><br/>
		<!-- 페이징 -->
		<div id="pagingWrap"></div>
	</div>
</div>
</body>
</html>









