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
<body>

<div class="bigbox" >
<div class="box1"><div class="carreser label" ><h4><b>예약 확인</b></h4>
<b>차량 종류:<%=c.getCarModel() %></b><br>
대여일  반납일<br><%=start %><%=end %></div>
<div  class="carreser insurance "><b>보험</b><br> 가입(가격에 포함)</div>
<div  class="carreser info ">
    <h4><b>차량 종류:</b> <%=carinfos[0] %></h4>
            <br>
            <h4><b>연료:</b> <%=carinfos[1] %></h4>
            <br>
            <h4><b>차량 연식:</b> <%=carinfos[2] %></h4>
            <br>
            <h4><b>대여 자격:</b> <%=carinfos[3] %>,취득 <%=carinfos[4] %> 이상</h4>
            <h4><b>차량 옵션: +<%=gear %></b></h4></div>
            
<div  class=" imag "><img src="<%=request.getContextPath() %>/images/car/<%=carPics.get(carPics.size()-1) %>"></div>

</div>
<div class="box2">
   
    <div class="warn carbook "><div class="reslabel"><h2>자차공통 사항</h2></div>

<br><br>차량손해면책제도 가입 여부와 관계없이 미적용 경우 <br>
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
    <div class="carbook pplinfo">
     <div class=" pplinfo-1"><div class="reslabel">예약 정보</div>
     <label>예약자 아이디</label>
     <input type="text" value="<%=loginMember.getUserId() %>">
        <label>예약자 이름</label>
       <input type="text" value="<%=loginMember.getUserName() %>">
           <label>예약자 이메일</label>
         <input type="text" id="email" value="">
     
     </div>
      <div class="pplinfo-2"><div class="tlabel">기타 의견사항</div>
      <textarea id="opinion" rows="5" cols="33" >요구 사항 없음</textarea>
    <div id="test_cnt">(0 / 50)</div>
      </div>
    </div>
     
     
     
    
    <div class="carbook money"><div class="reslabel">총 비용</div>
      
     <div style="text-align:right;display:flex;float:right;">
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




<style>
form{
margin-top:22px;

}


label{
display:block;
height:20px;
margin-bottom:10px;
margin-top:10px;
}




.tlabel{
display:inline-block;
height:50px;
width:100%;	
background-color:skyblue;

}

.reslabel{
display:inline-block;
height:50px;
width:100%;	
border-bottom: 1px solid gray; 

}


textarea{
line-height: 1.5;
margin-top:10px;
border :1px solid #ccc;
width:99%;
resize:none;
}


.noti{
color:red;
}

.warn{
height:400px;
}


.bigbox{
display:flex;
height:auto;

}
body{
height:auto;
}


.carbook{
    display:inline-block; 
    width:700px;
    
    border:1px solid black; 
    margin-left: 50px;
    margin-top: 10px;

}

.pplinfo{
    height:420px;

}

.pplinfo-1{
    height:250px;
 display:inline-block; 
    width:700px;
    
   
}

.pplinfo-2{
    height:150px;
display:inline-block; 
    width:700px;
    
    
}


.money{
height:100px;


}


.imag{
height:250px;
 
    margin-left: 50px;
    margin-top: 10px;
  display:inline-block; 
    width:300px;
}


.carreser{
    display:inline-block; 
    width:300px;
    height:100px; 
    border:1px solid black; 
    margin-left: 50px;
    margin-top: 10px;

}

.insurance{
    height:50px;

}

.info{
    display:inline-block; 
    width:300px;
    height:350px; 
    border:1px solid black; 
    margin-left: 50px;
    margin-top: 10px;

}


section{
margin-left:1000px;

width:auto;
height:auto;
border:1px solid black;
display: block;

}

.box1{

    border:1px green solid;
            width:400px;
            height:800px;
            position:sticky;
            top:0;
            left:400px;
            display: inline-block;
            background-color:white;
}

.box2{
    display: inline-block;
width:800px;
height: 1000px;
border:1px red solid;
margin-left:520px;
position:relative;
}


</style>
<%@ include file="/views/common/footer.jsp" %>	