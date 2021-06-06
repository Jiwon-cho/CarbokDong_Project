<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
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

.searchPwd-container {
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
    <div class="searchPwd-container">
		<form name="searchPwdFrm" action="<%=request.getContextPath()%>/member/searchPwdEnd" method="post" >
		<center><h2>비밀번호 찾기</h2></center>
		<input type="text" class="text-field" name="userId" placeholder="아이디" required>
					<input type="text" class="text-field" name="name" placeholder="이름" required>
        <input type="text" class="text-field2" name="email1" placeholder="이메일" required> @ <input type="text" class="text-field2" name="email2" placeholder="주소" required>
        <center>
            <input type="submit" class="submit-btn" value="찾기" />&nbsp;
            <input type="button" class="submit-btn" value="닫기" onclick="window.close();"/>	
            </center>
		</form>
	</div>
</body>
</html>