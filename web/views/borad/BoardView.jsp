<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.borad.model.vo.Board,java.util.List,com.borad.model.vo.Reply,com.borad.model.vo.Files" %>
<%
List<Reply>list=(List<Reply>)request.getAttribute("list");
	Board b=(Board)request.getAttribute("b");
	int replycount=(int)request.getAttribute("replycount");
	List<Files> f=(List<Files>)request.getAttribute("f");

%>    
    
    
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/BoardView.css">
<style>
	#btn-insert{
		width:50px; height:50px; color:#fff; background:#ff5656; 
   	 	font-size: 13px;
   	 	position: relative;
   	 	top:-21px;
   	 	}

</style>
<br><br>
<article id="ar">
	<div class="divdivv">
		<h3 class="tit_subject" style="font-size: 40px;"><%=b.getBoardTitle()%></h3>
		<span class="spandd">
			<a><h3 style="font-size: 25px;"><img alt="" width="30" height="30" style="border-radius: 100px"
			src="<%=request.getContextPath()%>/images/user.jpg"><%=b.getMemberId()%></h3></a>
			<br>
			<span class="txt_bar">|</span>
			<span class="numnum" style="font-size: 20px;"><%=b.getBoradDate()%></span>
			<span class="txt_bar">|</span>
			<span class="numnum" style="font-size: 20px;"><%=b.getViewCount() %></span>
		</span>
		<span class="desc_subjeck">
			<a id="gomain" role="button" class="btnbtn_1" style="font-size: 15px; cursor: pointer;">목록</a>
			<a id="rec_up" role="button" class="btnbtn_1" style="font-size: 15px; cursor: pointer;">
				추천 
				<!-- 스펜에 추천수 -->
				<span class="num_count"></span>
			</a>
			 <%if(loginMember!=null&&loginMember.getUserId().equals(b.getMemberId())){ %> 
			<a href="<%=request.getContextPath() %>/board/updateBoard?No=<%=b.getBoardNb() %>" role="button" class="btnbtn_2" style="font-size: 15px;">수정</a>
			<a id="deletebtn" role="button" class="btnbtn_2" style="font-size: 15px; cursor: pointer;">삭제</a>
			 <%} %>
		</span>
	</div>
	<div class="view_info">
		<%if(f!=null){ %>
			<%for(Files a:f){ %>
		<img src="<%=request.getContextPath() %>/upload/board/<%=a.getFileNm() %>" width="500" height="300" >
		<br>
			<%} %>
		<%}else{ %>
		<%} %>
		<div id="article" style="font-size: 20px;"><%=b.getBoardContents()%></div>
	</div>
	<div class="viewrecom">
		<div>
			<ul class="tab_tt">
				<li class="on">
					<a class="ahref" style="font-size: 20px;">댓글<span class="num_total"><%=replycount%></span></a>
				</li>
			</ul>
			<%
			for(Reply bc : list){ 
					if(bc.getReplyLevel()==1){
			%>
			<ul class="level1">
				<li>
					<div class="reply_div">
						<span class="txt_info" style="font-size: 15px;">
							<%=bc.getReplyWriter() %>
							<span class="txt_bar" style="font-size: 15px;">|</span>
							<span class="txt_num" style="font-size: 15px;"><%=bc.getReplyDate() %></span>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px;"><%=bc.getReplyContent() %></span>
						</strong>
						<%if(loginMember!=null&&loginMember.getUserId().equals(bc.getReplyWriter())){ %> 
						<button onclick="location.assign('<%=request.getContextPath() %>/board/deleteReply?reNo=<%=bc.getReplyNo() %>&boNo=<%=b.getBoardNb()%>');" class="btn-reply" style="font-size: 20px;" value="<%=bc.getReplyNo()%>">삭제</button>
						<%}%>
						<button class="btn-reply" style="font-size: 20px;"  value="<%=bc.getReplyNo()%>">답글</button>
					</div>
				</li>
			</ul>
			<%}else if(bc.getReplyLevel()==2) {%>
			<ul class="level2">
				<li>
					<div class="reply_div">
						<span class="txt_info" style="font-size: 15px;">
							ㄴ <%=bc.getReplyWriter() %>
							<span class="txt_bar" style="font-size: 15px;">|</span>
							<span class="txt_num" style="font-size: 15px;"><%=bc.getReplyDate() %></span>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px;"><%=bc.getReplyContent() %></span>
						</strong>
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
						<input type="hidden" name="commentWriter" value="<%=loginMember==null?"":loginMember.getUserId()%>">
						<input type="hidden" name="boardRef" value="<%=b.getBoardNb()%>">
						<input type="hidden" name="commentRef" value="0">
						<button type="submit" value="등록" id="btn-insert">등록</button>
					</form>
				</div>
			</div>
	</div>
	<br><br><br>

</article>
<script >

	$("#btn-insert2").click(e=>{
		location.assign('<%=request.getContextPath() %>/board/commentInsert');
	});
	$("#gomain").click(e=>{
		location.assign('<%=request.getContextPath() %>/borad/mainBorad');
	});
	
	$(".btn-reply").click(e=>{
		const ul=$("<ul>");
		const form=$(".inner-comment>form").clone();
		form.find("textarea").attr("rows","1");
		form.find("textarea").attr("cols","95");
		form.find("[name=level]").val("2");
		form.find("[name=commentRef]").val($(e.target).val());
		form.find("button").removeAttr("id").addClass("btn-insert2");
		console.log($(e.target).val());
		const li=$("<li>").attr("colspan","2");
		ul.append(li.append(form));
		ul.find("li").css("display","none");
		
		ul.insertAfter($(e.target).parents("ul")).children("li").slideDown(800);
		
		$(e.target).off("click");
	});
	
 	$(".comment-editor textarea").focus(e=>{
		<%if(loginMember==null){%>
			alert("로그인후 이용하세요");
			$("#gomain").focus();
			$(e.target).blur();
			location.assign("<%=request.getContextPath()%>/loginPage");
		<%}%>
	});
 	
	$(".btn-reply").focus(e=>{
		<%if(loginMember==null){%>
			alert("로그인후 이용하세요!");
			$(e.target).blur();
			location.assign("<%=request.getContextPath()%>/loginPage");
			<%}%>
	}); 
	
	$("#deletebtn").click(e=>{
		const result=confirm("정말로 삭제하시겠습니까?");
		if(result){
		location.assign('<%=request.getContextPath() %>/board/deleteBoard?No=<%=b.getBoardNb() %>');			
		}	
	});
	
	$("#rec_up").click(e=>{
		<%if(loginMember!=null){%>
		$.ajax({
			url:"<%=request.getContextPath()%>/board/recUpdate.do",
			type:"POST",
			data:{
				no:<%=b.getBoardNb()%>,
				/* id값 loginMember.getUserId 로변경 */
				id:"<%=loginMember.getUserId()%>",
			},
			success: function(){
				recCount();
				console.log("추천로직");
			},
		})
		<%}else{%>
		alert("로그인후 이용하세요!");
		$(e.target).blur();
		location.assign("<%=request.getContextPath()%>/loginPage");
	
		<%}%>
	});
	
	function recCount(){
		$.ajax({
			url:"<%=request.getContextPath()%>/board/recCount.do",
			type:"POST",
			data:{
				no:<%=b.getBoardNb()%>,
			},
			success: function(count){
				console.log("카운트수");
				$(".num_count").html(count);
			},
		})
	};
	recCount();
</script>
<%@ include file="/views/common/footer.jsp"%>