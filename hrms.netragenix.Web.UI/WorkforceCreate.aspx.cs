using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System;
using System.IO;
using System.Web;


namespace hrms.netragenix.Web.UI
{
    public partial class WorkforceCreate : System.Web.UI.Page
    {
        WorkforceBL workforceBL = new WorkforceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");
        }

        public string getUserName()
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            return authentication.firstname;
        }

        public string getImageName()
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            return authentication.imagename;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ProfileImageFileName = string.Empty;
            Employees employees = new Employees();

            if (fucProfileImage.HasFile)
            {
                ProfileImageFileName = Path.GetFileName(fucProfileImage.PostedFile.FileName);
                fucProfileImage.PostedFile.SaveAs(Server.MapPath("~/images/profileimages/") + ProfileImageFileName);
            }

            employees.employeecode = txtEmployeeCode.Text.ToString();
            employees.firstname = txtFirstName.Text.ToString();
            employees.lastname = txtLastName.Text.ToString();
            if (txtDateOfBirth.Text != string.Empty) { employees.dateofbirth = Convert.ToDateTime(txtDateOfBirth.Text); }
            if (txtJoiningDate.Text != string.Empty) { employees.joiningdate = Convert.ToDateTime(txtJoiningDate.Text); }
            employees.mobile = txtMobile.Text.ToString();
            employees.emailid = txtEmail.Text.ToString();
            employees.gender = ddlGender.Text.ToString();
            employees.maritalstatus = ddlMaritalStatus.Text.ToString();
            employees.employeetype = ddlEmployeeType.Text.ToString();
            employees.departmentid = Convert.ToInt32(ddlDepartment.SelectedValue);
            employees.positionid = Convert.ToInt32(ddlPosition.SelectedValue);
            employees.imagename = ProfileImageFileName;
            employees.username = txtUserName.Text.ToString();
            employees.password = txtPassword.Text.ToString();
            employees.usertype = ddlUserType.Text.ToString();
            employees.address = txtAddress.InnerText.ToString();
            employees.status = ddlStatus.Text.ToString();

            if (ddlActive.SelectedValue == "1")
                employees.isactive = true;
            else
                employees.isactive = false;

            employees.isdeleted = false;
            employees.createdby = authentication.employeeid;
            employees.createddate = DateTime.Now;

            workforceBL.InsertWorkforceEmployees(employees);

            Response.Redirect("WorkforceManagement.aspx");
        }

        public string getTopEventDetails()
        {
            return eventBL.GetTopEventDetails();
        }

        public string getTopMessageDetails()
        {
            return messageBL.GetTopMessageDetails(authentication.usertype, authentication.employeeid);
        }

        public string getTopTaskDetails()
        {
            return taskBL.GetTopTaskDetails(authentication.usertype, authentication.employeeid);
        }
    }
}