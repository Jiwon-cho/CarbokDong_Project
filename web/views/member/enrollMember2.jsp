<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<center>
	<form action="<%=request.getContextPath()%>/memberEnrollEnd"
		method="post" name="" onsubmit="return fn_invalidate();">
		<table width="800">
			<tr height="40">
				<td align="center"><b>[회원가입]</b></td>
			</tr>

		</table>
		<table width="700" height="650" cellpadding="0"
			style="border-collapse: collapse;">
			<tr height="7">
				<td colspan="3"><input type="hidden" id="memberType"
					name="memberType" value="1">
					<hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">회원 ID</td>
				<td><input type="text" name="userId" id="userId_" /> <input
					type="button" value="중복확인" onclick="fn_duplicateId();"></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">비밀번호</td>
				<td><input type="password" name="password" id="password_" /></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">비밀번호 확인</td>
				<td><input type="password" name="pwdCheck" id="pwCheck" /> <input
					type="button" value="확인" name="pwdCheckBtn" id="pwdCheckBtn"
					onclick="fn_pwcheck();"></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">이 름</td>
				<td><input type="text" name="userName" id="userName" /></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">주민등록번호</td>
				<td><input name="userNo1" type="number" class="box"
					id="userNo1" size="15"> - <input name="userNo2"
					type="number" class="box" id="userNo2" size="20"></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">닉네임</td>
				<td><input type="text" name="nikName" id="nikName" /> <input
					type="button" value="중복확인" name="nikNameBtn"
					onclick="fn_nikNameBtn();"></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>

			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">이메일</td>
				<td><input name="email1" type="text" class="box" id="email1"
					size="15"> @ <input name="email2" type="text" class="box"
					id="email2" size="20"> <input type="button"
					value="이메일 중복확인" onclick="fn_duplicateEmail();"> <input
					type="button" value="인증번호 발송" onclick="fn_email();"> <%-- <input type="hidden" readonly="readonly" name="code_check"
					id="code_check" value="<%=getRandom()%>" /> --%></td>
			</tr>
			<!-- <tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td></td>
				<td width="15%">인증번호</td>
				<td><input type="text" name="emailCheck" id="emailCheck" /> <input
					type="button" value="확인" id=""></td>
			</tr> -->
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">주 소</td>
				<td><input type="text" size="15" name="sample4_postcode"
					id="sample4_postcode" placeholder="우편번호" readonly> <input
					type="button" value="우편번호 찾기" onclick="sample4_execDaumPostcode()"><br>
					<br> <input type="text" size="30" name="sample4_roadAddress"
					id="sample4_roadAddress" placeholder="도로명주소" readonly> <input
					type="text" size="30" name="sample4_jibunAddress"
					id="sample4_jibunAddress" placeholder="지번주소" readonly><br>
					<br> <input type="text" name="address" placeholder="나머지 주소"
					size="70"></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td></td>
				<td width="15%">운전면허</td>
				<td><input type="number" name="driver" id="driver2" size="30" />
					<input type="button" value="확인" onclick="driverBtn();"></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="확인">
					<input type="reset" value="취소"></td>
			</tr>
		</table>

	</form>
	<form name="duplicateFrm" action="" method="post">
		<input type="hidden" id="emailresult" value="0"> 
		<input type="hidden" name="userId"> 
		<input type="hidden" name="email"> 
		<input type="hidden" name="nickName"> 
		<input type="hidden" id="checknickName" value="0"> 
		<input type="hidden" id="checkId" value="0"> 
		<input type="hidden" id="checkEmail" value="0"> 
		<input type="hidden" id="checkpwd" value="0"> 
		<input type="hidden" id="checkdriver" value="0">
		<input type="hidden" name="checkaddress" value="0">
	</form>
