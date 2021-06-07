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
	입력할 차량 정보를 입력하세요. 
	</h2>
	<form action="<%=request.getContextPath()%>/admin/insertCarEnd" method="post" enctype="multipart/form-data">
	<p>차량 고유 번호: <input type="text" name="carNo" placeholder="(숫자로만 입력하세요)"></p>
	<p>차량 타입: <input type="text" name="carType" ></p>
	<p>모델명: <input type="text" name="carModel" ></p>
	<p>차량 PPL: <input type="text" name="carPPL" placeholder="(숫자로만 입력하세요)"></p>
	<p>차량 갯수: <input type="text" name="carTotal" placeholder="(숫자로만 입력하세요)"></p>
	<p>차량 PSB: <input type="text" name="carPSG" placeholder="(숫자로만 입력하세요)"></p>
	<p>차량 정보: <textarea name="carInfo"></textarea></p>
	<p>차량 가격: <input type="text" name="carPrice" placeholder="(숫자로만 입력하세요)"></p>
	<p>차량 이미지: <input type="file" name="fileName"></p>
	
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