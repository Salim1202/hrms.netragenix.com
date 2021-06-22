<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogSalaryStructure.aspx.cs" Inherits="hrms.netragenix.Web.UI.LogSalaryStructure" %>

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
			<li><a href="WorkforceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-delicious"></i><span>Workforce</span></a></li>
			<li><a href="RecruitmentManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-swap-alt"></i><span>Recruitment</span> </a></li>
			<li><a href="AttendanceManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Attendance</span></a></li>
			<li class="active open"><a href="PayrollManagement.aspx" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Payroll</span></a></li>
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
            <h2>Log Payroll</h2>
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="BusinessDeskManagement.aspx">Home</a></li>			
                <li class="breadcrumb-item active">Log Salary Structure</li>
            </ul>
        </div>  
        <!-- Basic Validation -->
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="body">
                        <form id="form_validation" method="POST" runat="server" enctype="multipart/form-data">
                            <div class="row">                                
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtGrossSalary" name="txtGrossSalary" Placeholder=" Employee Gross Salary" OnTextChanged="txtGrossSalary_TextChanged" AutoPostBack="true" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtSalaryInHand" name="txtSalaryInHand" ReadOnly="true" Placeholder="Salary In Hand" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">                                        
                                            <div class="form-line">
                                                <asp:Label ID="lblBasicSalary" runat="server" Text="Basic Salary"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                        
                                            <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                <asp:TextBox class="form-control" ID="txtBasicPercentage" name="txtBasicPercentage" ReadOnly="true" Placeholder="Basic Salary" runat="server" required="required" />
                                                    </div>
                                            </div>
                                                </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                <asp:TextBox class="form-control" ID="txtBasicAmount" name="txtBasicAmount" Placeholder="Basic Salary" runat="server" required="required" />
                                                    </div>
                                            </div>
                                        </div>                                                                                                                                                    
                                </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblDA" runat="server" Text="Dearest Allowance"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtDAPercentage" name="txtDAPercentage" ReadOnly="true" Placeholder="Dearest Allowance" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtDAAmount" name="txtDAAmount" ReadOnly="true" Placeholder="DA" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblHRA" runat="server" Text="House Rent Allowance"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtHRAPercentage" name="txtHRAPercentage" ReadOnly="true" Placeholder="House Rent Allowance" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtHRAAmount" name="txtHRAAmount" Placeholder="HRA" runat="server" required="required" />                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblPF" runat="server" Text="Provident Fund"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtPFPercentage" name="txtPFPercentage" ReadOnly="true" Placeholder="Provident Fund" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtPFAmount" name="txtPFAmount" Placeholder="Provident Fund" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblLTA" runat="server" Text="Leave Travel Allowance"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtLTAPercentage" name="txtLTAPercentage" ReadOnly="true" Placeholder="Leave Travel Allowance" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtLTAAmount" name="txtLTAAmount" Placeholder="Leave Travel Allowance" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblMedicalAllowance" runat="server" Text="Medical Allowance"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtMedicalPercentage" name="txtMedicalPercentage" ReadOnly="true" Placeholder="Medical Allowance" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtMedicalAmount" name="txtMedicalAmount" Placeholder="Medical Allowance" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            

                            <div class="row">                               
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblESI" runat="server" Text="ESI"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtESIPercentage" name="txtESIPercentage" ReadOnly="true" Placeholder="ESI" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtESIAmount" name="txtESIAmount" Placeholder="ESI" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:Label ID="lblProfessionalTax" runat="server" Text="Professional Tax"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtPTPercentage" name="txtPTPercentage" ReadOnly="true" Placeholder="Professional Tax" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group form-float">
                                        <div class="form-line">
                                            <asp:TextBox class="form-control" ID="txtPTAmount" name="txtPTAmount" Placeholder="Professional Tax" runat="server" required="required" />
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <asp:Button ID="btnSubmit" class="btn btn-raised btn-primary waves-effect" runat="server" CausesValidation="false" Text="Log Salary Structure" OnClick="btnSubmit_Click" ></asp:Button>
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
