<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car,java.util.List" %>
<%
List<Car> list=(List<Car>)request.getAttribute("list");
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<%@ include file="/views/common/header.jsp" %>
<div class="list_container">
<div style="background-color:white;">
  <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/carList">전체 차량</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="소형" href="<%=request.getContextPath()%>/car/searchCartwo?carType=소형/준중형">소형/준중형</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/searchCar?carType=중형">중형</a>
    </li>
   <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/searchCar?carType=SUV">SUV</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/searchCar?carType=캠핑카">캠핑카</a>
    </li>
  </ul>
  </div>
      <div class="car_container">
      <%for(Car c: list){ %>
        <div class="car_list">
     
          <img
            src="<%=request.getContextPath() %>/images/car/<%=c.getCarModel() %>.png"
            alt="car"
            class="thumbnail"
          />
          <h3><%=c.getCarModel() %></h3>
          <br>
          <h6><%=c.getCarInfo() %></h6>
          
         <input type="hidden" name="carNB" value="<%=c.getCarNB()%>">
         <button class="reservation" onclick="location.assign('<%=request.getContextPath()%>/car/carView?carNB=<%=c.getCarNB()%>')">예약하기</button>
     
        </div>
        <%} %>
       
    </div>
    </div>
    <script>
    
    </script>
    
    <style>
    	body{
    		font-family: -apple-system, BlinkMacSystemFont;
    	}
    
      .header {
        width: 100%;
        height: 100px;
        background-color: rgb(0, 0, 0);
        color: white;
        text-align: center;
        font-size: 3em;
      }

      .list_container {
        margin: auto;
        margin-bottom: 150px;
        padding: 10px;
        height: 900px;
        width: 1700px;
       
      }

      .navbar {
        height: 10%;
        width: 100%;
        text-align: center;
      }
      .model {
        margin: auto;
      }

      .model_list {
        display: inline-block;
        border: 3px outset gray;
        list-style: none;
        margin: 20px;
        padding: 25px 50px;
      }

      .model_list:hover {
        cursor: pointer;
        background-color: wheat;
      }

      .car_container {
        text-align: justify;
        margin: 50px;
        margin-top: 0;
      }

      .car_list {
        display: inline-block;
        height: 300px;
        width: 260px;
        align-items: center;
        margin: 50px 20px 20px 20px;
        padding: 10px;
        padding-bottom: 30px;
        -webkit-box-shadow: 0px 10px 13px -7px #000000, 0px 0px 3px 2px rgba(0,0,0,0.17); 
		box-shadow: 0px 10px 13px -7px #000000, 0px 0px 3px 2px rgba(0,0,0,0.17);
      }

      .thumbnail {
        height: 50%;
        width: 100%;
      }

      .reservation {
        height: 30px;
        width: 100%;
        margin-top: 20px;
        cursor: pointer;
      }
      
      a.nav-link:hover{
		font-weight: bold;

	}
	
	.nav-link{
		color: black;
		font-family: -apple-system, BlinkMacSystemFont;
	}
	
	.nav-item{
		display:flex;
		border: 1px solid rgba(130, 130, 130, 0.28);
		height: 50px;
		justify-content: center;
		align-items: center;
	}
      
    </style>
    

    

<%@ include file="/views/common/footer.jsp" %>	