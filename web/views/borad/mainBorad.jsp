<%@page import="org.jsoup.select.Evaluator.IsEmpty"%>
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
		<p id="titi" style="font-size: 35px;">  커뮤니티 게시판</p>
		<p id="insertborad" style="cursor:pointer; font-size: 25px;">글쓰기</p>
		<hr>
		<table  id="bb" class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
		<colgroup>
		<col>
		<col width="110">
		<col width="100">
		<col width="80">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
		<%for(int i=0;i<2;i++){ %>
			<tr>
				<td class="title">
				<input type="button" value="공지" class="btnmain" readonly="readonly">
				<a href="#" style="font-size: 20px;">게시판 제목이 들어갑니다</a>
				</td>
				<td class="name" style="font-size: 20px;">글쓴이이름</td>
				<td class="date" style="font-size: 13px;">2021/05/15</td>
				<td class="hit" style="font-size: 13px;">10</td>
			</tr>
			<%} %>
				<%for(Board bbc:pplist){ %>
			<tr>
				<td class="title">
				<input type="button" value="인기글" class="btnmain" readonly="readonly">
				<a href="<%=request.getContextPath() %>/borad/boardView?No=<%=bbc.getBoardNb() %>" style="font-size: 20px;"><%=bbc.getBoardTitle() %></a>
				</td>
				<td class="name" style="font-size: 20px;"><%=bbc.getMemberId() %></td>
				<td class="date" style="font-size: 13px;"><%=bbc.getBoradDate() %></td>
				<td class="hit" style="font-size: 13px;"><%=bbc.getViewCount() %></td>
			</tr>

			<%} %>
		</tbody>
		</table>
		<br>
		<hr>
		<br>
		<div id="secondBorad" style="position: relative;">
		<ul class="side">
			<%for(Board b: list){ %>
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
			<%} %>
		</ul>
		</div>
		<br><br>
		<div id="pageBarb"><%=request.getAttribute("pageBar") %></div>
		<br><br>
	<div id="search-container">
		검색:
		<select id="searchType" size="1">
			<option value="member_Id" <%=searchType!=null&&searchType.equals("member_Id")?"selected":"" %>>작성자로찾기</option>
			<option value="board_Contents"  <%=searchType!=null&&searchType.equals("board_Contents")?"selected":"" %>>내용으로찾기</option>
		</select>
		<div id="search-member_Id">
			<form action="<%=request.getContextPath() %>/board/searchMemberList" method="post">
				<input type="text" name="searchKeyword" size="25"
				placeholder="검색할 아이디를 입력해주세요"
				value="<%=searchType!=null&&searchType.equals("member_Id")?searchKeyword:""%>">
				<input type="hidden" name="searchType" value="member_Id">
				<button type="submit" >조회</button>
			</form>
		</div>
		<div id="search-board_Contents">
			<form action="<%=request.getContextPath() %>/board/searchMemberList" method="post">
				<input type="text" name="searchKeyword" size="25"
				placeholder="검색할 내용을 입력해주세요"
				value="<%=searchType!=null&&searchType.equals("board_Contents")?searchKeyword:""%>">
				<input type="hidden" name="searchType" value="board_Contents">
				<button type="submit" >조회</button>
			</form>
		</div>
			</div>
	<br><br>
	<script>
	 <%if(loginMember!=null){%> 
	   $("#insertborad").on("click",(e)=>{
           location.assign("<%=request.getContextPath()%>/insertBorad");
       });
	   <%}else{%>
	   $("#insertborad").on("click",(e)=>{
		   alert("로그인후 이용해주세요.");
           location.assign("<%=request.getContextPath()%>/loginPage");
       });
	   <%}%> 
	  $("#searchType").change(e=>{
			const userId=$("#search-member_Id");
			const userName=$("#search-board_Contents");
			
			userId.css("display","none");
			userName.css("display","none");

			
			$("#search-"+$(e.target).val()).css("display","inline-block");
		});
		$(function(){
			$("#searchType").change();
		});

	</script>
<%@ include file="/views/common/footer.jsp"%>