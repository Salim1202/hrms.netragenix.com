<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkforceRemove.aspx.cs" Inherits="hrms.netragenix.Web.UI.WorkforceRemove" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>HRMS - Netragenix</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- Custom Css -->
<link href="assets/css/main.css" rel="stylesheet">
<!-- choose a theme from css/themes instead of get all themes -->
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

<!-- Top Bar -->
<nav class="navbar clearHeader">
	<div class="col-12">
		<div class="navbar-header"> <a href="javascript:void(0);" class="bars"></a> <a class="navbar-brand" href="BusinessDeskManagement.aspx">HRMS - Netragenix</a> </div>
		<ul class="nav navbar-nav navbar-right">
            <li class="dropdown msg-notification"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"> <i class="zmdi zmdi-calendar-note"></i>
				<div class="notify"><span class="heartbit"></span><span class="point"></span></div>
				</a>
				<ul class="dropdown-menu">
					<li class="header">Events</li>
					<li class="body">
						<ul class="menu">
							<%=getTopEventDetails()%>
						</ul>
					</li>
					<li class="footer"> <a href="EventManagement.aspx">Manage Events for Workforce</a> </li>
				</ul>
			</li>
			<li class="dropdown msg-notification"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"> <i class="zmdi zmdi-email"></i>
				<div class="notify"><span class="heartbit"></span><span class="point"></span></div>
				</a>
				<ul class="dropdown-menu">
					<li class="header">Messages</li>
					<li class="body">
						<ul class="menu">
                            <%=getTopMessageDetails() %>
						</ul>
					</li>
					<li class="footer"> <a href="MessageManagement.aspx">Manage Messages for Workforce</a> </li>
				</ul>
			</li>
			<li class="dropdown task"> <a href="javascript:void(0);" class="dropdown-toggle " data-toggle="dropdown" role="button"> <i class="zmdi zmdi-format-list-bulleted"></i>
				<div class="notify"><span class="heartbit"></span><span class="point"></span></div>
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
			<li><a href="BusinessDeskManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-home"></i><span>Business Desk</span></a></li>
			<li class="active open"><a href="WorkforceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-delicious"></i><span>Workforce</span></a></li>
			<li><a href="RecruitmentManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-swap-alt"></i><span>Recruitment</span> </a></li>
			<li><a href="AttendanceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Attendance</span></a></li>
			<li><a href="PayrollManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Payroll</span></a></li>
			<li><a href="PerformanceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-image"></i><span>Performance</span> </a></li>
			<li><a href="TrainingManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-chart"></i><span>Training</span> </a></li>
			<li><a href="DocumentManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-lock"></i><span>Documents</span> </a></li>
		</ul>
	</div>
	<!-- #Menu --> 
</aside>
<!-- #END# Left Sidebar --> 

