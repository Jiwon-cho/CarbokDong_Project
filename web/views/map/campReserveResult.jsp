<%@page import="com.camp.model.dao.CampDao"%>
<%@page import="com.camp.model.vo.Camp"%>
<%@page import="com.camp.model.dao.CampReserveDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.Vector"%>
<%@ page import ="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id ="date" class="com.camp.model.vo.CampReserve">
		<jsp:setProperty name ="date" property="*" />
	</jsp:useBean>
	
	
	<% 
		String id = (String)session.getAttribute("id");
		id = "임시로그인";
		if(id==null){
	%>	
		<script>
			alert("로그인후 예약이 가능합니다.");
			location.href="";
		</script>	
	<% 	
		}
		//날찌 비교
		Date d1 = new Date();
		Date d2 = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		d1 = sdf.parse(date.getDate());
		d2 = sdf.parse(sdf.format(d2));
		//날짜 비교 매소드를 사용
		
		int compare = d1.compareTo(d2);
		//에약 하려는 날짜보다 현재 날짜가  크다면 -1 
		//예약하려는 날짜와 현재 날짜가 같다면 0
		//예약하려는  날짜가 더 크다면 1을 리턴 
		if(compare < 0){//오늘보다 이전 날짜 선택시 
			
	%>	
			<script>
				alert("현재 시스템 날짜보다 이전 날짜는 선택할수 없음");
				history.go(-1);
			</script>	
	<% 	
		}
		//결과적으로 아무 문제가 없다면 데이터를 저장후 결과 페이지 보여주기 
		//아이디 값이 빈클래스에 없기에 
		String userId1 = (String)session.getAttribute("id");
		date.setUserId(userId1);
		
		//데이터 베이스에 빈 클래스를 저장 
		CampDao campDao = new CampDao();
		campDao.setReserve(date);
		
		//해당 캠핑장 정보 얻어오기 
		Camp camp = campDao.getOneCamp(date.getCampName());
		
		// 캠핑장 예약 총 금액
		int campTotal = camp.getPrice()*date.getPeriod();
	%>
	
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center">
					<font size="6" color="gray">캠핑장 예약 완료</font>
				</td>
			</tr>
			
			<tr height="100">
				<td align="center">
					<img alt="" src="https://lh3.googleusercontent.com/proxy/mz7xjsjjHwBaczG5WD57dzlkgonkFkGJncLDlE2JfxSKKqUd5CTujwVICcmSAv2IUP2qveRr4oW3ux51_OWFYmAsVzGTt_dlxNeuZsyBoK1fuVMKWc74B9UV6Kd3FmL-wBJiLmtoxhv4GjU"  width="470">
				</td>
			</tr>
			
			<tr height="50">
				<td align="center">
					<font size="5" color="blue">캠핑장 예약 총 금액 <%=campTotal%> 원 </font>
				</td>
			</tr>

		</table>
	</center>
</body>
</html>