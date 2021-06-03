<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.member.model.vo.QnA" %>
<%
	List<QnA> list=(List<QnA>)request.getAttribute("list");
	String searchType=request.getParameter("searchType");
	String searchKeyword=request.getParameter("searchKeyword");
%>    
<%@ include file="/views/common/header.jsp" %>
<center>
<table class="Qnotice" border="1" cellspacing="0" summary="QnA게시판리스트">
		<tr><td class="title2"><p style="font-size: 35px;align">Q&A</p></td></tr>
        <caption>Q&A게시판리스트</caption>
        <colgroup>
        <col width="80">
        <col>
        <col width="200">
        <col width="150">
        <col width="150">
        </colgroup>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">상태</th>
            <th scope="col">글쓴이</th>
            <th scope="col">날짜</th>
        </tr>
        <%if(list.isEmpty()) {%>
			<tr>
            	<td colspan="6">조회된 게시글이 없습니다</td>
            </tr>
        <%}else{ 
        	
        	for(QnA q : list){
        %>
        <tr>
        <td class="no"><%=q.getNo() %></td>
        <td class="title2"><a href="<%=request.getContextPath()%>/member/QnAView?no=<%=q.getNo() %>"><%=q.getTitle() %></a></td>
        <%if(q.getResult().equals("Y")) {%>
        	<td class="result2"><a>답변완료</a></td>
        <%}else{ %>
        	<td class="result1"><a>접수중</a></td>
        <%} %>
        <td class="name"><%=q.getUserId() %></td>
        <td class="date"><%=q.getDate() %></td>
        </tr>
		<%} 
		}%>
</table>
<div id="search-container">
        	검색타입 :
        	<select id="searchType">
        		<option value="userId" <%=searchType!=null&&searchType.equals("userId")?"selected":"" %>>아이디</option>
        		<option value="title" <%=searchType!=null&&searchType.equals("title")?"selected":""%>>제목</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath() %>/member/searchQnAList" method="post">
        			<input type="text" name="searchKeyword" size="25" placeholder="검색할 아이디를 입력해주세요" value="<%=searchType!=null&&searchType.equals("userId")?searchKeyword:""%>">
        			<input type="hidden" name="searchType" value="MEMBER_ID">
        			<button type="submit">조회</button>
        		</form>
        	</div>
        	<div id="search-title">
        		<form action="<%=request.getContextPath() %>/member/searchQnAList" method="post">
        			<input type="text" name="searchKeyword" size="25" placeholder="검색할 제목을 입력해주세요" value="<%=searchType!=null&&searchType.equals("title")?searchKeyword:""%>">
        			<input type="hidden" name="searchType" value="QA_TITLE">
        			<button type="submit">조회</button>
        		</form>
        	</div>
        	</center>
        <div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
</div>
        <script>
        	$("#searchType").change(e=>{
        		const userId=$("#search-userId");
        		const title=$("#search-title");
        		
        		userId.css("display","none");
        		title.css("display","none");
        		
        		$("#search-"+$(e.target).val()).css("display","inline-block");
        	});
        	$(function() {
				$("#searchType").change();
			});
        </script>
        <style>
	        div#pageBar {
				margin-top: 10px;
				text-align: center;
				background-color: rgba(0, 188, 212, 0.3);
			}
			
			div#pageBar span.cPage {
				color: #0066ff;
			}
            .Qnotice,.Qnotice th,.Qnotice td{border:0}
            .Qnotice a{color:#383838;text-decoration:none}
            .Qnotice{width:91%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
            .Qnotice caption{display:none}
            .Qnotice th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
            .Qnotice td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
            .Qnotice .date,.Qnotice .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
            .Qnotice .title2{text-align:left; padding-left:15px; font-size:13px;}
            .Qnotice .title2 .new .name .date .result2{margin:0 0 2px;vertical-align:middle}
            .result1{margin:0 0 2px;vertical-align:middle;color:blue;}
            .Qnotice .title2 a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
        </style>
<%@ include file="/views/common/footer.jsp" %>