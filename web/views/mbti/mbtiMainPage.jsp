<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>


<h1 style="text-align: center;">&gt;MBTI</h1>

<img src="<%=request.getContextPath() %>/images/mbti.jpg" style="position: relative; left: 700px;" usemap="#map">
 <map name="map">
  		  <area shape="rect" coords="1,2,120,120" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ISTJ" 
         alt="" target="_self">
          <area shape="rect" coords="128,1,250,119" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ISFJ" 
         alt="" target="_self">
          <area shape="rect" coords="256,2,371,118" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=INFJ" 
         alt="" target="_self">
          <area shape="rect" coords="382,2,499,121" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=INTJ" 
         alt="" target="_self">
          <area shape="rect" coords="1,127,122,247" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ISTP" 
         alt="" target="_self">
          <area shape="rect" coords="127,127,248,246" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ISFP" 
         alt="" target="_self">
          <area shape="rect" coords="255,127,372,245" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=INFP" 
         alt="" target="_self">
          <area shape="rect" coords="379,127,497,248" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=INTP" 
         alt="" target="_self">
          <area shape="rect" coords="0,251,121,372" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ESTP" 
         alt="" target="_self">
          <area shape="rect" coords="127,250,245,371" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ESFP" 
         alt="" target="_self">
          <area shape="rect" coords="255,252,373,371" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ENFP" 
         alt="" target="_self">
          <area shape="rect" coords="379,252,498,370" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ENTP" 
         alt="" target="_self">
          <area shape="rect" coords="-1,378,119,495" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ESTJ" 
         alt="" target="_self">
          <area shape="rect" coords="128,378,245,497" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ESFJ" 
         alt="" target="_self">
          <area shape="rect" coords="253,379,371,497" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ENFJ" 
         alt="" target="_self">
          <area shape="rect" coords="380,378,499,496" href="<%=request.getContextPath() %>/mbti/mbtiViewPage?type=ENTJ" 
         alt="" target="_self">
 </map>

<h3 style="text-align: center;">당신의 MBTI를 눌러주세요</h3>

<%@ include file="/views/common/footer.jsp"%>