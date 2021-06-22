using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.BusinessEntities;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace hrms.netragenix.Web.UI
{
    public partial class PerformanceLog : System.Web.UI.Page
    {
        AttendanceBL attendanceBL = new AttendanceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        WorkforceBL workforceBL = new WorkforceBL();
        PerformanceBL performanceBL = new PerformanceBL();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (!Page.IsPostBack)
                BindEmployeesDropdown();
        }

        public void BindEmployeesDropdown()
        {
            List<WorkforceEmployees> WorkforceEmployeesList = new List<WorkforceEmployees>();
            WorkforceEmployeesList = workforceBL.GetWorkforceEmployeesDropdown();
            ddlEmployeeCode.DataSource = WorkforceEmployeesList;
            ddlEmployeeCode.DataValueField = "employeecode";
            ddlEmployeeCode.DataTextField = "employeecode";
            ddlEmployeeCode.DataBind();
            ddlEmployeeCode.Items.Insert(0, new ListItem("-- Please Select Employee Code --", ""));
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
            hrms.netragenix.BusinessEntities.PerformanceLog performanceLog = new hrms.netragenix.BusinessEntities.PerformanceLog();
            performanceLog.employeeid = 0;
            performanceLog.employeecode = ddlEmployeeCode.SelectedValue;
            performanceLog.communication = Convert.ToInt32(txtCommunication.Text);
            performanceLog.conflictresolution = Convert.ToInt32(txtConflictResolution.Text);
            performanceLog.management = Convert.ToInt32(txtManagement.Text);
            performanceLog.planning = Convert.ToInt32(txtPlanning.Text);
            performanceLog.problemsolving = Convert.ToInt32(txtProblemSolving.Text);

            performanceBL.LogPerformance(performanceLog);

            Response.Redirect("PerformanceManagement.aspx");
        }
    }
}