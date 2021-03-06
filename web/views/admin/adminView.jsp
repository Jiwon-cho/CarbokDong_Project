<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.model.vo.Member" %>    
<%
	Member m=(Member)request.getAttribute("member");
%>     
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico">
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>카복동</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/Resources/AdminTemplate/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <!-- google charts import -->
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <!-- jQuery -->
   	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>	
   	<!--Alert 디자인 라이브러리 -->
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/admin/adminMain">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Carbok Admin </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminMain">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Main</span></a>
            </li>

    

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Managing
            </div>

       <!--      Nav Item - Pages Collapse Menu
            <li class="nav-item">
             
            <!-- Nav Item - Charts
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>
 -->
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/adminTableServlet">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>
               <div class="sidebar-heading">
                Controller
            </div>
                <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/adminCheck">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Return/Cancellation</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
           

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
              

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <!-- Nav Item - Alerts -->
      <!--                   <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                Counter - Alerts
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            Dropdown - Alerts
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>
 -->
                        <!-- Nav Item - Messages -->
                               <li class="nav-item dropdown no-arrow mx-1">
                        <div style="height:20px;"></div>
                        <button type="button" class="btn btn-outline-primary" onclick="location.assign('<%=request.getContextPath()%>')">Go to Homepage</button>
                     
                        </li>
                      

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                             <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
                                <img class="img-profile rounded-circle"
                                    src="<%=request.getContextPath() %>/Resources/AdminTemplate/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminView?userId=admin">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                       
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="<%=request.getContextPath() %>/logout" >
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Admin View</h1>

                </div>
                <!-- /.container-fluid -->
<center>
	<form action="<%=request.getContextPath() %>/memberUpdate" method="post" id="memberFrm">
		<table width="800">
			<tr height="40">
				
				<td align="center"><b>[회원정보]</b></td>
			</tr>
			
		</table>
		<table width="700" height="450" cellpadding="0" style="border-collapse: collapse;">
			<tr height="7">
				<td colspan="3"><input type="hidden" id="memberType" name="memberType" value="1"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">회원 ID</td>
				<td><input type="text" name="userId" id="userId_" value="<%=m.getUserId()%>" readonly></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">이 름</td>
				<td><input type="text" name="userName" id="userName" value="<%=m.getUserName()%>" readonly></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">성 별</td>
				<td><input type="radio" name="gender" id="gender0" value="M" <%=m.getGender().equals("M")?"checked":"" %> disabled>
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F" <%=m.getGender().equals("F")?"checked":"" %> disabled>
					<label for="gender1">여</label>
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">닉네임</td>
				<td><input type="text" name="nikName" id="nikName" value="<%=m.getNikname()%>" readonly></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">이메일</td>
				<td>
				<input name="email1" type="text" class="box" id="email1" size="15" value="<%=m.getEmail().split("@")[0]%>">
				 @ 
				<input name="email2" type="text" class="box" id="email2" size="15" value="<%=m.getEmail().split("@")[1]%>">
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>	
			<tr class="" height="30">
				<td width="5%" align="center"></td>
				<td width="15%">주 소</td>
				<td><input type="text" size="15" name="sample4_postcode" id="sample4_postcode"
					placeholder="우편번호" value="<%=m.getAddress().split("/")[1]%>" readonly> <input type="button" value="우편번호 찾기" onclick="sample4_execDaumPostcode()"><br>
				<br> <input type="text" size="30" name="sample4_roadAddress" id="sample4_roadAddress"
					placeholder="도로명주소" value="<%=m.getAddress().split("/")[2]%>" readonly> <input type="text" size="30" name="sample4_jibunAddress" id="sample4_jibunAddress"
					placeholder="지번주소" value="<%=m.getAddress().split("/")[0]%>" readonly><br>
				<br> <input type="text" name="address" placeholder="나머지 주소" size="70" value="<%=m.getAddress().split("/")[3]%>">
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="정보변경" onclick="fn_updateMember();">
					<input type="button" value="비밀번호변경" onclick="fn_updatePassword();"/>
					<input type="button" value="탈퇴" onclick="fn_deleteMember();"/>
				</td>
			</tr>
			</table>
			</form>
			<form name="duplicateFrm" action="" method="post">
				<input type="hidden" name="userId">
				<input type="hidden" name="nickName">
			</form>
			</center>
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	const fn_updatePassword=()=>{
		open("<%=request.getContextPath()%>/member/updatePassword?userId=<%=m.getUserId()%>","updatePassword"
				,"left=200px,top=200px,width=400px,height=370px");
	}
	const fn_updateMember=()=>{
		const updateFrm=$("#memberFrm");
		updateFrm.attr("action","<%=request.getContextPath()%>/memberUpdate");
		updateFrm.submit();
	}
	const fn_deleteMember=()=>{
		if(confirm("정말로 탈퇴하시겠습니까?")){
			location.replace("<%=request.getContextPath()%>/deleteMember?userId=<%=m.getUserId()%>");
		}
	}
	
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드.
 				
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가
                // 법정동의 경우 마지막 문자가 "동/로/가"
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만듬
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 					
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        
        }).open();
    }
</script>


            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
              <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                       <address class="addr">
            상호명:차박왕 카복동 │ 대표:KH	 │ 개인정보관리자:BS
          </address>
          <p class="copy">Copyright 2021-0820 by 차박왕 카복동. All rights reserved.</p>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/js/sb-admin-2.min.js"></script>

</body>

</html>