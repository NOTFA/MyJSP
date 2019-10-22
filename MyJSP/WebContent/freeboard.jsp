<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="head.jsp"/>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"/>
		<!-- 중간 -->
		<div class="row">
			<div class="col">
			</div>
		</div>
		
		<button type="button" class="btn" onclick="location.href='/MyJSP/memberInsert.do';">일괄등록</button>
		<button type="button" class="btn" onclick="location.href='/MyJSP/memberInsert.do';">선택삭제</button>
		<button type="button" class="btn" onclick="location.href='/MyJSP/memberInsert.do';">수정</button>
		<!-- 발 -->
		<div class="row">
			<div class="col text-center">
				copy right 멍구
			</div>
		</div>
	</div>
</body>
</html>





