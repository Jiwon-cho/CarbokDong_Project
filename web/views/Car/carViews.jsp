<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car"  %>
<%@ include file="/views/common/header.jsp" %>
<%
Car c=(Car)request.getAttribute("car");
String[] carinfos=c.getCarInfo().split("|");
String id=null;
if(loginMember!=null){
	 id="'"+loginMember.getUserId()+"'";
	 
}



%>
<style>
    table
    {
        border:1px solid #BDBDBD;
        text-align:center;
        width:320px;
        height:300px;
    }
</style>
 
<script language="javascript">
    var today = new Date(); // 오늘 날짜
    var date = new Date();
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
        
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }
    
    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
       
        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2) 
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
            {
                cell.bgColor = "#BCF1B1"; //오늘날짜배경색
            }
        }
        
        cl();
     	page_move(url);
        /*    carPv(); */	
    }

    function cl(){
    $("td").click((e)=>{
        var dt=String(today.getFullYear())+"-"+  String((today.getMonth() + 1))+"-"+ $(e.target).text();
        var ddt=new Date(dt);
        var det;
        if($("#end").val!=null){
        det=new Date($("#end").val());
        }else{
            det=today;
        }
        if($("#start").val()==""||ddt>=det){

        $("#start").val(dt);
        $("#end").val("");
        
    }else if(ddt<today||ddt<new Date($("#start").val())){
        alert("안돼!");
    }
    else{
        $("#end").val(dt);
        
    }
})}
    
    function page_move(url) {
    	if(<%=id%>!==null){	
        var form = document.createElement("form");
        var parm = new Array();
        var input = new Array();
		var dt=$('#start').val();
		var dt2=$('#end').val();
		var gear=$('#gear-select').val();
        
        form.action = url;
        form.method = "post";


         parm.push( ['carNB', '<%=c.getCarNB()%>'] ); 
		parm.push( ['start',dt]);
		parm.push( ['end',dt2]);
		parm.push( ['gear',gear]);


        for (var i = 0; i < parm.length; i++) {
            input[i] = document.createElement("input");
            input[i].setAttribute("type", "hidden");
            input[i].setAttribute('name', parm[i][0]);
            input[i].setAttribute("value", parm[i][1]);
            form.appendChild(input[i]);
        }
        document.body.appendChild(form);
        form.submit();}else{
        	alert("로그인을 하고 이용해 주십시오");	
     	   location.assign("<%=request.getContextPath()%>/loginPage");
     }
    }
  <%--    function carPV(){
    
   if(<%=id%>!==null){	
     location.assign("<%=request.getContextPath()%>/car/carPurchaseView?carNB=<%=c.getCarNB()%>");
    }else{
    	alert("로그인을 하고 이용해 주십시오");	
    	   location.assign("<%=request.getContextPath()%>/loginPage");
    }
    } --%>  
</script>
 
<body onload="build();">
<div class="content_container">
      <div class="book">
        <div class="book_img">
          <img
            src="https://auto.nate.com/news/photo/old/data/old_img/1804/6547f90d897e2144b85c467f2429ccdb_WGR6Eh1cdlUWlj.jpg"
            alt="car"
            class="img_file"
          />
        </div>
        <div class="book_option">
          <div class="book_subject">
            <h1><%=c.getCarModel() %></h1>
            
            <h3 style="text-align: right">재고 : <%=c.getCarPsb() %>대</h3>
            <h2><%=c.getCarInfo() %></h2>
            <br>
            <%=c.getPrice() %>
          </div>
           <div style="height:320px;">
    <table align="center" id="calendar">
        <tr>
            <th><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></th>
            <th colspan="5" align="center" id="yearmonth"></th>
            <th><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></th>
        </tr>
        <tr>
            <th align="center"> <font color="#FF9090">일</font></th>
            <th align="center"> 월 </th>
            <th align="center"> 화 </th>
            <th align="center"> 수 </th>
            <th align="center"> 목 </th>
            <th align="center"> 금 </th>
            <th align="center"><font color=#7ED5E4>토</font></th>
        </tr>
    </table>
</div>

<div >

    <input type="text" id="start" name="trip-start"
    value="">
    
    <input type="text" id="end" name="trip-end"
    value="">
    
