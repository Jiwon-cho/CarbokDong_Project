<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<div class="content_container">
      <div class="book">
        <div class="book_img">
          <img
            src="https://auto.nate.com/news/photo/old/data/old_img/1804/6547f90d897e2144b85c467f2429ccdb_WGR6Eh1cdlUWlj.jpg"
            alt="car"
            class="img_file"
          />
        </div>
        <div class="book_option">
          <div class="book_subject">
            <h1>성능좋은 캠핑카</h1>
            <h3 style="text-align: right">재고 : n대</h3>
            <h2>상품 설명 ~ 성능좋고 싸고 튼튼합니다</h2>
          </div>
          <div class="book_options">
            <select name="gear" id="gear-select">
              <option value="">--- 차량 대여일자 ---</option>
              <option value="rental_date">2021-05-05</option>
            </select>
            <select name="gear" id="gear-select">
              <option value="">--- 추가 캠핑용품 ---</option>
              <option value="grill">바베큐 그릴</option>
            </select>
            <br />
            <button class="basket_btn">장바구니 담기</button>
            <button class="buy_btn">구매하기</button>
          </div>
        </div>
      </div>
      <div class="item">
        <img
          src="http://m.roadtripcamping.co.kr/web/upload/NNEditor/20191202/mobile/5dd3fff18576c74c2b6ec9d830c4d7de_1575282422.jpg"
          alt=""
          class="item_img"
        />
      </div>
      <div class="review">
        <div class="review_content">
          <div class="review_subject">
            <span>⭐⭐⭐⭐⭐</span>
            <h5>bokdong119</h5>
            <h3>엄청 친절하고 차도 날아다니네요~ 아주 좋아요</h3>
          </div>
          <div>
            <img
              src="https://auto.nate.com/news/photo/old/data/old_img/1804/6547f90d897e2144b85c467f2429ccdb_WGR6Eh1cdlUWlj.jpg"
              alt=""
              class="review_img"
            />
          </div>
        </div>
      </div>
    </div>
  </body>

  <style>
    .header {
      width: 100%;
      height: 100px;
      background-color: rgb(0, 0, 0);
      color: white;
      text-align: center;
      font-size: 3em;
    }

    .content_container {
      justify-content: center;
      flex-direction: column;
      align-items: center;
      margin: auto;
      width: 70vw;
      height: 3000px;
      background-color: rgb(233, 233, 233);
    }

    .book {
      box-sizing: border-box;
      display: flex;
      justify-content: center;
      flex-direction: row;
      margin: 30px 0;
      height: 700px;
      width: 100%;
      border: 1px gray solid;
    }

    .book_img {
      box-sizing: border-box;
      display: flex;
      align-items: center;
      /* border: 1px gray solid; */
      width: 45%;
      height: 100%;
      border: 1px rgba(202, 202, 202, 0.514) solid;
      margin-left: 50px;
    }

    .img_file {
      width: 100%;
    }

    .book_option {
      margin-left: 150px;
      margin-right: 150px;
      border: 1px rgba(202, 202, 202, 0.514) solid;
      text-align: center;
      width: 50%;
      height: 100%;
    }

    .book_subject {
      height: 60%;
    }

    .book_options {
      display: flex;
      flex-direction: column;
      width: 70%;
      height: 35%;
      margin: auto;
    }

    .basket_btn,
    .buy_btn {
      margin-bottom: 20px;
      height: 15%;
      cursor: pointer;
    }

    .item {
      box-sizing: border-box;
      text-align: center;
      height: 1500px;
      width: 100%;
      margin: 50px 0;
      border: 1px gray solid;
    }

    .item_img {
      width: 60%;
      height: 100%;
    }

    .review {
      display: block;
      flex-direction: column;
      margin: 0;
      width: 100%;
      height: 500px;
      border: 1px gray solid;
    }

    .review_content {
      display: flex;
      height: 120px;
      width: 95%;
      margin: 20px 20px;
      border-top: 1px gray dashed;
      border-bottom: 1px gray dashed;
    }

    .review_subject {
      height: 100px;
      width: 50%;
      margin: 0 50px;
    }

    .review_img {
      width: 30%;
      height: 100%;
      float: right;
    }

    select {
      width: 100%;
      height: 30px;
      font-size: large;
      text-align-last: center;
      margin: 10px 0;
    }
  </style>
<%@ include file="/views/common/footer.jsp" %>	