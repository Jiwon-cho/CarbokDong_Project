<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<center>
    <div class="wrapper">
        <div class="contents-top">
            <h2 class="join-title">회원가입 유형 선택</h2>
            <p class="join-title-desc">
                자신에 맞는 유형으로 가입해 주세요!
            </p>
        </div>
        <div class="contents-mid">
            <div class="join-type">
                <h3 class="join-type-title">개인회원<br><img src="individual.jpg" alt="" width="100" height="100"></h3>
                <p class="join-type-desc">만19세 이상 회원가입</p>
                <button type="button" class="btn-join">가입하기</button>
            </div>
            <div class="join-type">
                <h3 class="join-type-title">사업자회원<br><img src="company.png" alt="" width="100" height="100"></h3>
                <p class="join-type-desc">사업자 회원가입</p>
                <button type="button" class="btn-join">가입하기</button>
            </div>
            </div>
        </div>
    </div>
    </center>
    <style>
        .join-type {
            width: 233px;
            height: 260px;
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
        }
        .contents-mid{
            display: inline-block;
        }
    </style>
<%@ include file="/views/common/footer.jsp" %>