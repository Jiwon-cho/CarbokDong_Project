<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>
	삭제하실 회원 아이디: 
	</h2>
	<form action="<%=request.getContextPath()%>/admin/deleteEnd" method="post">
	<input type="text" name="memberId" >
	<input id="dd" type="submit" value="확인">
	<button onclick="fn_close();">취소</button>
	</form>
	<script>
	const fn_close=()=>{
		window.close();
	};
	</script>
</body>
</html>