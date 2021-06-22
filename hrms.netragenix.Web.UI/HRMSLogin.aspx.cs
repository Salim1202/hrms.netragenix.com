using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.BusinessEntities;
using System.Net.Http;

namespace hrms.netragenix.Web.UI
{
    public partial class HRMSLogin : System.Web.UI.Page
    {
        AuthenticationBL authenticationBL = new AuthenticationBL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Authentication authentication = new Authentication();

            authentication = authenticationBL.GetAuthenticationDetails(txtUserName.Text.Trim(), txtPassword.Text.Trim());

            if(authentication.username == txtUserName.Text.Trim() && authentication.password == txtPassword.Text.Trim())
            {
                HttpContext.Current.Session["Authentication"] = authentication;
                Response.Redirect("BusinessDeskManagement.aspx");
            }
            else
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Invalid Credentials... Please Try Again";
                txtUserName.Text = string.Empty;
                txtPassword.Text = string.Empty;
                return;
            }
        }
    }
}