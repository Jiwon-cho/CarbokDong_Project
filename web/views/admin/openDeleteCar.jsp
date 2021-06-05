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
	삭제할 차량 정보를 입력하세요. 
	</h2>
	<form action="<%=request.getContextPath()%>/admin/DeleteCarEnd" method="post">
	<p>차량 고유 번호: <input type="text" name="carNo" placeholder="(숫자로만 입력해주세요)"></p>

	
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