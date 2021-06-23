using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.DataAccess;
using System;
using System.Web;

namespace hrms.netragenix.Web.UI
{
    public partial class EventManagement : System.Web.UI.Page
    {
        EventBL eventBL = new EventBL();
        Authentication authentication = new Authentication();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        EventDB eventDB = new EventDB();
        Event eventbe = new Event();
        Message msg = new Message();
        Task tsk = new Task();
        int eventid;
        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (Request.QueryString["eventid"] != null)
            {
                eventid = Convert.ToInt32(Request.QueryString["eventid"]);
                getUpdatedEventDetails();
            }

            //getUpdatedEventDetails();

        }

        //public int getUpdatedEventDetails()
        //{
        //    //int employeeid = authentication.employeeid;
        //    return eventDB.UpdateEventDetails(eventid);
        //}        

        public int getUpdatedEventDetails()
        {
            int employeeid = authentication.employeeid;
            return eventDB.UpdateEventDetails(employeeid, eventid, 0, 0);
        }

        public string getUpdatedCountTopEventDetails()
        {
            string count = string.Empty;
            if (authentication.usertype != "Administrator")
            {
                count = eventBL.GetUpdatedCountTopEventDetails(authentication.employeeid, eventid);
            }
            // return eventBL.GetUpdatedCountTopEventDetails(authentication.employeeid, eventid);
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

        public string getEventDetails()
        {
            return eventBL.GetEventDetails();
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

        public string getGridMenu()
        {
            string CommonString = string.Empty;

            if (authentication.usertype == "Administrator")
            {
                CommonString += "<ul class='header-dropdown m-r--5'>";
                CommonString += "<li class='dropdown'><a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class='zmdi zmdi-more-vert'></i></a>";
                CommonString += "<ul class='dropdown-menu pull-right'>";
                CommonString += "<li><a href='EventCreate.aspx'>Create Event</a></li>";
                CommonString += "</ul>";
                CommonString += "</li>";
                CommonString += "</ul>";
            }
            else
            {
                CommonString += "";
            }

            return CommonString;
        }
    }
}