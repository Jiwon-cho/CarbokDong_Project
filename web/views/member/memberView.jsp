<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m=(Member)request.getAttribute("member");
%>   
<%@ include file="/views/common/header.jsp" %>
<center>
	<form action="<%=request.getContextPath() %>/memberUpdate" method="post" id="memberFrm">
		<table width="800">
			<tr height="40">
				
				<td align="center"><b>[회원정보]</b></td>
			</tr>
			
		</table>
		<table width="700" height="450" cellpadding="0" style="border-collapse: collapse;">
			<tr height="7">
				<td colspan="3"><input type="hidden" id="memberType" name="memberType" value="1"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">회원 ID</td>
				<td><input type="text" name="userId" id="userId_" value="<%=m.getUserId()%>" readonly></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">이 름</td>
				<td><input type="text" name="userName" id="userName" value="<%=m.getUserName()%>" readonly></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">성 별</td>
				<td><input type="radio" name="gender" id="gender0" value="M" <%=m.getGender().equals("M")?"checked":"" %> disabled>
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F" <%=m.getGender().equals("F")?"checked":"" %> disabled>
					<label for="gender1">여</label>
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">닉네임</td>
				<td><input type="text" name="nikName" id="nikName" value="<%=m.getNikname()%>" readonly></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">이메일</td>
				<td>
				<input name="email1" type="text" class="box" id="email1" size="15" value="<%=m.getEmail().split("@")[0]%>">
				 @ 
				<input name="email2" type="text" class="box" id="email2" size="15" value="<%=m.getEmail().split("@")[1]%>">
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>	
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">주 소</td>
				<td><input type="text" size="15" name="sample4_postcode" id="sample4_postcode"
					placeholder="우편번호" value="<%=m.getAddress().split("/")[1]%>" readonly> <input type="button" value="우편번호 찾기" onclick="sample4_execDaumPostcode()"><br>
				<br> <input type="text" size="30" name="sample4_roadAddress" id="sample4_roadAddress"
					placeholder="도로명주소" value="<%=m.getAddress().split("/")[2]%>" readonly> <input type="text" size="30" name="sample4_jibunAddress" id="sample4_jibunAddress"
					placeholder="지번주소" value="<%=m.getAddress().split("/")[0]%>" readonly><br>
				<br> <input type="text" name="address" placeholder="나머지 주소" size="70" value="<%=m.getAddress().split("/")[3]%>">
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="정보변경" onclick="fn_updateMember();">
					<input type="button" value="비밀번호변경" onclick="fn_updatePassword();"/>
					<input type="button" value="탈퇴" onclick="fn_deleteMember();"/>
				</td>
			</tr>
			</table>
			</form>
			<form name="duplicateFrm" action="" method="post">
				<input type="hidden" name="userId">
				<input type="hidden" name="nickName">
			</form>
			</center>
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	const fn_updatePassword=()=>{
		open("<%=request.getContextPath()%>/member/updatePassword?userId=<%=m.getUserId()%>","updatePassword"
				,"left=200px,top=200px,width=400px,height=370px");
	}
	const fn_updateMember=()=>{
		const updateFrm=$("#memberFrm");
		updateFrm.attr("action","<%=request.getContextPath()%>/memberUpdate");
		updateFrm.submit();
	}
	const fn_deleteMember=()=>{
		if(confirm("정말로 탈퇴하시겠습니까?")){
			location.replace("<%=request.getContextPath()%>/deleteMember?userId=<%=m.getUserId()%>");
		}
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
<%@ include file="/views/common/footer.jsp" %>	