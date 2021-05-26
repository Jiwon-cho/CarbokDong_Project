<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.news.model.vo.News" %>
<%
List<News> list=(List<News>)request.getAttribute("list");
String pageBar=(String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp" %>




<div class="search">
<span class="camptit">캠핑 뉴스</span>
</div>

<section>
    <div class="articles_list"> 
    <table>
    <%for(News n: list){ %>
    <tr>
        <td>  
    <a href="">  <img src="<%=n.getImgUrl() %>" class="ig"></a></td>
    <dd>
    <a href="">
      <h2 style="font-size:17px;line-height:22px;font-weight:normal;"><%=n.getNewsTitle() %></h2>
        
      
            <p ><%=n.getNewsPrev() %></p>
            </a>
            <span><%=n.getNewsDate() %></span>
   </dd>  
</tr>
	<%} %>
</table>
</div>
	<%-- <ul>
	<%for(News n: list){ %>
	<li><%=n.getNewsNo() %><%=n.getNewsTitle() %></li>
	<%} %>
	</ul> --%>
<div class="pageBar">
<span><%=pageBar %></span>
</div>	
</section>
