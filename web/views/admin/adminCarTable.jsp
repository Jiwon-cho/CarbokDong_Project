<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.List,com.car.model.vo.Car" %>
<%

	List<Car>clist=(List<Car>)request.getAttribute("clist");

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

            <!-- Nav Item - Pages Collapse Menu -->
    <!--         <li class="nav-item">
             
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
                   <!--      <li class="nav-item dropdown no-arrow mx-1">
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
                        </li> -->

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
				<select id="searchType" name="searchType" onchange="location.href=this.value">
					<option value="<%=request.getContextPath()%>/adminTableServlet" >Member</option>
					<option value="Car" selected="selected">Car</option>
					<option value="<%=request.getContextPath()%>/admin/CampTable">Camp</option>
				</select>
				

                <!-- Begin Page Content -->
                <div class="container-fluid" >
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>
                    <button onclick="fn_insertCar();" style="position: relative; left: 1390px; bottom: 15px;">차량 추가</button>        
                    <button onclick="fn_deleteCar();" style="position: relative; left: 1400px; bottom: 15px;">차량 삭제</button>
                                                <!-- DataTales Example -->
                    <div class="card shadow mb-4" >
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" >
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>차량 고유번호</th>
                                            <th>차량 타입</th>
                                            <th>차량 모델</th>
                                            <th>차량 총 수</th>
                                            <th>차량 정보</th>
                                            <th>차량 가격</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
 											<th>차량 고유번호</th>
                                            <th>차량 타입</th>
                                            <th>차량 모델</th>
                                            <th>차량 총 수</th>
                                            <th>차량 정보</th>
                                            <th>차량 가격</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%for(Car c:clist){ %>
                                        <tr>
                                            <td><%=c.getCarNB() %></td>
                                            <td><%=c.getCarType() %></td>
                                            <td><%=c.getCarModel() %></td>
                                            <td><%=c.getCarTotal() %></td>
                                            <td><%=c.getCarInfo() %></td>
                                            <td><%=c.getPrice() %></td>
                                        </tr>
                                     <%} %>
                                    </tbody>                                
                                </table>
                            
                            </div>
                        </div>
                    </div>
                    <!-- Page Heading -->
                    

                </div>

   
                <!-- /.container-fluid -->
 
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

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath() %>/Resources/AdminTemplate/js/demo/datatables-demo.js"></script>
	
   <script>
		const fn_insertCar=()=>{
			const status="width=700px,height=500px,left=500px,top=500px";
			const title="deleteMember";
			const url="<%=request.getContextPath()%>/admin/insertCar";
			open(url,title,status);

	};
	const fn_deleteCar=()=>{
		const status="width=700px,height=500px,left=500px,top=500px";
		const title="deleteMember";
		const url="<%=request.getContextPath()%>/admin/deleteCar";
		open(url,title,status);

};
	</script>
	


</body>
</html>