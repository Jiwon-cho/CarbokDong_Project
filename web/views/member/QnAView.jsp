<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.member.model.vo.QnA,com.member.model.vo.QnAReply" %>
<%
	QnA q=(QnA)request.getAttribute("QnA");
	List<QnAReply> reply=(List<QnAReply>)request.getAttribute("reply");
%> 
<%@ include file="/views/common/header.jsp" %>
<table class="view" align=center>
        <tr>
                <td colspan="4" class="title"><%=q.getTitle() %></td>
        </tr>
        <tr>
                <td class="main">작성자</td>
                <td class="content"><%=q.getNickName() %>(<%=q.getUserId() %>)</td>
                <td class="main">등록일</td>
                <td class="content"><%=q.getDate() %></td>
        </tr>
        <tr>
            <td class="main">첨부파일</td>
            <td class="content">
            <%if(q.getFileOriginalName()!=null) {%>
            	<a href="javascript:fn_fileDownload('<%=q.getFileOriginalName()%>','<%=q.getFileReName()%>')">
				<img alt="" src="<%=request.getContextPath()%>/images/file.jpg" width="16px"><%=q.getFileOriginalName()%></a>
			<%}else{ }%>
			</td>
        </tr>
        <tr>
                <td colspan="4" class="view_content" valign="top"><%=q.getContent() %></td>
        </tr>
        </table>
		<br>
        <%if(loginMember.getMemberType()==0) {%>
	        <form action="<%=request.getContextPath() %>/member/insertReply" method="post">
	        	<input type="hidden" name="QnAReply" value="<%=q.getNo()%>">
	        	<table align=center>
		            <tr>
		                <td><textarea name="QnAReplyContent" style=" width: 800px; height: 100px;resize: none; placeholder="댓글을 입력해 주세요."></textarea></td>
		                <td><button type="submit" id="btn-insert" style="width: 80px; height: 100px;">등록</button></td>
		            </tr>
		        </table>
			</form>
			<br>
        <%} %>
        <form action="<%=request.getContextPath() %>/member/deleteReply" method="post">
        <input type="hidden" name="QnANo" value="<%=q.getNo()%>">
        
 		<table align=center>
 			<%for(QnAReply qp : reply){%>
					<tr>
		                <td class="result" style=" width: 80px; height: 100px;">답변</td>
		                <td colspan="3" class="result2" valign="top" style=" width: 800px; height: 100px;"><%=qp.getQnAReplyContent() %></td>
		                <%if(loginMember.getMemberType()==0) {%>
		                <td><input type="hidden"  name="QnAReplyNo" value="<%=qp.getQnAReplyNo()%>"><button type="submit" id="btn-delete" style=" width: 50px; height: 100px;">삭제</button></td>
		                <%} %>
		            </tr>
				<%} %>
            
        </table>
        </form>
        <form method="post" name="form1">
        <input type="hidden" name="QnANo" value="<%=q.getNo()%>">
        <div class="btn">
        		<input type="hidden" name="QnANo" value="<%=q.getNo()%>">
        		<input type="submit" onclick="btn_QnAList();" value="목록으로">
                <%if(loginMember.getUserId().equals(q.getUserId())||(loginMember.getMemberType()==0)){ %>
                <input type="submit" onclick="btn_QnAUpdate();" value="수정">
                <input type="submit" onclick="btn_QnADelete();" value="삭제">
                <%} %>
                <%if((loginMember.getMemberType()==0)&&(q.getResult().equals("N"))) {%>
                <input type="submit" onclick="btn_QnAResult();" value="답변완료">
                <%} %>
        </div>
        </form>
        <script>
	        const fn_fileDownload=(oriname,rename)=>{
	    		const encodeOri=encodeURIComponent(oriname);
	    		const url="<%=request.getContextPath()%>/member/filedownload";
	    		location.assign(url+'?oriname='+encodeOri+'&rename='+rename);
	    	}
	        function btn_QnAList(){
	    		form1.action="<%=request.getContextPath() %>/member/QnAList"
	    	}
	        function btn_QnAUpdate(){
	    		form1.action="<%=request.getContextPath() %>/member/QnAUpdate"
	    	}
	        function btn_QnAResult(){
	    		form1.action="<%=request.getContextPath() %>/member/QnAResult"
	    	}
	        function btn_QnADelete(){
	        	if(confirm("정말로 삭제하시겠습니까?")){
					form1.action="<%=request.getContextPath() %>/member/QnADelete?rename=<%=q.getFileReName()%>"
				}
	    	}
	        
        </script>
        <style>
            .view {
            border: 1px solid #444444;
            margin-top: 30px;
            }
            .title {
            height: 30px;
            text-align: center;
            background-color: #cccccc;
            color: white;
            width: 1000px;
            }
            .result{
                height: 100px;
                text-align: center;
                background-color: #cccccc;
                color: white;
                border-bottom: 1px solid #444444;
                border-top: 1px solid #444444;
            }
            .result2{
                height: 100px;
                border-top: 1px solid #444444;
                border-bottom: 1px solid #444444;
                padding-top: 5px;
            }
            .main {
            text-align: center;
            background-color: #EEEEEE;
            width: 30px;
            }
            .content {
            background-color: white;
            width: 60px;
            }
            .view_content {
            padding-top: 10px;
            border-top: 1px solid #444444;
            height: 500px;
            }
            .btn {
            width: 700px;
            height: 200px;
            text-align: center;
            margin: auto;
            margin-top: 20px;
            }
            </style>
<%@ include file="/views/common/footer.jsp" %>