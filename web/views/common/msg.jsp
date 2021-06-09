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
<title>알림메세지</title>
</head>
<body>
	<script>
		if(<%=request.getAttribute("emailresult")!=null%>){
			opener.document.getElementById("emailresult").value=1
		}
		alert('<%=msg%>');
		<%=request.getAttribute("script")!=null?request.getAttribute("script"):""%>;
		location.replace('<%=request.getContextPath()%><%=loc%>');
	</script>
</body>
</html>