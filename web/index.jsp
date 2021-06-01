<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="views/common/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">  

  <script>
    $.getJSON('https://api.openweathermap.org/data/2.5/onecall?lat=37.5683&lon=126.9778&appid=72d907e7254e1bb6390f7526c46e9e72&units=metric'
    ,function(result){
    for(var i=0;i<7;i++){ 
        var cTemp=result.daily[i].temp.day;
        var minTemp=result.daily[i].temp.min;
        var maxTemp=result.daily[i].temp.max;
         var cDate=result.daily[i].dt;
        var wIcon=result.daily[i].weather[0].icon;
        
        function convertTime(t){
            var ot= new Date(t*1000);
            var mt=ot.getMonth()+1;
            var dt=ot.getDate();
            var dy=ot.getDay();
            switch(dy){
                case 1: dy="월";break;
                case 2: dy="화";break;
                case 3: dy="수";break;
                case 4: dy="목";break;
                case 5: dy="금";break;
                case 6: dy="토";break;
                case 0: dy="일";break;
            }
            return mt+"/"+dt+"("+dy+")";
        }
        var currentTime=convertTime(cDate)
        
        var tableHtml='<tr>'+
            '<td >날짜: '+currentTime+'</td>'+
            '<td>평균 기온: '+cTemp+'</td>'+
            '<td>최고 기온: '+maxTemp+'</td>'+
            '<td>최저 기온: '+minTemp+'</td>'+
            '<td><img src="http://openweathermap.org/img/wn/'+wIcon+'@2x.png" alt="'+result.daily[i].weather[0].description+'" width="25px" height="22px"></td>'+'</tr>' ;
        
            $('tbody').append(tableHtml);
       
    }})



  </script>
  <script>
  var slideIndex = 0; //slide index

// HTML 로드가 끝난 후 동작
window.onload=function(){
  showSlides(slideIndex);

  // Auto Move Slide
  var sec = 3000;
  setInterval(function(){
    slideIndex++;
    showSlides(slideIndex);

  }, sec);
}


// Next/previous controls
function moveSlides(n) {
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}

// Thumbnail image controls
function currentSlide(n) {
  slideIndex = n;
  showSlides(slideIndex);
}

function showSlides(n) {

  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex = 0; n = 0;
  }else if (n < 0) {
    slideIndex = (size-1);
    n = (size-1);
  }

  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }

  slides[n].style.display = "block";
  dots[n].className += " active";
}
    </script> 
     <style>
/* * {
  margin: 0;
  padding: 0;
  box-sizing:border-box;
} */

