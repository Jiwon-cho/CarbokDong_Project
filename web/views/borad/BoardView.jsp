<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.borad.model.vo.Board,java.util.List,com.borad.model.vo.BoardComment" %>
<%
	List<BoardComment>list=(List<BoardComment>)request.getAttribute("list");
	Board b=(Board)request.getAttribute("b");
	int replycount=(int)request.getAttribute("replycount");
%>    
    
    
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/BoardView.css">
<style>
	#btn-insert{
		width:50px; height:50px; color:#fff; background:#ff5656; 
   	 	font-size: 13px;
   	 	position: relative;
   	 	top:-20px;
   	 	
   	 	
    }
</style>
<br><br>
<article id="ar">
	<div class="divdivv">
		<h3 class="tit_subject" style="font-size: 40px;"><%=b.getBoardTitle() %></h3>
		<span class="spandd">
			<a><h3 style="font-size: 25px;"><img alt="" width="30" height="30" style="border-radius: 100px"
			src="<%=request.getContextPath() %>/images/user.jpg"><%=b.getMemberId() %></h3></a>
			<br>
			<span class="txt_bar">|</span>
			<span class="numnum" style="font-size: 20px;"><%=b.getBoradDate() %></span>
			<span class="txt_bar">|</span>
			<span class="numnum" style="font-size: 20px;">조회수</span>
		</span>
		<span class="desc_subjeck">
			<a id="gomain" role="button" class="btnbtn_1" style="font-size: 15px; cursor: pointer;">목록</a>
			<a href="" role="button" class="btnbtn_1" style="font-size: 15px;">
				추천 
				<!-- 스펜에 추천수 -->
				<span class="num_count">0</span>
			</a>
			<a href="" role="button" class="btnbtn_2" style="font-size: 15px;">수정</a>
			<a href="" role="button" class="btnbtn_2" style="font-size: 15px;">삭제</a>
		</span>
	</div>
	<div class="view_info">
		<div id="article" style="font-size: 20px;"><%=b.getBoardContents() %></div>
	</div>
	<div class="viewrecom">
		<div>
			<ul class="tab_tt">
				<li class="on">
					<a class="ahref" style="font-size: 20px;">댓글<span class="num_total"><%=replycount %></span></a>
				</li>
			</ul>
			<%for(BoardComment bc : list){ 
				if(bc.getBoardCommentLevel()==1){%>
			<ul class="level1">
				<li>
					<div class="reply_div">
						<span class="txt_info" style="font-size: 15px;">
							<%=bc.getBoardCommentWriter() %>
							<span class="txt_bar" style="font-size: 15px;">|</span>
							<span class="txt_num" style="font-size: 15px;"><%=bc.getBoardCommentDate() %></span>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px;"><%=bc.getBoardCommentContent() %></span>
						</strong>
						<button class="btn-delete" style="font-size: 20px;">삭제</button>
						<button class="btn-reply" style="font-size: 20px;">답글</button>
					</div>
				</li>
			</ul>
			<%}else if(bc.getBoardCommentLevel()==2) {%>
			<ul class="level2">
				<li>
					<div class="reply_div">
						<span class="txt_info" style="font-size: 15px;">
							<%=bc.getBoardCommentWriter() %>
							<span class="txt_bar" style="font-size: 15px;">|</span>
							<span class="txt_num" style="font-size: 15px;"><%=bc.getBoardCommentDate() %></span>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px;"><%=bc.getBoardCommentContent() %></span>
						</strong>
						<button class="btn-delete" style="font-size: 20px;">삭제</button>
						<button class="btn-reply" style="font-size: 20px;">답글</button>
					</div>
				</li>
			</ul>
				<%} 
				}%>
		</div>
		<br><br>
			<div class="comment-editor">
				<div class="inner-comment">
					<form action="<%=request.getContextPath() %>/board/commentInsert" method="post">
						<textarea name="comment" rows="3" cols="195" style="resize: none;" placeholder="로그인을 하셔야 댓글에 글을 쓸수 있습니다."></textarea>
						<input type="hidden" name="level" value="1">
						<input type="hidden" name="commentWriter" value="admin">
						<input type="hidden" name="boardRef" value="<%=b.getBoardNb()%>">
						<input type="hidden" name="commentRef" value="0">
						<button type="submit" value="등록" id="btn-insert">등록</button>
					</form>
				</div>
			</div>
	</div>
	<br><br><br><br><br>
	<button class="pagebtn"> &lt;prev </button>
	<button class="pagebtn"> next&gt; </button>
</article>
<script >
	$("#gomain").click(e=>{
		location.assign('<%=request.getContextPath() %>/borad/mainBorad');
	});
	$(".btn-reply").click(e=>{
		const ul=$("<ul>");
		const form=$(".comment-editor>form").clone();
		form.find("textarea").attr("rows","1");
		form.find("[name=level]").val("2");
		form.find("[name=commentRef]").val($(e.target).val());
		form.find("button").removeAttr("id").addClass("btn-insert2");
		
		const li=$("<li>").attr("colspan","2");
		ul.append(li.append(form));
		ul.find("li").css("display","none");
		
		ul.insertAfter($(e.target).parents("ul")).children("li").slideDown(800);
		
		$(e.target).off("click");
	});
</script>
<%@ include file="/views/common/footer.jsp"%>