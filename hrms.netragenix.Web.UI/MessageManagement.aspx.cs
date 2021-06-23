using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.DataAccess;
using System;
using System.Web;

namespace hrms.netragenix.Web.UI
{
    public partial class MessageManagement : System.Web.UI.Page
    {
        MessageBL messageBL = new MessageBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        TaskBL taskBL = new TaskBL();
        MessageDB messageDB = new MessageDB();
        EventDB eventDB = new EventDB();
        Event eventbe = new Event();
        Message msg = new Message();
        Task tsk = new Task();
        int messageid;
        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (Request.QueryString["messageid"] != null)
            {
                messageid = Convert.ToInt32(Request.QueryString["messageid"]);
                getUpdatedMessageDetails();
            }

            //getUpdatedMessageDetails();
        }

        public string getUpdatedCountTopEventDetails()
        {
            string count = string.Empty;
            if (authentication.usertype != "Administrator")
            {
                return eventBL.GetUpdatedCountTopEventDetails(authentication.employeeid, eventbe.eventid);
            }
            return count;
        }

        public string getUpdatedCountTopMessageDetails()
        {
            return messageBL.GetUpdatedCountTopMessageDetails(authentication.employeeid);
        }

        public string getUpdatedCountTopTaskDetails()
        {
            return taskBL.GetUpdatedCountTopTaskDetails(authentication.employeeid, tsk.taskid);
        }

        public int getUpdatedMessageDetails()
        {
            int employeeid = authentication.employeeid;
            return eventDB.UpdateEventDetails(employeeid, 0, messageid, 0);
        }
        public string getMessageDetails()
        {
            return messageBL.GetMessageDetails(authentication.usertype, authentication.employeeid);
        }

        public string getMessageHeaders()
        {
            return messageBL.GetMessageHeaders(authentication.usertype);
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
    }
}