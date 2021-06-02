<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car, java.text.SimpleDateFormat, java.util.Date"  %>
<%
Car c=(Car)request.getAttribute("car");
String start=(String)request.getAttribute("start");
String end=(String)request.getAttribute("end");
String gear=(String)request.getAttribute("gear");
int money=(int)request.getAttribute("money");





%>
<%@ include file="/views/common/header.jsp" %>    
<body>

<div>
<div class="box1"><div class="carreser label" ><%=c.getCarModel() %>예약확인<br>대여일  반납일<br><%=start %><%=end %></div>
<div div class="carreser insurance ">보험<br> 가입</div>
<div div class="carreser info "><%=c.getCarInfo() %></div>
<div div class="carreser img "></div>

</div>
<div class="box2">
    <div class="carbook insucheck"></div>
    <div class="carbook warn"><h2>자차공통 사항</h2><br>차량손해면책제도 가입 여부와 관계없이 미적용 경우 
1. 자동차 대여 표준약관 제18조(보험처리 등)
1) 고의로 인한 손해
2) 무면허운전 사고로 인한 손해
3) 영리를 목적으로 렌터가를 전대하거나 요금 도는 대가를 받고 렌터카를 사용하다가 생긴 사고로 인한 손해
4) 범죄를 목적으로 렌터카를 사용하다가 발생한 손해
5) 음주운전 사고로 인한 손해 
6) 마약,각성제,신나 등 약물에 취한 상태에서 운전하다가 생긴 사고로 인한 손해
7) 렌터카를 경기용이나 연습용 또는 시험용으로 사용하다가 생긴 사고로 인한 손해
8)임대차계약서상의 운전자 이외의자가 렌터카를 운전하다가 생긴 사고로 인한 손해
2.당사 미보고 사고,타이어파손,휠파손,차키분실및 파손,체인분실및파손,실내부품은 손해면책제도혜택을 받을실 수 없습니다.
3.우도,마라도,가파도등(섬지역) : 출동서비스 및 교통사고시 보험 기사님 현장출동 절대불가
4. 출동서비스 유료입니다.(특약 보험 가입시 1회 무료 제공)
5. 차량 내 흡연시 클리닝 비용 10만원이 부과 됩니다.
6.생선비린내/구토/실내 악취 발생시 클리닝 비용 10만원이 부과 됩니다.
※ 손해면책제도보험 및 특약보험은 1회 소멸성입니다.(사고발생 즉시 본사로 연락을 주셔야 보험처리 가능합니다.)</div>
    <div class="carbook pplinfo"><% %></div>
    <div class="carbook prom"></div>
    <div class="carbook money">총비용<br><%=money %></div>
</div>
</div>


<style>


.carbook{
    display:inline-block; 
    width:700px;
    height:200px; 
    border:1px solid black; 
    margin-left: 50px;
    margin-top: 10px;

}

.pplinfo{
    height:500px;

}

.money{
height:100px;

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
            height:700px;
            position:fixed;
            top:210px;
            left:400px;
            display: inline-block;
            background-color:white;
}

.box2{
    display: inline-block;
width:800px;
height: 1300px;
border:1px red solid;
margin-left:820px;
}


</style>
<%@ include file="/views/common/footer.jsp" %>	