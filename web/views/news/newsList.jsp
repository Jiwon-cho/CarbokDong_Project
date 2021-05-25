<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.news.model.vo.News" %>
<%
List<News> list=(List<News>)request.getAttribute("list");
String pageBar=(String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp" %>
  <style>
  .cts_aclst{
      width: 600px;
      margin-left: 30%;
      margin-right:30%;
      height:auto;
      
  }
  .ig{
      float:left;
      margin-right: 20px;
      clear:both;
      
  }
 /*  ul>li:first-child{
      list-style: none;
      margin-top: 20px;
      border-top: none;
    
  } */
  ul.articles>li{
      list-style: none;
      margin-top: 20px;
      border-top: 1px solid #eee;
      height:auto;
    
  }
.pbdt{
    margin-left: 10px;

}
.tt2{
 margin-left: 45%;
 float:right;
}

.cts{
margin-top:10px;
}
.pageBar{
margin-top:50px;
margin-left:45%;
font-size:40px;
}   


.search{
height:100px;
margin-left:32%;
font-size:40px;
margin-top:30px;
}



    </style>
<div class="search">
<span class="camptit">캠핑 뉴스</span>
</div>

<section>
    <div class="cts_aclst"> 
    <ul class="articles">
    <%for(News n: list){ %>
        <li>  
    <a href="<%=request.getContextPath()%>/news/newsViews?newsNo=<%=n.getNewsNo()%>&cPage=<%=request.getParameter("cPage")%>">   <span class="tt2"><%=n.getNewsTitle() %></span>
        <span class="fl" style="display: block;width: 700px;height:160px;">
      
            <img src="<%=n.getImgUrl() %>" class="ig">
            <span class="cts" ><%=n.getNewsPrev() %></span>
            </span>
            <span class="pbdt" ><%=n.getNewsDate() %></span>
   </a>  
</li>
	<%} %>
</ul>
</div>
	<%-- <ul>
	<%for(News n: list){ %>
	<li><%=n.getNewsNo() %><%=n.getNewsTitle() %></li>
	<%} %>
	</ul> --%>
<div class="pageBar">
<span>&lt<%=pageBar %>&gt</span>
</div>	
</section>
<%@ include file="/views/common/footer.jsp" %>	