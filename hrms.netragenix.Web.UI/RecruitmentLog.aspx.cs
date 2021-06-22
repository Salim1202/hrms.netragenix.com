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
    public partial class RecruitmentLog : System.Web.UI.Page
    {
        WorkforceBL workforceBL = new WorkforceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        RecruitmentBL recruitmenBL = new RecruitmentBL();

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

        public void BindEmployeesDropdown()
        {
            List<WorkforceEmployees> WorkforceEmployeesList = new List<WorkforceEmployees>();
            WorkforceEmployeesList = workforceBL.GetWorkforceEmployeesDropdown();
            ddlTakenBy.DataSource = WorkforceEmployeesList;
            ddlTakenBy.DataValueField = "employeeid";
            ddlTakenBy.DataTextField = "employeecode";
            ddlTakenBy.DataBind();
            ddlTakenBy.Items.Insert(0, new ListItem("-- Please Select Employee --", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LogRecruitment logRecruitment = new LogRecruitment();

            logRecruitment.candidatename = txtCandidateName.Text;
            logRecruitment.interviewdate = Convert.ToDateTime(txtInterviewDate.Text);
            logRecruitment.confirmationdate = Convert.ToDateTime(txtConfirmationDate.Text);
            logRecruitment.takenby = Convert.ToInt32(ddlTakenBy.SelectedValue);
            logRecruitment.status = "Pending";
            logRecruitment.createdby = authentication.employeeid;

            recruitmenBL.LogRecruitment(logRecruitment);

            Response.Redirect("RecruitmentManagement.aspx");
        }
    }
}