/* Slideshow container */
.slideshow-container {
  max-width: 100%;
  max-height: 550px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 550px;
  object-fit:cover;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
  li.nav-item{
    font-size:50px;
    margin-left: 70px;
    margin-right: 70px;

  }
  </style>
      <body>
   <section>
  <div class="container-fluid">
     <div class="row">
    <div class="col" style="height: 50px;"></div>
</div>
   <div class="slideshow-container" >

        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade" >
          <div class="numbertext"></div>
          <img src="<%=request.getContextPath() %>/images/캠핑 메인1.jpg" style="width:100%"> -->
          <div class="text">ACNE STUDIO</div>
        </div>
  
        <div class="mySlides fade">
          <div class="numbertext">2 / 6</div>
          <img src="<%=request.getContextPath() %>/images/캠핑메인2.jpg" style="width:100%">
          <div class="text">ACNE STUDIO</div>
        </div>
  
        <div class="mySlides fade">
          <div class="numbertext">3 / 6</div>
          <img src="<%=request.getContextPath() %>/images/캠핑메인3.jpg" style="width:100%">
          <div class="text">ACNE STUDIO</div>
        </div>
  
        <div class="mySlides fade">
          <div class="numbertext">4 / 6</div>
          <img src="<%=request.getContextPath() %>/images/캠핑메인4.jpg" style="width:100%">
          <div class="text">ACNE STUDIO</div>
        </div>
  
        <div class="mySlides fade">
          <div class="numbertext">5 / 6</div>
          <img src="<%=request.getContextPath() %>/images/캠핑메인.jpg" style="width:100%">
          <div class="text">ACNE STUDIO</div>
        </div>
  
        <div class="mySlides fade">
          <div class="numbertext">6 / 6</div>
          <img src="<%=request.getContextPath() %>/images/캠핑메인6.jpg" style="width:100%">
          <div class="text">ACNE STUDIO</div>
        </div>
  
        <!-- Next and previous buttons -->
        <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
        <a class="next" onclick="moveSlides(1)">&#10095;</a>
      </div>
      <br/>
  
      <!-- The dots/circles -->
      <div style="text-align:center">
        <span class="dot" onclick="currentSlide(0)"></span>
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
      </div>

      
<!-- 	<div class="event"
	style="    background-image: url('https://parks.seoul.go.kr/file/info/view.do?tableName=BANNER&bIdx=537');
    background-repeat: no-repeat;
    background-size: cover;">
      <h1>============== 이벤트 이미지 ==============</h1>
    </div>
  

    <div> 
 -->
    <!-- <img class="slide1" src="https://item.kakaocdn.net/do/c5c470298d527ef65eb52883f0f186c49f17e489affba0627eb1eb39695f93dd" >
    <img class="slide1" src="https://cdn.imweb.me/upload/S202002259d2c4f16c33cd/20e9d0fd888dc.jpg" width="300px", height="300px">
    <img class="slide1" src="https://lh3.googleusercontent.com/proxy/rfhOC98Rjc_4cdAM2-wZVgeITTqcyyYyvUiGzQayYoevBzsZcdNpfb3C0bdjdPnjNvZTKTfy7CARxT4GAZfLyUcYhg8meeUFQwAJYEawGl78YdW2TK4SxlDtEgLABv7y2NUleG_ic_QLNJ2KjzXzz9j5Df1zNxlkkr5eLSy1UBASY5rlQldv4bRoYhzrW8AnPBUVj51l8IYtfyIyZ9Cvcv_DUScVfL12H3hXRo7wVtJLdYdpfifeN_KnuUVrBQldgHjNXtpxvpMAJLfn5sKZZV4OaZ33tOCsC9yVsPU9SA"width="300px", height="300px"> -->
    <!-- <img class="slide1" src="https://e7.pngegg.com/pngimages/324/268/png-clipart-kakaotalk-computer-icons-kakao-friends-kakaostory-iphone-electronics-text.png"> -->
  <div style="height:100px;"></div>
  	<!--       <div class="container-fluid"> -->
      <div class="row">
        <div class="col" style="height: 350px;background-color:rgba(248, 215, 176, 0.925);">
          <div class="container-fluid">
            <div class="row">
              <div class="col" style="height: 50px; text-align:center;">
              <h2>==== 캠핑 스토리 ===</h2>
              </div>
          </div>
            <div class="row" style="text-align:center;">
             <div class="col-2"></div>
             
            <div class="col-lg-2" style="background-color:black;height: 250px; background-image:url('<%=request.getContextPath() %>/images/campingnews.jpg'); background-size:cover;
            text-align:left;">
            <div style="margin-top:10px; ">
             <a href="<%=request.getContextPath() %>/news/newsList" style="color:#FFF;">
              <h2>
              <p>
                                        CAMPING
                <br>
                <span>NEWS</span>
              </p>
              <span id="campnews">캠핑소식&뉴스</span>
              <br>
              >>
             <%--  <ul class="arrowul">
                <li><a href="<%=request.getContextPath() %>/news/newsList"" class="arrow">link</a></li>
                <li><a href="<%=request.getContextPath() %>/news/newsList"" class="arrow">link</a></li>
                
              </ul> --%>
              </h2>
              </a>
            </div>
            </div>
            <div class="col-lg-3" style="background-color:white; height: 250px;  ">
              <div class="container-fluid" style="font-size:;">
            <div class="row">
              <div class="col" style="height: 20px;"></div>
          </div>
              <table align="center" id="weather-tb" style="font-size:50px;">
                      <tr>
                      <th colspan="5">===== 날씨예보 ====</th>
                  </tr>
                 
                  </table>
                  
           
            </div>
            </div>
            <div class="col-lg-3" style="background-color:red; height: 250px; background-image:url('https://t1.daumcdn.net/cfile/tistory/99D8F24E5F07D10C2A');
                background-size: cover;text-align:center;     background-repeat: no-repeat;"> <h2><a href="#">[MBTI 검사~!!]</a></h2></div>
            <div class="col-2"></div>
        </div>
        </div>
        
        </div>
      </div>
      </div>
   
  <%-- 
    <div class="container">
        
  
        <div class="layout">
          <span><h1>캠핑 스토리</h1></span>
           <div class="news" style="background-image:url('<%=request.getContextPath() %>/images/campingnews.jpg');">
              <!-- <h1>============== 뉴스 ==============</h1> -->
              <a href="<%=request.getContextPath() %>/news/newsList" style="color:#FFF;">
              <p>
                                        CAMPING
                <br>
                <span>NEWS</span>
              </p>
              <span id="campnews">캠핑소식&뉴스</span>
              <ul class="arrowul">
                <li><a href="<%=request.getContextPath() %>/news/newsList"" class="arrow">link</a></li>
                <li><a href="<%=request.getContextPath() %>/news/newsList"" class="arrow">link</a></li>
                
              </ul>
              </a>
           </div>
      
            <!-- <div class="notice2"> -->
                <div class="weather">
                    <table align="center">
                      <tr>
                      <th colspan="5">===== 날씨예보 ====</th>
                  </tr>
                 
                  </table>
                  
                    <!-- <h2> - 날씨 정보</h2>
                    <div class="cicon"> </div>
                    <div class="ctemp">현재 온도:</div>
                    <div class="clowtemp">최저 온도:</div>
                    <div class="chighttemp">최고 온도:</div> -->
                </div>
               
                <div class="mbti">
                  <h2><a href="#">[MBTI 검사~!!]</a></h2>
                </div>
              
            <!-- </div> -->
      </div>
    </div>
		 --%>
		</section>
		
		
<%@ include file="views/common/footer.jsp" %>	