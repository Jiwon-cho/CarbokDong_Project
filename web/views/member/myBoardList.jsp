<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.borad.model.vo.Board,com.borad.model.vo.Files" %>
<%
	List<Board>list=(List<Board>)request.getAttribute("list");
	List<Board>pplist=(List<Board>)request.getAttribute("pplist");
	String searchType= request.getParameter("searchType");
	String searchKeyword= request.getParameter("searchKeyword");
	//String img=(String)request.getAttribute("img");
	List<Files>flist=(List<Files>)request.getAttribute("flist");
%>    
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainBoradStyle.css">
<style>
	#ddssaa{
		width:800px;
		height: 100px;
		position: absolute;
		display: block;
		left: 200px;
		bottom: 30px;
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
	.txt_de{
	position:relative;
	left:150px;
	bottom:100px;
	color: #000;
	font-size: 17px;
	line-height: 22px;
	vertical-align: top;
	white-space: normal;
	word-break: break-all;
	}
</style>

	<section id="borad-container">
		<p id="titi" style="font-size: 35px;">  내가 쓴 글</p>
		<br><br><br><br>
		
		<br>
		<hr>
		<br>
		<div id="secondBorad" style="position: relative;">
		<ul class="side">
		<%if(list.isEmpty()) {%>
			<tr>
            	<center><td colspan="5">조회된 게시글이 없습니다</td></center>
            	<br><hr>
            </tr>
            
        <%}else{
			for(Board b: list){ %>
			<li>
				<a href="<%=request.getContextPath() %>/borad/boardView?No=<%=b.getBoardNb() %>" class="aaa">
					<span class="artice">
				<div id="imgdivback" style="width: 130px; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
					<%for(Files f:flist){%>
						<%if(f.getBoardNb()==b.getBoardNb()){ %>
						<img src="<%=request.getContextPath() %>/upload/board/<%=f.getFileNm() %>" width="130" height="120"
						onerror="this.src='<%=request.getContextPath() %>/images/noimage.gif'">
						<%}else{ %>
						<%} %>
					<%} %>
					</div>
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
			<%}
			}%>
		</ul>
		</div>
		<br><br>
		<div id="pageBarb"><%=request.getAttribute("pageBar") %></div>
		<br><br>
<%@ include file="/views/common/footer.jsp" %>