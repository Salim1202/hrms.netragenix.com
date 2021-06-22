<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessDeskManagement.aspx.cs" Inherits="hrms.netragenix.Web.UI.BusinessDeskManagement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>HRMS - Netragenix</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/plugins/morrisjs/morris.css" rel="stylesheet" />
<!-- Custom Css -->
<link href="assets/css/main.css" rel="stylesheet">
<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-blue">
<!-- Page Loader -->
<div class="page-loader-wrapper">
	<div class="loader">
		<div class="line"></div>
		<div class="line"></div>
		<div class="line"></div>
		<div class="line"></div>
		<p>Please wait...</p>
	</div>
</div>

<!-- Overlay For Sidebars -->
<div class="overlay"></div>

<!-- Search  -->
<div class="search-bar">
	<div class="search-icon"> <i class="material-icons">search</i> </div>
	<input type="text" placeholder="Explor adminX...">
	<div class="close-search"> <i class="material-icons">close</i> </div>
</div>

<!-- Top Bar -->
<nav class="navbar clearHeader">
	<div class="col-12">
		<div class="navbar-header"> <a href="javascript:void(0);" class="bars"></a> <a class="navbar-brand" href="BusinessDeskManagement.aspx">HRMS - Netragenix</a> </div>
		<ul class="nav navbar-nav navbar-right">
            <li class="dropdown msg-notification"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"> <i class="zmdi zmdi-calendar-note"></i>
				<div class="notify"><span class="heartbit"></span><span class="point"><%=getUpdatedCountTopEventDetails()%> </span></div>
				</a>
				<ul class="dropdown-menu">
					<li class="header">Events</li>
					<li class="body"> 
						<ul class="menu"> 
							<%=getTopEventDetails()%> 
						</ul>
					</li>
					<li class="footer"><a href="EventManagement.aspx">Manage Events for Workforce</a> </li>
				</ul>
			</li>
			<li class="dropdown msg-notification"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"> <i class="zmdi zmdi-email"></i>
				<div class="notify"><span class="heartbit"></span><span class="point"><%=getUpdatedCountTopMessageDetails()%> </span></div>
				</a>
				<ul class="dropdown-menu">
					<li class="header">Messages</li>
					<li class="body">
						<ul class="menu">
                            <%=getTopMessageDetails() %>
						</ul>
					</li>
					<li class="footer"><a href="MessageManagement.aspx">Manage Messages for Workforce</a> </li>
				</ul>
			</li>
			<li class="dropdown task"> <a href="javascript:void(0);" class="dropdown-toggle " data-toggle="dropdown" role="button"> <i class="zmdi zmdi-format-list-bulleted"></i>
				<div class="notify"><span class="heartbit"></span><span class="point"><%=getUpdatedCountTopTaskDetails()%> </span></div>
				</a>
				<ul class="dropdown-menu">
					<li class="header">TASKS</li>
					<li class="body">
						<ul class="menu tasks">
							<%=getTopTaskDetails() %>
						</ul>
					</li>
					<li class="footer"> <a href="TaskManagement.aspx">Manage Tasks for Workforce</a> </li>
				</ul>
			</li>
			<li><a href="HRMSLogin.aspx" class="mega-menu" data-close="true"><i class="zmdi zmdi-power"></i></a></li>
		</ul>
	</div>
</nav>
<!-- #Top Bar --> 

<!--Side menu and right menu -->
<!-- Left Sidebar -->
<aside id="leftsidebar" class="sidebar"> 
	<!-- Menu -->
	<div class="menu">
		<ul class="list">
			<li> 
				<!-- User Info -->
				<div class="user-info">
					<div class="admin-image"> <img src="images/profileimages/<%=getImageName() %>" alt="profile img"> </div>
					<div class="admin-action-info"> <span>Welcome</span>
						<h3><%=getUserName() %></h3>
						<ul>
							<li><a data-placement="bottom" title="Go to Inbox" href="javascript:void(0);"><i class="zmdi zmdi-email"></i></a></li>
							<li><a data-placement="bottom" title="Go to Profile" href="javascript:void(0);"><i class="zmdi zmdi-account"></i></a></li>
							<li><a data-placement="bottom" title="Full Screen" href="HRMSLogin.aspx" ><i class="zmdi zmdi-sign-in"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- #User Info --> 
			</li>
			<li class="header">SYSTEM NAVIGATION</li>
			<li class="active open"><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-home"></i><span>Business Desk</span></a></li>
			<li> <a href="WorkforceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-delicious"></i><span>Workforce</span></a></li>
			<li> <a href="RecruitmentManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-swap-alt"></i><span>Recruitment</span> </a></li>
			<li> <a href="AttendanceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Attendance</span></a></li>
			<li> <a href="PayrollManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Payroll</span></a></li>
			<li> <a href="PerformanceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-image"></i><span>Performance</span> </a></li>
			<li> <a href="TrainingManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-chart"></i><span>Training</span> </a></li>
			<li> <a href="DocumentManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-lock"></i><span>Documents</span> </a></li>
		</ul>
	</div>
	<!-- #Menu --> 
</aside>
<!-- #END# Left Sidebar --> 

<!-- main content -->
<section class="content home">
	<div class="container-fluid">
		<div class="block-header">
			<h2>Business Desk</h2>
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="BusinessDeskManagement.aspx">Home</a></li>			
				<li class="breadcrumb-item active">Business Desk</li>
			</ul>
		</div>
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12">
				<div class="card">
					<div class="header">
						<h2>Recently Joined Employees</h2>
					</div>
					<div class="body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Employee Code</th>
										<th>Name</th>
										<th>Position</th>										
										<th>Department</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<%=getBusinessDeskEmployees()%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="row clearfix">
			<div class="col-sm-12 col-md-12">
				<div class="card">
					<div class="header">
						<h2>Leaves Management</h2>
                        <%=getLeaveMenu() %>
					</div>
					<div class="body">
                        <form id="form_validation" method="POST" runat="server" enctype="multipart/form-data">
						    <div class="table-responsive">
							    <table class="table table-striped">
								    <thead>
									    <%=getBusinessDeskLeaveHeaders() %>
								    </thead>
								    <tbody>
									    <%=getBusinessDeskLeaveDetails()%>
								    </tbody>
							    </table>
						    </div>
                        </form>
					</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-sm-12 col-md-12">
				<div class="card">
					<div class="body" id="footer">
						<div class="row">
							<div class="col-sm-12">
								<p class="copy m-b-0">© Copyright
									<time class="year">2017</time>
									- Netragenix  - All Rights Reserved</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js ( jquery.v3.2.1, Bootstrap4 js) --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- slimscroll, waves Scripts Plugin Js --> 

<script src="assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script> <!-- Sparkline Plugin Js --> 
<script src="assets/bundles/flotscripts.bundle.js"></script><!-- Flot Charts Plugin Js --> 
<script src="assets/bundles/morrisscripts.bundle.js"></script><!-- Flot Charts Plugin Js --> 

<script src="assets/plugins/jquery-knob/jquery.knob.min.js"></script> <!-- Jquery Knob Plugin Js --> 
<script src="assets/bundles/jvectormapscripts.bundle.js"></script><!-- JVectorMap Plugin Js --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
<script src="assets/js/pages/index.js"></script> 
<script src="assets/js/pages/charts/sparkline.js"></script> 
<script src="assets/js/pages/maps/jvectormap.js"></script> 
<script src="assets/js/pages/charts/jquery-knob.js"></script>
</body>
</html>