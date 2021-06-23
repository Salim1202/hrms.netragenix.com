using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace hrms.netragenix.Web.UI
{
    public partial class EventCreate : System.Web.UI.Page
    {
        AttendanceBL attendanceBL = new AttendanceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        WorkforceBL workforceBL = new WorkforceBL();
        PerformanceBL performanceBL = new PerformanceBL();
        DocumentBL documentBL = new DocumentBL();
        TrainingBL trainingBL = new TrainingBL();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

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
            hrms.netragenix.BusinessEntities.EventCreate eventCreate = new hrms.netragenix.BusinessEntities.EventCreate();
            eventCreate.eventname = txtEventName.Text;
            eventCreate.eventdescription = txtEventDescription.Text;
            eventCreate.scheduledon = Convert.ToDateTime(txtScheduledOn.Text);
            eventCreate.createdby = authentication.employeeid;

            eventBL.InsertEvent(eventCreate);

            Response.Redirect("EventManagement.aspx?eventid=0");
        }
    }
}