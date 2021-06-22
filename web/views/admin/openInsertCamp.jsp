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
	입력할 캠핑장 정보를 입력하세요. 
	</h2>
	<form action="<%=request.getContextPath()%>/admin/insertCampEnd" method="post">
	<p>캠핑장 이름: <input type="text" name="campName" ></p>
	<p>캠핑장 위치: <textarea name="campLoc" ></textarea></p>
	<p>캠핑장 정보: <textarea name="campInfo"></textarea></p>
	<p>캠핑장 LAT: <input type="text" name="campLAT" placeholder="(숫자로만 입력하세요)"></p>
	<p>캠핑장 Long: <input type="text" name="campLong" placeholder="(숫자로만 입력하세요)"></p>
	<p>캠핑장 가격: <input type="text" name="campPrice" placeholder="(숫자로만 입력하세요)"></p>
	<p>캠핑장 옵션: <textarea name="campFA" ></textarea></p>
	
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