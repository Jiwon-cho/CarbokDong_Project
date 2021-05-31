<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=(boolean)request.getAttribute("result");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<style>
	div#checkId-container{text-align:center;padding-top:50px;}
	span#duplicated{color:red;font-weight: bold;}
</style>
</head>
<body>
	<div id="checkId-container">
		<%if(result) {%>
			[<span><%=request.getParameter("nickName") %></span>]는 사용가능합니다.	
			<br><br>
			<button type="button" onclick="fn_close();">닫기</button>
		<%}else{ %>
			[<span id="duplicated"><%=request.getParameter("nickName") %></span>]는 사용중입니다.
			<br><br>
			<form action="<%=request.getContextPath() %>/checkDuplicateNickname" method="post">
				<input type="text" name="nikName" id="nikName">
				<input type="submit" value="중복검사" >
			</form>
		<%} %>
	</div>
	<script>
		const fn_close=()=>{
			opener.document.getElementById("nikName").value='<%=request.getParameter("nickName")%>'; 
			opener.document.getElementById("checknickName").value='1'
			opener.document.getElementById("email1").focus();
			window.close();
		}
	</script>
</body>
</html>