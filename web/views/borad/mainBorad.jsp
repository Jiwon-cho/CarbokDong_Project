<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.borad.model.vo.Board" %>
<%
	List<Board> list=(List<Board>)request.getAttribute("list");
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
				<th scope="col">추천</th>
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
				<%for(int i=0;i<4;i++){ %>
			<tr>
				<td class="title">
				<input type="button" value="인기글" class="btnmain" readonly="readonly">
				<a href="#" style="font-size: 20px;">게시판 제목이 들어갑니다</a>
				</td>
				<td class="name" style="font-size: 20px;">글쓴이이름</td>
				<td class="date" style="font-size: 13px;">2021/05/15</td>
				<td class="hit" style="font-size: 13px;">10</td>
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
						<%if(b.getFilepath()==null){ %>
						<img src="<%=request.getContextPath() %>/images/noimage.gif" width="130" height="120" >
						<%}else{ %>
						<img src="<%=request.getContextPath() %>/images/<%=b.getFilepath()%>" width="60" height="60" >
						<%} %>
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
							<%=b.getLikeCount() %>
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
		<select>
			<option value="">내용으로찾기</option>
			<option value="">작성자로찾기</option>
			<option value="">내용+작성자</option>
		</select>
		<textarea cols="20" rows="1"></textarea>
		<input type="button" value="검색">
	</section>
	<br><br>
	<script>
	   $("#insertborad").on("click",(e)=>{
           location.assign("<%=request.getContextPath()%>/insertBorad")
       });
	</script>
<%@ include file="/views/common/footer.jsp"%>