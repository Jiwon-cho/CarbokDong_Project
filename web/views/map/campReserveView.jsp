<%@page import="com.camp.model.vo.Camp"%>
<%@page import="com.camp.model.dao.CampDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <body>
  
  	<% 
		String name = request.getParameter("name");
	
		//데이터 베이스에 접근
		CampDao campDao  = new CampDao();
		
		//렌트카 하나에 대한 정보를 얻어옴 
		Camp camp = campDao.getOneCamp(name);

	%>
  
    <center>
      <form action="campReserveResult.jsp" method="post">
        <table width="1000">
          <tr height="100">
            <td align="center" colspan="3">
              <font size="6" color="gray"> <%=camp.getName() %> 예약 페이지</font>
            </td>
          </tr>

          <tr height="100">
            <td rowspan="7" width="450">
              <img
                alt=""
                src="https://lh3.googleusercontent.com/proxy/mz7xjsjjHwBaczG5WD57dzlkgonkFkGJncLDlE2JfxSKKqUd5CTujwVICcmSAv2IUP2qveRr4oW3ux51_OWFYmAsVzGTt_dlxNeuZsyBoK1fuVMKWc74B9UV6Kd3FmL-wBJiLmtoxhv4GjU"
                width="450"
              />
            </td>
		</tr>
		<tr>
			<td width="250" align="center">
				1박 요금 : 
			</td>
			<td width="250" align="center">
				<%= camp.getPrice() %>
			</td>
		</tr>
		<tr>
            <td width="250" align="center">대여기간</td>
            <td width="250" align="center">
              <select name="dday">
                <option value="1">1일</option>
                <option value="2">2일</option>
                <option value="3">3일</option>
                <option value="4">4일</option>
                <option value="5">5일</option>
                <option value="6">6일</option>
                <option value="7">7일</option>
              </select>
            </td>
          </tr>

          <tr>
            <td width="250" align="center">대여일</td>
            <td width="250" align="center">
              <input type="date" name="rday" size="15" />
            </td>
          </tr>

          <tr>
            <td align="center" colspan="2">
              <input type="submit" value="캠핑장 예약하기" />
            </td>
          </tr>
        </table>
      </form>
    </center>
  </body>
</html>