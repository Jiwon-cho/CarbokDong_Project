<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.mbti.model.vo.Mbti" %>
<%
	List<Mbti>list=(List<Mbti>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
<div style="width: 70%;position: relative; left: 255px;">
<br>
<h1 style="text-align: center;">&gt;MBTI</h1>
<hr>
<h3 style="text-align: center;">[<%=list.get(0).getMbtiType() %>]</h3>
<br>
<p style="text-align: center;"><%=list.get(0).getMbtiType() %> : <%=list.get(0).getMbtiInfo() %></p>
<br><hr>
<h2 style="text-align: center;">추천 캠핑장</h2>
<%for(Mbti m:list) {%>
      <hr>
      <ul class="level1" style="height: 150px;">
				<li>
					<div class="reply_div">
						<span class="txt_info" style="font-size: 20px; position: relative; left: 20px;" >
							<%=m.getMbtiCampName() %>
						</span>
						<strong class="reply_st">
							<span class="txt_de" style="font-size: 20px; position: relative; top: 40px; right: 80px;">&emsp;<%=m.getMbtiCampLoc() %></span>
							<span class="txt_de" style="font-size: 20px; position: relative; top: 90px; right: 400px;">&emsp;<%=m.getMbtiCampInfo() %></span>
						</strong>
						<div style="display: inline-block; float: left; position: relative; " >
          					  <img
             					     src="<%=request.getContextPath() %>/images/campImgs/<%=m.getMbtiCampPic() %>"
              						alt=""
              						style="width: 200px;height: 150px; float: left; position: relative; display: inline-block;"
            							/>
          					</div>
					</div>
				</li>
			</ul>
			<hr>
			<%} %>
</div>

<%@ include file="/views/common/footer.jsp"%>