<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.news.model.vo.News" %>
<%
List<News> list=(List<News>)request.getAttribute("list");
String pageBar=(String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp" %>
  <style>
/*   .cts_aclst{
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
/*   ul.articles>li{
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
}    */

.pageBar{
margin-top:50px;
margin-left:730PX;
font-size:40px;
}
.search{
height:100px;
margin-left:570PX;
font-size:40px;
margin-top:30px;
}

.news-container {
    display: inline-block;
    width: 761PX;
    height: 170PX;
    margin-left: 570PX;
    margin-right: 570PX;
    border-top: 1px solid gray;
  }
  .header-container {
    display: inline-block;
    vertical-align: middle;
    height: 100%;
    width: 533px;
	float:right;
  }
  .image-right-container {
    display: inline-block;
    vertical-align: middle;
    width: 220PX;
    float: left;
  }
  .header-news-title, .left-body {
    display: block;
  }
  .left-body  {
    margin-top:20px;
    font-weight: 600;
    
  }

  .footer-date {
  }
  .title {
    font-size: 18px;
    display: inline-block;
    vertical-align: middle;
    font-weight: bold;
    margin-top:10px;
  }
  .top-img {
    width: 220px;
    height: 150px;
    /* border-radius: 20px; */
    margin-top:10px;
  }


    </style>
<div class="search">
<span class="camptit">>캠핑 뉴스</span>
</div>

<section>
	 <%for(News n: list){ %>	
    <div class="news-container">
    <a href="<%=request.getContextPath()%>/news/newsViews?newsNo=<%=n.getNewsNo()%>&cPage=<%=request.getParameter("cPage")%>">  
        <div class="image-right-container">
          <img src="<%=n.getImgUrl() %>" alt="" class="top-img">
        </div>
        <div class="header-container">
        
          <div class="header-news-title">
     
          <div class="title"><%=n.getNewsTitle() %></div>
          </div>
          <div class="left-body">
            <%=n.getNewsPrev() %>       </div>
          
          <div class="footer-date">
            <%=n.getNewsDate() %>
          </div>
        </div>
        </a>
      </div>
      <%} %>
      <div class="pageBar">
<span>&lt<%=pageBar %>&gt</span>
</div> 

  <%--   <div class="cts_aclst"> 
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
	<ul>
	<%for(News n: list){ %>
	<li><%=n.getNewsNo() %><%=n.getNewsTitle() %></li>
	<%} %>
	</ul>
<div class="pageBar">
<span>&lt<%=pageBar %>&gt</span>
</div> --%>	
</section>
<%@ include file="/views/common/footer.jsp" %>	