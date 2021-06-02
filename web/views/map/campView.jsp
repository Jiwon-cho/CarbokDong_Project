<%@page import="com.camp.model.vo.CampHotplace"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Array"%>
<%@page import="com.camp.model.vo.Camp"%>
<%@page import="com.camp.model.dao.CampDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  
  	<% 
		String name = request.getParameter("name");
  		
		CampDao campDao  = new CampDao();
		
		Camp camp = campDao.getOneCamp(name);
		List<CampHotplace> campHots = campDao.getHotplace(camp.getNum());
		List<String> photos = campDao.getCampPhoto(camp.getNum());
		
		
		
		System.out.println("불러온 이미지배열:"+photos);
		String path="/SemiTest/resources/campImgs";
		System.out.println("불러온 경로:"+path);
	%>
	<title><%= camp.getName() %>에 어서오세요</title>
	
 	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/campView.css">   
 	
     <script
      type="text/javascript"
      src="//code.jquery.com/jquery-1.11.0.min.js"
    ></script>

    <script type="text/javascript" src="slick/slick.min.js"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />

    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/campView.css">   
</head>
<body>
    <div class="header">Header</div>

    <div class="container">
      <div class="head">
        <div class="title"><%= camp.getName() %></div>
      </div>
      <div class="main">
        <div class="mainPhoto">
        
        <%for(int i=0; i<photos.size(); i++ ){%>
        	<div>
            <img
              	class="mainImg"
              	src="<%=request.getContextPath() %>/images/campImgs/<%=photos.get(i)%>"
             	alt="<%=photos.get(i)%> 이미지를 불러올 수 없어요"
           	 />
          	</div>
        <%}%>
        
          

        </div>
        <div class="details">
          <div class="detail">
            🔹 주소 : <%=camp.getLocation() %>
          </div>
          <div class="detail">
            🔹 <%= camp.getInfo() %>
          </div>
			<div class="detail">🔹 1박당 요금 : <%= camp.getPrice() %></div>
          <div class="detail">
            🔹 부대시설 : <%= camp.getFacility() %>
          </div>
          <div class="like">
            <div class="heart">💗</div>
            9
          </div>
        </div>
      </div>
    </div>
    <section id="place" class="section">
      <span class="hot">주변 핫플레이스</span>
      <div class="place__container">
        <div class="place__categories">
          <button class="category__btn" data-filter="*">전체보기</button>
          <button class="category__btn" data-filter="site">관광지</button>
          <button class="category__btn" data-filter="food">음식</button>
        </div>

        <div class="place__informations">
        
        <%for(int i=0; i<campHots.size(); i++){%>
        <a class="info" target="_blank" data-type="<%=campHots.get(i).getType()%>">
            <img
              class="info__img"
              src="<%=request.getContextPath() %>/images/hotplace/<%=campHots.get(i).getFile()%>"
              alt=""
            />
            <div class="info__description">
              <h3><%=campHots.get(i).getName()%></h3>
            </div>
          </a>
        <%} %>
          
        </div>
      </div>
    </section>
    <div class="route">
     <span class="coming">오시는길</span> 
      <div class="routeMap">

      </div>
    </div>
    <!-- arrow  -->
    <section>
      <div>
        <button class="arrow">
          <i class="fas fa-arrow-circle-up"></i>
        </button>
      </div>
    </section>
    
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9e43696a44b958e8d5154bc1b138b81"></script>
		<script>
		var mapContainer = document.querySelector('.routeMap'), // 지도를 표시할 div 
    		mapOption = { 
        		center: new kakao.maps.LatLng(<%=camp.getLatitude()%>, <%=camp.getLongitude()%>), // 지도의 중심좌표
        		level: 3 // 지도의 확대 레벨
    		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	      // 마커가 표시될 위치입니다

	      function markerTest(latitude, longitude){
	    	  return new kakao.maps.LatLng(latitude, longitude);
	      };

	      // 마커 생성
	      // 마커를 담을 배열
	      const markers = [];
	    	  var mark = new kakao.maps.Marker({
	    	        position: markerTest(<%=camp.getLatitude()%>, <%=camp.getLongitude()%>)
	    	      });
	    	  markers.push(mark);
	    	  mark.setMap(map);
	    	  
	    	  var content = '<div class="marker_title"><%= camp.getName() %><br/> <span class="route_location"><%=camp.getLocation()%></span></div>';
	    	  
	    	 
	    	  
	    	  var customOverlay = new kakao.maps.CustomOverlay({
	    		    position : markerTest(<%=camp.getLatitude()%>, <%=camp.getLongitude()%>), 
	    		    content : content,
	    		    yAnchor: 2.8,
	    		});
	    	  customOverlay.setMap(map);
		</script>
		
		<style>
		.marker_title{
      	font-family: "Black Han Sans", sans-serif;
      	font-size: 1.5rem;
      	background-color: rgba(245, 222, 179, 0.815);
      	padding : 5px;
      	border: 3px solid black;
      	border-radius: 5px;
      }
      
      	.route_location{
      	font-size: 15px;
        font-family: 'Sunflower', sans-serif;
      	}
      </style>

    <script type="text/javascript">
      $(".mainPhoto").slick({
        prevArrow:
          "<button type='button' class='slick-prev' style='font-size:30px; border-radius:10px;-webkit-box-shadow: 0px 10px 13px -7px #000000, 0px 0px 8px 5px rgba(0,0,0,0.51);  '><</button>",
        nextArrow:
          "<button type='button' class='slick-next' style='font-size:30px; border-radius:10px;-webkit-box-shadow: 0px 10px 13px -7px #000000, 0px 0px 8px 5px rgba(0,0,0,0.51); '>></button>",
        fade: true,
        cssEase: "linear",
      });

      const placeBtnContainer = document.querySelector(".place__categories");
      const infoContainer = document.querySelector(".place__informations");
      const informations = document.querySelectorAll(".info");
      placeBtnContainer.addEventListener("click", (e) => {
        const filter =
          e.target.dataset.filter || e.target.parentNode.dataset.filter;
        if (filter === null) {
          return;
        }

        const active = document.querySelector(".category__btn.selected");
        if (active != null) {
          active.classList.remove("selected");
        }
        e.target.classList.add("selected");

        informations.forEach((info) => {
          console.log(info.dataset.type);
          if (filter === "*" || filter === info.dataset.type) {
            info.style.display = "block";
          } else {
            info.style.display = "none";
          }
        });
      });

      const home = document.querySelector("#home");
      const arrow = document.querySelector(".arrow");
      document.addEventListener("scroll", () => {
        if (window.scrollY > 200) {
          arrow.style.opacity = 1;
          arrow.style.pointerEvents = "auto";
        } else {
          arrow.style.opacity = 0;
          arrow.style.pointerEvents = "none";
        }
      });

      arrow.addEventListener("click", () => {
        window.scrollTo({ top: 0, behavior: "smooth" });
      });

      const like = document.querySelector(".like");
      like.addEventListener("mousedown", () => {
        like.style.transform = "scale(1.1)";
      });

      like.addEventListener("mouseup", () => {
        like.style.transform = "scale(1.0)";
      });
    </script>
  </body>
	

</html>

