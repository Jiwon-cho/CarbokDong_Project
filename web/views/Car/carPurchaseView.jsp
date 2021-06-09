<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car, java.text.SimpleDateFormat, java.util.Date,java.util.List"  %>
<%
Car c=(Car)request.getAttribute("car");
String start=(String)request.getAttribute("start");
String end=(String)request.getAttribute("end");
String gear=(String)request.getAttribute("gear")==null?"":(String)request.getAttribute("gear");
int money=(int)request.getAttribute("money");
String[] carinfos=c.getCarInfo().split("/");
List<String> carPics=(List<String>)request.getAttribute("carpics");




%>
<%@ include file="/views/common/header.jsp" %>    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/carPurchasingStyle.css">
<body>

<div class="section" >
	<div class="box1">
		<div class="carreser label" ><h1><b>예약 확인</b></h1>
			<b>차량 종류:<%=c.getCarModel() %></b><br/><br/>
			<b>대여일</b><br/><%=start %><br/><br/>
			<b>반납일</b><br/><%=end %>
		</div>
	<div  class="carreser insurance "><br><b>보험</b><br/> 가입(가격에 포함)</div>
	<div  class="carreser info ">
    <h4><b>차량 종류:</b> <%=carinfos[0] %></h4>
            <br>
            <h4><b>연료:</b> <%=carinfos[1] %></h4>
            <br>
            <h4><b>차량 연식:</b> <%=carinfos[2] %></h4>
            <br>
            <h4><b>대여 자격:</b> <%=carinfos[3] %>,취득 <%=carinfos[4] %> 이상</h4>
            <h4><b>차량 옵션: <%=gear %></b></h4></div>
            
	<div  class=" imag "><img class="image_car" src="<%=request.getContextPath() %>/images/car/<%=carPics.get(carPics.size()-1) %>"></div>
</div>
<div class="box2">
   
    <div class="warn_carbook "><div class="reslabel"><h2>자차공통 사항</h2></div>

<br><br>차량손해면책제도 가입 여부와 관계없이 미적용 경우 <br>
<div class="warnContent">
<span class="noti">1. 자동차 대여 표준약관 제18조(보험처리 등)</span><br>
1) 고의로 인한 손해<br>
2) 무면허운전 사고로 인한 손해<br>
3) 영리를 목적으로 렌터가를 전대하거나 요금 도는 대가를 받고 렌터카를 사용하다가 생긴 사고로 인한 손해<br>
4) 범죄를 목적으로 렌터카를 사용하다가 발생한 손해<br>
5) 음주운전 사고로 인한 손해 <br>
6) 마약,각성제,신나 등 약물에 취한 상태에서 운전하다가 생긴 사고로 인한 손해<br>
7) 렌터카를 경기용이나 연습용 또는 시험용으로 사용하다가 생긴 사고로 인한 손해<br>
8)임대차계약서상의 운전자 이외의자가 렌터카를 운전하다가 생긴 사고로 인한 손해<br>
<span class="noti">2.당사 미보고 사고,타이어파손,휠파손,차키분실및 파손,체인분실및파손,실내부품은 손해면책제도혜택을 받을실 수 없습니다.</span><br>
<span class="noti">3.우도,마라도,가파도등(섬지역) : 출동서비스 및 교통사고시 보험 기사님 현장출동 절대불가</span><br>
<span class="noti">4. 출동서비스 유료입니다.(특약 보험 가입시 1회 무료 제공)</span><br>
<span class="noti">5. 차량 내 흡연시 클리닝 비용 10만원이 부과 됩니다.</span><br>
<span class="noti">6.생선비린내/구토/실내 악취 발생시 클리닝 비용 10만원이 부과 됩니다.</span><br>
<span class="noti">※ 손해면책제도보험 및 특약보험은 1회 소멸성입니다.(사고발생 즉시 본사로 연락을 주셔야 보험처리 가능합니다.)</span></div>
</div>
    <div class="carbook_pplinfo">
     <div class=" pplinfo-1"><div class="reslabel"><h2>예약 정보</h2></div>
     <br/>
     <div class="user_info">
     <div class="info_content">
     	<label>예약자 아이디</label>
     	<input class="info_input" type="text" value="<%=loginMember.getUserId() %>"><br/>
     </div>
     <div class="info_content">
        <label>예약자 이름</label>
       <input class="info_input" type="text" value="<%=loginMember.getUserName() %>"><br/>
      </div>
      <div class="info_content">
          <label>예약자 이메일</label>
         <input class="info_input" type="text" id="email" value="">
        </div>
         </div>
     </div>
      <div class="pplinfo-2"><div class="tlabel"><h3>기타 의견사항</h3></div>
      <textarea id="opinion" rows="5" cols="33" >요구 사항 없음</textarea>
    <div id="test_cnt">(0 / 50)</div>
      </div>
    </div>
     
     
     
    
    <div class="carbook_money"><div class="reslabel"><h2>총 비용</h2></div>
      
     <div >
      <h1><%=money %></h1>
    <form id="frm"  action="<%=request.getContextPath()%>/order/purchasingGo" method="post" >
     <input class="op" type="hidden" name="op" value="">
    <input type="hidden" name="email" value="" class="email">
    
     <input type="hidden" name="carNB" value="<%=c.getCarNB() %>">
     <input type="hidden" name="start" value="<%=start%>">
     <input type="hidden" name="end" value="<%=end%>">
     <input type="hidden" name="gear" value="<%=gear%>">
     <input type="hidden" name="money" value="<%=money%>">
    <button type="submit">결제하기</button> </form>
</div> 
  

    </div> 
   
</div>
</div>

<script>
$(document).ready(function() {
    $('#opinion').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 50)");
 
        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
            $('#test_cnt').html("(50 / 50)");
        }
    });
});


 $("#frm").submit(
		function(){
	$(".op").val($("#opinion").val());
	$(".email").val($("#email".val()));
}
);

</script>


<%@ include file="/views/common/footer.jsp" %>	