using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrms.netragenix.Web.UI
{
    public partial class WorkforceUpdate : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {
                BindWorkforceEmployeesDropdown();
            }

            SetEmployeeInformation(ddlEmployeeCode.Text);
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

        public void BindWorkforceEmployeesDropdown()
        {
            List<WorkforceEmployees> WorkforceEmployeesList = new List<WorkforceEmployees>();
            WorkforceEmployeesList = workforceBL.GetWorkforceEmployeesDropdown();
            ddlEmployeeCode.DataSource = WorkforceEmployeesList;
            ddlEmployeeCode.DataValueField = "employeecode";
            ddlEmployeeCode.DataTextField = "employeecode";
            ddlEmployeeCode.DataBind();
            ddlEmployeeCode.Items.Insert(0, new ListItem("-- Please Select Employee Code --", ""));
        }

        public void SetEmployeeInformation(string EmployeeCode)
        {
            if (ddlEmployeeCode.Text != "-- Please Select Employee Code --")
            {
                Employees employees = new Employees();
                employees = workforceBL.GetWorkforceEmployeesRawData(ddlEmployeeCode.Text);
                ddlEmployeeCode.SelectedValue = employees.employeecode;
                txtFirstName.Text = employees.firstname;
                txtLastName.Text = employees.lastname;
                txtDateOfBirth.Text = employees.dateofbirth.ToString();
                txtJoiningDate.Text = employees.joiningdate.ToString();
                txtMobile.Text = employees.mobile;
                txtEmail.Text = employees.emailid;
                if (ddlGender.SelectedValue == "") { ddlGender.SelectedValue = employees.gender; }
                if (ddlMaritalStatus.SelectedValue == "") { ddlMaritalStatus.SelectedValue = employees.maritalstatus; }
                if (ddlEmployeeType.SelectedValue == "") { ddlEmployeeType.SelectedValue = employees.employeetype; }
                if (ddlDepartment.SelectedValue == "") { ddlDepartment.SelectedValue = employees.departmentid.ToString(); }
                if (ddlPosition.SelectedValue == "") { ddlPosition.SelectedValue = employees.positionid.ToString(); }
                txtUserName.Text = employees.username;
                txtPassword.Text = employees.password;
                if (ddlUserType.SelectedValue == "") { ddlUserType.SelectedValue = employees.usertype; }
                txtAddress.InnerText = employees.address;
                if (ddlStatus.SelectedValue == "") { ddlStatus.SelectedValue = employees.status; }
                if (employees.isactive == true) { ddlActive.SelectedValue = "1"; } else { ddlActive.SelectedValue = "0"; }
            }
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

            employees.employeecode = ddlEmployeeCode.Text.ToString();
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

            workforceBL.UpdateWorkforceEmployees(employees);

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