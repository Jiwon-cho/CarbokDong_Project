<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
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

.updatePassword-container {
    background-color: #EEEFF1;
    width: 320px;
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

.submit-btn {
  font-size: 14px;
  background-color: #1BBC9B;
  border: 0px;
  border-radius: 5px;
  margin-bottom: 30px;
  width: 130px;
  padding: 10px;
  
 
}
    </style>

    <div class="updatePassword-container">
		<form name="updatePwdFrm" action="<%=request.getContextPath()%>/updatePasswordEnd" method="post" >
					<input type="password" class="text-field" name="password" id="password" placeholder="현재 비밀번호" required>
					<input type="password" class="text-field" name="password_new" placeholder="변경할 비밀번호" id="password_new" required>
					<input type="password" class="text-field" id="password_chk" placeholder="비밀번호 확인" required><br>
						<input type="submit" class="submit-btn" value="변경" />&nbsp;
						<input type="button" class="submit-btn" value="닫기" onclick="window.close();"/>	
			<input type="hidden" name="userId" value="<%=request.getParameter("userId")%>">
		</form>
	</div>
	<script>
		document.getElementById("password_chk").addEventListener("blur",e=>{
			let pw=document.getElementById("password_new").value.trim();
			let pwck=e.target.value.trim();
			if(pw!=pwck){
				alert("비밀번호가 일치하지 않습니다");
				document.getElementById("password_new").focus();
			}
			
		});
		
	</script>


</body>
</html>