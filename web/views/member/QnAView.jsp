<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.member.model.vo.QnA" %>
<%
	QnA q=(QnA)request.getAttribute("QnA");
%> 
<%@ include file="/views/common/header.jsp" %>
<table class="view" align=center>
        <tr>
                <td colspan="4" class="title"><%=q.getTitle() %></td>
        </tr>
        <tr>
                <td class="main">작성자</td>
                <td class="content"><%= %>(<%=q.getUserId() %>)</td>
                <td class="main">등록일</td>
                <td class="content">2021/05/08</td>
        </tr>
        <tr>
                <td colspan="4" class="view_content" valign="top">내용</td>
        </tr>
        <tr>
            <td class="result">답변</td>
            <td colspan="3" class="result2" valign="top">dasdasdas</td>
        </tr>
        </table>
 
        <div class="btn">
                <button class="" name="" onclick="">목록으로</button>
                <button class="" name="" onclick="">수정</button>
                <button class="" name="" onclick="">삭제</button>
        </div>
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
                border-top: 1px solid #444444;
            }
            .result2{
                height: 100px;
                border-top: 1px solid #444444;
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