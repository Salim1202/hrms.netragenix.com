<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRMSLogin.aspx.cs" Inherits="hrms.netragenix.Web.UI.HRMSLogin" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Workspace HRMS</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Custom Css -->
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/login2.css" rel="stylesheet">

<!-- adminX You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-blue">    
    <div class="authentication">
        <div class="bg-white">
            <div class="container">
                <div class="row clearfix">
                    <div class="card">
                        <h3 class="l-login">HRMS Login</h3>
                        <form id="sign_in" method="POST" class="row" runat="server" enctype="multipart/form-data">
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="form-group form-float ">
                                    <div class="form-line">
                                        <asp:TextBox class="form-control" id="txtUserName" name="txtUserName" Placeholder="User Name" runat="server" required="required" />
                                    </div>
                                    <asp:Label class="form-control" id="lblErrorMessage" name="lblErrorMessage" runat="server" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <asp:TextBox class="form-control" type="password" id="txtPassword" name="txtPassword" Placeholder="Password" runat="server" required="required" />
                                    </div>
                                    <a href="#">Forgot Password?</a>
                                </div>                               
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <asp:Button class="btn btn-raised btn-primary m-t-15 waves-effect" id="btnSignIn" name="btnSignIn" CausesValidation="False" Text="SIGN IN" runat="server" OnClick="btnSignIn_Click" />
                                <%--<a href="HRMSRegister.aspx" class="btn btn-raised waves-effect" title="">SIGN UP</a>--%>
                            </div>                     
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 ">
                    <div class="l-detail">
                        <h5 class="position">Welcome</h5>
                        <h2 class="position">Workspace HRMS - Netragenix</h2>
                        <h4 class="position">Sign in to start your session</h4>
                        <p class="position">Start your journey towards HRMS automation of HR processes. Features includes Workforce management, Recruitment & Training Management with Business Intelligence & Analytics.</p>                            
                        <ul class="list-unstyled l-menu">
                        </ul>
                    </div>
                </div> 
            </div>
        </div>
        <div id="instance1"></div>
    </div>

<!-- Jquery Core Js --> 
<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js ( jquery.v3.2.1, Bootstrap4 js) --> 
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

<script src="assets/js/pages/login2/jparticles.js"></script>
<script src="assets/js/pages/login2/particle.js"></script>

<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="assets/js/pages/login2/event.js"></script>
</body>
</html>
