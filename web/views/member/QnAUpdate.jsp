<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.member.model.vo.QnA"  %>
<%
	QnA q=(QnA)request.getAttribute("QnA");
%>
<%@ include file="/views/common/header.jsp" %>
<form method="POST" action = "<%=request.getContextPath()%>/member/QnAUpdateEnd?QnANo=<%=q.getNo()%>" enctype="multipart/form-data">
        <table style="padding-top:50px" align="center" width="800" cellpadding="2">
            <tr>
            <th height="20" align="center" bgcolor="#ccc"><font color="white">QnA글수정</font></th>
            </tr>
            <tr>
            <th>
            <table class="table2">
                <tr>
                <th>제목</th>
                <td><input type="text" name="title" size="60" value="<%=q.getTitle()%>"></td>
                </tr>
                <tr>
                <th>내용</th>
                <td><textarea style="resize : none" name="content" cols="85" rows="15"><%=q.getContent() %></textarea></td>
                </tr>
                <tr>
                <th>설정</th>
                <td><select name="public">
                    <option value="Y" <%=q.getQapublic().equals("Y")?"selected":"" %>>공개</option>
                    <option value="N" <%=q.getQapublic().equals("N")?"selected":"" %>>비공개</option>
                </select></td>
                </tr>
                <th>첨부파일</th>
                <td>
		            <%if(q.getFileOriginalName()!=null){ %>
			            <input type="file" name="up_file">
			            <span id="fname"><%=q.getFileOriginalName()%></span>
			            <input type="hidden" name="oldFile" value="<%=q.getFileReName()%>">
		            <%} else{ %>
		            	<input type="file" name="up_file">
		            <%} %>
                </td>
            </table>
            <center>
                <input type="submit" value="작성">
                <input type="button" value="돌아가기" onclick="history.foward(-1);">
            </center>
            </th>
            </tr>
        </table>
    </form>
    <script>
	    $("input[type=file]").change(e=>{
			if($(e.target).val()==""){
				$("#fname").show();
			}else{
				$("#fname").hide();
			}
		});
    </script>
    <style>
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
        }
        table.table2 tr {
                width: 50px;
                padding: 10px;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                width: 70px;
                padding: 10px;
                border-bottom: 1px solid #ccc;
        }
        table.table2 th {
                width: 70px;
                padding: 10px;
                border-bottom: 1px solid #ccc;
        }
    </style>
<%@ include file="/views/common/footer.jsp" %>