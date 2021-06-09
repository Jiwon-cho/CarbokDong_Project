<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.payment.model.vo.Payment,java.text.SimpleDateFormat,java.util.Date,com.admin.model.service.AdminService"%>
<%
	List<Payment> list = (List<Payment>) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
	 Date today=new Date();
	 
%>
<%@ include file="/views/common/header.jsp" %>
<style>
.list-table {
	        margin-top: 20px;
	        margin-bottom: 60px;
	    }
        .list-table th{
            height:40px;
            border-top:2px solid skyblue;
            border-bottom:1px solid #CCC;
            font-weight: bold;
            font-size: 17px;
        }
        .list-table td{
            text-align:center;
            padding:10px 0;
            border-bottom:1px solid	 #CCC; height:20px;
            font-size: 14px ;
            word-break: break-all;
        }
        .btn{
            margin: 10px;
            height: 30px;
            width: 50px;
        }
/*페이지바*/
div#pageBar {
	margin-top: 10px;
	text-align: center;
	background-color: rgba(0, 188, 212, 0.3);
}

div#pageBar span.cPage {
	color: #0066ff;
}
</style>
<center>
<div id="main_in">
			<div id="content">
	<h2>구매내역</h2>
	<table class="list-table">
		<tr>
			<th width="150">구매내역번호</th>
			<th width="150">결제번호</th>
			<th width="150">결제방식</th>
            <th width="150">결제시간</th>
			<th width="300">대여기간</th>
			<th width="150">가격</th>
			<th width="150">차량이름</th>
			<th width="150">대여상태</th>
			<th width="150">결제취소</th>	
		</tr>
		<%if(list.isEmpty()) {%>
			<tr>
            	<td colspan="9">구매내역이 없습니다.</td>
            </tr>
        <%}else{ 
        	for(Payment p : list){
        		String rc=new AdminService().returnCheck(p.getPaymentsNo());
        		String cc=new AdminService().cancelCheck(p.getPaymentsNo());
        		System.out.println(cc);
        %>	
		<tr>
			<td><%=p.getRnum() %></td>
			<td><%=p.getPaymentsNo() %></td>
			<td><%=p.getPaymetType() %></td>
			<td><%=p.getPaymentDate() %></td>
			<td><%=p.getStartDate() %> ~ <%=p.getEndDate() %></td>
			<td><%=p.getPrice() %></td>
			<td><%=p.getProductNm() %></td>
	
			<%if(p.getStartDate().after(today)) {%>
			<td style="color:gold;"> 출고 대기중	</td>
			 <%}else if((p.getStartDate().before(today)||p.getStartDate().equals(today))&&p.getEndDate().after(today)){%>
			<td style="color:blue;"> 대여중	</td>
			<%}else if(p.getEndDate().after(today)&&!(rc.equals("Y"))){ %>
			<td style="color:red;"> 반납 확인중	</td>
			<%}else if(p.getEndDate().before(today)&&rc.equals("Y")){ %>	
			<td style="color:green;"> 반납 완료	</td>
			<%} %>
			<%if(p.getStartDate().after(today)){ %>
			<%if(cc.equals("D")){ %>
			<td><input class="cancel-very" type="button" value="신청"></td>
			<%}else if(cc.equals("N")) {%>
			<td>취소 심사 중</td>
			<%}else{ %>
			<td style="color:lightgreen;">취소 됨</td>
			<%} %>
			<%}else{ %>
			<td>X</td>
			<%} %>
		</tr>
		<%} 
		}%>
	</table>
</div>
</center>
		</div>
	<div id="pageBar">
		<%=pageBar %>
	</div>
<script>
$(".cancel-very").click((e)=>{
	let val=$(e.target).parent().parent().children();
 
    
    var f=val[1].innerHTML;
    console.log(f);
  	var a=val[8].innerHTML;
    console.log(a);
    
    
    var result=confirm("결제 취소 신청을 하시겠습니까?");
    
    if(result){
	$.ajax({
    	url:"<%=request.getContextPath()%>/payment/cancelCheck",
    	 type: 'POST',
         dataType: 'json',
    	data:{
    		pm_no:f
    	},
    	success:data=>{
    		console.log(data.msg);
    		alert(data.msg);
    	
    		console.log(data.rc);
    		if(data.rc=='N'){
    			val[8].innerHTML='취소 심사 중';
    		}
    		
    	}
    	
    	
    });

    
    
    
    } else{
    	alert("반납이 되지 않았습니다.");
    }
    
    
    
});



</script>	
	
	
	
<%@ include file="/views/common/footer.jsp" %>