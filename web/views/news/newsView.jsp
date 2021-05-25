<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.news.model.vo.News" %>
 <%
 
 News n=(News)request.getAttribute("news");
 String[] img=n.getImgUrl().split(",");
 
 %>
 <style>
.article-view{
margin-left: 35%;
margin-right: 35%;
width: 630px;
display: block;
text-align: left;
}

.top{
    width: 500px;
display: block;
text-align: left;
word-break: break-all;
margin-left: 10%;
    font-size: 30px;
}
img{
    margin-left: 5%;
}

</style>   
<%@ include file="/views/common/header.jsp" %>
 <div class="article-view">
    <div class="top">
    <div class="tit"> 	<%=n.getNewsTitle() %></div></div>
    <div class="contents" style="display:block; text-align: left;"> 
    <%for(String s: img){ %>
        <div class="ig"><img src="<%=s %>" style="width:540px;" alt="이미지중앙" border="0"></div>
   <%} %>
        <br>
        <br>
        <div>
           <%=n.getNewsContent() %>
        </div>
    </div>
</div>
<%@ include file="/views/common/footer.jsp" %>	