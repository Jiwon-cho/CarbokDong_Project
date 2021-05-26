<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<style>
    .inner_login {
        position: absolute;
        left: 50%;
        top: 50%;
        margin: -145px 0 0 -160px;
    }
    .login2{
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
    body, button, input, select, td, textarea, th {
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
        margin: 15px 0 0;
        width: 100%;
        height: 40px;
        border-radius: 3px;
        font-size: 16px;
        color: #fff;
        background-color: skyblue;
    }
    .btn_newMember{
        margin: 10px 0 0;
        width: 100%;
        height: 40px;
        border-radius: 3px;
        font-size: 16px;
        color: #fff;
        background-color: skyblue;
    }
    .btn_newNaverMember{
        margin: 10px 0 0;
        width: 100%;
        height: 40px;
        border-radius: 3px;
        font-size: 16px;
        color: gray;
        background-color: greenyellow;
    }
    </style>
    <div class="inner_login">
        <div class="login2">
            <form  id="" action="" method="post">
                <input type="hidden" name="" value="">
                <div class="box_login">
                    <div class="inp_text">
                    <label for="loginId" class="screen_out">아이디</label>
                    <input type="text" id="loginId" name="loginId" placeholder="ID" >
                    </div>
                    <div class="inp_text">
                    <label for="loginPw" class="screen_out">비밀번호</label>
                    <input type="password" id="loginPw" name="password" placeholder="Password" >
                    </div>
                </div>
                <button type="submit" class="btn_login" >로그인</button><br>
                <div id="naver_id_login" class="btn_newNaverMember"></div>
                <button class="btn_newMember">회원가입</button>
            </form>
            
        </div>
    </div>
    
    <script type="text/javascript">
  	var naver_id_login = new naver_id_login("uESYdXxeCHDQJ1wuF95U", "http://localhost:9090/SemiProject/views/member/Callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:9090/SemiProject/Login");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
</body>
</html>