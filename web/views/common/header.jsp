<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.member.model.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카복동</title>
	<link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Black+Han+Sans&family=East+Sea+Dokdo&display=swap"
      rel="stylesheet">
      <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/headerStyle.css">   

  </head>
  
 <header> 
     <nav id="navbar__main">
      <div id="navbar__logo">
        <a href="<%=request.getContextPath()%>" style="text-decoration: none;"> 차박왕카복동</a>
      </div>
      <div id="navbar__menu">
        <li><a href="<%=request.getContextPath()%>/borad/mainBorad">커뮤니티</a></li>
        <li>
          <a href="<%=request.getContextPath()%>/map">여행지 지도</a>
        </li>
        <li><a href="<%=request.getContextPath()%>/car/carList">렌트 차 종류</a></li>
        <li><a href="<%=request.getContextPath()%>/member/QnAList">Q&A</a></li>
      </div>
      <ul class="navbar__icons">
       <%if(loginMember==null) {%>
      <ul class="list">
        <li><a href="<%=request.getContextPath() %>/loginPage">로그인</a></li>
        <li><a href="<%=request.getContextPath() %>/enrollMember">회원 가입</a></li>
      </ul>
	<%}else if(loginMember.getMemberType()==0){%>
	  <ul class="head-list">
	  	<li><a href="<%=request.getContextPath() %>/admin/adminMain">관리자페이지</a></li>
	  	<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
	  </ul>
	<%}else{ %>
	<ul class="head-list">
	  	<li><a href="<%=request.getContextPath() %>/myPage">마이페이지</a></li>
	  	<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
	  </ul>
	<%} %>
      </ul>

      <a href="#" class="navbar__toggleBtn">
        <i class="fas fa-bars"></i></a>
    </nav>
	<script>
      const toggleBtn = document.querySelector(".navbar__toggleBtn");
      const menu = document.querySelector("#navbar__menu");
      const icons = document.querySelector(".navbar__icons");

      toggleBtn.addEventListener("click", () => {
        menu.classList.toggle("active");
        icons.classList.toggle("active");
      });
    </script>
  </header>
