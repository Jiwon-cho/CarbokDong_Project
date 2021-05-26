<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<center>
        <form action="사업자회원가입" method="post" name="">
            <table width="800">
                <tr height="40">
                    <td align="center"><b>[사업자회원가입]</b></td>
                </tr>
            </table>    
            <table width="700" height="600" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">사업자 선택</td>
                    <td>개인 사업자<input type="radio" name="gender" value="1" checked />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;법인 사업자<input type="radio" name="gender" value="2"/></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">법인명</td>
                    <td><input type="text" name="" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">법인 번호</td>
                    <td><input name="email1" type="text" class="box" id="email1" size="15"> * <input name="email2" type="text" class="box" id="email2" size="15"> <input type="button" value="중복확인" id=""></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">상호명</td>
                    <td><input type="text" name="" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">사업자 번호</td>
                    <td><input type="text" name="" /> <input type="button" value="확인"></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">회원 ID</td>
                    <td><input type="text" name="userId" /> <input type="button" value="중복확인"></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">비밀번호</td>
                    <td><input type="password" name="pwd" id="pw" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">비밀번호 확인</td>
                    <td><input type="password" name="pwdCheck" id="pwCheck" /> <input type="button" value="확인" name="" id=""></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">이 름</td>
                    <td><input type="text" name="userName" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">주민등록번호</td>
                    <td><input name="userNo1" type="text" class="box" id="" size="15"> - <input name="userNo2" type="text" class="box" id="" size="20"></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">휴대전화</td>
                    <td><input type="tel" name="phone" /></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">이메일</td>
                    <td><input name="email1" type="text" class="box" id="email1" size="15"> @ <input name="email2" type="text" class="box" id="email2" size="20">
                        <select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
                            <option value="" selected>선택하세요</option>
                            <option value="naver.com">naver.com</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="hanmail.com">hanmail.com</option>
                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                            <option value="1">직접입력</option>
                        </select> <input type="button" value="인증번호 받기" id=""></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td></td>
                    <td width="15%">인증번호</td>
                    <td><input type="tel" name="emailCheck" /> <input type="button" value="확인" id=""></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">주 소</td>
                    <td>
                        <input type="text" size="15" name="" id="" placeholder="우편번호">
                        <input type="button" value="우편번호 찾기" onclick=""><br><br>
                        <input type="text" size="30" name="" id="" placeholder="도로명주소">
                        <input type="text" size="30" name="" id="" placeholder="지번주소"><br><br>
                        <input type="text" name="" placeholder="나머지 주소" size="70">
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr class="" height="30">
                    <td></td>
                    <td width="15%">운전면허</td>
                    <td><input type="tel" name="emailCheck" /> <input type="button" value="확인" id=""></td>
                </tr>
                <tr height="7">
                    <td colspan="3"><hr></td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><input type="submit" value="확인"></td>
                </tr>
        </form>
    </center>
<%@ include file="/views/common/footer.jsp" %>