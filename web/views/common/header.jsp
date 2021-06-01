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


    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>  
<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">   --%>
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=East+Sea+Dokdo&display=swap"
      rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">   

  </head>

  
 <header> 
<!-- <div class="container-fluid"> -->
   <%-- <div class="row">
    <div class="col" style="background-color:rgb(211, 202, 202); height:30px;" >
     <%if(loginMember==null) {%>
     <ul class="nav justify-content-end" style="height:30px;">
       <!--  <li class="nav-item">
          <a class="nav-link" href="#" ><h5>Link</h5></a>
        
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" ><h5>Link</h5></a>
        
        </li> -->
    <li><a href="<%=request.getContextPath() %>/loginPage">로그인</a></li>
        <li><a href="<%=request.getContextPath() %>/enrollMember">회원 가입</a></li>
      </ul>
	<%}else {%>
	<ul class="nav justify-content-end" style="height:30px;">
		<li><a href="<%=request.getContextPath()%>/myPage">마이페이지</a></li>
	  	<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
	  </ul>
	<%} %>
        <div class="row">
    <div class="col" style="background-color:rgb(211, 202, 202); height:10px;" ></div></div>
    </div>

</div>
<div class="row">
    <div class="col" style=" height:100px;text-align: center;margin-top: 40px;"><h1> <a href="" style="text-decoration: none; color: green">차박왕 카복동 </a></h1></div>


</div>
  <div class="row">

    <div class="col" style="background-color:lavender;text-align: center;">
      <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link" href="#" id="menu-bar">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="menu-bar">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="menu-bar">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" id="menu-bar">Disabled</a>
        </li>
      </ul>
    </div>

  </div>
    <div class="row">
    <div class="col" style="height: 50px;"></div>
</div>  --%>
     <div class="headbar">
       <%if(loginMember==null) {%>
      <ul class="list">
        <li><a href="<%=request.getContextPath() %>/loginPage">로그인</a></li>
        <li><a href="<%=request.getContextPath() %>/enrollMember">회원 가입</a></li>
      </ul>
	<%}else {%>
	  <ul class="head-list">
	  	<li><a href="<%=request.getContextPath()%>/myPage">마이페이지</a></li>
	  	<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
	  </ul>
	<%} %>

    </div>
    <div class="navbar__logo">
      <a href="<%=request.getContextPath()%>">차박왕카복동</a>
    </div>
    
    <div class="navbar">
      <div class="navbar__menu">
        <li><a href="<%=request.getContextPath()%>/borad/mainBorad">커뮤니티</a></li>
        <li>
          <a
            href="https://www.google.com/maps/d/u/0/viewer?ie=UTF8&oe=UTF8&msa=0&mid=1GS6L7YRskgtfzVebJsDhbgbNsyQ&ll=36.12610142320005%2C128.9769752008968&z=8"
          >
            여행지 지도
          </a>
        </li>
        <li><a href="<%=request.getContextPath()%>/car/carList">렌트 차 종류</a></li>
        <!-- <li><a href="">마이페이지</a></li> -->
        <li><a href="">Q&A</a></li>
      </div>  
      <!-- <ul class="navbar__icons">
        <li>
          <a href="./mini_Login.html"><i class="fas fa-sign-in-alt"></i></a>
        </li>
      </ul> -->
<!-- 
    </div> -->
  </header>
