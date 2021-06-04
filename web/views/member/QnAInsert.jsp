<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<form method="POST" action = "<%=request.getContextPath()%>/member/QnAInsertEnd" enctype="multipart/form-data">
<input type="hidden" name="writer" value="<%=loginMember.getUserId()%>">
        <table style="padding-top:50px" align="center" width="800" cellpadding="2">
            <tr>
            <th height="20" align="center" bgcolor="#ccc"><font color="white">QnA글쓰기</font></th>
            </tr>
            <tr>
            <th>
            <table class="table2">
                <tr>
                <th>제목</th>
                <td><input type="text" name="title" size="60"></td>
                </tr>
                <tr>
                <th>내용</th>
                <td><textarea style="resize : none" name="content" cols="85" rows="15"></textarea></td>
                </tr>
                <tr>
                <th>설정</th>
                <td><select name="public">
                    <option value="Y">공개</option>
                    <option value="N">비공개</option>
                </select></td>
                </tr>
                <th>첨부파일</th>
                <td><input type="file" name="upfile"></td>
            </table>
            <center>
                <input type="submit" value="작성">
                <input type="button" value="취소" onclick="history.foward(-1);">
            </center>
            </th>
            </tr>
        </table>
    </form>
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