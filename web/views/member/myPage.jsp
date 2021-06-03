<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<body>
    <body>
		<center>
        <div class="wrapper">
            <div class="contents-top">
                <h2 class="join-title">마이페이지</h2>
            </div>
            <div class="contents-mid">
            <form action="" method="post" name="form1">
            	<input type="hidden" name="userId" value="<%=loginMember.getUserId() %>">
                <div class="join-type">
                    <h3 class="join-type-title">장바구니<br><img src="https://media.istockphoto.com/vectors/add-to-cart-icon-shopping-cart-icon-vector-illustration-vector-id1179275901?k=6&m=1179275901&s=170667a&w=0&h=LTlzJ6cdRT0GeHtRL3LpDLrfjYrMHzrLsdKdDfyZl60=" alt="" width="100" height="100"></h3>
                    <p class="join-type-desc">찜목록</p>
                    <input type="submit" onclick="btn_ShoppingBag();" value="선택">
                </div>
                <div class="join-type">
                    <h3 class="join-type-title">결재 내역<br><img src="https://img.icons8.com/ios/452/payment-history.png" alt="" width="100" height="100"></h3>
                    <p class="join-type-desc">구매 내역</p>
                    <input type="submit" onclick="btn_Payment();" value="선택">
                </div>
                <div class="join-type">
                    <h3 class="join-type-title">내가 쓴글<br><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6pbUybzmIExB2NazJYIj6rYorJdM_wxmQpg&usqp=CAU" alt="" width="100" height="100"></h3>
                    <p class="join-type-desc">나의글 / 나의댓글</p>
                    <input type="submit" onclick="btn_MyBoardList();" value="선택">
                </div>
                <div class="join-type">
                    <h3 class="join-type-title">내정보<br><img src="https://www.urbanbrush.net/web/wp-content/uploads/2020/09/urbanbrush-20200903091659987374.jpg" alt="" width="100" height="100"></h3>
                    <p class="join-type-desc">탈퇴 / 변경</p>
                    <input type="submit" onclick="btn_MyUpdate();" value="선택">
                </div>
                </form>
            </div>
        </div>
        </center>
        <script>
	        function btn_Payment(){
	    		form1.action="<%=request.getContextPath() %>/member/payment"
	    	}
	        function btn_MyUpdate(){
	    		form1.action="<%=request.getContextPath() %>/member/memberView"
	    	}
        	function btn_ShoppingBag(){
        		form1.action="<%=request.getContextPath() %>/member/carboard"
        	}
        	function btn_MyBoardList(){
        		form1.action="<%=request.getContextPath() %>/member/myBoardList"
        	}
        </script>
        <style>
            .join-type {
                width: 233px;
                height: 250px;
                float: left;
                margin-right: 20px;
                border: 1px solid #d8d8d8;
            }
            .join-type-title {
                height: 45px;
                font-size: 20px;
                font-weight: bold;
                color: #222;
                position: relative;
                padding-bottom: 72px;
                margin-top: 28px;
                text-align: center;
            }
            .join-type-desc {
                font-size: 13px;
                font-weight: normal;
                color: #666;
                margin: 20px 0 9px;
                line-height: 1.4;
                text-align: center;
            }
            .wrapper{
                text-align: center;
                margin-bottom: 100px;
                
            }
            .contents-mid{
                display: inline-block;
            }
        </style>
<%@ include file="/views/common/footer.jsp" %>