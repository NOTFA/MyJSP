<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="head.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
			$(".mytr").css("cursor","pointer");
			
			$(".mytr").click(function(){
				var seq = $(this).attr("seq");
				location.href="memberUpdate.do?seq="+seq;
			});
	});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<!-- 중간 -->
		<div class="row">
		
		<div class="col-xs-3">
				<button style="margin: 20px 0;" type="button" class="btn" onclick="location.href='/MyJSP/memberInsert.do';">회원등록</button>
				<button style="margin: 20px 0;" type="button" class="btn" onclick="location.href='/MyJSP/memberDelete.do';">회원삭제</button>
			</div>
		
		</div>
		<div class="row"><!-- xs( xm md lg -->
			<div class="col-xs-12">
				<table class="table">
					<tr>
						<td>헤더열</td>
						<td>순번</td>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>성별</td>
						<td>가입날짜</td>
					</tr>
					<%
// 						List<MemberVO> list = (List) request.getAttribute("myList");
// 						for( MemberVO vo :list)
// 							out.println(vo.getName());
					%>
					<c:forEach items="${myList}" var="i">
						<tr class="mytr" seq="${i.seq}">
							<td><input type="checkbox" name="seq" value="${i.seq}"/></td>
							<td>${i.seq}</td>
							<td>${i.id}</td>
							<td>${i.pwd}</td>
							<td>${i.name}</td>
							<td>${i.gender}</td>
							<td>${i.joindate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
		</div>
		<div class="row">
			<div class="col-xs-12">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					
					<c:forEach begin="1" end="${membercnt}" var="i">
					<li class="page-item"><a class="page-link" href="${path}/member.do?pageNum=${i}">${i}</a></li>
					</c:forEach>
					
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
		<!-- 발 -->
		<div class="row">
			<div class="col text-center">
				copy right 멍구
			</div>
		</div>
	</div>
</body>
</html>





