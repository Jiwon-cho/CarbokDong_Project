<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.camp.model.vo.Camp"%>
<%@page import="com.camp.model.dao.CampDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mapStyle.css">       
<meta charset="UTF-8">
<title>캠핑장 지도</title>
</head>
<%@ include file="../common/header.jsp" %>
<body>
	 
	 <%

	 	CampDao campDao = new CampDao();
	 List<Camp> list = campDao.selectAllMember();

	 %>

    <div class="map_wrap">
      <div
        id="map"
        style="width: 100%; height: 90%; position: relative;" 
      ></div>

      <div id="menu_wrap" class="bg_white">
        <div class="option">
          <div>
            <form onsubmit="searchPlaces(); return false;">
              키워드 :
              <input type="text" value="캠핑장" id="keyword" size="15" />
              <button type="submit">검색하기</button>
            </form>
          </div>
        </div>
        <hr />
        <ul id="placesList">

        <% 
        	for(int i=0; i<list.size(); i++){
        		Camp camp = list.get(i);
        	
        %>	<div>
        		<form action="<%=request.getContextPath()%>/map/CampView" method="post">
        		<div class="camp_name" onclick="panTo(<%=list.get(i).getLatitude()%>, <%=list.get(i).getLongitude()%>)"><%= list.get(i).getName() %></div> <br/>
        		<div class="camp_location" onclick="panTo(<%=list.get(i).getLatitude()%>, <%=list.get(i).getLongitude()%>)">1박당 요금 : <%= list.get(i).getPrice() %></div> <br/>
        		<div class="camp_location" onclick="panTo(<%=list.get(i).getLatitude()%>, <%=list.get(i).getLongitude()%>)"><%= list.get(i).getLocation() %></div> <br/>
        		<input type="hidden" name="campName" value="<%=camp.getName()%>"/>
        		<button class="snip1535" type="submit">상세정보</button> <br/><br/>
        		<div class="list_line"></div><br/>
        		</form>
        	</div>
        	<%} %> 
        	
        </ul>
        <div id="pagination"></div>
      </div>
    </div>
	<script type="text/javascript">    	
	$(".hover").mouseleave(function () {
    	$(this).removeClass("hover");
  	});
	</script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e43696a44b958e8d5154bc1b138b81&libraries=services"
    ></script>
    <script>

    
      const mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(36.64213353295997, 127.87458257769703), // 지도의 중심좌표
          level: 12, // 지도의 확대 레벨
        };

      // 지도를 생성합니다
      const map = new kakao.maps.Map(mapContainer, mapOption);

      // 마커가 표시될 위치입니다

      function markerTest(latitude, longitude){
    	  return new kakao.maps.LatLng(latitude, longitude);
      };

      // 마커 생성
      // 마커를 담을 배열
      const markers = [];
      <%for(int i=0; i<list.size(); i++){%>
    	  var marker = new kakao.maps.Marker({
    	        position: markerTest(<%=list.get(i).getLatitude()%>, <%=list.get(i).getLongitude()%>)
    	      });
    	  marker.setClickable(true);
    	  markers.push(marker);
    	  marker.setMap(map);
    	// 마커 클릭이벤트
      	kakao.maps.event.addListener(marker, 'click', function() {
      		location.href='campView.jsp?name=<%=list.get(i).getName()%>'
      	});
    	  
    	  var content = '<div class="marker_title"><%= list.get(i).getName() %> </div> ';
    	  
    	  var customOverlay = new kakao.maps.CustomOverlay({
    		    position : markerTest(<%=list.get(i).getLatitude()%>, <%=list.get(i).getLongitude()%>), 
    		    content : content,
    		    yAnchor: 2.2
    		});
    	  customOverlay.setMap(map);
     <%}%>;

      
   

		
      const campName = document.querySelector('.camp_name');
      const campLocation = document.querySelector('.camp_location');
      
      function panTo(a,b){
        var moveLatLon = new kakao.maps.LatLng(a, b);
        map.panTo(moveLatLon); 
        console.log("지도이동함");
      }
      
   
      </script>
      

</body>
<%@ include file="../common/footer.jsp" %>
</html>
