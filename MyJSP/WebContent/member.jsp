<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Set"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="head.jsp"/>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<!-- 중간 -->
		<div class="row">
			<div class="col">
				<%
					HashMap<String,String> hm = (HashMap)request.getAttribute("hm");
					Set<String> keys = hm.keySet();
					for(String key : keys)
						out.println(key + hm.get(key) + "<br/>");
				%>
				<c:forEach items="${hm}" var="i">
					${i}<br/>
				</c:forEach>
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





