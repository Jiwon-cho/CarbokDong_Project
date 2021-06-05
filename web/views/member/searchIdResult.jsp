<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.member.model.vo.Member" %>
<%
	Member searchId=(Member)session.getAttribute("searchId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과</title>
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
	
		<div class="searchId-container2">
			<form name="searchIdFrm" action="" method="post" >
	        	<center>
	       			<p>아이디 찾기</p>
	                <p>회원가입 시 사용한 아이디는 (<%=searchId.getUserId() %>)입니다</p>
	                <input type="button" class="submit-btn" value="닫기" onclick="window.close();"/>
	            </center>
	    	</form>
		</div>
</body>
</html>