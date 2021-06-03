<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.car.model.vo.Car" %>
<%
Car c=(Car)request.getAttribute("car");
String start=(String)request.getAttribute("start");
String end=(String)request.getAttribute("end");
String gear=(String)request.getAttribute("gear");
int money=(int)request.getAttribute("money");   
 
%>
<%@ include file="/views/common/header.jsp" %>    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<body>
<div id="result"></div>



    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp95185287'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var rs_data;
        var cDate=new Date().getTime();
        
        function convertTime(){
            var ot= new Date();
            var yy=ot.getFullYear();
            var mt=ot.getMonth()+1;
            var dt=ot.getDate();
            var dh=ot.getHours();
            var dm=ot.getMinutes();
            var ds=ot.getSeconds();
       
        
            return yy+"-"+mt+"-"+dt+"-"+dh+"-"+dm+"-"+ds;
        }
        var currentTime=convertTime()

        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + cDate,
            name : '<%=c.getCarModel()%>',
            amount : <%=money%>,
            buyer_email : 'SS',
            buyer_name : '<%=loginMember.getUserId()%>',
            buyer_tel : '1',
            buyer_addr : '한국',
            buyer_postcode : '123-456',
    
        }, function(rsp) {
        
             if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "<%=request.getContextPath()%>/order/purchasecheck", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                     	buyer: rsp.buyer_name,
                        paid_amount: rsp.paid_amount,
                    	pd_no:<%=c.getCarNB()%>,
                        date: currentTime,
                        pay_method:rsp.pay_method,
                        pd_name:rsp.name,
                     	start:<%=start%>,
                     	end:<%=end%>
                    },
                     success:data=>{
                    	console.log(data);
                    	const table=$("<table>");
                    	const head=$("<tr>").html("<th>고유 아이디</th><th>결제자 이름</th><th>결제 금액</th><th>결제 시간</th><th>결제 물품</th><th>결제 방법</th>");
                    	table.append(head);
                    	const body=$("<tr>");
        				const id=$("<td>").html(data.imp_uid);
        				const buyer=$("<td>").html(data.buyer);
        				const amount=$("<td>").html(data.paid_amount);
        				const time=$("<td>").html(currentTime);
        				const pd=$("<td>").html(data.pd_name);
        				const pm=$("<td>").html(data.pay_method);
        				body.append(id).append(buyer).append(amount).append(time).append(pd).append(pm);
        				table.append(body);
                    	$("#result").html(table);
                    	
                    	
                  
                    } 
                    
                });
                //성공시 이동할 페이지 --%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                (function(){
                	 var form = document.createElement("form");
                     var parm = new Array();
                     var input = new Array();
             	
                     
                     form.action = "<%=request.getContextPath()%>/order/payFail";
                     form.method = "post";


                      parm.push( ['carNB', '<%=c.getCarNB()%>'] ); 
             		parm.push( ['start','<%=start%>']);
             		parm.push( ['end','<%=end%>']);
             		parm.push( ['gear','<%=gear%>']);
             		parm.push( ['money','<%=money%>']);


                     for (var i = 0; i < parm.length; i++) {
                         input[i] = document.createElement("input");
                         input[i].setAttribute("type", "hidden");
                         input[i].setAttribute('name', parm[i][0]);
                         input[i].setAttribute("value", parm[i][1]);
                         form.appendChild(input[i]);
                     }
                     document.body.appendChild(form);
                     form.submit();
                }());
                
           
            }
        })
    });
    
  
/* }); */
 
     </script>
<%@ include file="/views/common/footer.jsp" %>	