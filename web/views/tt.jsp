<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>  
<script type="text/javascript" language="javascript">
 
    $(document).ready(function(){
    	
        $.ajax({
            type : "get", //전송방식을 지정한다 (POST,GET)
            url : "https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                alert("통신실패!!!!");
            },
            success : function(Parse_data){
                $("#Parse_Area").html(Parse_data); //div에 받아온 값을 넣는다.
                alert("통신 데이터 값 : " + Parse_data);
            }
             
        });
    });
 
</script>
<style>
#Parse_Area{
width:auto;
height:500px;
}

</style>
</head>
<body>
<div>나나나</div>
    <div id="Parse_Area">gt;lt;</div>
</body>
</html>