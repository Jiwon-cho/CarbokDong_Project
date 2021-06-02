<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

    <div class="inner_login">
        <div class="login2">
            <form  id="" action="<%=request.getContextPath() %>/login" method="post">
                <input type="hidden" name="" value="">
                <div class="box_login">
                    <div class="inp_text">
                    <label for="loginId" class="screen_out">아이디</label>
                    <input type="text" id="loginId" name="loginId" placeholder="ID" >
                    </div>
                    <div class="inp_text">
                    <label for="loginPw" class="screen_out">비밀번호</label>
                    <input type="password" id="password" name="password" placeholder="Password" >
                    </div>
                </div>
                <button type="submit" class="btn_login" >로그인</button><br>
                <div id="naver_id_login" class="btn_newNaverMember"></div>
                
            </form>
            <form id="" action="<%=request.getContextPath() %>/memberEnrollEnd" method="post">
            	<button type="submit" class="btn_newMember" >회원가입</button>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("uESYdXxeCHDQJ1wuF95U", "http://localhost:9090/KH-SEMI-Carbokdong/views/member/Callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://localhost:9090/KH-SEMI-Carbokdong/Login");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
  </script>
<%@ include file="/views/common/footer.jsp" %>	