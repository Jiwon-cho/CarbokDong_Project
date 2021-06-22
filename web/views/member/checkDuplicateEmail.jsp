<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=(boolean)request.getAttribute("result");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
	div#checkId-container{text-align:center;padding-top:50px;}
	span#duplicated{color:red;font-weight: bold;}
</style>
</head>
<body>
	<div id="checkId-container">
		<%if(result) {%>
			[<span><%=request.getParameter("email") %></span>]는 사용가능합니다.	
			<br><br>
			<button type="button" onclick="fn_close();">닫기</button>
		<%}else{ %>
			[<span id="duplicated"><%=request.getParameter("email") %></span>]는 사용중입니다.
			<br><br>
			<form action="<%=request.getContextPath() %>/checkDuplicateEmail" method="post">
				<input name="email1" type="text" id="email1" size="15">
				 @ 
				<input name="email2" type="text" id="email2" size="20">
				<input type="hidden" name="email" id="email">
				<input type="submit" value="중복검사" onclick="fn_emailbtn();">
			</form>
		<%} %>
	</div>
	<script>
		const fn_emailbtn=()=>{
			const email1=document.getElementById("email1").value;
			const email2=document.getElementById("email2").value;
			const email=email1+"@"+email2;
			document.getElementById("email").value=email;
		}
		const fn_close=()=>{
				opener.document.getElementById("email1").value='<%=request.getParameter("email")%>'.split("@")[0]; 
				opener.document.getElementById("email2").value='<%=request.getParameter("email")%>'.split("@")[1];
				opener.document.getElementById("checkEmail").value='1'
				window.close();
		}
	</script>
	
	
</body>
</html>