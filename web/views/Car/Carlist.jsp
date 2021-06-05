<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car,java.util.List" %>
<%
List<Car> list=(List<Car>)request.getAttribute("list");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="/views/common/header.jsp" %>
<div class="list_container">
<div style="background-color:white;">
  <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/carList">전체 차량</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="소형" href="<%=request.getContextPath()%>/car/searchCar?carType=소형">소형/준중형</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/searchCar?carType=중형">중형</a>
    </li>
   <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/car/searchCar?carType=SUV">SUV</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="#">캠핑카</a>
    </li>
  </ul>
  </div>
      <div class="car_container">
      <%for(Car c: list){ %>
        <div class="car_list">
     
          <img
            src="https://auto.nate.com/news/photo/old/data/old_img/1804/6547f90d897e2144b85c467f2429ccdb_WGR6Eh1cdlUWlj.jpg"
            alt="car"
            class="thumbnail"
          />
          <h3><%=c.getCarModel() %></h3>
          <br>
          <h4><%=c.getCarInfo() %></h4>
          
         <%--  <button class="reservation" onclick="location.assign('<%=request.getContextPath()%>/car/carView?carNb=<%=c.getCarNB()%>')">예약하기</button> --%>
         <input type="hidden" name="carNB" value="<%=c.getCarNB()%>">
         <button class="reservation" onclick="location.assign('<%=request.getContextPath()%>/car/carView?carNB=<%=c.getCarNB()%>')">예약하기</button>
     
        </div>
        <%} %>
       
    </div>
    </div>
    <script>
    
    </script>
    
    <style>
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
        padding-top: 50px;
        height: 1000px;
        width: 1700px;
        background-color: rgba(129, 129, 129, 0.11);
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
        margin: 10px 20px;
        padding: 25px 50px;
      }

      .model_list:hover {
        cursor: pointer;
        background-color: wheat;
      }

      .car_container {
        text-align: justify;
        margin: 50px;
      }

      .car_list {
        display: inline-block;
        height: 300px;
        width: 250px;
        background-color: rgb(172, 172, 172);
        align-items: center;
        margin: 20px;
        padding: 10px;
        box-shadow: 9px 10px 15px -3px #000000;
      }

      .thumbnail {
        height: 50%;
        width: 100%;
      }

      .reservation {
        height: 30px;
        width: 100%;
        margin-top: 50px;
        cursor: pointer;
      }
      
      a.nav-link:hover{
color:red;
}
.nav-link{
color:blue;
}
      
    </style>
    
 <%--  <script>
  
  $("#소형").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/car/searchCar?carType=소형",
			dataType:"text",
			success:data=>{
				console.log(data);
				const table=$("<table>");
				const cars=data.split("\n");
				console.log(cars);
				for(let i=0;i<cars.length;i++){
					let pData=persons[i].split(",");
					console.log(pData);
					let tr=$("<tr>");
					let name=$("<td>").html(pData[0]);
					let phone=$("<td>").html( pData[1]);
					let profile=$("<td>").append($("<img>").attr({
						"src":"<%=request.getContextPath()%>/images/"+pData[2],
						"width":"100px",
						"height":"100px"
					}));
					tr.append(name).append(phone).append(profile);
					table.append(tr);
					$("#target").html(table);
				}
			}
		});
	});
  
  
  </script> --%>
    

<%@ include file="/views/common/footer.jsp" %>	