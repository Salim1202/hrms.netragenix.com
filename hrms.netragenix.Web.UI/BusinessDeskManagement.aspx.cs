using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.DataAccess;
using System;
using System.Web;

namespace hrms.netragenix.Web.UI
{
    public partial class BusinessDeskManagement : System.Web.UI.Page
    {
        BusinessDeskBL businessDeskBL = new BusinessDeskBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        EventDB eventDB = new EventDB();
        Event eventbe = new Event();
        Message msg = new Message();
        Task tsk = new Task();



        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            int LeaveID;


            if (Request.QueryString["LeaveID"] != null)
            {
                LeaveID = Convert.ToInt32(Request.QueryString["LeaveID"]);
                leaveBL.ApproveLeave(LeaveID);
            }

        }

        public string getBusinessDeskEmployees()
        {
            return businessDeskBL.GetBusinessDeskEmployees();
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

        //This method has been replaced by getUpdatedCountTopEventDetails() so it can be commented
        public string getCountTopEventDetails()
        {
            return eventBL.GetCountTopEventDetails();
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
            return taskBL.GetUpdatedCountTopTaskDetails(authentication.employeeid, tsk.taskid);
        }

        public string getTopMessageDetails()
        {
            return messageBL.GetTopMessageDetails(authentication.usertype, authentication.employeeid);
        }

        public string getTopTaskDetails()
        {
            return taskBL.GetTopTaskDetails(authentication.usertype, authentication.employeeid);
        }

        public string getBusinessDeskMessageDetails()
        {
            return messageBL.GetBusinessDeskMessageDetails(authentication.usertype, authentication.employeeid);
        }

        public string getBusinessDeskLeaveDetails()
        {
            return leaveBL.GetBusinessDeskLeaveDetails(authentication.usertype, authentication.employeeid);
        }

        public string getBusinessDeskLeaveHeaders()
        {
            return leaveBL.GetBusinessDeskLeaveHeaders(authentication.usertype);
        }

        public string getLeaveMenu()
        {
            string LeaveString = string.Empty;

            if (authentication.usertype != "Administrator")
            {
                LeaveString += "<ul class='header-dropdown m-r--5'>";
                LeaveString += "<li class='dropdown'><a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class='zmdi zmdi-more-vert'></i></a>";
                LeaveString += "<ul class='dropdown-menu pull-right'>";
                LeaveString += "<li><a href='LeaveApply.aspx'>Apply for Leave</a></li>";
                LeaveString += "</ul>";
                LeaveString += "</li>";
                LeaveString += "</ul>";
            }

            return LeaveString;
        }
    }
}