</div>
          <div class="book_options">
           <!--  <select name="gear" id="gear-select">
              <option value="">--- 차량 대여일자 ---</option>
              <option value="rental_date">2021-05-05</option>
            </select> -->
            <select name="gear" id="gear-select">
              <option value="">--- 추가 캠핑용품 ---</option>
              <option value="grill" >바베큐 그릴</option>
            </select>
            <br />
            
            <button class="basket_btn">장바구니 담기</button>
  
     <!--        <button class="buy_btn" onclick="carPV();">구매하기</button>  -->
                 <button class="buy_btn" onclick="page_move('<%=request.getContextPath()%>/car/carPurchaseView?carNB=<%=c.getCarNB()%>');">구매하기</button> 
       
            </form>
          </div>
        </div>
      </div>
      <div class="item">
        <img
          src="http://m.roadtripcamping.co.kr/web/upload/NNEditor/20191202/mobile/5dd3fff18576c74c2b6ec9d830c4d7de_1575282422.jpg"
          alt=""
          class="item_img"
        />
      </div>
      <hr>
      <ul class="level1" >
				<li>
					<div class="reply_div">
 						<span>⭐⭐⭐⭐⭐</span>
						<span class="txt_info" style="font-size: 15px;">
							작성자
							<span class="txt_bar" style="font-size: 15px;">|</span>
							<span class="txt_num" style="font-size: 15px;">2021/06/02</span>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px; ">&emsp;엄청 친절하고 차도 날아다니네요~아주 좋아요</span>
						</strong>
						<div style="display: inline-block; float: right; position: relative; bottom: 20px;" >
          					  <img
             					     src="https://auto.nate.com/news/photo/old/data/old_img/1804/6547f90d897e2144b85c467f2429ccdb_WGR6Eh1cdlUWlj.jpg"
              						alt=""
              						style="width: 80px;height: 70px;"
            							/>
          					</div>
					</div>
				</li>
			</ul>
			<hr>
			<br><br>
			<div class="comment-editor" >
			<form action="<%=request.getContextPath() %>/car/insertReview" method="post">			
				<span>
					평점:
					<select name="rating" size="1" style="width: 50px; height: 23px;">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
					<input type="file" name="filename">
				</span>
					<div class="inner-comment">
							<textarea name="content" rows="3" cols="120" style="resize: none;" placeholder="로그인을 하셔야 댓글에 글을 쓸수 있습니다."></textarea>
							<input type="hidden" name="memberId" value="<%=loginMember==null?"":loginMember.getUserId()%>">
							<input type="hidden" name="carNo" value="<%=c.getCarNB()%>">
							<button type="submit" value="등록" id="btn-insert">등록</button>
					</div>
				</form>
			</div>
    </div>
  </body>

  <style>
    .header {
      width: 100%;
      height: 100px;
      background-color: rgb(0, 0, 0);
      color: white;
      text-align: center;
      font-size: 3em;
    }

    .content_container {
      justify-content: center;
      flex-direction: column;
      align-items: center;
      margin: auto;
      width: 70vw;
      height: auoto;
      background-color: rgb(233, 233, 233);
    }

    .book {
      box-sizing: border-box;
      display: flex;
      justify-content: center;
      flex-direction: row;
      margin: 30px 0;
      height: 1620px;
      width: 100%;
      border: 1px gray solid;
      background-color:white;
    }

    .book_img {
      box-sizing: border-box;
      display: flex;
      align-items: center;
      /* border: 1px gray solid; */
      width: 45%;
      height: 100%;
      border: 1px rgba(202, 202, 202, 0.514) solid;
      margin-left: 50px;
    }

    .img_file {
      width: 100%;
    }

    .book_option {
      margin-left: 150px;
      margin-right: 150px;
      border: 1px rgba(202, 202, 202, 0.514) solid;
      text-align: center;
      width: 50%;
      height: 100%;
    }

    .book_subject {
      height: 60%;
    }

    .book_options {
      display: flex;
      flex-direction: column;
      width: 70%;
      height: 35%;
      margin: auto;
    }

    .basket_btn,
    .buy_btn {
      margin-bottom: 20px;
      height: 15%;
      cursor: pointer;
    }

    .item {
      box-sizing: border-box;
      text-align: center;
      height: 1700px;
      width: 100%;
      margin: 50px 0;
      border: 1px gray solid;
    }

    .item_img {
      width: 60%;
      height: 100%;
    }

    .review {
      display: block;
      flex-direction: column;
      margin: 0;
      width: 100%;
      height: 700px;
      border: 1px gray solid;
    }

    .review_content {
      display: flex;
      height: 120px;
      width: 95%;
      margin: 20px 20px;
      border-top: 1px gray dashed;
      border-bottom: 1px gray dashed;
    }

    .review_subject {
      height: 100px;
      width: 50%;
      margin: 0 50px;
    }

    .review_img {
      width: 30%;
      height: 100%;
      float: right;
    }

    select {
      width: 100%;
      height: 30px;
      font-size: large;
      text-align-last: center;
      margin: 10px 0;
    }
  </style>
<%@ include file="/views/common/footer.jsp" %>	