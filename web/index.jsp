<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.common.AESEncrypt"%>
<%@ include file="views/common/header.jsp" %>
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
            '<td>날짜: '+currentTime+'</td>'+
            '<td>평균 기온: '+cTemp+'</td>'+
            '<td>최고 기온: '+maxTemp+'</td>'+
            '<td>최저 기온: '+minTemp+'</td>'+
            '<td><img src="http://openweathermap.org/img/wn/'+wIcon+'@2x.png" alt="'+result.daily[i].weather[0].description+'" width="15px" height="15px"></td>'+'</tr>' ;
        
            $('tbody').append(tableHtml);
       
    }})

  </script>
   <section>
	<div class="event">
      <h1>============== 이벤트 이미지 ==============</h1>
    </div>
  

    <div>

    <!-- <img class="slide1" src="https://item.kakaocdn.net/do/c5c470298d527ef65eb52883f0f186c49f17e489affba0627eb1eb39695f93dd" >
    <img class="slide1" src="https://cdn.imweb.me/upload/S202002259d2c4f16c33cd/20e9d0fd888dc.jpg" width="300px", height="300px">
    <img class="slide1" src="https://lh3.googleusercontent.com/proxy/rfhOC98Rjc_4cdAM2-wZVgeITTqcyyYyvUiGzQayYoevBzsZcdNpfb3C0bdjdPnjNvZTKTfy7CARxT4GAZfLyUcYhg8meeUFQwAJYEawGl78YdW2TK4SxlDtEgLABv7y2NUleG_ic_QLNJ2KjzXzz9j5Df1zNxlkkr5eLSy1UBASY5rlQldv4bRoYhzrW8AnPBUVj51l8IYtfyIyZ9Cvcv_DUScVfL12H3hXRo7wVtJLdYdpfifeN_KnuUVrBQldgHjNXtpxvpMAJLfn5sKZZV4OaZ33tOCsC9yVsPU9SA"width="300px", height="300px"> -->
    <!-- <img class="slide1" src="https://e7.pngegg.com/pngimages/324/268/png-clipart-kakaotalk-computer-icons-kakao-friends-kakaostory-iphone-electronics-text.png"> -->
  </div>
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
		</section>
<%@ include file="views/common/footer.jsp" %>	