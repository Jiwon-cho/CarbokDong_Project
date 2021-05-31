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

	%>
	<title><%= camp.getName() %> 상세 보기</title>
	
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
        <div class="hashtags">
          <div class="tag">#멋있다</div>
          <div class="tag">#가깝다</div>
          <div class="tag">#좋다</div>
          <div class="tag">#놀기좋다</div>
          <div class="tag">#공기좋다</div>
          <div class="tag">#그냥 좋다</div>
        </div>
      </div>
      <div class="main">
        <div class="mainPhoto">
          <div>
            <img
              class="mainImg"
              src="https://kr.blog.kkday.com/wp-content/uploads/korea_camping_spot_5.jpg"
              alt=""
            />
          </div>
          <div>
            <img
              class="mainImg"
              src="http://tourimage.interpark.com/BBS/Tour/FckUpload/201408/6354273907343808120.jpg"
              alt=""
            />
          </div>
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
          <a class="info" target="_blank" data-type="food">
            <img
              class="info__img"
              src="https://www.hotelbears.co.kr/app/dubu_sourcecode/docs/imgs/1508388474_%EB%B0%94%EB%B2%A0%ED%81%90.jpg"
              alt=""
            />
            <div class="info__description">
              <h3>복동 바베큐</h3>
            </div>
          </a>
          <a class="info" target="_blank" data-type="site">
            <img
              class="info__img"
              src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYeLSfabdYayla-Bxxkwna-0XHIilczbUTDw&usqp=CAU"
              alt=""
            />
            <div class="info__description">
              <h3>복동 계곡</h3>
            </div>
          </a>
        </div>
      </div>
    </section>
    <div class="route">
      오시는길
      <div class="routeMap">
        <img
          class="routeImg"
          src="https://blog.kakaocdn.net/dn/sRcY1/btqDVUPrDqr/zbqnfe1JkO8gyLnxboBuDK/img.jpg"
          alt=""
        />
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