</center>
<script src="https://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	const fn_email=()=>{
		const code_check=$("#code_check").val();
		const email1=$("#email1").val();
		const email2=$("#email2").val();
		const reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		const email=email1+"@"+email2;
		if(!reg_email.test(email)) {     
	    	 alert("이메일형식이 올바르지 않습니다.");
	    	 
	     }                            
	     else {                       
	    	 open("<%=request.getContextPath()%>/member/email?email1="+email1+"&email2="+email2+"&code_check="+code_check,"email"
	 				,"left=200px,top=200px,width=450px,height=400px");     
	     }  
	}
	const fn_invalidate=()=>{
		const userName=$("#userName").val();
		const userNo1=$("#userNo1").val();
		const userNo2=$("#userNo2").val();
		const email1=$("#email1").val();
		const email2=$("#email2").val();
		const password=$("#password_").val();
		const checkpwd=$("#checkpwd").val();		
		const userId=$("#userId_").val();
		const checkId=$("#checkId").val();
		const nikName=$("#nikName").val();
		const checknickName=$("#checknickName").val();
		const checkaddress=$("#sample4_postcode").val();
		const checkdriver=$("#checkdriver").val();
		const emailresult=$("#emailresult").val();
		
		if(userId.trim()==""){
			alert("아이디를 입력해주세요");
			$("#userId_").focus();
			return false;
		}
		if(checkId==0){
			alert("아이디 중복확인을 해주세요");
			$("#userId_").focus();
			return false;
		}
		if(password.trim()==""){
			alert("비밀번호를 입력해주세요");
			$("#password_").focus();
			return false;
		}
		if(checkpwd==0){
			alert("비밀번호 확인을 해주세요");
			$("#pwdCheck").focus();
			return false;
		}
		if(userName.trim()==""){
			alert("이름을 입력해주세요");
			$("#userName").focus();
			return false;
		}
		if(userNo1==null || userNo2==null){
			alert("주민등록번호를 입력해주세요");
			$("#userNo1").focus();
			return false;
		}
		if(userNo1.trim().length>6 || userNo1.trim().length<6){
			alert("주민번호 앞자리는 6자리 숫자로 입력해주세요");
			$("#userNo1").focus();
			return false;
		}
		if(userNo2.trim().length>7 || userNo2.trim().length<7){
			alert("주민번호 뒷자리는 7자리 숫자로 입력해주세요");
			$("#userNo2").focus();
			return false;
		}
		
		if(nikName.trim()==""){
			alert("닉네임을 입력해주세요");
			$("#nikName").focus();
			return false;
		}
		if(checknickName==0){
			alert("닉네임 중복확인을 해주세요");
			$("#nikName").focus();
			return false;
		}
		if(email1.trim()=="" || email2.trim()==""){
			alert("이메일을 입력해주세요");
			$("#email1").focus();
			return false;
		}
		if(checkEmail==0){
			alert("이메일 중복확인을 해주세요");
			$("#email1").focus();
			return false;
		}
		if(emailresult==0){
			alert("이메일 인증을 해주세요");
			return false;
		}
		if(checkaddress.trim()==""){
			alert("주소를 입력해주세요");
			return false;
		}
		if(checkdriver==0){
			alert("운전면허 확인을 해주세요");
			$("#driver2").focus();
			return false;
		}
	}
	const fn_nikNameBtn=()=>{
		const status="width=300px,height=200px,left=500px,top=500px";
		const title="duplicateNickname";
		const url="<%=request.getContextPath()%>/checkDuplicateNickname";
		open("",title,status);
		console.log(duplicateFrm);
		duplicateFrm.nickName.value=$("#nikName").val();
		duplicateFrm.target=title;
		duplicateFrm.action=url;
		duplicateFrm.submit();
	}
	const driverBtn=()=>{
		const driver=$("#driver2").val();
		if(driver.trim().length>12 || driver.trim().length<12){
			alert("12숫자를 제대로 입력하세요");
			$("#driver2").focus();
			$("#checkdriver").val("0");
		}else{
			alert("확인되셨습니다!");
			$("#checkdriver").val("1");
		}
	}
	const fn_pwcheck=()=>{
		const pw=$("#password_").val();
		const pwck=$("#pwCheck").val();
		if(pw!=pwck){
			alert("패스워드가 일치하지 않습니다.");
			$("#checkpwd").val("0");
		}else{
			alert("패스워드가 일치합니다.");
			$("#checkpwd").val("1");
		}
	}
	const fn_duplicateEmail=()=>{
		const status="width=300px,height=200px,left=500px,top=500px";
		const title="duplicateEmail";
		const url="<%=request.getContextPath()%>/checkDuplicateEmail";
		open("",title,status);
		console.log(duplicateFrm);
		duplicateFrm.email.value=$("#email1").val()+"@"+$("#email2").val();
		duplicateFrm.target=title;
		duplicateFrm.action=url;
		duplicateFrm.submit();
	}
	const fn_duplicateId=()=>{
		const status="width=300px,height=200px,left=500px,top=500px";
		const title="duplicateId";
		const url="<%=request.getContextPath()%>/checkDuplicateId";
		open("",title,status);
		console.log(duplicateFrm);
		duplicateFrm.userId.value=$("#userId_").val();
		duplicateFrm.target=title;
		duplicateFrm.action=url;
		duplicateFrm.submit();
	}
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드.
 				
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가
                // 법정동의 경우 마지막 문자가 "동/로/가"
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만듬
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 					
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        
        }).open();
    }
</script>
<%@ include file="/views/common/footer.jsp"%>