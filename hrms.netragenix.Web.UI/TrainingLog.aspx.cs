using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrms.netragenix.Web.UI
{
    public partial class TrainingLog : System.Web.UI.Page
    {
        AttendanceBL attendanceBL = new AttendanceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        WorkforceBL workforceBL = new WorkforceBL();
        PerformanceBL performanceBL = new PerformanceBL();
        TrainingBL trainingBL = new TrainingBL();
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
            ddlEmployeeCode.DataValueField = "employeeid";
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
            hrms.netragenix.BusinessEntities.TrainingLog trainingLog = new hrms.netragenix.BusinessEntities.TrainingLog();
            trainingLog.trainingdate = Convert.ToDateTime(txtTrainingDate.Text);
            trainingLog.scheduledate = Convert.ToDateTime(txtScheduleDate.Text);
            trainingLog.particulars = txtParticulars.Text;
            trainingLog.raisedby = authentication.employeeid;
            trainingLog.employeeid = Convert.ToInt32(ddlEmployeeCode.SelectedValue);
            trainingLog.employeecode = ddlEmployeeCode.SelectedItem.Text;
            trainingLog.createdby = authentication.employeeid;

            trainingBL.LogTraining(trainingLog);

            Response.Redirect("TrainingManagement.aspx");
        }
    }
}