<!-- main content -->
<section class="content">    
    <div class="container-fluid">
        <div class="block-header">
            <h2>Remove Workforce</h2>
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="BusinessDeskManagement.aspx">Home</a></li>			
                <li class="breadcrumb-item active">Remove Workforce</li>
            </ul>
        </div>  
        <!-- Basic Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="body">
                        <form id="form_validation" method="POST" runat="server" enctype="multipart/form-data">
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" AutoPostBack="true" runat="server" id="ddlEmployeeCode" Enabled ="true" required="required">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:Label class="form-control" id="txtFirstName" name="txtFirstName" Placeholder="First Name" runat="server" />
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" id="txtLastName" name="txtLastName" Placeholder="Last Name" runat="server" />
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" id="txtDateOfBirth" name="txtDateOfBirth" Placeholder="Date of Birth" runat="server" />
                                </div>
                                <div class="help-info">YYYY-MM-DD format</div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" id="txtJoiningDate" name="txtJoiningDate" Placeholder="Date of Joining" runat="server" />
                                </div>
                                <div class="help-info">YYYY-MM-DD format</div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" id="txtMobile" name="txtMobile" Placeholder="Mobile" runat="server" />
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" id="txtEmail" name="txtEmail" Placeholder="Email" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlGender" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select Gender --</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlMaritalStatus" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select Marital Status --</asp:ListItem>
                                        <asp:ListItem Value="Married">Married</asp:ListItem>
                                        <asp:ListItem Value="Single">Single</asp:ListItem>
                                        <asp:ListItem Value="Divorcee">Divorcee</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlEmployeeType" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select Employee Type --</asp:ListItem>
                                        <asp:ListItem Value="Full-Time">Full-Time</asp:ListItem>
                                        <asp:ListItem Value="Part-Time">Part-Time</asp:ListItem>
                                        <asp:ListItem Value="On-Contract">On-Contract</asp:ListItem>
                                        <asp:ListItem Value="Consultant">Consultant</asp:ListItem>
                                    </asp:DropDownList>  
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlDepartment" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select Department --</asp:ListItem>
                                        <asp:ListItem Value="1">Information Technology</asp:ListItem>
                                        <asp:ListItem Value="2">HR</asp:ListItem>
                                        <asp:ListItem Value="3">Production</asp:ListItem>
                                        <asp:ListItem Value="4">Compliance</asp:ListItem>
                                        <asp:ListItem Value="5">Finance</asp:ListItem>
                                        <asp:ListItem Value="6">Performance</asp:ListItem>
                                        <asp:ListItem Value="7">Marketing</asp:ListItem>
                                        <asp:ListItem Value="8">Accounts</asp:ListItem>
                                        <asp:ListItem Value="9">Purchase</asp:ListItem>
                                        <asp:ListItem Value="10">Research&Development</asp:ListItem>
                                        <asp:ListItem Value="11">Administration</asp:ListItem>
                                        <asp:ListItem Value="12">Sales</asp:ListItem>
                                    </asp:DropDownList>  
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlPosition" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select Position --</asp:ListItem>
                                        <asp:ListItem Value="1">Manager</asp:ListItem>
                                        <asp:ListItem Value="2">Executive</asp:ListItem>
                                        <asp:ListItem Value="3">Developer</asp:ListItem>
                                        <asp:ListItem Value="4">Vice President</asp:ListItem>
                                        <asp:ListItem Value="5">President</asp:ListItem>
                                        <asp:ListItem Value="6">Managing Director</asp:ListItem>
                                        <asp:ListItem Value="7">CEO</asp:ListItem>
                                        <asp:ListItem Value="8">Secretary</asp:ListItem>
                                        <asp:ListItem Value="9">Team Leader</asp:ListItem>
                                        <asp:ListItem Value="10">COO</asp:ListItem>
                                        <asp:ListItem Value="11">CFO</asp:ListItem>
                                        <asp:ListItem Value="12">Receptionist</asp:ListItem>
                                        <asp:ListItem Value="13">Accountant</asp:ListItem>
                                    </asp:DropDownList>  
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" id="txtUserName" name="txtUserName" Placeholder="User Name" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:TextBox class="form-control" type="password" id="txtPassword" name="txtPassword" Placeholder="Password" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlUserType" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select User Type --</asp:ListItem>
                                        <asp:ListItem Value="Employee">Employee</asp:ListItem>
                                        <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <textarea rows="1" class="form-control no-resize auto-growth" id="txtAddress" Placeholder="Address" runat="server"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlStatus" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Select Status --</asp:ListItem>
                                        <asp:ListItem Value="Employed">Employed</asp:ListItem>
                                        <asp:ListItem Value="Resigned">Resigned</asp:ListItem>
                                        <asp:ListItem Value="Notice Period">Notice Period</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList class="form-control show-tick" runat="server" id="ddlActive" Enabled ="true">
                                        <asp:ListItem Value="">-- Please Activate/Deactivate --</asp:ListItem>
                                        <asp:ListItem Value="1">Activate</asp:ListItem>
                                        <asp:ListItem Value="0">Deactivate</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:FileUpload id="fucProfileImage" runat="server" />
                                    <asp:Button ID="btnProfileImage" class="btn btn-raised btn-primary waves-effect" runat="server"  text="Click Here to Upload Profile Image" CausesValidation="false" />
                                </div>
                            </div>
                            <asp:Button ID="btnSubmit" class="btn btn-raised btn-primary waves-effect" runat="server" CausesValidation="false" Text="Remove Workforce Information" OnClick="btnSubmit_Click"></asp:Button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Basic Validation --> 
    </div>
</section>

<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js ( jquery.v3.2.1, Bootstrap4 js) --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="assets/plugins/jquery-validation/jquery.validate.js"></script> <!-- Jquery Validation Plugin Css --> 
<script src="assets/plugins/jquery-steps/jquery.steps.js"></script> <!-- JQuery Steps Plugin Js --> 

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
<script src="assets/js/pages/forms/form-validation.js"></script> 
</body>
</html>
