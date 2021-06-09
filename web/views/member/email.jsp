<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int random=(int)session.getAttribute("random");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일인증</title>
</head>
<body>
	<style>
    * {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}

body {
  margin: 0;
  background-color: #1BBC9B;
}

.searchId-container {
    background-color: #EEEFF1;
    width: 380px;
    border: none;
    border-radius: 5px;
    margin: 50px auto;
    padding: 20px;
    
    
}

.searchId-container2{
    background-color: #EEEFF1;
    width: 380px;
    border: none;
    border-radius: 5px;
    margin: 50px auto;
    padding: 20px;
    
    
}

.text-field {

  font-size: 14px;
  border:none;
  margin-bottom:30px;
  width: 260px;
 
}
.text-field2{
    
    font-size: 14px;
    border:none;
    margin-bottom:30px;
    width: 152px;
   
  }

.submit-btn {
  font-size: 14px;
  background-color: #1BBC9B;
  border: 0p;
    border-radius: 5px;
  margin-bottom: 20px;
  width: 130px;
  padding: 10px;
  
 
}
    </style>
    <div class="searchId-container">
    	<center><h2>이메일 인증번호</h2></center>
		<form name="emailFrm" action="<%=request.getContextPath() %>/member/emailEnd" method="post" >
					<input type="text" class="text-field" onkeyup="checkCode()" name="code" id="code" placeholder="인증번호" required><div id="checkCode"></div>
					<input type="hidden" name="random" value="<%=random %>">
        <center>
            <input type="submit" class="submit-btn" id="hi" value="인증번호 확인" onclick="btn_result"/>&nbsp;
            <input type="button" class="submit-btn" value="닫기" onclick="window.close();"/>	
            </center>
		</form>
	</div>
</body>
</html>