<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.member.model.vo.Payment"%>
<%
	List<Payment> list = (List<Payment>) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
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
            font-size: 14px 
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
			<th width="150">결제방식</th>
            <th width="150">구매일</th>
			<th width="300">대여기간</th>
			<th width="150">가격</th>
			<th width="150">차량이름</th>
		</tr>
		<%if(list.isEmpty()) {%>
			<tr>
            	<td colspan="6">구매내역이 없습니다.</td>
            </tr>
        <%}else{ 
        	for(Payment p : list){
        %>
		<tr>
			<td><%=p.getType() %></td>
			<td><%=p.getToDate() %></td>
			<td><%=p.getStartDate() %> ~ <%=p.getEndDate() %></td>
			<td><%=p.getPirce() %></td>
			<td><%=p.getProductModel() %></td>
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
<%@ include file="/views/common/footer.jsp" %>