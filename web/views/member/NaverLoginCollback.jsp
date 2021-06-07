<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버로그인처리</title>
</head>
<body>
	<script>
		opener.parent.location.replace("<%=request.getContextPath()%>/");
		<%=request.getAttribute("script")%>;
	</script>
</body>
</html>