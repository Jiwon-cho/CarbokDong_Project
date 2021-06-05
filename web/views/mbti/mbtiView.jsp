<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.mbti.model.vo.Mbti" %>
<%
	List<Mbti>list=(List<Mbti>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
<br>
<h1 style="text-align: center;">&gt;MBTI</h1>
<hr>
<h3>[<%=list.get(0).getMbtiType() %>]</h3>
<br>
<p><%=list.get(0).getMbtiType() %> : <%=list.get(0).getMbtiInfo() %></p>
<h2>추천 캠핑장</h2>
<%for(Mbti m:list) {%>
      <hr>
      <ul class="level1" >
				<li>
					<div class="reply_div">
						<span class="txt_info" style="font-size: 15px;">
							<%=m.getMbtiCampName() %>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px; ">&emsp;<%=m.getMbtiCampLoc() %></span>
							<span class="txt_de" style="font-size: 20px; ">&emsp;<%=m.getMbtiCampInfo() %></span>
						</strong>
						<div style="display: inline-block; float: right; position: relative; bottom: 20px;" >
          					  <img
             					     src="<%=request.getContextPath() %>/images/<%=m.getMbtiCampPic() %>"
              						alt=""
              						style="width: 80px;height: 70px; float: right;"
            							/>
          					</div>
					</div>
				</li>
			</ul>
			<hr>
			<%} %>


<%@ include file="/views/common/footer.jsp"%>