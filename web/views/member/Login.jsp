<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String referer = (String) request.getAttribute("referer");
%>
<%@ include file="/views/common/header.jsp"%>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<div class="inner_login">
	<div class="login2">
		<form id="" action="<%=request.getContextPath()%>/login"
			method="post">

			<input type="hidden" name="referer" value="<%=referer%>">
			<div class="box_login">
				<div class="inp_text">
					<label for="loginId" class="screen_out">아이디</label> <input
						type="text" id="loginId" name="loginId" placeholder="ID">
				</div>
				<div class="inp_text">
					<label for="loginPw" class="screen_out">비밀번호</label> <input
						type="password" id="password" name="password"
						placeholder="Password">
				</div>
			</div>
			<button type="submit" class="btn_login">로그인</button>
			<br>
			<center>
			<div id="naver_id_login" ></div>
			</center>
		</form>
		<form>
			<input type="button" class="btn_serch" value="아이디찾기"
				onclick="fn_searchId();"> <input type="button"
				class="btn_serch" value="비밀번호찾기" onclick="fn_searchPwd();">
		</form>
		<form id="" action="<%=request.getContextPath()%>/enrollMember"
			method="post">
			<button type="submit" class="btn_newMember">회원가입</button>
		</form>
	</div>
</div>
<style>
.btn_serch {
	margin: 10px 1px 0;
	width: 48%;
	height: 40px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: skyblue;
}

.inner_login {
	left: 50%;
	top: 50%;
	margin: 120px;
}

.login2 {
	position: relative;
	width: 320px;
	margin: 0 auto;
}

.screen_out {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	line-height: 0;
	text-indent: -9999px;
}

button, input, select, td, textarea, th {
	font-size: 13px;
	line-height: 1.5;
	-webkit-font-smoothing: antialiased;
}

.login2 .box_login {
	margin: 35px 0 0;
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
	box-sizing: border-box;
}

.login2 .inp_text {
	position: relative;
	width: 100%;
	margin: 0;
	padding: 18px 19px 19px;
	box-sizing: border-box;
}

.login2 .inp_text+.inp_text {
	border-top: 1px solid #ddd;
}

.inp_text input {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 13px;
	color: #000;
	border: none;
	outline: 0;
	-webkit-appearance: none;
	background-color: transparent;
}

.btn_login {
	margin: 15px 0 15px;
	width: 100%;
	height: 40px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: skyblue;
}

.btn_newMember {
	margin: 10px 0 0;
	width: 100%;
	height: 40px;
	border-radius: 3px;
	font-size: 16px;
	color: #fff;
	background-color: skyblue;
}

.btn_newNaverMember {
	margin: 10px 0 0;
	width: 100%;
	height: 40px;
	border-radius: 3px;
	font-size: 16px;
	color: gray;
	background-color: greenyellow;
}
</style>
<script>
	    const fn_searchId=()=>{
			open("<%=request.getContextPath()%>/member/searchId","searchId"
					,"left=200px,top=200px,width=450px,height=400px");
		}
	    const fn_searchPwd=()=>{
			open("<%=request.getContextPath()%>/member/searchPwd","searchPwd"
					,"left=200px,top=200px,width=450px,height=400px");
		}
    </script>
<script type="text/javascript">
	  	//var naver_id_login = new naver_id_login("uESYdXxeCHDQJ1wuF95U", "http://localhost:9090/KH-SEMI-Carbokdong/views/member/Callback.jsp");
	  	var naver_id_login = new naver_id_login("uESYdXxeCHDQJ1wuF95U", "https://rclass.iptime.org/21PM_Carbokdong/views/member/Callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,40);
	  	//naver_id_login.setDomain("http://localhost:9090/KH-SEMI-Carbokdong/Login");
	  	naver_id_login.setDomain("https://rclass.iptime.org/21PM_Carbokdong/Login");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
  </script>
<%@ include file="/views/common/footer.jsp"%>
