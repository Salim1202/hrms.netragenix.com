using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System.IO;

namespace hrms.netragenix.Web.UI
{
    public partial class PayrollLog : System.Web.UI.Page
    {
        WorkforceBL workforceBL = new WorkforceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        PayrollBL payrollBL = new PayrollBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (!Page.IsPostBack)
                BindEmployeesDropdown();
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LogPayroll logPayroll = new LogPayroll();
            //LogRecruitment logRecruitment = new LogRecruitment();

            logPayroll.employeecode = ddlEmployeeCode.SelectedValue;
            logPayroll.grosssalary = Convert.ToDouble(txtGrossSalary.Text);
            logPayroll.netsalary = Convert.ToDouble(txtNetSalary.Text);
            logPayroll.status = ddlStatus.SelectedValue;

            payrollBL.LogPayroll(logPayroll);

            Response.Redirect("PayrollManagement.aspx");
        }

        public void BindEmployeesDropdown()
        {
            List<WorkforceEmployees> WorkforceEmployeesList = new List<WorkforceEmployees>();
            WorkforceEmployeesList = workforceBL.GetWorkforceEmployeesDropdown();
            ddlEmployeeCode.DataSource = WorkforceEmployeesList;
            ddlEmployeeCode.DataValueField = "employeecode";
            ddlEmployeeCode.DataTextField = "employeecode";
            ddlEmployeeCode.DataBind();
            ddlEmployeeCode.Items.Insert(0, new ListItem("-- Please Select Employee --", ""));
        }
    }
}