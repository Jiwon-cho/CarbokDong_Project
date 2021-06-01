<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.borad.model.vo.Board,com.borad.model.vo.Files" %>
<%
	List<Board>list=(List<Board>)request.getAttribute("list");
	List<Board>pplist=(List<Board>)request.getAttribute("pplist");
	String searchType= request.getParameter("searchType");
	String searchKeyword= request.getParameter("searchKeyword");
	//String img=(String)request.getAttribute("img");
	//List<Files>flist=(List<Files>)request.getAttribute("flist");
%>    
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainBoradStyle.css">
<style>
	#ddssaa{
		width:800px;
		height: 100px;
		position: absolute;
		display: block;
		left: 170px;
		bottom: 40px;
		column-span: all;
		overflow: hidden;	
	}
	#pageBarb{
	text-align: center;
	}
	#pageBarb a{
		display: inline-block;
		font-weight: bold;
		text-decoration: none;
		width: 50PX;
	}
	#search-container{
		position: relative;
		left: 550px;
	}
</style>
	<section id="borad-container">
		<p id="titi" style="font-size: 35px;">내가 쓴 글</p>
		<br><br>
		<table  id="bb" class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
		<colgroup>
		<col>
		<col width="110">
		<col width="100">
		<col width="80">
		</colgroup>
		
		</table>
		
		<br>
		<div id="secondBorad" style="position: relative;">
		<ul class="side">
			<%for(Board b: list){ %>
			<li>
				<a href="<%=request.getContextPath() %>/borad/boardView?No=<%=b.getBoardNb() %>" class="aaa">
				<input type="hidden" name="boardNo" value="<%=b.getBoardNb()%>">
					<span class="artice">

						<img src="<%=request.getContextPath() %>/images/noimage.gif" width="130" height="120">

						<strong class="tit" style="display: inline-block;">
							<span class="txt_de" style="font-size: 23px;">&emsp;<%=b.getBoardTitle() %></span>
						</strong>
						<span id="ddssaa" style="font-size: 20px;"><%=b.getBoardContents()%></span>
						<span class="txt_info">
							<span class="username" style="font-size: 17px;">
							 <%=b.getMemberId() %>
							 ||
							</span>
							<span style="font-size: 17px;">
							<%=b.getBoradDate() %>
							||
							</span>
							<span style="font-size: 17px;">
							<%=b.getViewCount() %>
							</span>
						</span>
					</span>
				</a>
			</li>
			<%} %>
		</ul>
		</div>
		<br><br>
		<div id="pageBarb"><%=request.getAttribute("pageBar") %></div>
	
<%@ include file="/views/common/footer.jsp" %>