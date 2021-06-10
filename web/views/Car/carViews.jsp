<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car,com.car.model.vo.Reviews,java.util.List"  %>
<%@ include file="/views/common/header.jsp" %>
<%
Car c=(Car)request.getAttribute("car");
String[] carinfos=c.getCarInfo().split("/");
String id=null;
if(loginMember!=null){
	 id="'"+loginMember.getUserId()+"'";
	 
}
List<Reviews>rlist=(List<Reviews>)request.getAttribute("rlist");
List<String> carPics=(List<String>)request.getAttribute("carpics");

%>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/carViewStyle.css">

 
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
     	goto_cart()
        /*    carPv(); */	
    }

    function cl(){
    $("td").click((e)=>{
    	var s=$("#start").val();
    	var ed=$("#end").val();
    	console.log(typeof s);
    	//들어갈 선택될 문자열
    	console.log($(e.tartget).text());
        var dt=String(today.getFullYear())+"-"+  String((today.getMonth() + 1))+"-"+ $(e.target).text();
        console.log(dt);
        //선택하는 날짜
        var ddt=new Date(dt);

        
        //시작날짜
        var sdt=new Date($("#start").val());
        //반납 날짜
        var det=new Date($("#end").val());
        //오늘 날짜
        var d=new Date();
        console.log(d);
       /*  var det;
        if($("#end").val()!=null){
        	
        det=new Date($("#end").val());
        } 
         */
       /*  var sdt=new Date($("#start").val());
        console.log(det); */
        
      /*   
		var yyyyMMdd = dt;
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(5,6);
		console.log(sMonth)
	    var sDate = yyyyMMdd.substring(7,9); */
		
	   // var ssdt=new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
	    
		var diff=Math.abs(ddt-d);
		var days=diff/(1000*3600*24);
        
        
        /* if(days>=7){
        	  alert("카복동 프리미엄 서비스로 인하여, 대여일은 오늘로부터 7일 안까지만 선택하실 수 있습니다.");	
              $('#start').val("");
      		$('#end').val("");
        } */
        
        
        
        
        
        
        
        if(ddt<d){
        	alert("당일 예약은 오후 3시까지 가능하며,이전 날짜는 선택하실 수 없습니다.");
        	console.log(ddt);
        }else if(s===""||(s===""&&ddt>det)){
        	if(days>=7){
          	  alert("카복동 프리미엄 서비스로 인하여, 대여일은 오늘로부터 7일 안까지만 선택하실 수 있습니다.");	
                $('#start').val("");
        		$('#end').val("");
          }else{
        	$("#start").val(dt);
        	$("#end").val("");
          }
        }else if(ddt>sdt){
        	  $("#end").val(dt);
        }else if(ddt<sdt&&ddt>=d){
        	$("#start").val(dt);
        	 $("#end").val("");
        }
        
        
        
        
        
        
        
        
        
        
        
/*         if($("#start").val()==""&&(ddt>det||$("#end").val()==""){

        $("#start").val(dt);
        $("#end").val("");
        
    }else if(ddt<det){
    	 $("#start").val(dt);
         $("#end").val(det);
    }
        else if(ddt<d||ddt<sdt){
        alert("안돼!");
        console.log(d);
        console.log( $("#end").val())
        
    }
    else{
        $("#end").val(dt);
        
    } */
 })}
    
    function page_move(url) {
		var dt=$('#start').val();
		var dt2=$('#end').val();
		var ddd=new Date();
		
		var yyyyMMdd = dt;
	    var sYear = yyyyMMdd.substring(0,4);
	    var sMonth = yyyyMMdd.substring(5,6);
		console.log(sMonth)
	    var sDate = yyyyMMdd.substring(7,9);
		
	    var sdt=new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
	    
		var diff=Math.abs(sdt-ddd);
		var days=diff/(1000*3600*24);
		
		console.log(sdt);
		
    	if(<%=id%>!==null&&dt!=""&&dt2!=""&&days<7){	
        var form = document.createElement("form");
        var parm = new Array();
        var input = new Array();
		var gear=$('#gear-select').val();
        
        form.action = url;
        form.method = "post";


         parm.push( ['carNB', '<%=c.getCarNB()%>'] ); 
		parm.push( ['start',dt]);
		parm.push( ['end',dt2]);
		parm.push( ['gear',gear]);
		parm.push( ['id',<%=id%>]);


        for (var i = 0; i < parm.length; i++) {
            input[i] = document.createElement("input");
            input[i].setAttribute("type", "hidden");
            input[i].setAttribute('name', parm[i][0]);
            input[i].setAttribute("value", parm[i][1]);
            form.appendChild(input[i]);
        }
        document.body.appendChild(form);
        form.submit();}else if(<%=id%>==null){
        	alert("로그인을 하고 이용해 주십시오");	
      	   location.assign("<%=request.getContextPath()%>/loginPage");
      }
    	/* else if(days>=7){
        alert("카복동 프리미엄 서비스로 인하여, 대여일은 오늘로부터 7일 안까지만 선택하실 수 있습니다.");	
        $('#start').val("");
		$('#end').val("");
        } */
    	else if(dt==""||dt2==""){
        	alert("날짜를 정하셔야 합니다.");
        	
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
    function setThumbnail(event) { var reader = new FileReader(); reader.onload = function(event) { var img = document.createElement("img"); img.setAttribute("src", event.target.result); document.querySelector("div#image_container").appendChild(img); }; reader.readAsDataURL(event.target.files[0]); }

    
    function goto_cart(){
    	if(<%=id%>!=null){	
    	var dt3=$('#start').val();
		var dt4=$('#end').val();
		var g=$('#gear-select').val();
		var st_ar=dt3.split("-");
		var ed_ar=dt4.split("-");
		
		var sst=new Date(st_ar[0],Number(st_ar[1]-1),st_ar[2]);
		var eed=new Date(ed_ar[0],Number(ed_ar[1]-1),ed_ar[2]);
		
		var bt=(eed.getTime()-sst.getTime())/1000/60/60/24;
		var m=bt*<%=c.getPrice()%>;
		var mid=<%=id%>;
		
		
		
		
		var rs=confirm("장바구니에 추가하시겠습니까?");
		
	  if(rs){
    	$.ajax({
    		url:"<%=request.getContextPath()%>/car/gotoCart",
    		data:{
    			carNB:<%=c.getCarNB()%>,
    			start:dt3,
    			end:dt4,
    			id:mid,
    			money:m,
    			gear:g
    			
    			
    		},
    		success:data=>{
    			console.log(data);
    			alert(data);
    		}
    	});
    	
    
    }else{
    	alert("장바구니에 담지 못하였습니다.");
    }
    	}else{
    		alert("로그인을 하고 이용해 주십시오");	
      	   location.assign("<%=request.getContextPath()%>/loginPage");
    	} 
    }
    
</script>
 
<body onload="build();">
<div class="content_container">
      <div class="book">
        <div class="book_img">
          <img
            src="<%=request.getContextPath() %>/images/car/<%=carPics.get(carPics.size()-1) %>"
            alt="car"
            class="img_file"
          />
        </div>
        <div class="book_option">
          <div class="book_subject">
          <div class="book_subject_main">
            <h1><%=c.getCarModel() %></h1>
           </div>
              <div class="book_content">
            	<h3 style="text-align: right">재고 : <%=c.getCarPsb() %>대</h3>
            	<p>차량 종류 : <%=carinfos[0] %></p>
            	<br/>
            	<p>연료 : <%=carinfos[1] %></p>
            	<br/>
            	<p>차량 연식 : <%=carinfos[2] %></p>
            	<br/>
            	<p>대여 자격 : <%=carinfos[3] %>, <%=carinfos[4] %></p>
            	<br/>
            	<p>대여 비용 : 1일-<%=c.getPrice() %> 원</p>
            	<br/>
            </div>
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
	<span>대여일 - </span>
    <input class="dateInput" type="text" id="start" name="trip-start"
    value="">
    <br/><br/>
    <span>반납일 - </span>
    <input class="dateInput" type="text" id="end" name="trip-end"
    value="">
    <br>
    <br>
    <span><h6>*카복동 프리미엄 정책으로 인해 대여일은 당일 기준 <span style="color:red;">7일</span> 안의 날짜만 가능합니다.*</h6></span>
          <div class="book_options">
            <select name="gear" id="gear-select">
              <option value="">--- 추가 캠핑용품 ---</option>
              <option value="grill" >바베큐 그릴</option>
            </select>
            <br />
            
            	<button class="basket_btn" onclick="goto_cart();">장바구니 담기</button>
  
                 <button class="buy_btn" onclick="page_move('<%=request.getContextPath()%>/car/carPurchaseView?carNB=<%=c.getCarNB()%>');">구매하기</button> 
       
            </form>
          </div>
        </div>
      </div>
      <div class="item">
     <%for(int i=0;i<carPics.size()-1;i++){ %>
     
      <div class="item-img" height:810px;"> 
        <img
          src="<%=request.getContextPath() %>/images/car/<%=carPics.get(i) %>"
          alt=""
          class="item_img"
        />
        </div>
        <%} %>
      </div>
      <div class="review">
      <%for(Reviews r:rlist) {%>
      <ul class="level1" >
				<li>
					<div class="review_content">
 						<span>
 						<%if(r.getRating()==1){ %>
 						⭐
 						<%}else if(r.getRating()==2){ %>
 						⭐⭐
 						<%}else if(r.getRating()==3){ %>
 						⭐⭐⭐
 						<%}else if(r.getRating()==4){ %>
 						⭐⭐⭐⭐
 						<%}else if(r.getRating()==5){ %>
 						⭐⭐⭐⭐⭐
 						<%} %>
 						</span>
						<span class="txt_info" style="font-size: 15px;">
							<%=r.getMemberId() %>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px; ">&emsp;<%=r.getReviewContents() %></span>
						</strong>
						<div style="display: inline-block; float: right; position: relative; bottom: 20px;" >
          					  <img
             					     src="<%=request.getContextPath() %>/upload/car/<%=r.getFileName() %>"
              						alt=""
              						style="width: 80px;height: 70px; float: right;"
            							/>
          				</div>
					</div>
				</li>
			</ul>
			<%} %>
	</div>
			<br><br>
			<div class="comment-editor" >
			<form action="<%=request.getContextPath() %>/car/insertReview" method="post" enctype="multipart/form-data">			
				<span>
					평점:
					<select name="rating" size="1" style="width: 50px; height: 23px;">
						<option value="1">1점</option>
						<option value="2">2점</option>
						<option value="3">3점</option>
						<option value="4">4점</option>
						<option value="5">5점</option>
					</select>
				</span>
					
					<div class="inner-comment">
							
							<textarea class="comment" name="content" rows="3" cols="120"  placeholder="로그인을 하셔야 댓글에 글을 쓸수 있습니다."></textarea>
							<input type="hidden" name="memberId" value="<%=loginMember==null?"":loginMember.getUserId()%>">
								<input type="hidden" name="carNo" value="<%=c.getCarNB()%>">
								<button class="commentBtn" type="submit" value="등록" id="btn-insert">등록</button>
					</div>
					<input type="file" name="filename" accept="image/*" onchange="setThumbnail(event);">
					
				</form>
			</div>
    </div>
  </body>

  
<%@ include file="/views/common/footer.jsp" %>	