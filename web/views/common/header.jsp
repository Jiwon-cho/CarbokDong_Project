<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카복동</title>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">  
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>  
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=East+Sea+Dokdo&display=swap"
      rel="stylesheet"
    />
  </head>
 <header> 
  <body>
    <div class="headbar">
      <ul class="list">
        <li>로그인</li>
        <li>회원 가입</li>
        
      </ul>

    </div>
    <div class="navbar__logo">
      <a href="<%=request.getContextPath()%>">차박왕카복동</a>
    </div>
    
    <div class="navbar">
      <div class="navbar__menu">
        <li><a href="">커뮤니티</a></li>
        <li>
          <a
            href="https://www.google.com/maps/d/u/0/viewer?ie=UTF8&oe=UTF8&msa=0&mid=1GS6L7YRskgtfzVebJsDhbgbNsyQ&ll=36.12610142320005%2C128.9769752008968&z=8"
          >
            여행지 지도
          </a>
        </li>
        <li><a href="">렌트 차 종류</a></li>
        <!-- <li><a href="">마이페이지</a></li> -->
        <li><a href="">Q&A</a></li>
      </div>
      <!-- <ul class="navbar__icons">
        <li>
          <a href="./mini_Login.html"><i class="fas fa-sign-in-alt"></i></a>
        </li>
      </ul> -->

    </div>
  </header>