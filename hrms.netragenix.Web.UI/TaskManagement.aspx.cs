using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.BusinessEntities;
using hrms.netragenix.DataAccess;

namespace hrms.netragenix.Web.UI
{
    public partial class TaskManagement : System.Web.UI.Page
    {
        TaskBL taskBL = new TaskBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskDB taskDB = new TaskDB();
        EventDB eventDB = new EventDB();
        Event eventbe = new Event();
        Message msg = new Message();
        int taskid;

        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (Request.QueryString["taskid"] != null)
            {
                taskid = Convert.ToInt32(Request.QueryString["taskid"]);
                getUpdatedTaskDetails();
            }

            //getUpdatedTaskDetails();
        }

        public int getUpdatedTaskDetails()
        {
            int employeeid = authentication.employeeid;
            return eventDB.UpdateEventDetails(employeeid, 0, 0, taskid);
        }

        public string getUpdatedCountTopEventDetails()
        {
            string count = string.Empty;
            if (authentication.usertype != "Administrator")
            {
                count = eventBL.GetUpdatedCountTopEventDetails(authentication.employeeid, eventbe.eventid);
            }
            return count;
        }

        public string getUpdatedCountTopMessageDetails()
        {
            return messageBL.GetUpdatedCountTopMessageDetails(authentication.employeeid);
        }

        public string getUpdatedCountTopTaskDetails()
        {            
            return taskBL.GetUpdatedCountTopTaskDetails(authentication.employeeid, taskid);
        }
        public string getTaskDetails()
        {
            return taskBL.GetTaskDetails(authentication.usertype, authentication.employeeid);
        }

        public string getTaskHeaders()
        {
            return taskBL.GetTaskHeaders(authentication.usertype);
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